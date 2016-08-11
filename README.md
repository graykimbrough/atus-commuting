# ATUS-Commuting
This Stata code uses the trip tour methodology describe in [Kimbrough (2016)](https://ideas.repec.org/p/ris/uncgec/2015_002.html) to construct a measure of commuting from ATUS activity-level files.  Additionally, the provided code performs calculations and analysis found in the paper (plus additional analysis) and produces figures and tables.

## Master file
atus_commuting_master.do calls each of the component programs in order.  To remove analysis, figures, etc., begin by commenting out the relevant portions here.  In particular, figures.do includes some very processor-intensive code to produce tempograms.  Do not run this as-is without sufficient computing resources and time.

## Data files
ATUS data were sourced from [ATUS-X](https://www.atusdata.org/atus/), in the form of hierarchical extracts.  The provided .do files were edited to construct from these hierarchical files a rectangular dataset, with individual and household characteristics attached to each activity line in a respondent's time diary.

ACS data were similarly sourced from [IPUMS-USA](https://usa.ipums.org/usa/).  The extract file is supplied here.

NHTS data are converted Stata-format versions of the files found at the [NHTS website](http://nhts.ornl.gov/download.shtml).

### Supplied as .zip files
To use provided data files, check each relevant subdirectory of the data directory for a zipped compressed file; unzip these files in the given directories.

### Versioning
Stata data files may be unreadable on Stata versions prior to 13.0.  Contact the author for older versions of these datasets.
