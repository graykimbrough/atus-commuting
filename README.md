# ATUS-Commuting
This Stata code uses the trip tour methodology described in [Kimbrough (2016)](https://ideas.repec.org/p/ris/uncgec/2015_002.html) to construct a measure of commuting from ATUS activity-level files.  If you incorporate or adapt this methodology into your analysis, please cite the latest version of this paper.  Currently it is a working paper, and the most recent version can be found at [RePEC](https://ideas.repec.org/p/ris/uncgec/2015_002.html).

## Master file
[atus_commuting_calculation.do](src/atus_commuting_calculation.do) calls each of the component programs in order.  

## Paring
The provided [paring program](src/ATUSX_paring.do) reduces the sample in certain ways that were needed for the paper but may not be needed for your analysis.  In particular, age and weekday filters may not be desired.

## Data files
ATUS data were sourced from [ATUS-X](https://www.atusdata.org/atus/), in the form of hierarchical extracts.  The provided .do files were edited to construct from these hierarchical files a rectangular dataset, with individual and household characteristics attached to each activity line in a respondent's time diary.

Users wishing to use their own ATUS-X input files should place the .dta files in the data/input directory and modify the accompanying .do files from ATUS-X using the guidance in the comments of the [data read-in program](src/read_ATUSX.do).

### Supplied as .zip files
A data file is provided in .zip format in the [data/input](data/input) directory.  To use this file, unzip it in its given directory.

### Merging in additional data
If you wish to incorporate other covariates, the simplest solution is to obtain a person-level rectangular extract in Stata format from [ATUS-X](https://www.atusdata.org/atus/) with the desired characteristics.  These characteristics can be merged using the `caseid` variable, which uniquely identifies households in the ATUS-X data:

>`merge 1:1 caseid using ../data/output/atus_commutes`
