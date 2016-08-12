#delimit ;
clear all;
capture log close;
set more off;
log using ../log/atus_commuting_calculation.log, replace;

/* Master file to calculate commuting times using the trip tour methodology
	described in:
	
	"Measuring Commuting in the American Time Use Survey,"
	Gray Kimbrough, 2016.
	
	https://ideas.repec.org/p/ris/uncgec/2015_002.html
	
	Unlike the paper replication programs, this program uses an extract
	containing all available data as of July 2016, 2003-2015 ATUS.
*/

/* Read in data and produce atus_prelim file in data directory */
do read_ATUSX.do;
do ATUSX_labels_and_formats.do;

/* Pare the data */
do ATUSX_paring.do;

/* Construct the set of ATUS commutes */
do dataset_construction.do;

capture log close;
