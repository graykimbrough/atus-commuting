#delimit;
/* ATUS-X dataset paring file.  

Input: atus_labeled, which contains raw activity
      records for all ATUS respondents, 2003-2012, from ATUS-X
      extract 36.

Output: atusxpared, containing observations for workers, 25-60, non-holiday
	weekdays.

Inputs:
 (1) atus_labeled

Outputs:
 (1) atusx0312 (intermediate dataset)
 (2) atusxpared
 (3) demographics
*/

use ../data/output/atus_labeled, clear;

tab year;
sort caseid actline;

/* 
Rectype variable, from what I gather, is:
1: household records
2: Person records of HH members
3: activity records of respondents
4: who records accompanying activity records
*/

/* Generate female dummy */
gen female = sex==2;
label define labelfemale 1 "Female";
label define labelfemale 0 "Male", add;
label values female labelfemale;

/* Rename "spouse present" and "children<18 present" variables */
rename hh_child childpres;

/* Generate weekend dummy */
gen weekend = day==1 | day==7;
label define labelweekend 1 "Weekend";
label define labelweekend 0 "Weekday", add;
label values weekend labelweekend;

/* SVYset the data */
svyset [pweight=wt06];

/* Save what I have so far, before paring */
save ../data/output/atusx0312, replace;

/* Cut down to 25-60 */
keep if age>=25 & age<=60;

/* Get rid of weekend and holiday observations */
svy: prop weekend, subpop(if actline==1);
svy: prop holiday, subpop(if actline==1);
keep if weekend==0;

/* Generate dummy for reporting work at a job (out of the home) that day, 
	defined as 050101 or 050102; drop those not working. */
gen workcheck = (activity==050101 | activity==050102) & where==102;

/* Keep those who are employed, but don't add more restrictions because these 
	aren't available in other datasets */
keep if empstat==1 | empstat==2;

/* Drop those whose work spell starts or ends the diary day
  (i.e. occurs at the boundary */

by caseid: gen firstlastwork= (workcheck & (_n==1 | _n==_N));
by caseid: egen censoredwork = total(firstlastwork);
keep if censoredwork == 0;
drop firstlastwork censoredwork;

drop workcheck;

/* Add a variable for the first two digits of the activity code, act2 */
gen act2 = floor(activity/10000);

/* Add indicator for travel in which respondent is driving a car */
gen driving = where==230 if where>=230 & where<=240 & act2 == 18;


/* Create time variable.  Starttime records time (in minutes) after 4:00 AM */
gen double time = clock(start , "hms");
gen starttime = hh(time)*60+mm(time)-240;
replace starttime = starttime + 24*60 if starttime<0;
drop time;

sort caseid actline;
save ../data/output/atusxpared, replace;

keep if actline==1;
keep caseid female spousepres childpres;

sort caseid;
save ../data/output/demographics, replace;
