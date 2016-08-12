/* Adapted version of .do file to input data as provided by IPUMS at ATUS-X,
	with some light edits plus a major change:
	Create a rectangular dataset instead of a hierarchical one
*/

clear
quietly infix                       ///
  byte    rectype          1-1      ///
  double  caseid           2-15     ///
  long    year             16-20    ///
  long    activity         21-26    ///
  int     where            27-30    ///
  int     duration_ext     31-34    ///
  int     duration         35-38    ///
  byte    actline          39-40    ///
  int     scc_hhnhhown_ln  41-44    ///
  long    scc_nownnhh_ln   45-49    ///
  int     sed_all_ln       50-53    ///
  str     start            54-61    ///
  str     stop             62-69    ///
  using `"../data/atus/atus_extract_full.dat"' if rectype==3
save ../data/output/__temp_ipums_hier_3.dta

clear
quietly infix                       ///
  byte    rectype          1-1      ///
  double  caseid           2-15     ///
  long    year             16-20    ///
  byte    pernum           21-22    ///
  int     lineno           23-25    ///
  int     lineno_cps8      26-28    ///
  byte    presence         29-29    ///
  int     month            30-32    ///
  byte    day              33-34    ///
  byte    holiday          35-36    ///
  double  date             37-45    ///
  double  wt06             46-62    ///
  int     age              63-65    ///
  byte    sex              66-67    ///
  int     race             68-71    ///
  int     hispan           72-75    ///
  byte    marst            76-77    ///
  int     yrimmig          78-80    ///
  int     citizen          81-83    ///
  long    bpl              84-89    ///
  long    mbpl             90-95    ///
  long    fbpl             96-101   ///
  int     relate           102-104  ///
  byte    sex_cps8         105-106  ///
  byte    popstat          107-108  ///
  int     educ             109-111  ///
  int     educyrs          112-114  ///
  byte    schlcoll         115-116  ///
  byte    schlcoll_cps8    117-118  ///
  byte    empstat          119-120  ///
  byte    multjobs         121-122  ///
  byte    clwkr            123-124  ///
  int     occ2             125-128  ///
  long    occ              129-133  ///
  int     ind2             134-137  ///
  int     whyabsnt         138-140  ///
  byte    fullpart         141-142  ///
  int     uhrswork1        143-145  ///
  float   earnweek         146-152  ///
  byte    paidhour         153-154  ///
  byte    earnrpt          155-156  ///
  float   hourwage         157-161  ///
  int     hrsatrate        162-164  ///
  byte    otusual          165-166  ///
  float   otpay            167-173  ///
  byte    spousepres       174-175  ///
  int     spage            176-178  ///
  int     sprace           179-182  ///
  int     sphispan         183-186  ///
  int     speduc           187-189  ///
  byte    spempnot         190-191  ///
  byte    spempstat        192-193  ///
  int     spusualhrs       194-196  ///
  float   spearnweek       197-203  ///
  byte    kidund18         204-205  ///
  byte    hh_numownkids    206-207  ///
  byte    kidund13         208-209  ///
  byte    kidund1          210-211  ///
  byte    kid1to2          212-213  ///
  byte    kid3to5          214-215  ///
  byte    kid6to12         216-217  ///
  byte    kid13to17        218-219  ///
  byte    dtrund18         220-221  ///
  byte    dtrund1          222-223  ///
  byte    dtr1to2          224-225  ///
  byte    dtr3to5          226-227  ///
  byte    dtr6to12         228-229  ///
  byte    dtr13to17        230-231  ///
  byte    sonund18         232-233  ///
  byte    sonund1          234-235  ///
  byte    son1to2          236-237  ///
  byte    son3to5          238-239  ///
  byte    son6to12         240-241  ///
  byte    son13to17        242-243  ///
  byte    nonhhchild       244-245  ///
  int     hhtime           246-249  ///
  int     totalhhtime      250-253  ///
  using `"../data/atus/atus_extract_full.dat"' if rectype==2
save ../data/output/__temp_ipums_hier_2.dta

clear
quietly infix                       ///
  byte    rectype          1-1      ///
  double  caseid           2-15     ///
  long    year             16-20    ///
  double  hrhhid_cps8      21-35    ///
  long    hrhhid2_cps8     36-41    ///
  str     hrsersuf_cps8    42-42    ///
  str     hrsample_cps8    43-46    ///
  byte    huhhnum_cps8     47-48    ///
  int     year_cps8        49-52    ///
  byte    month_cps8       53-54    ///
  byte    region           55-55    ///
  byte    statefip         56-57    ///
  byte    metro            58-59    ///
  byte    msasize          60-60    ///
  long    metarea          61-65    ///
  int     famincome        66-68    ///
  int     hh_size          69-71    ///
  byte    poverty130       72-73    ///
  byte    poverty185       74-75    ///
  byte    povertylevel     76-77    ///
  byte    foodstamp        78-79    ///
  byte    hhtenure         80-81    ///
  byte    hh_child         82-83    ///
  byte    housetype        84-85    ///
  byte    hh_numkids       86-87    ///
  byte    fambus           88-89    ///
  int     ageychild        90-92    ///
  byte    fambus_resp      93-94    ///
  byte    hh_numadults     95-96    ///
  byte    fambus_spouse    97-98    ///
  byte    fambus_other     99-100   ///
  using `"../data/atus/atus_extract_full.dat"' if rectype == 1
save ../data/output/__temp_ipums_hier_1.dta

clear
use ../data/output/__temp_ipums_hier_3.dta
merge m:1 caseid using ../data/output/__temp_ipums_hier_2.dta, nogen
merge m:1 caseid using ../data/output/__temp_ipums_hier_1.dta, nogen
erase ../data/output/__temp_ipums_hier_3.dta
erase ../data/output/__temp_ipums_hier_2.dta
erase ../data/output/__temp_ipums_hier_1.dta


save ../data/output/atus_prelim, replace
