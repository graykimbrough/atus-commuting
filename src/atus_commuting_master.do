#delimit ;
clear all;
capture log close;
set more off;
log using ../log/ATUSXmaster.log, replace;

/* Master file to perform all calculations and analysis, plus create all 
	tables and figures, for paper:
	
	"Measuring Commuting in the American Time Use Survey,"
	Gray Kimbrough, 2016.
	
	https://ideas.repec.org/p/ris/uncgec/2015_002.html
*/

/* Read in data and produce atus_prelim file in data directory */
/* Switch to carriage return delimiters for this portion, since these
	files are edited versions of those provided by IPUMS through ATUS-X */
do read_ATUSX_extract.do;
do labels_and_formats.do;

/* Pare the data */
do ATUSX_paring.do;

/* Construct the set of ATUS commutes */
do dataset_construction.do;

/* Produce some statistics comparing commuting across NHTS, ATUS, and ACS */
do commute_comparison.do;

/* Produce figures */
do figures.do;

/* Perform multivariate analysis of differences in commuting between the 
	surveys */
do multivariate_analysis.do;

capture log close;
