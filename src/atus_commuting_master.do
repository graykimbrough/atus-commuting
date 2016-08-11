#delimit;

/* New master for all data 2003-2012
Using ATUS-X data

Initiated 10/20/2013

v4: uses v3 of commute_comparison and v4 of figures
v5: Uses v2 of paring program
v6: Uses v4 of commute_comparison and v6 of figures
*/

clear all;
capture log close;
set more off;

log using ATUSXmaster.log, replace;

/* Read in data and produce atus_prelim file in data directory */

cd ../../data/atus/;
do extract_jgkimbro_uncg_edu36_atus_rvsd.do ;
cd ../../stata/postdefense;

/* Pare the data */
do ATUSXparing_v2.do;

do construction_newmethod.do;

do commute_comparison_v6.do;

do figures_v9.do;

do multivariate.do;

capture log close;
