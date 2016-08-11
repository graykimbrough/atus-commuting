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

log using ../log/ATUSXmaster.log, replace;

/* Read in data and produce atus_prelim file in data directory */
do read_atus_extract.do;

/* Pare the data */
do ATUSXparing.do;

do dataset_construction.do;

do commute_comparison.do;

do figures.do;

do multivariate_analysis.do;

capture log close;
