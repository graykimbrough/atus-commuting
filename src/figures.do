#delimit;

/* Making Figures

Initiated 2/2/2011

Version 2: Added NHTS figures, switched ATUS data to ATUSfinal
Version 9: Adapting to post-defense code
*/

clear all;
capture log close;
set more off;
set scheme s2mono;

log using ../log/figures, replace;

/* Create a set of minutes to merge in so that I'm sure every one is full */

set obs 1440;
gen minutes = _n-1;
save minutes, replace;

use ../data/output/ATUSfinal, clear;

keep caseid wt06 female;
bysort caseid: keep if _n==1;
save ../data/output/ATUSdemographics, replace;

/* Uncomment to draw 10% sample -- stick to 100% for now. */
/*
keep caseid;
sample 10;
merge 1:m caseid using ATUSfinal, keep(match);
*/
use ../data/output/ATUSfinal, clear;
keep caseid starttime commutespellATUS commutespellALL commutespellLT30;

rename starttime minutes;

merge m:1 minutes using ../data/output/minutes, nogen;

/* Format for TS analysis and fill in missing values at every minute */
tsset caseid minutes , delta(1);
tsfill, full;

bysort caseid: carryforward commutespellATUS, replace;
bysort caseid: carryforward commutespellALL, replace;
bysort caseid: carryforward commutespellLT30, replace;

merge m:1 caseid using ../data/output/ATUSdemographics, nogen;

save ../data/output/ATUSintermediate, replace;

/* Only want every 15 (or maybe 5, 10, 30?) minutes */
keep if minutes/15 == floor(minutes/15);

collapse (mean) ATUS = commutespellATUS ALL = commutespellALL lt30 = commutespellLT30 [pweight=wt06], by(minutes);
label var lt30 "ATUS Commute trip tours";
label var ATUS "ATUS travel related to work";
label var ALL "All travel between home and work";

/* Add to Fig 1 line for B&B, as Dave siggested Oct 9 */

twoway (line lt30 minutes, sort), name(lt30, replace) nodraw;
twoway (line lt30 minutes, sort) (line ALL minutes, sort) (line ATUS minutes, sort), name(allthree, replace) nodraw;

twoway (line lt30 minutes, sort xlabel(0 240 480 720 960 1200, valuelabel))  
(line ATUS minutes, sort xlabel(0 240 480 720 960 1200, valuelabel))
(line ALL minutes, sort xlabel(0 240 480 720 960 1200, valuelabel)), 
  legend(cols(1))
  name(fig1, replace) nodraw;
graph save ../graphs/fig1, replace;
save ../data/output/ATUScollapsed, replace;

/* Do the same for NHTS */

use ../data/output/NHTSfinal, clear;

gen female=r_sex==2;
gen double caseid = houseid*100+personid;
format %10.0f caseid;

bysort caseid: keep if _n==1;
keep caseid female wtperfin;
save ../data/output/NHTSdemographics, replace;

use ../data/output/NHTSfinal, clear;
gen double caseid = houseid*100+personid;
format %10.0f caseid;

keep caseid begntime endttime commutetour;

/* Create time variable.  Starttime records time (in minutes) after 4:00 AM */

gen starttime = (floor(real(begntime)/100)-4)*60 + mod(real(begntime),100);
replace starttime = starttime + 24*60 if starttime<0;

gen endtime = (floor(real(endttime)/100)-4)*60 + mod(real(endttime),100);
replace endtime = endtime + 24*60 if endtime<0;

rename starttime minutes;

/* Note that those with missing minutes values will be dropped */
merge m:1 minutes using ../data/output/minutes, nogen keep(2 3);

/* There is one clearly erroneous case, so drop that one */
drop if caseid==5145731602 & minutes==351;

/* Format for TS analysis and fill in missing values at every minute */
tsset caseid minutes , delta(1);
tsfill, full;

save ../data/output/intermediateNHTS, replace;

/* Have to carry endtime forward so that the next step will work */
bysort caseid: carryforward endtime, replace;

/* Fill in 0s at first entry and first after a commute spell where missing */
bysort caseid: replace commutetour=0 if (missing(commutetour) & endtime==minutes);
bysort caseid: replace commutetour=0 if (missing(commutetour) & _n==1);

bysort caseid: carryforward commutetour, replace;

save ../data/output/NHTStimeseries, replace;

/* Only want every 15 (or maybe 5, 10, 30?) minutes */
keep if minutes/15 == floor(minutes/15);

/* Merge in demographics and weights */
merge m:1 caseid using ../data/output/NHTSdemographics, nogen keep(3);

preserve;

collapse (mean) commute = commutetour [pweight=wtperfin], by(female minutes);

twoway (line commute minutes if female, sort) 
	(line commute minutes if ~female, sort), name(NHTSbysex, replace) nodraw;

graph save ../graphs/NHTSbysex, replace;

save ../data/output/NHTScollapsedbysex, replace;

restore;

collapse (mean) commute = commutetour [pweight=wtperfin], by(minutes);
twoway (line commute minutes, sort), name(NHTScommutes, replace) nodraw;
graph save ../graphs/NHTScommutes, replace;
save ../data/output/NHTScollapsed, replace;


merge 1:1 minutes using ../data/output/ATUScollapsed, nogen;

label var minutes "Time of day";
label define time 0 "4:00 AM" 240 "8:00 AM" 480 "12:00 PM" 720 "4:00 PM" 960 "8:00 PM" 1200 "12:00 AM";
label values minutes time;
label var commute "NHTS commute trip tours";
label var lt30 "ATUS Commute trip tours";

twoway
 (line lt30 minutes, sort xlabel(0 240 480 720 960 1200, valuelabel))
 (line commute minutes, sort xlabel(0 240 480 720 960 1200, valuelabel)), 
  name(fig2, replace) nodraw;  

graph save ../graphs/fig2, replace;

/* Version 2 of the figure: to work spells, including ACS */

/* Do same for ATUS and NHTS, but only to-work trips */
use ../data/output/ATUSfinal, clear;
keep caseid starttime toworkLT30;

rename starttime minutes;
merge m:1 minutes using ../data/output/minutes, nogen;

/* Format for TS analysis and fill in missing values at every minute */
tsset caseid minutes , delta(1);
tsfill, full;
drop if missing(caseid);

/* 
replace toworkLT30=0 if missing(toworkLT30) & toworkLT30[_n-1]==0; */
bysort caseid: carryforward toworkLT30, replace;
merge m:1 caseid using ../data/output/ATUSdemographics;

keep if _merge==3;
drop _merge;

/* Only want every 15 (or maybe 5, 10, 30?) minutes */
keep if minutes/15 == floor(minutes/15);

collapse (mean) toworkATUS = toworkLT30 [pweight=wt06], by(minutes);
save ../data/output/toworkATUS, replace;

/* Do the same for NHTS */
use ../data/output/NHTSfinal, clear;
gen double caseid = houseid*100+personid;
format %10.0f caseid;
keep caseid begntime endttime towork;

/* Create time variable.  Starttime records time (in minutes) after 4:00 AM */

gen starttime = (floor(real(begntime)/100)-4)*60 + mod(real(begntime),100);
replace starttime = starttime + 24*60 if starttime<0;

gen endtime = (floor(real(endttime)/100)-4)*60 + mod(real(endttime),100);
replace endtime = endtime + 24*60 if endtime<0;

rename starttime minutes;

/* Note that those with missing minutes values will be dropped */
merge m:1 minutes using ../data/output/minutes, nogen keep(2 3);

/* There is one clearly erroneous case, so drop that one */
drop if caseid==5145731602 & minutes==351;

/* Format for TS analysis and fill in missing values at every minute */
tsset caseid minutes , delta(1);
tsfill, full;

/* Have to carry endtime forward so that the next step will work */
bysort caseid: carryforward endtime, replace;

/* Fill in 0s at first entry and first after a commute spell where missing */
bysort caseid: replace towork=0 if (missing(towork) & endtime==minutes);
bysort caseid: replace towork=0 if (missing(towork) & _n==1);

bysort caseid: carryforward towork, replace;

/* Only want every 15 (or maybe 5, 10, 30?) minutes */
keep if minutes/15 == floor(minutes/15);

/* Merge in demographics and weights */
merge m:1 caseid using ../data/output/NHTSdemographics, nogen keep(3);

collapse (mean) toworkNHTS = towork [pweight=wtperfin], by(minutes);

save ../data/output/toworkNHTS, replace;

/* Do the same for ACS */
use ../data/output/ACSfinal, clear;

gen female=sex==2;
gen double caseid = serial*100+pernum;
keep caseid perwt female;
save ../data/output/ACSdemographics, replace;

use ../data/output/ACSfinal, clear;
drop if arrives==0000 | departs==0000;
gen double caseid = serial*100+pernum;
format %10.0f caseid;

keep caseid departs arrives;

/* Create time variable.  Starttime records time (in minutes) after 4:00 AM */
gen starttime = (floor(departs/100)-4)*60 + mod(departs,100);
replace starttime = starttime + 24*60 if starttime<0;

gen endtime = (floor(arrives/100)-4)*60 + mod(arrives,100);
replace endtime = endtime + 24*60 if endtime<0;

/* Actually, use a different method for the ACS */
forval timeval = 15(15)1440{;
	disp "`timeval'";
	gen byte commute`timeval' = (`timeval'>=starttime & `timeval'<endtime);
};

/* Merge in demographics and weights */
merge m:1 caseid using ../data/output/ACSdemographics, nogen keep(3);

preserve;
collapse (mean) commute* [pweight=perwt], by(female);
reshape long commute, i(female) j(minutes);

rename commute toworkACS;

twoway (line toworkACS minutes if female, sort) 
	(line toworkACS minutes if ~female, sort), name(ACSbysex, replace) nodraw;

graph save ../graphs/ACSbysex, replace;

save ../data/output/ACScollapsedbysex, replace;

restore;

collapse (mean) commute* [pweight=perwt];
gen i=1;
reshape long commute, i(i) j(minutes);

rename commute toworkACS;

twoway (line toworkACS minutes, sort xlabel(0 240 480 720 960 1200, val)), 
	name(ACScommutes, replace) nodraw;
graph save ../graphs/ACScommutes, replace;
save ../data/output/ACScollapsed, replace;

merge 1:1 minutes using ../data/output/toworkATUS, nogen;
merge 1:1 minutes using ../data/output/toworkNHTS, nogen;

label var minutes "Time of day";
label define time 0 "4:00 AM" 240 "8:00 AM" 480 "12:00 PM" 720 "4:00 PM" 960 "8:00 PM" 1200 "12:00 AM";
label values minutes time;
label var toworkNHTS "NHTS";
label var toworkATUS "ATUS";
label var toworkACS "ACS";

#delimit;
twoway 
	(line toworkATUS minutes, 
		sort xlabel(0 240 480 720 960 1200, valuelabel))
	(line toworkNHTS minutes, 
		sort xlabel(0 240 480 720 960 1200, valuelabel))
	(line toworkACS minutes, 
		sort xlabel(0 240 480 720 960 1200, valuelabel)),
	name(fig2_v2, replace)  
	legend(rows(1)) 
	xtitle("");

graph save ../graphs/fig2_v2, replace;

/* Add analysis that Dave suggested, of departure times across the samples 	*/
/* General form:

	by id, sort: egen firsttime = min(cond(state == 1, time, .))
	keep if time==firsttime													*/
use ../data/output/ATUSfinal, clear;
keep caseid starttime toworkLT30 wt06;
bysort caseid: egen firsttime = min(cond(toworkLT30 == 1, starttime, .));
keep if starttime==firsttime;

drop if missing(starttime);

/* 1: <5 AM */
gen depart_cat1 =starttime<60;
/* 2: 5-5:29 */
gen depart_cat2 = starttime>=60 & starttime<=89;
/* 3: 5:30-5:59 */
gen depart_cat3 = starttime>=90 & starttime<=119;
/* 4: 6-6:29 */
gen depart_cat4 = starttime>=120 & starttime<=149;
/* 5: 6:30-6:59 */
gen depart_cat5 = starttime>=150 & starttime<=179;
/* 6: 7-7:29 */
gen depart_cat6 = starttime>=180 & starttime<=209;
/* 7: 7:30-7:59 */
gen depart_cat7 = starttime>=210 & starttime<=239;
/* 8: 8-8:29 */
gen depart_cat8 = starttime>=240 & starttime<=269;
/* 9: 8:30-8:59 */
gen depart_cat9 = starttime>=270 & starttime<=299;
/* 10: 9-9:29 */
gen depart_cat10 = starttime>=300 & starttime<=329;
/* 11: 9:30-9:59 */
gen depart_cat11 = starttime>=330 & starttime<=359;
/* 12: 10:00 AM+ */
gen depart_cat12 = starttime>=360;

collapse (mean) depart_cat* [pweight=wt06];
gen dataset="ATUS";
save ../data/output/ATUS_cats, replace;

/* NHTS */
use ../data/output/NHTSfinal, clear;
gen double caseid = houseid*100+personid;
keep caseid wtperfin begntime towork;

destring begntime, replace;

bysort caseid: egen firsttime = min(cond( towork== 1, begntime, .));
keep if begntime==firsttime;

drop if missing(begntime);

/* 1: <5 AM */
gen depart_cat1 = begntime<500;
/* 2: 5-5:29 */
gen depart_cat2 = begntime>=500 & begntime<=529;
/* 3: 5:30-5:59 */
gen depart_cat3 = begntime>=530 & begntime<=559;
/* 4: 6-6:29 */
gen depart_cat4 = begntime>=600 & begntime<=629;
/* 5: 6:30-6:59 */
gen depart_cat5 = begntime>=630 & begntime<=659;
/* 6: 7-7:29 */
gen depart_cat6 = begntime>=700 & begntime<=729;
/* 7: 7:30-7:59 */
gen depart_cat7 = begntime>=730 & begntime<=759;
/* 8: 8-8:29 */
gen depart_cat8 = begntime>=800 & begntime<=829;
/* 9: 8:30-8:59 */
gen depart_cat9 = begntime>=830 & begntime<=859;
/* 10: 9-9:29 */
gen depart_cat10 = begntime>=900 & begntime<=929;
/* 11: 9:30-9:59 */
gen depart_cat11 = begntime>=930 & begntime<=959;
/* 12: 10:00 AM+ */
gen depart_cat12 = begntime>=1000;

collapse (mean) depart_cat* [pweight=wtperfin];
gen dataset="NHTS";
save ../data/output/NHTS_cats, replace;

/* ACS */
use ../data/output/ACSfinal, clear;

drop if arrives==0000 | departs==0000;
gen double caseid = serial*100+pernum;
format %10.0f caseid;

keep caseid departs perwt;

destring departs, replace;

drop if missing(departs);

/* 1: <5 AM */
gen depart_cat1 = departs<500;
/* 2: 5-5:29 */
gen depart_cat2 = departs>=500 & departs<=529;
/* 3: 5:30-5:59 */
gen depart_cat3 = departs>=530 & departs<=559;
/* 4: 6-6:29 */
gen depart_cat4 = departs>=600 & departs<=629;
/* 5: 6:30-6:59 */
gen depart_cat5 = departs>=630 & departs<=659;
/* 6: 7-7:29 */
gen depart_cat6 = departs>=700 & departs<=729;
/* 7: 7:30-7:59 */
gen depart_cat7 = departs>=730 & departs<=759;
/* 8: 8-8:29 */
gen depart_cat8 = departs>=800 & departs<=829;
/* 9: 8:30-8:59 */
gen depart_cat9 = departs>=830 & departs<=859;
/* 10: 9-9:29 */
gen depart_cat10 = departs>=900 & departs<=929;
/* 11: 9:30-9:59 */
gen depart_cat11 = departs>=930 & departs<=959;
/* 12: 10:00 AM+ */
gen depart_cat12 = departs>=1000;

collapse (mean) depart_cat* [pweight=perwt];
gen dataset="ACS";

append using ../data/output/ATUS_cats;
append using ../data/output/NHTS_cats;

label var depart_cat1 "Before 5:00 AM";
label var depart_cat2 "5:00-5:29 AM";
label var depart_cat3 "5:30-5:59 AM";
label var depart_cat4 "6:00-6:29 AM";
label var depart_cat5 "6:30-6:59 AM";
label var depart_cat6 "7:00-7:29 AM";
label var depart_cat7 "7:30-7:59 AM";
label var depart_cat8 "8:00-5:30 AM";
label var depart_cat9 "8:30-8:59 AM";
label var depart_cat10 "9:00-5:30 AM";
label var depart_cat11 "9:30-9:59 AM";
label var depart_cat12 "10:00 AM or later";

foreach cat of varlist depart_cat*{;
	replace `cat'=`cat'*100;
	};

tabstat depart_cat*, by(dataset) stat(mean) format(%4.1f) col(stat);

/* Make departure time graphs */
use ../data/output/ATUSfinal, clear;
keep caseid starttime toworkLT30 wt06;
rename wt06 weight;
bysort caseid: egen firsttime = min(cond(toworkLT30 == 1, starttime, .));
keep if starttime==firsttime;

drop if missing(starttime);

gen dataset="ATUS";

replace starttime = floor(starttime/30);

save ../data/output/ATUSforkernel, replace;

use ../data/output/NHTSfinal, clear;
gen double caseid = houseid*100+personid;
keep caseid wtperfin begntime towork;
rename wtperfin weight;

destring begntime, replace;

bysort caseid: egen firsttime = min(cond( towork== 1, begntime, .));
keep if begntime==firsttime;

drop if missing(begntime);

gen starttime = (floor(begntime/100)-4)*60 + mod(begntime,100);
replace starttime = starttime + 24*60 if starttime<0;

replace starttime = floor(starttime/30);

gen dataset="NHTS";

save ../data/output/NHTSforkernel, replace;

use ../data/output/ACSfinal, clear;

drop if arrives==0000 | departs==0000;
gen double caseid = serial*100+pernum;
format %10.0f caseid;

keep caseid departs perwt;
rename perwt weight;
destring departs, replace;
drop if missing(departs);

gen starttime = (floor(departs/100)-4)*60 + mod(departs,100);
replace starttime = starttime + 24*60 if starttime<0;

replace starttime = floor(starttime/30);

gen dataset="ACS";

save ACSforkernel, replace;

append using ../data/output/ATUSforkernel;
append using ../data/output/NHTSforkernel;

gen id=_n;
gen departure=100;
rename starttime halfhour;

/* Format for TS analysis and fill in missing values at every minute */
preserve;
keep id dataset weight dataset;
save weights, replace;
restore;
keep id halfhour departure;
tsset id halfhour , delta(1);
tsfill, full;

list in 1/10;

merge m:1 id using ../data/output/weights, nogen;

list in 1/10;

replace departure=0 if missing(departure);

list in 1/10;

collapse (mean) prop_towork = departure [pweight=weight], by(halfhour dataset);


twoway (line prop_towork halfhour if dataset=="ATUS")
  (line prop_towork halfhour if dataset=="NHTS")
  (line prop_towork halfhour if dataset=="ACS");


label define time 0 "4:00 AM" 8 "8:00 AM" 16 "12:00 PM" 24
	"4:00 PM" 32 "8:00 PM" 40 "12:00 AM";
label values halfhour time;

twoway 
	(line prop_towork halfhour if dataset=="ATUS", 
		sort xlabel(0 8 16 24 32 40, valuelabel))
	(line prop_towork halfhour if dataset=="NHTS", 
		sort xlabel(0 8 16 24 32 40, valuelabel)) 
	(line prop_towork halfhour if dataset=="ACS", 
		sort xlabel(0 8 16 24 32 40, valuelabel)),   
	name(fig3, replace)  
	legend(rows(1) label(1 "ATUS") label(2 "NHTS") label(3 "ACS")) 
	xtitle("Time of Day, half hour intervals")
	ytitle("Percent of Departures to Work");

graph save ../graphs/fig3, replace;

log close;
