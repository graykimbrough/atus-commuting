#delimit;
/* Produce a dataset containing one observation per person, with the desired
	commuting measure(s).
	
Inputs:
 (1) atus_final_spells

Outputs:
 (1) atus_commutes
 
Preferred measure is stored using variable commutetimeLT30.
*/

use ../data/output/atus_final_spells, clear;

/* This code keeps only caseid (unique ID for each respondent) and
	the preferred commuting time measure for each individual.
	
	Other variables (e.g. from 
	demographics dataset in /data/output/demographics)
	can be merged in on caseid. 
	
	Any other measures calculated for each individual can be retained
	by adding to the below keep statement.
*/
	
keep caseid commutetimeLT30;

/* Because all of these measures are calculated at the individual level,
	simply keep the first observation per each person. 
*/
bysort caseid: keep if _n==1;

save ../data/output/atus_commutes, replace;
