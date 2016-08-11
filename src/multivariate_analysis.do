#delimit;
/* Multivariate analysis  */

/* Get stats for ACS, too */
use ../data/output/ACSfinal, clear;
svy: prop sex;

/* Education:
  1 - LTHS
  2 - HS grad (incl. GED)
  3 - some college
  4 - college grad
  5 - grad degree */

gen educatt=.;
replace educatt=1 if educd>=2 & educd<=61;
replace educatt=2 if educd>=62 & educd<=64;
replace educatt=3 if educd>=65 & educd<101;
replace educatt=4 if educd==101;
replace educatt=5 if educd>=114 & educd<=116;

svy: prop educatt;

gen agecat=1 if ~missing(age);
replace agecat = 2 if age>=35 & age<=44;
replace agecat=3 if age>45 & age<=60;

svy: prop agecat;

gen whitenonhisp = (hispan==0 & probwht ==100) &
	~missing(hispan) & ~missing(probwht);
	
svy: mean whitenonhisp;

/* Pool ATUS and NHTS data */

/* For NHTS, construct categorical variables */
/* Female: 1 if female */
use ../data/output/NHTSfinal, clear;
keep if firstline;
gen female=(r_sex==2);

/* Education:
  1 - LTHS
  2 - HS grad (incl. GED)
  3 - some college
  4 - college grad
  5 - grad degree */
gen educatt=educ;
replace educatt=. if educ<1;

/* Age categories */
gen agecat=.;
replace agecat=1 if (r_age>=25 & r_age<=34);
replace agecat=2 if (r_age>=35 & r_age<=44);
replace agecat=3 if (r_age>=45 & r_age<=60);

/* Race/ethnicity */
gen whitenonhisp=(hh_race==1 & hh_hisp==2) 
  if (~missing(hh_race) & ~missing(hh_hisp));

/* Presence of children -- note no missing values*/
gen kidspres=1-(lif_cyc==1 | lif_cyc==2 | lif_cyc==9);

/* Indicator for ATUS */
gen ATUS_ind=0;
/* Rename dependent variable to be same across both datasets */
rename commutetravtime commutetime;

/* Normalize weights to mean 1 */
sum wtperfin;
gen weight=wtperfin/r(mean);
keep commutetime ATUS_ind female educatt agecat whitenonhisp kidspres weight;

save ../data/output/NHTS_for_reg, replace;

/* Do same for ATUS */
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

gen ATUS_ind=1;

/* Race/ethnicity */
gen whitenonhisp=(race==0100 & hispan==0100) 
  if (~missing(race) & ~missing(hispan));

/* Presence of children */
gen kidspres = hh_numkids>0 if ~missing(hh_numkids);

rename commutetimeLT30 commutetime;
keep commutetime ATUS_ind female educatt agecat whitenonhisp kidspres wt06;
append using ../data/output/NHTS_for_reg;

qui sum weight if ATUS_ind==0;
local num_NHTS=r(N);

qui sum wt06 if ATUS_ind==1;
local num_ATUS=r(N);
replace weight=(wt06/r(mean))*`num_NHTS'/`num_ATUS' if ATUS_ind==1;

drop wt06;
bysort ATUS_ind: sum weight;

svyset [pweight=weight];

/* Proportion of sample with each category value */
svy: prop educatt, over(ATUS_ind);
svy: prop agecat, over(ATUS_ind);
svy: prop female, over(ATUS_ind);
svy: prop whitenonhisp, over(ATUS_ind);
/* svy: prop kidspres, over(ATUS_ind); */

svy: reg commutetime i.ATUS_ind;

svy: reg commutetime i.ATUS_ind ib0.female ib2.educatt ib2.agecat ib1.whitenonhisp;

svy: reg commutetime i.ATUS_ind##(ib0.female ib2.educatt ib2.agecat ib1.whitenonhisp);

test 1.female;
test 1.educatt 3.educatt 4.educatt 5.educatt;
test 1.agecat 3.agecat;
test 0.whitenonhisp;

test 1.ATUS_ind;
test 1.ATUS_ind#1.female;
test 1.ATUS_ind#1.educatt 1.ATUS_ind#3.educatt 1.ATUS_ind#4.educatt 1.ATUS_ind#5.educatt;
test 1.ATUS_ind#1.agecat 1.ATUS_ind#3.agecat;
test 1.ATUS_ind#0.whitenonhisp;

test 1.ATUS_ind 1.ATUS_ind#1.female 1.ATUS_ind#1.educatt 1.ATUS_ind#3.educatt 1.ATUS_ind#4.educatt 1.ATUS_ind#5.educatt 1.ATUS_ind#1.agecat 1.ATUS_ind#3.agecat 1.ATUS_ind#0.whitenonhisp;

/*svy: reg commutetime i.ATUS_ind##(ib0.female ib2.educatt ib3.agecat);
test 1.agecat 2.agecat;
*/
