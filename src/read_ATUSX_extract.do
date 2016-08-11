/* Adapted version of .do file to input data as provided by IPUMS at ATUS-X,
	with some light edits plus a major change:
	Create a rectangular dataset instead of a hierarchical one
*/

clear
quietly infix                       ///
  byte    rectype          1-1      ///
  double  caseid           19-32    ///
  long    activity         33-38    ///
  int     where            39-42    ///
  int     duration_ext     43-46    ///
  int     duration         47-50    ///
  byte    actline          51-52    ///
  str     start            53-60    ///
  str     stop             61-68    ///
  int     scc_hhnhhown_ln  69-72    ///
  long    scc_nownnhh_ln   73-77    ///
  int     sed_all_ln       78-81    ///
  using `"../data/atus/atus_extract.dat"' if rectype==3
save ../data/output/__temp_ipums_hier_3.dta

clear
quietly infix                       ///
  byte    rectype          1-1      ///
  double  caseid           19-32    ///
  int     lineno           33-35    ///
  float   wt06             36-51    ///
  byte    pernum           52-53    ///
  int     lineno_cps8      54-56    ///
  byte    presence         57-57    ///
  byte    holiday          58-59    ///
  byte    day              60-61    ///
  long    year             62-66    ///
  int     age              67-69    ///
  byte    sex              70-71    ///
  int     race             72-75    ///
  int     hispan           76-79    ///
  byte    marst            80-81    ///
  int     yrimmig          82-84    ///
  int     citizen          85-87    ///
  long    bpl              88-93    ///
  long    mbpl             94-99    ///
  long    fbpl             100-105  ///
  int     relate           106-108  ///
  byte    popstat          109-110  ///
  int     educ             111-113  ///
  int     educyrs          114-116  ///
  byte    schlcoll         117-118  ///
  byte    schlcoll_cps8    119-120  ///
  byte    empstat          121-122  ///
  byte    multjobs         123-124  ///
  byte    clwkr            125-126  ///
  int     occ2             127-130  ///
  long    occ              131-135  ///
  int     ind2             136-139  ///
  int     whyabsnt         140-142  ///
  float   otpay            143-149  ///
  byte    otusual          150-151  ///
  int     hrsatrate        152-154  ///
  float   hourwage         155-159  ///
  byte    earnrpt          160-161  ///
  byte    paidhour         162-163  ///
  float   earnweek         164-170  ///
  int     uhrswork1        171-173  ///
  byte    fullpart         174-175  ///
  byte    spousepres       176-177  ///
  int     spage            178-180  ///
  int     sprace           181-184  ///
  int     sphispan         185-188  ///
  int     speduc           189-191  ///
  byte    spempnot         192-193  ///
  byte    spempstat        194-195  ///
  int     spusualhrs       196-198  ///
  float   spearnweek       199-205  ///
  byte    kidund18         206-207  ///
  byte    hh_numownkids    208-209  ///
  byte    kidund13         210-211  ///
  byte    kidund1          212-213  ///
  byte    kid1to2          214-215  ///
  byte    kid3to5          216-217  ///
  byte    kid6to12         218-219  ///
  byte    kid13to17        220-221  ///
  byte    dtrund18         222-223  ///
  byte    dtrund1          224-225  ///
  byte    dtr1to2          226-227  ///
  byte    dtr3to5          228-229  ///
  byte    dtr6to12         230-231  ///
  byte    dtr13to17        232-233  ///
  byte    sonund18         234-235  ///
  byte    sonund1          236-237  ///
  byte    son1to2          238-239  ///
  byte    son3to5          240-241  ///
  byte    son6to12         242-243  ///
  byte    son13to17        244-245  ///
  byte    nonhhchild       246-247  ///
  byte    sex_cps8         248-249  ///
  int     month            250-252  ///
  double  date             253-261  ///
  int     hhtime           262-265  ///
  int     totalhhtime      266-269  ///
  using `"../data/atus/atus_extract.dat"' if rectype==2
save ../data/output/__temp_ipums_hier_2.dta

clear
quietly infix                       ///
  byte    rectype          1-1      ///
  double  caseid           19-32    ///
  double  hrhhid_cps8      33-47    ///
  long    hrhhid2_cps8     48-53    ///
  str     hrsersuf_cps8    54-55    ///
  str     hrsample_cps8    56-60    ///
  byte    huhhnum_cps8     61-62    ///
  int     year_cps8        63-66    ///
  byte    month_cps8       67-68    ///
  byte    region           69-69    ///
  byte    statefip         70-71    ///
  byte    metro            72-73    ///
  byte    msasize          74-75    ///
  long    metarea          76-80    ///
  int     hh_size          81-83    ///
  byte    hh_child         84-85    ///
  byte    hh_numkids       86-87    ///
  int     ageychild        88-90    ///
  byte    hh_numadults     91-92    ///
  int     hh_numempld      93-95    ///
  int     famincome        96-98    ///
  byte    poverty130       99-100   ///
  byte    poverty185       101-102  ///
  byte    povertylevel     103-104  ///
  byte    foodstamp        105-106  ///
  byte    hhtenure         107-108  ///
  byte    housetype        109-110  ///
  byte    fambus           111-112  ///
  byte    fambus_resp      113-114  ///
  byte    fambus_spouse    115-116  ///
  byte    fambus_other     117-118  ///
  using `"../data/atus/atus_extract.dat"' if rectype == 1
save ../data/output/__temp_ipums_hier_1.dta

clear
use ../data/output/__temp_ipums_hier_3.dta
merge m:1 caseid using ../data/output/__temp_ipums_hier_2.dta, nogen
merge m:1 caseid using ../data/output/__temp_ipums_hier_1.dta, nogen
erase ../data/output/__temp_ipums_hier_3.dta
erase ../data/output/__temp_ipums_hier_2.dta
erase ../data/output/__temp_ipums_hier_1.dta


save ../data/output/atus_prelim, replace
