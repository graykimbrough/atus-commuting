**************************************************************************************************;
/* This program:

(1) Reads in data from ACS, NHTS, and ATUS
(2) forms comparable samples
(3) generates some statistics
(4) Compares statistics and generates graphs showing comparisons */

/* Version 2 keeps begin and end times for NHTS tours */

/* Version 3: Add stop info for NHTS.  Also firstline indicator, and add this to calculations.
	      Remove self-employed restriction for NHTS.  */

/* Version 4: Add requested analysis of incidence 
	      Include Armed Forces employed in ACS sample */
/*
Inputs:
 (1) tour09 (from NHTS)
 (2) perv2pub (from NHTS)
 (3) atus_prelim
 (4) atusxpared
 (5) ATUSfinal
 (6) raw ACS data
 
Outputs:
 (1) 2009tours (intermediate dataset)
 (2) NHTSfinal
 (3) ACSfinal
 (4) atus (intermediate dataset)
 (5) chars (intermediate dataset)
 (5) ATUSfinal
 
*/		  
**************************************************************************************************;

/* First: NHTS */
use ../data/nhts/tour09;

tab tourtype;
sort houseid personid tour;

gen time = (real(substr(endttime ,1,2))-real(substr(begntime  ,1,2)))*60 
	+(real(substr(endttime ,3,2))-real(substr(begntime  ,3,2)));
	
replace time = 1440+time if time<0;

rename time tot_time;

list in 1/10;

list tot_time tot_dwel2 in 1/10;

rename tot_cmin travel_time;

list time tot_time travel_time in 1/30;

keep houseid personid tour tourtype time tot_time travel_time begntime endttime stops;

destring houseid personid, replace;
save ../data/output/2009tours, replace;

clear;
use ../data/nhts/perv2pub;
merge 1:m houseid personid using 2009tours;

svyset [pweight=wtperfin];

/* 
Restrict sample: 
		Age 25-60
		Weekdays 
*/
		
keep if worker==1;
keep if r_age>=25 & r_age<=60;
keep if travday~=1 & travday~=7;

preserve;
gen commute = tourtype =="HW" | tourtype =="WH";
gen commutetime = commute * travel_time;
collapse (sum) commutetime = commutetime (sum)numcommutes = commute (mean)wtperfin=wtperfin, by(houseid personid );
hist commutetime if commutetime<=240, frac width(20) name(HWandWHtours);
tab numcommutes;

svy: mean commutetime ;
svy: mean commutetime, subpop( if commutetime~=0);
svy: mean commutetime, subpop( if commutetime<=240);
svy: mean commutetime, subpop( if commutetime~=0 & commutetime<=240);

restore, preserve;
gen towork = tourtype =="HW" ;
gen commutetimetowork = towork * travel_time;
collapse (sum) commutetimetowork = commutetimetowork (sum)numtowork = towork (mean)wtperfin=wtperfin, by(houseid personid );
hist commutetimetowork if commutetimetowork<=120, frac width(10) name(HWtours);
tab numtowork;

svy: mean commutetimetowork;
svy: mean commutetimetowork, subpop(if commutetime~=0);
svy: mean commutetimetowork, subpop(if commutetime<=120);
svy: mean commutetimetowork, subpop(if commutetime~=0 & commutetime<=120);

restore;

/* Old way of doing this ... 
collapse (sum) worktravtime = worktravtime (sum)numworktrips = worktour (mean)wtperfin=wtperfin, by(houseid personid ); */

gen towork = tourtype =="HW" ;
gen toworktourtime = towork * travel_time;
gen tohome = tourtype =="WH" ;
gen tohometourtime = tohome * travel_time;
gen commutetour = tourtype =="HW" | tourtype =="WH";
gen commutetourtime = commutetour * travel_time;
bysort houseid personid: egen numcommutespells = total(commutetour);
bysort houseid personid: egen numcommutespellstowork = total(towork);
bysort houseid personid: egen numcommutespellsfromwork = total(tohome);
bysort houseid personid: egen toworktravtime = total(toworktourtime);
bysort houseid personid: egen tohometravtime = total(tohometourtime);
bysort houseid personid: egen commutetravtime = total(commutetourtime);
bysort houseid personid: egen numcommutetrips = total(commutetour);

bysort houseid personid: egen numtowork = total(towork);
gen directtowork = 0;
replace directtowork=1 if towork & stops==0;
bysort houseid personid: egen numdirecttowork = total(directtowork);
bysort houseid personid: egen numtohome = total(tohome);
gen directtohome = 0;
replace directtohome=1 if tohome & stops==0;
bysort houseid personid: egen numdirecttohome = total(directtohome);

gen oneeachway = (numtowork ==1 & numtohome ==1);

/* Simple: indicator that respondent has ONLY one direct commute to work
	  and one direct commute from work to home.  */
gen simple = (numdirecttohome==1 & numdirecttowork==1);

bysort houseid personid: gen firstline = (_n==1);

svy: mean commutetravtime, subpop(firstline);
svy: mean commutetravtime, subpop(if firstline & commutetravtime~=0);
svy: mean commutetravtime, subpop(if firstline & commutetravtime<=240);
svy: mean commutetravtime, subpop(if firstline & commutetravtime~=0 & commutetravtime<=240);

svy: prop oneeachway  , subpop(firstline);
tab oneeachway if firstline ;

svy: prop simple, subpop(firstline);

save ../data/output/NHTSfinal, replace;

**************************************************************************************************;

/* Second: ACS  */

use ../data/acs/usa_00151;

sum;

/* Limit to workers, 25-60 */
keep if empstatd>=10 & empstat<=15;
keep if age>=25 & age<=60;

/* Remove GQ types to make comparable to ATUS */
drop if gqtype==1 | gqtype==2 | gqtype==3 |gqtype==4 |gqtype==6;

svyset [pweight=perwt];

hist trantime , frac width(10) name(acs_trantime);
svy: mean trantime;
svy: mean trantime, subpop(if trantime~=0);
svy: mean trantime, subpop(if trantime<=120);
svy: mean trantime, subpop(if trantime~=0 & trantime <=120);

save ../data/output/ACSfinal, replace;

**************************************************************************************************;

/* Third: ATUS */

use ../data/output/ATUSfinal, clear;

/* Table 1: % and # of diary days:

  A) >=1 nonstop H->W trip
  B) >=1 nonstop W->H trip
  C) at least one nonstop H->W trip and at least one nonstop W->H trip
  D) >=1 H->W tour
  E) >=1 W->H tour
  F) at least one nonstop H->W tour and at least one nonstop W->H tour
*/

keep if firstline;

gen table1A = 100*(totDTW>=1);
gen table1B = 100*(totDTH>=1);
gen table1C = 100*(totDTW>=1 & totDTH>=1);
gen table1D = 100*(numtoworkLT30>=1);
gen table1E = 100*(numfromworkLT30>=1);
gen table1F = 100*(numtoworkLT30>=1 & numfromworkLT30>=1);

tabstat table1* [aweight=wt06 ], stat(mean);
/* Alternatively, svy: mean table1*; */
tabstat table1*, stat(sum);

/* Table 2: Mean and median commute time by different definitions, ATUS sample */

svy: mean commutetimeLT30 commutetimeDIRECT commutetimeATUS commutetimeALL;

/* Additional analysis: incidence for ACS, NHTS, various ATUS measures */
use ../data/output/ATUSfinal, clear;

foreach type in LT30 DIRECT ATUS ALL{;
  gen nonzero`type'=(commutetime`type'~=0);
  gen nonzero`type'towork=(commutetime`type'towork~=0);
  gen nonzero`type'fromwork=(commutetime`type'fromwork~=0);
  gen nonzero`type'both=(commutetime`type'towork~=0) & (commutetime`type'fromwork~=0);
};

svy: prop nonzero*, subpop(if firstline);
/* svy: prop numcommutespells*, subpop(if firstline); */

use ../data/output/NHTSfinal, clear;
svy: mean commutetravtime, subpop(if firstline);

gen nonzerocommute=(commutetravtime~=0);
gen nonzerotowork=(toworktravtime~=0);
gen nonzerotohome=(tohometravtime~=0);
gen nonzeroboth=((toworktravtime~=0)&(tohometravtime~=0));

svy: prop nonzero*, subpop(if firstline);
svy: prop numcommutespells*, subpop(if firstline);

use ../data/output/ACSfinal, clear;
gen nonzerotowork=(trantime~=0);
svy: prop nonzero*;


/* Table 3: Statistics on trip tours, NHTS */

/* Table: Descriptive statistics across comparative samples */

use ../data/output/ACSfinal, clear;
svy: mean age;
sum age, det;
svy: prop sex;
tab empstat;
tab empstatd;

use ../data/output/NHTSfinal, clear;

tab tdaydate;
svy: mean r_age;
sum r_age, det;
svy: prop tdaydate;
tab worker;
tab travday;

use ../data/output/ATUSfinal, clear;

svy: mean age;
sum age, det;
prop female;
tab empstat;

/* Table 4: Aggregate estimates
  A) H->W
    1) ACS
    2) NHTS
    3) ATUS
  B) H->W and W->H
    1) NHTS
    2) ATUS
*/

use ../data/output/ACSfinal, clear;
svy: mean trantime;
svy: mean trantime, subpop(if trantime~=0);

use ../data/output/NHTSfinal, clear;
svy: mean toworktravtime, subpop(firstline);
svy: mean toworktravtime, subpop(if firstline & toworktravtime~=0);

use ../data/output/ATUSfinal, clear;
svy: mean commutetimeLT30towork, subpop(if firstline);
svy: mean commutetimeLT30towork, subpop(if commutetimeLT30towork~=0 & firstline);

use ../data/output/NHTSfinal, clear;
svy: mean commutetravtime, subpop(if firstline);
svy: mean commutetravtime, subpop(if firstline & commutetravtime~=0);

use ../data/output/ATUSfinal, clear;
svy: mean commutetimeLT30, subpop(if firstline);
svy: mean commutetimeLT30, subpop(if commutetimeLT30~=0 & firstline);


/* Look at direct commutes only */
use ../data/output/NHTSfinal, clear;
svy: prop simple, subpop(if firstline);
svy: prop simple, subpop(if firstline & commutetravtime~=0);
svy: mean commutetravtime, subpop(if firstline & simple);
svy: mean commutetravtime, subpop(if firstline & ~simple);
svy: mean commutetravtime, subpop(if firstline & ~simple & commutetravtime~=0);

use ../data/output/ATUSfinal, clear;
/*svy: prop simple, subpop(if firstline);
svy: prop simple, subpop(if firstline & commutetimeLT30~=0); 
svy: mean commutetimeLT30, subpop(if firstline & simple);
svy: mean commutetimeLT30, subpop(if firstline & ~simple);
svy: mean commutetimeLT30, subpop(if commutetimeLT30~=0 & ~simple & firstline);
*/
/* Look at non-direct commutes only */
use ../data/output/NHTSfinal, clear;
svy: mean commutetravtime, subpop(if firstline & ~simple);
svy: mean commutetravtime, subpop(if firstline & ~simple & commutetravtime~=0);

use ../data/output/ATUSfinal, clear;
/*svy: mean commutetimeLT30, subpop(if firstline & ~simple);
svy: mean commutetimeLT30, subpop(if commutetimeLT30~=0 & ~simple & firstline);
*/

/* Additional Table A suggested by Dave Oct 9 */

/* For each characteristic value, want:
means of the three times
3 incidences
3 two-way incidences
t-tests of times, pairwise
*/

use ../data/output/ATUSfinal, clear;
keep if firstline;

gen educatt=.;
replace educatt=1 if educ<20 & ~missing(educ);
replace educatt=2 if educ>=20 & educ<=21 & ~missing(educ);
replace educatt=3 if educ>=30 & educ<=32 & ~missing(educ);
replace educatt=4 if educ==40 & ~missing(educ);
replace educatt=5 if educ>=41 & educ<=43 & ~missing(educ);

gen agecat=.;
replace agecat=1 if (age>=25 & age<=34);
replace agecat=2 if (age>=35 & age<=44);
replace agecat=3 if (age>=45 & age<=60);

/* Race/ethnicity */
gen whitenonhisp=(race==0100 & hispan==0100) 
  if (~missing(race) & ~missing(hispan));

foreach type in LT30 ATUS ALL{;
  gen nonzero`type'=(commutetime`type'~=0);
  gen nonzero`type'both=(commutetime`type'towork~=0) & (commutetime`type'fromwork~=0);
};

local commutetimes "commutetimeLT30 commutetimeATUS commutetimeALL";
local nonzeros "nonzeroLT30 nonzeroATUS nonzeroALL";
local nonzeroboths "nonzeroLT30both nonzeroATUSboth nonzeroALLboth";

svy: mean `commutetimes' `nonzeros' `nonzeroboths';

test commutetimeLT30 = commutetimeATUS;
test commutetimeLT30 = commutetimeALL;

svy: mean `commutetimes' `nonzeros' `nonzeroboths', subpop(if female==0);

test commutetimeLT30 = commutetimeATUS;
test commutetimeLT30 = commutetimeALL;

svy: mean `commutetimes' `nonzeros' `nonzeroboths', subpop(if female==1);

test commutetimeLT30 = commutetimeATUS;
test commutetimeLT30 = commutetimeALL;

tab agecat;
forvalues catnum=1/3{;
  svy: mean `commutetimes' `nonzeros' `nonzeroboths', subpop(if agecat==`catnum');
  test commutetimeLT30 = commutetimeATUS;
  test commutetimeLT30 = commutetimeALL;
};

tab educatt;
forvalues catnum=1/5{;
  svy: mean `commutetimes' `nonzeros' `nonzeroboths', subpop(if educatt==`catnum');
  test commutetimeLT30 = commutetimeATUS;
  test commutetimeLT30 = commutetimeALL;
};

svy: mean `commutetimes' `nonzeros' `nonzeroboths', subpop(if whitenonhisp==0);

test commutetimeLT30 = commutetimeATUS;
test commutetimeLT30 = commutetimeALL;

svy: mean `commutetimes' `nonzeros' `nonzeroboths', subpop(if whitenonhisp==1);

test commutetimeLT30 = commutetimeATUS;
test commutetimeLT30 = commutetimeALL;

/* Additional suggestion from Dave Oct 9: histograms of number of commute spells */
use ../data/output/NHTSfinal, clear;
keep if numcommutespells<=6;
keep if firstline;
hist numcommutespells if firstline , disc frac name(NHTS, replace);

use ../data/output/ATUSfinal, clear;
by caseid: gen LT30count = numtoworkLT30 + numfromworkLT30; 
keep if firstline;
keep if LT30count<=6;
hist LT30count , disc frac name(ATUS, replace);
graph combine ATUS NHTS, cols(2) ycommon;

graph save ../graphs/histograms, replace;
