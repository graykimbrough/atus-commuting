
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

replace wt06            = wt06            / 1000000
replace otpay           = otpay           / 100
replace hourwage        = hourwage        / 100
replace earnweek        = earnweek        / 100
replace spearnweek      = spearnweek      / 100

format caseid          %14.0f
format wt06            %16.6f
format hrhhid_cps8     %15.0f
format otpay           %7.2f
format hourwage        %5.2f
format earnweek        %7.2f
format spearnweek      %7.2f

label var rectype         `"Record Type"'
label var caseid          `"ATUS Case ID"'
label var lineno          `"Person line number"'
label var wt06            `"Person weight, 2006 methodology"'
label var pernum          `"Person number (general)"'
label var hrhhid_cps8     `"Household ID (CPS)"'
label var hrhhid2_cps8    `"Household ID part 2 (CPS)"'
label var hrsersuf_cps8   `"Serial Suffix (CPS)"'
label var hrsample_cps8   `"Sample ID (CPS)"'
label var huhhnum_cps8    `"Household number (CPS)"'
label var year_cps8       `"Year of final CPS interview"'
label var month_cps8      `"Month of final CPS interview"'
label var region          `"Region"'
label var statefip        `"FIPS State Code"'
label var metro           `"Metropolitan/central city status"'
label var msasize         `"MSA/PMSA size"'
label var metarea         `"Consolidated MSA name"'
label var hh_size         `"Number of people in household"'
label var hh_child        `"Children under 18 in household"'
label var hh_numkids      `"Number of children under 18 in household"'
label var ageychild       `"Age of youngest household child"'
label var hh_numadults    `"Number of adults in household"'
label var hh_numempld     `"Number of employed adults in household"'
label var famincome       `"Family income"'
label var poverty130      `"Household income greater or less than 130% of poverty level"'
label var poverty185      `"Household income greater or less than 185% of poverty level"'
label var povertylevel    `"Income values used in POVERTY185 and POVERTY130"'
label var foodstamp       `"Household received food stamps in past 30 days"'
label var hhtenure        `"Living quarters owned, rented, or occupied without rent"'
label var housetype       `"Type of housing unit"'
label var fambus          `"Business or farm owned by household member"'
label var fambus_resp     `"Business or farm owned by respondent"'
label var fambus_spouse   `"Business or farm owned by respondent's spouse or unmarried partner"'
label var fambus_other    `"Business or farm owned by other hh member"'
label var lineno_cps8     `"Person line number (CPS)"'
label var presence        `"Presence in household"'
label var holiday         `"Day of ATUS interview was a holiday"'
label var day             `"ATUS interview day of the week"'
label var year            `"Year of ATUS interview"'
label var age             `"Age"'
label var sex             `"Sex"'
label var race            `"Race"'
label var hispan          `"Hispanic origin"'
label var marst           `"Marital status"'
label var yrimmig         `"Year of immigration"'
label var citizen         `"Citizenship status"'
label var bpl             `"Birthplace"'
label var mbpl            `"Mother's birthplace"'
label var fbpl            `"Father's birthplace"'
label var relate          `"Relationship to ATUS respondent "'
label var popstat         `"Adult civilian, armed forces, or child (CPS)"'
label var educ            `"Highest level of school completed"'
label var educyrs         `"Years of education"'
label var schlcoll        `"Enrollment in school or college"'
label var schlcoll_cps8   `"Enrollment in school or college (CPS)"'
label var empstat         `"Labor force status"'
label var multjobs        `"Has more than one job"'
label var clwkr           `"Class of worker, main job"'
label var occ2            `"General occupation category, main job"'
label var occ             `"Detailed occupation category, main job"'
label var ind2            `"General industry classification, main job"'
label var whyabsnt        `"Reason absent from job last week"'
label var otpay           `"Weekly overtime earnings"'
label var otusual         `"Usually receives overtime, tips, commission at main job"'
label var hrsatrate       `"Hours worked at hourly rate"'
label var hourwage        `"Hourly earnings"'
label var earnrpt         `"Easiest way to report earnings"'
label var paidhour        `"Hourly or non-hourly pay"'
label var earnweek        `"Weekly earnings"'
label var uhrswork1       `"Hours usually worked per week at main job"'
label var fullpart        `"Full time/part time employment status"'
label var spousepres      `"Spouse or unmarried partner in household"'
label var spage           `"Age of respondent's spouse or unmarried partner"'
label var sprace          `"Race of respondent's spouse or unmarried partner"'
label var sphispan        `"Hispanic origin of respondent's spouse or unmarried partner"'
label var speduc          `"Highest level of school completed of respondent's spouse or unmarried partner"'
label var spempnot        `"Spouse or unmarried partner employed"'
label var spempstat       `"Spouse or unmarried partner employment status"'
label var spusualhrs      `"Spouse or unmarried partner usual work hours"'
label var spearnweek      `"Weekly earnings of respondent's spouse or unmarried partner"'
label var kidund18        `"Own child under 18 in household"'
label var hh_numownkids   `"Number of own children under 18 in household"'
label var kidund13        `"Own child under 13 in household"'
label var kidund1         `"Own child under 1 in household"'
label var kid1to2         `"Own child age 1 to 2 in household"'
label var kid3to5         `"Own child age 3 to 5 in household"'
label var kid6to12        `"Own child age 6 to 12 in household"'
label var kid13to17       `"Own child age 13 to 17 in household"'
label var dtrund18        `"Own daughter under 18 in household"'
label var dtrund1         `"Own daughter under 1 in household"'
label var dtr1to2         `"Own daughter age 1 to 2 in household"'
label var dtr3to5         `"Own daughter age 3 to 5 in household"'
label var dtr6to12        `"Own daughter age 6 to 12 in household"'
label var dtr13to17       `"Own daughter age 13 to 17 in household"'
label var sonund18        `"Own son under 18 in household"'
label var sonund1         `"Own son under 1 in household"'
label var son1to2         `"Own son age 1 to 2 in household"'
label var son3to5         `"Own son age 3 to 5 in  household"'
label var son6to12        `"Own son age 6 to 12 in household"'
label var son13to17       `"Own son age 13 to 17 in household"'
label var nonhhchild      `"Own child under 18 not in household"'
label var activity        `"Activity"'
label var where           `"Location of activity"'
label var duration_ext    `"Duration of activity (extended version)"'
label var duration        `"Duration of activity"'
label var actline         `"Activity line number"'
label var start           `"Activity start time"'
label var stop            `"Activity stop time"'
label var scc_hhnhhown_ln `"Time spent during activity on secondary child care of household and own, non-hou"'
label var scc_nownnhh_ln  `"Time spent during activity on secondary child care of non-own, non-household chi"'
label var sed_all_ln      `"Duration of time spent during activity on secondary eating and drinking"'
label var sex_cps8        `"Sex (CPS)"'
label var month           `"Month of ATUS interview"'
label var date            `"Date of ATUS interview"'
label var hhtime          `"No description"'
label var totalhhtime     `"Total (correct, not specific) HH time.  Other variable is specHHtime."'

label define lineno_lbl 1   `"1"'
label define lineno_lbl 2   `"2"', add
label define lineno_lbl 3   `"3"', add
label define lineno_lbl 4   `"4"', add
label define lineno_lbl 5   `"5"', add
label define lineno_lbl 6   `"6"', add
label define lineno_lbl 7   `"7"', add
label define lineno_lbl 8   `"8"', add
label define lineno_lbl 9   `"9"', add
label define lineno_lbl 10  `"10"', add
label define lineno_lbl 11  `"11"', add
label define lineno_lbl 12  `"12"', add
label define lineno_lbl 13  `"13"', add
label define lineno_lbl 14  `"14"', add
label define lineno_lbl 15  `"15"', add
label define lineno_lbl 16  `"16"', add
label define lineno_lbl 17  `"17"', add
label define lineno_lbl 18  `"18"', add
label define lineno_lbl 19  `"19"', add
label define lineno_lbl 999 `"NIU (Not in universe)"', add
label values lineno lineno_lbl

label define wt06_lbl 0 `"0"'
label values wt06 wt06_lbl

label define pernum_lbl 1  `"1"'
label define pernum_lbl 2  `"2"', add
label define pernum_lbl 3  `"3"', add
label define pernum_lbl 4  `"4"', add
label define pernum_lbl 5  `"5"', add
label define pernum_lbl 6  `"6"', add
label define pernum_lbl 7  `"7"', add
label define pernum_lbl 8  `"8"', add
label define pernum_lbl 9  `"9"', add
label define pernum_lbl 10 `"10"', add
label define pernum_lbl 11 `"11"', add
label define pernum_lbl 12 `"12"', add
label define pernum_lbl 13 `"13"', add
label define pernum_lbl 14 `"14"', add
label define pernum_lbl 15 `"15"', add
label define pernum_lbl 16 `"16"', add
label values pernum pernum_lbl

label define hrhhid2_cps8_lbl 999999 `"NIU (Not in universe)"'
label values hrhhid2_cps8 hrhhid2_cps8_lbl

label define huhhnum_cps8_lbl 1  `"1"'
label define huhhnum_cps8_lbl 2  `"2"', add
label define huhhnum_cps8_lbl 3  `"3"', add
label define huhhnum_cps8_lbl 4  `"4"', add
label define huhhnum_cps8_lbl 5  `"5"', add
label define huhhnum_cps8_lbl 6  `"6"', add
label define huhhnum_cps8_lbl 99 `"NIU (Not in universe)"', add
label values huhhnum_cps8 huhhnum_cps8_lbl

label define year_cps8_lbl 2002 `"2002"'
label define year_cps8_lbl 2003 `"2003"', add
label define year_cps8_lbl 2004 `"2004"', add
label define year_cps8_lbl 2005 `"2005"', add
label define year_cps8_lbl 2006 `"2006"', add
label define year_cps8_lbl 2007 `"2007"', add
label define year_cps8_lbl 2008 `"2008"', add
label define year_cps8_lbl 2009 `"2009"', add
label define year_cps8_lbl 2010 `"2010"', add
label define year_cps8_lbl 2011 `"2011"', add
label define year_cps8_lbl 2012 `"2012"', add
label values year_cps8 year_cps8_lbl

label define month_cps8_lbl 1  `"January"'
label define month_cps8_lbl 2  `"February"', add
label define month_cps8_lbl 3  `"March"', add
label define month_cps8_lbl 4  `"April"', add
label define month_cps8_lbl 5  `"May"', add
label define month_cps8_lbl 6  `"June"', add
label define month_cps8_lbl 7  `"July"', add
label define month_cps8_lbl 8  `"August"', add
label define month_cps8_lbl 9  `"September"', add
label define month_cps8_lbl 10 `"October"', add
label define month_cps8_lbl 11 `"November"', add
label define month_cps8_lbl 12 `"December"', add
label values month_cps8 month_cps8_lbl

label define region_lbl 1 `"Northeast"'
label define region_lbl 2 `"Midwest"', add
label define region_lbl 3 `"South"', add
label define region_lbl 4 `"West"', add
label values region region_lbl

label define statefip_lbl 1  `"Alabama"'
label define statefip_lbl 2  `"Alaska"', add
label define statefip_lbl 4  `"Arizona"', add
label define statefip_lbl 5  `"Arkansas"', add
label define statefip_lbl 6  `"California"', add
label define statefip_lbl 8  `"Colorado"', add
label define statefip_lbl 9  `"Connecticut"', add
label define statefip_lbl 10 `"Delaware"', add
label define statefip_lbl 11 `"District of Columbia"', add
label define statefip_lbl 12 `"Florida"', add
label define statefip_lbl 13 `"Georgia"', add
label define statefip_lbl 15 `"Hawaii"', add
label define statefip_lbl 16 `"Idaho"', add
label define statefip_lbl 17 `"Illinois"', add
label define statefip_lbl 18 `"Indiana"', add
label define statefip_lbl 19 `"Iowa"', add
label define statefip_lbl 20 `"Kansas"', add
label define statefip_lbl 21 `"Kentucky"', add
label define statefip_lbl 22 `"Louisiana"', add
label define statefip_lbl 23 `"Maine"', add
label define statefip_lbl 24 `"Maryland"', add
label define statefip_lbl 25 `"Massachusetts"', add
label define statefip_lbl 26 `"Michigan"', add
label define statefip_lbl 27 `"Minnesota"', add
label define statefip_lbl 28 `"Mississippi"', add
label define statefip_lbl 29 `"Missouri"', add
label define statefip_lbl 30 `"Montana"', add
label define statefip_lbl 31 `"Nebraska"', add
label define statefip_lbl 32 `"Nevada"', add
label define statefip_lbl 33 `"New Hampshire"', add
label define statefip_lbl 34 `"New Jersey"', add
label define statefip_lbl 35 `"New Mexico"', add
label define statefip_lbl 36 `"New York"', add
label define statefip_lbl 37 `"North Carolina"', add
label define statefip_lbl 38 `"North Dakota"', add
label define statefip_lbl 39 `"Ohio"', add
label define statefip_lbl 40 `"Oklahoma"', add
label define statefip_lbl 41 `"Oregon"', add
label define statefip_lbl 42 `"Pennsylvania"', add
label define statefip_lbl 44 `"Rhode Island"', add
label define statefip_lbl 45 `"South Carolina"', add
label define statefip_lbl 46 `"South Dakota"', add
label define statefip_lbl 47 `"Tennessee"', add
label define statefip_lbl 48 `"Texas"', add
label define statefip_lbl 49 `"Utah"', add
label define statefip_lbl 50 `"Vermont"', add
label define statefip_lbl 51 `"Virginia"', add
label define statefip_lbl 53 `"Washington"', add
label define statefip_lbl 54 `"West Virginia"', add
label define statefip_lbl 55 `"Wisconsin"', add
label define statefip_lbl 56 `"Wyoming"', add
label values statefip statefip_lbl

label define metro_lbl 1 `"Metropolitan, central city"'
label define metro_lbl 2 `"Metropolitan, balance of MSA"', add
label define metro_lbl 3 `"Metropolitan, not identified"', add
label define metro_lbl 4 `"Nonmetropolitan"', add
label define metro_lbl 5 `"Not identified"', add
label values metro metro_lbl

label define msasize_lbl 0 `"Not identified or non-metropolitan"'
label define msasize_lbl 2 `"100,000 - 249,999"', add
label define msasize_lbl 3 `"250,000 - 499,999"', add
label define msasize_lbl 4 `"500,000 - 999,999"', add
label define msasize_lbl 5 `"1,000,000 - 2,499,999"', add
label define msasize_lbl 6 `"2,500,000 - 4,999,999"', add
label define msasize_lbl 7 `"5,000,000+"', add
label values msasize msasize_lbl

label define metarea_lbl 0     `"Not Identified or NonMetropolitan"'
label define metarea_lbl 460   `"Appleton-Oshkosh-Neenah, WI"', add
label define metarea_lbl 1120  `"Boston, MA"', add
label define metarea_lbl 1121  `"Boston-Worchester-Manchester, MS-NH-CT-ME"', add
label define metarea_lbl 1160  `"Bridgeport-New Haven-Stamford, CT"', add
label define metarea_lbl 1600  `"Chicago-Gary-Kenosha, IL-IN-WI"', add
label define metarea_lbl 1601  `"Chicago-Naperville-Michigan City, IL-IN-WI"', add
label define metarea_lbl 1640  `"Cincinnati-Hamilton, OH-KY-IN"', add
label define metarea_lbl 1641  `"Cincinnati-Middletown-Wilmington, OH-KY-IN"', add
label define metarea_lbl 1680  `"Cleveland-Akron, OH"', add
label define metarea_lbl 1681  `"Cleveland-Akron-Elyria, OH"', add
label define metarea_lbl 1920  `"Dallas-Fort Worth, TX"', add
label define metarea_lbl 1921  `"Dallas-Fort Worth, TX"', add
label define metarea_lbl 2000  `"Dayton-Springfield-Greenville, OH"', add
label define metarea_lbl 2080  `"Denver-Boulder-Greeley, CO"', add
label define metarea_lbl 2081  `"Denver-Aurora-Boulder, CO"', add
label define metarea_lbl 2160  `"Detroit-Ann Arbor-Flint, MI"', add
label define metarea_lbl 2161  `"Detroit-Warren-Flint, MI"', add
label define metarea_lbl 2840  `"Fresno-Madera, CA"', add
label define metarea_lbl 3000  `"Grand Rapids-Muskegon-Holland, MI (part)"', add
label define metarea_lbl 3120  `"Greensboro-Winston-Salem-High Point, NC (part)"', add
label define metarea_lbl 3160  `"Greenville-Anderson-Seneca, SC (part)"', add
label define metarea_lbl 3360  `"Houston-Galveston-Brazoria, TX"', add
label define metarea_lbl 3361  `"Houston-Baytown-Huntsville, TX (part)"', add
label define metarea_lbl 3440  `"Huntsville-Decatur, AL"', add
label define metarea_lbl 3480  `"Indianapolis-Anderson-Columbus, IN (part)"', add
label define metarea_lbl 3660  `"Johnson City-Kingsport-Bristol, TN-VA (part)"', add
label define metarea_lbl 4480  `"Los Angeles-Riverside-Orange County, CA"', add
label define metarea_lbl 4481  `"Los Angeles-Long Beach-Riverside, CA"', add
label define metarea_lbl 4680  `"Macon-Warner-Robins-Fort Valley, GA (part)"', add
label define metarea_lbl 5000  `"Miami-Fort Lauderdale, FL"', add
label define metarea_lbl 5080  `"Milwaukee-Racine, WI"', add
label define metarea_lbl 5081  `"Milwaukee-Racine-Waukesha, WI"', add
label define metarea_lbl 5120  `"Minneapolis-St. Paul-St. Cloud, MN-WI (part)"', add
label define metarea_lbl 5600  `"New York-Northern New Jersey-Long Island, NY-NJ-CT-PA"', add
label define metarea_lbl 5601  `"New York-Newark-Bridgeport, NY-NH-CT-PA"', add
label define metarea_lbl 6160  `"Philadelphia-Wilmington-Atlantic City, PA-NJ-DE-MD"', add
label define metarea_lbl 6161  `"Philadelphia-Camden-Vineland, PA-NJ-DE-MD"', add
label define metarea_lbl 6400  `"Portland-Salem, OR-WA"', add
label define metarea_lbl 6640  `"Raleigh-Durham-Cary, NC (part)"', add
label define metarea_lbl 6920  `"Sacramento-Yolo, CA"', add
label define metarea_lbl 6921  `"Sacramento-Arden-Arcade-Truckee, CA-NV"', add
label define metarea_lbl 7160  `"Salt Lake City-Ogden-Clearfield, UT (part)"', add
label define metarea_lbl 7360  `"San Francisco-Oakland-San Jose, CA"', add
label define metarea_lbl 7600  `"Seattle-Tacoma-Bremerton, WA"', add
label define metarea_lbl 7601  `"Seattle-Tacoma-Olympia, WA"', add
label define metarea_lbl 8840  `"Washington-Baltimore, DC-MD-VA-WV"', add
label define metarea_lbl 8841  `"Washington-Baltimore-Northern Virginia, DC-MD-VA-WV"', add
label define metarea_lbl 99998 `"Blank"', add
label define metarea_lbl 99999 `"NIU (Not in universe)"', add
label values metarea metarea_lbl

label define hh_size_lbl 1   `"1"'
label define hh_size_lbl 2   `"2"', add
label define hh_size_lbl 3   `"3"', add
label define hh_size_lbl 4   `"4"', add
label define hh_size_lbl 5   `"5"', add
label define hh_size_lbl 6   `"6"', add
label define hh_size_lbl 7   `"7"', add
label define hh_size_lbl 8   `"8"', add
label define hh_size_lbl 9   `"9"', add
label define hh_size_lbl 10  `"10"', add
label define hh_size_lbl 11  `"11"', add
label define hh_size_lbl 12  `"12"', add
label define hh_size_lbl 13  `"13"', add
label define hh_size_lbl 14  `"14"', add
label define hh_size_lbl 15  `"15"', add
label define hh_size_lbl 16  `"16"', add
label define hh_size_lbl 999 `"NIU (Not in universe)"', add
label values hh_size hh_size_lbl

label define hh_child_lbl 0  `"No"'
label define hh_child_lbl 1  `"Yes"', add
label define hh_child_lbl 99 `"NIU (Not in universe)"', add
label values hh_child hh_child_lbl

label define hh_numkids_lbl 0  `"0"'
label define hh_numkids_lbl 1  `"1"', add
label define hh_numkids_lbl 2  `"2"', add
label define hh_numkids_lbl 3  `"3"', add
label define hh_numkids_lbl 4  `"4"', add
label define hh_numkids_lbl 5  `"5"', add
label define hh_numkids_lbl 6  `"6"', add
label define hh_numkids_lbl 7  `"7"', add
label define hh_numkids_lbl 8  `"8"', add
label define hh_numkids_lbl 9  `"9"', add
label define hh_numkids_lbl 10 `"10"', add
label define hh_numkids_lbl 11 `"11"', add
label define hh_numkids_lbl 12 `"12"', add
label define hh_numkids_lbl 99 `"NIU (Not in universe)"', add
label values hh_numkids hh_numkids_lbl

label define ageychild_lbl 0   `"0"'
label define ageychild_lbl 1   `"1"', add
label define ageychild_lbl 2   `"2"', add
label define ageychild_lbl 3   `"3"', add
label define ageychild_lbl 4   `"4"', add
label define ageychild_lbl 5   `"5"', add
label define ageychild_lbl 6   `"6"', add
label define ageychild_lbl 7   `"7"', add
label define ageychild_lbl 8   `"8"', add
label define ageychild_lbl 9   `"9"', add
label define ageychild_lbl 10  `"10"', add
label define ageychild_lbl 11  `"11"', add
label define ageychild_lbl 12  `"12"', add
label define ageychild_lbl 13  `"13"', add
label define ageychild_lbl 14  `"14"', add
label define ageychild_lbl 15  `"15"', add
label define ageychild_lbl 16  `"16"', add
label define ageychild_lbl 17  `"17"', add
label define ageychild_lbl 999 `"NIU (Not in universe)"', add
label values ageychild ageychild_lbl

label define hh_numadults_lbl 0  `"0"'
label define hh_numadults_lbl 1  `"1"', add
label define hh_numadults_lbl 2  `"2"', add
label define hh_numadults_lbl 3  `"3"', add
label define hh_numadults_lbl 4  `"4"', add
label define hh_numadults_lbl 5  `"5"', add
label define hh_numadults_lbl 6  `"6"', add
label define hh_numadults_lbl 7  `"7"', add
label define hh_numadults_lbl 8  `"8"', add
label define hh_numadults_lbl 9  `"9"', add
label define hh_numadults_lbl 99 `"NIU (Not in universe)"', add
label values hh_numadults hh_numadults_lbl

label define hh_numempld_lbl 0  `"0"'
label define hh_numempld_lbl 1  `"1"', add
label define hh_numempld_lbl 2  `"2"', add
label define hh_numempld_lbl 3  `"3"', add
label define hh_numempld_lbl 4  `"4"', add
label define hh_numempld_lbl 5  `"5"', add
label define hh_numempld_lbl 6  `"6"', add
label define hh_numempld_lbl 7  `"7"', add
label define hh_numempld_lbl 8  `"8"', add
label define hh_numempld_lbl 99 `"NIU (Not in universe)"', add
label values hh_numempld hh_numempld_lbl

label define famincome_lbl 1   `"Less than $5,000"'
label define famincome_lbl 2   `"$5,000 to $7,499"', add
label define famincome_lbl 3   `"$7,500 to $9,999"', add
label define famincome_lbl 4   `"$10,000 to $12,499"', add
label define famincome_lbl 5   `"$12,500 to $14,999"', add
label define famincome_lbl 6   `"$15,000 to $19,999"', add
label define famincome_lbl 7   `"$20,000 to $24,999"', add
label define famincome_lbl 8   `"$25,000 to $29,999"', add
label define famincome_lbl 9   `"$30,000 to $34,999"', add
label define famincome_lbl 10  `"$35,000 to $39,999"', add
label define famincome_lbl 11  `"$40,000 to $49,999"', add
label define famincome_lbl 12  `"$50,000 to $59,999"', add
label define famincome_lbl 13  `"$60,000 to $74,999"', add
label define famincome_lbl 14  `"$75,000 to $99,999"', add
label define famincome_lbl 15  `"$100,000 to $149,999"', add
label define famincome_lbl 16  `"$150,000 and over"', add
label define famincome_lbl 996 `"Refused"', add
label define famincome_lbl 997 `"Don't know"', add
label define famincome_lbl 998 `"Blank"', add
label values famincome famincome_lbl

label define poverty130_lbl 1  `"HH income lt or = 130% of poverty threshold"'
label define poverty130_lbl 2  `"HH income > 130% of poverty threshold"', add
label define poverty130_lbl 96 `"Refused"', add
label define poverty130_lbl 97 `"Don't know"', add
label define poverty130_lbl 98 `"Blank"', add
label define poverty130_lbl 99 `"NIU (Not in universe)"', add
label values poverty130 poverty130_lbl

label define poverty185_lbl 1  `"HH income lt or equal to 185% of poverty threshold"'
label define poverty185_lbl 2  `"HH income gt 185% of poverty threshold"', add
label define poverty185_lbl 96 `"Refused"', add
label define poverty185_lbl 97 `"Don't know"', add
label define poverty185_lbl 99 `"NIU (Not in universe)"', add
label values poverty185 poverty185_lbl

label define povertylevel_lbl 1  `"Fiscal year 2006 poverty thresholds"'
label define povertylevel_lbl 2  `"Fiscal year 2007 poverty thresholds"', add
label define povertylevel_lbl 3  `"Fiscal year 2008 poverty thresholds"', add
label define povertylevel_lbl 4  `"Fiscal year 2009 poverty thresholds"', add
label define povertylevel_lbl 99 `"NIU (Not in universe)"', add
label values povertylevel povertylevel_lbl

label define foodstamp_lbl 1  `"Yes"'
label define foodstamp_lbl 2  `"No"', add
label define foodstamp_lbl 96 `"Refused"', add
label define foodstamp_lbl 97 `"Don't know"', add
label define foodstamp_lbl 99 `"NIU (Not in universe)"', add
label values foodstamp foodstamp_lbl

label define hhtenure_lbl 1  `"Owned or being bought by a household member"'
label define hhtenure_lbl 2  `"Rented for cash"', add
label define hhtenure_lbl 3  `"Occupied without payment of cash rent"', add
label define hhtenure_lbl 99 `"NIU (Not in universe)"', add
label values hhtenure hhtenure_lbl

label define housetype_lbl 1  `"House, apartment, flat"'
label define housetype_lbl 2  `"Housing unit in nontransient hotel, motel, etc."', add
label define housetype_lbl 3  `"Housing unit permanent in transient hotel, motel"', add
label define housetype_lbl 4  `"Housing unit in rooming house"', add
label define housetype_lbl 5  `"Mobile home or trailer with no permanent room added"', add
label define housetype_lbl 6  `"Mobile home or trailer with 1 or more rooms added"', add
label define housetype_lbl 7  `"Housing unit not specified above"', add
label define housetype_lbl 8  `"Quarters not housing unit in rooming boarding house"', add
label define housetype_lbl 10 `"Unoccupied tent site or trailer site"', add
label define housetype_lbl 11 `"Student quarters in college dorm"', add
label define housetype_lbl 12 `"Other unit not specified above"', add
label values housetype housetype_lbl

label define fambus_lbl 0  `"No family business"'
label define fambus_lbl 1  `"Family business"', add
label define fambus_lbl 96 `"Refused"', add
label define fambus_lbl 97 `"Don't know"', add
label define fambus_lbl 99 `"NIU (Not in universe)"', add
label values fambus fambus_lbl

label define fambus_resp_lbl 0  `"No"'
label define fambus_resp_lbl 1  `"Yes"', add
label define fambus_resp_lbl 99 `"NIU (Not in universe)"', add
label values fambus_resp fambus_resp_lbl

label define fambus_spouse_lbl 0  `"No"'
label define fambus_spouse_lbl 1  `"Yes"', add
label define fambus_spouse_lbl 99 `"NIU (Not in universe)"', add
label values fambus_spouse fambus_spouse_lbl

label define fambus_other_lbl 0  `"No"'
label define fambus_other_lbl 1  `"Yes"', add
label define fambus_other_lbl 99 `"NIU (Not in universe)"', add
label values fambus_other fambus_other_lbl

label define lineno_cps8_lbl 1   `"1"'
label define lineno_cps8_lbl 2   `"2"', add
label define lineno_cps8_lbl 3   `"3"', add
label define lineno_cps8_lbl 4   `"4"', add
label define lineno_cps8_lbl 5   `"5"', add
label define lineno_cps8_lbl 6   `"6"', add
label define lineno_cps8_lbl 7   `"7"', add
label define lineno_cps8_lbl 8   `"8"', add
label define lineno_cps8_lbl 9   `"9"', add
label define lineno_cps8_lbl 10  `"10"', add
label define lineno_cps8_lbl 11  `"11"', add
label define lineno_cps8_lbl 12  `"12"', add
label define lineno_cps8_lbl 13  `"13"', add
label define lineno_cps8_lbl 14  `"14"', add
label define lineno_cps8_lbl 15  `"15"', add
label define lineno_cps8_lbl 16  `"16"', add
label define lineno_cps8_lbl 999 `"NIU (Not in universe)"', add
label values lineno_cps8 lineno_cps8_lbl

label define presence_lbl 1 `"ATUS and CPS"'
label define presence_lbl 2 `"ATUS only"', add
label define presence_lbl 3 `"CPS only"', add
label values presence presence_lbl

label define holiday_lbl 0  `"No"'
label define holiday_lbl 1  `"Yes"', add
label define holiday_lbl 99 `"NIU (Not in universe)"', add
label values holiday holiday_lbl

label define day_lbl 1  `"Sunday"'
label define day_lbl 2  `"Monday"', add
label define day_lbl 3  `"Tuesday"', add
label define day_lbl 4  `"Wednesday"', add
label define day_lbl 5  `"Thursday"', add
label define day_lbl 6  `"Friday"', add
label define day_lbl 7  `"Saturday"', add
label define day_lbl 99 `"NIU (Not in universe)"', add
label values day day_lbl

label define year_lbl 99999 `"NIU (Not in universe)"'
label define year_lbl 2012  `"2012"', add
label define year_lbl 2009  `"2009"', add
label define year_lbl 2004  `"2004"', add
label define year_lbl 2007  `"2007"', add
label define year_lbl 2008  `"2008"', add
label define year_lbl 2006  `"2006"', add
label define year_lbl 2011  `"2011"', add
label define year_lbl 2005  `"2005"', add
label define year_lbl 2010  `"2010"', add
label define year_lbl 2003  `"2003"', add
label values year year_lbl

label define age_lbl 0   `"0"'
label define age_lbl 1   `"1"', add
label define age_lbl 2   `"2"', add
label define age_lbl 3   `"3"', add
label define age_lbl 4   `"4"', add
label define age_lbl 5   `"5"', add
label define age_lbl 6   `"6"', add
label define age_lbl 7   `"7"', add
label define age_lbl 8   `"8"', add
label define age_lbl 9   `"9"', add
label define age_lbl 10  `"10"', add
label define age_lbl 11  `"11"', add
label define age_lbl 12  `"12"', add
label define age_lbl 13  `"13"', add
label define age_lbl 14  `"14"', add
label define age_lbl 15  `"15"', add
label define age_lbl 16  `"16"', add
label define age_lbl 17  `"17"', add
label define age_lbl 18  `"18"', add
label define age_lbl 19  `"19"', add
label define age_lbl 20  `"20"', add
label define age_lbl 21  `"21"', add
label define age_lbl 22  `"22"', add
label define age_lbl 23  `"23"', add
label define age_lbl 24  `"24"', add
label define age_lbl 25  `"25"', add
label define age_lbl 26  `"26"', add
label define age_lbl 27  `"27"', add
label define age_lbl 28  `"28"', add
label define age_lbl 29  `"29"', add
label define age_lbl 30  `"30"', add
label define age_lbl 31  `"31"', add
label define age_lbl 32  `"32"', add
label define age_lbl 33  `"33"', add
label define age_lbl 34  `"34"', add
label define age_lbl 35  `"35"', add
label define age_lbl 36  `"36"', add
label define age_lbl 37  `"37"', add
label define age_lbl 38  `"38"', add
label define age_lbl 39  `"39"', add
label define age_lbl 40  `"40"', add
label define age_lbl 41  `"41"', add
label define age_lbl 42  `"42"', add
label define age_lbl 43  `"43"', add
label define age_lbl 44  `"44"', add
label define age_lbl 45  `"45"', add
label define age_lbl 46  `"46"', add
label define age_lbl 47  `"47"', add
label define age_lbl 48  `"48"', add
label define age_lbl 49  `"49"', add
label define age_lbl 50  `"50"', add
label define age_lbl 51  `"51"', add
label define age_lbl 52  `"52"', add
label define age_lbl 53  `"53"', add
label define age_lbl 54  `"54"', add
label define age_lbl 55  `"55"', add
label define age_lbl 56  `"56"', add
label define age_lbl 57  `"57"', add
label define age_lbl 58  `"58"', add
label define age_lbl 59  `"59"', add
label define age_lbl 60  `"60"', add
label define age_lbl 61  `"61"', add
label define age_lbl 62  `"62"', add
label define age_lbl 63  `"63"', add
label define age_lbl 64  `"64"', add
label define age_lbl 65  `"65"', add
label define age_lbl 66  `"66"', add
label define age_lbl 67  `"67"', add
label define age_lbl 68  `"68"', add
label define age_lbl 69  `"69"', add
label define age_lbl 70  `"70"', add
label define age_lbl 71  `"71"', add
label define age_lbl 72  `"72"', add
label define age_lbl 73  `"73"', add
label define age_lbl 74  `"74"', add
label define age_lbl 75  `"75"', add
label define age_lbl 76  `"76"', add
label define age_lbl 77  `"77"', add
label define age_lbl 78  `"78"', add
label define age_lbl 79  `"79"', add
label define age_lbl 80  `"80"', add
label define age_lbl 85  `"85"', add
label define age_lbl 996 `"Refused"', add
label define age_lbl 997 `"Don't know"', add
label define age_lbl 999 `"NIU (Not in universe)"', add
label values age age_lbl

label define sex_lbl 1  `"Male"'
label define sex_lbl 2  `"Female"', add
label define sex_lbl 99 `"NIU (Not in universe)"', add
label values sex sex_lbl

label define race_lbl 100  `"White only"'
label define race_lbl 110  `"Black only"', add
label define race_lbl 120  `"American Indian, Alaskan Native"', add
label define race_lbl 130  `"Asian or Pacific Islander"', add
label define race_lbl 131  `"Asian only"', add
label define race_lbl 132  `"Hawaiian Pacific Islander only"', add
label define race_lbl 200  `"White-Black"', add
label define race_lbl 201  `"White-American Indian"', add
label define race_lbl 202  `"White-Asian"', add
label define race_lbl 203  `"White-Hawaiian"', add
label define race_lbl 210  `"Black-American Indian"', add
label define race_lbl 211  `"Black-Asian"', add
label define race_lbl 212  `"Black-Hawaiian"', add
label define race_lbl 220  `"American Indian-Asian"', add
label define race_lbl 221  `"American Indian-Hawaiian"', add
label define race_lbl 230  `"Asian-Hawaiian"', add
label define race_lbl 300  `"White-Black-American Indian"', add
label define race_lbl 301  `"White-Black-Asian"', add
label define race_lbl 302  `"White-Black-Hawaiian"', add
label define race_lbl 310  `"White-American Indian-Asian"', add
label define race_lbl 311  `"White-American Indian-Hawaiian"', add
label define race_lbl 320  `"White-Asian-Hawaiian"', add
label define race_lbl 330  `"Black-American Indian-Asian"', add
label define race_lbl 331  `"Black-American Indian-Hawaiian"', add
label define race_lbl 340  `"Black-Asian-Hawaiian"', add
label define race_lbl 350  `"American Indian-Asian-Hawaiian"', add
label define race_lbl 399  `"2 or 3 races, unspecified"', add
label define race_lbl 400  `"White-Black-American Indian-Asian"', add
label define race_lbl 401  `"White-Black-American Indian-Hawaiian"', add
label define race_lbl 402  `"White-Black-Asian-Hawaiian"', add
label define race_lbl 403  `"Black-American Indian-Asian-Hawaiian"', add
label define race_lbl 500  `"White-Black-American Indian-Asian-Hawaiian"', add
label define race_lbl 599  `"4 or 5 races, unspecified"', add
label define race_lbl 9999 `"NIU (Not in universe)"', add
label values race race_lbl

label define hispan_lbl 100  `"Not Hispanic"'
label define hispan_lbl 211  `"Mexican American"', add
label define hispan_lbl 212  `"Chicano"', add
label define hispan_lbl 213  `"Mexcian (Mexicano)"', add
label define hispan_lbl 220  `"Puerto Rican"', add
label define hispan_lbl 230  `"Cuban"', add
label define hispan_lbl 240  `"Central-South American"', add
label define hispan_lbl 250  `"Other Spanish"', add
label define hispan_lbl 9999 `"NIU (Not in universe)"', add
label values hispan hispan_lbl

label define marst_lbl 1  `"Married - spouse present"'
label define marst_lbl 2  `"Married - spouse absent"', add
label define marst_lbl 3  `"Widowed"', add
label define marst_lbl 4  `"Divorced"', add
label define marst_lbl 5  `"Separated"', add
label define marst_lbl 6  `"Never married"', add
label define marst_lbl 99 `"NIU (Not in universe)"', add
label values marst marst_lbl

label define yrimmig_lbl 0   `"Not foreign born"'
label define yrimmig_lbl 1   `"Before 1950"', add
label define yrimmig_lbl 2   `"1950-1959"', add
label define yrimmig_lbl 3   `"1960-1964"', add
label define yrimmig_lbl 4   `"1965-1969"', add
label define yrimmig_lbl 5   `"1970-1974"', add
label define yrimmig_lbl 6   `"1975-1979"', add
label define yrimmig_lbl 7   `"1980-1981"', add
label define yrimmig_lbl 8   `"1982-1983"', add
label define yrimmig_lbl 9   `"1984-1985"', add
label define yrimmig_lbl 10  `"1986-1987"', add
label define yrimmig_lbl 11  `"1988-1989"', add
label define yrimmig_lbl 12  `"1990-1991"', add
label define yrimmig_lbl 13  `"1992-1993"', add
label define yrimmig_lbl 14  `"1994-1995"', add
label define yrimmig_lbl 15  `"1996-1997"', add
label define yrimmig_lbl 16  `"1998-1999"', add
label define yrimmig_lbl 17  `"2000-2001"', add
label define yrimmig_lbl 18  `"2002-2003"', add
label define yrimmig_lbl 19  `"2002-2004"', add
label define yrimmig_lbl 20  `"2002-2005"', add
label define yrimmig_lbl 21  `"2004-2005"', add
label define yrimmig_lbl 22  `"2004-2006"', add
label define yrimmig_lbl 23  `"2004-2007"', add
label define yrimmig_lbl 24  `"2006-2007"', add
label define yrimmig_lbl 25  `"2006-2008"', add
label define yrimmig_lbl 26  `"2006-2009"', add
label define yrimmig_lbl 27  `"2008-2009"', add
label define yrimmig_lbl 28  `"2008-2010"', add
label define yrimmig_lbl 29  `"2008-2011"', add
label define yrimmig_lbl 30  `"2010-2011"', add
label define yrimmig_lbl 31  `"2010-2012"', add
label define yrimmig_lbl 32  `"2010-2013"', add
label define yrimmig_lbl 998 `"Blank"', add
label define yrimmig_lbl 999 `"NIU (Not in universe)"', add
label values yrimmig yrimmig_lbl

label define citizen_lbl 1   `"Native, born in United States"'
label define citizen_lbl 2   `"Native, born in Puerto Rico or U.S. Outlying Area"', add
label define citizen_lbl 3   `"Native, born abroad of American parent or parents"', add
label define citizen_lbl 4   `"Foreign born, U.S. citizen by naturalization"', add
label define citizen_lbl 5   `"Foreign born, not a U.S. citizen"', add
label define citizen_lbl 999 `"NIU (Not in universe)"', add
label values citizen citizen_lbl

label define bpl_lbl 9900   `"U.S., n.s."'
label define bpl_lbl 10000  `"American Samoa"', add
label define bpl_lbl 10500  `"Guam"', add
label define bpl_lbl 11000  `"Puerto Rico"', add
label define bpl_lbl 11500  `"U.S. Virgin Islands"', add
label define bpl_lbl 12090  `"U.S. outlying areas, n.s."', add
label define bpl_lbl 15000  `"Canada"', add
label define bpl_lbl 16010  `"Bermuda"', add
label define bpl_lbl 19900  `"North America, n.s."', add
label define bpl_lbl 20000  `"Mexico"', add
label define bpl_lbl 21010  `"Belize/British Honduras"', add
label define bpl_lbl 21020  `"Costa Rica"', add
label define bpl_lbl 21030  `"El Salvador"', add
label define bpl_lbl 21040  `"Guatemala"', add
label define bpl_lbl 21050  `"Honduras"', add
label define bpl_lbl 21060  `"Nicaragua"', add
label define bpl_lbl 21070  `"Panama"', add
label define bpl_lbl 21090  `"Central America, n.s."', add
label define bpl_lbl 25000  `"Cuba"', add
label define bpl_lbl 26000  `"West Indies"', add
label define bpl_lbl 26010  `"Dominican Republic"', add
label define bpl_lbl 26020  `"Haiti"', add
label define bpl_lbl 26030  `"Jamaica"', add
label define bpl_lbl 26043  `"Bahamas"', add
label define bpl_lbl 26044  `"Barbados"', add
label define bpl_lbl 26054  `"Dominica"', add
label define bpl_lbl 26055  `"Grenada"', add
label define bpl_lbl 26060  `"Trinidad and Tobago"', add
label define bpl_lbl 26065  `"Antigua and Barbuda"', add
label define bpl_lbl 26070  `"St. Kitts--Nevis"', add
label define bpl_lbl 26075  `"St. Lucia"', add
label define bpl_lbl 26080  `"St. Vincent and the Grenadi"', add
label define bpl_lbl 26090  `"Caribbean, n.s."', add
label define bpl_lbl 30005  `"Argentina"', add
label define bpl_lbl 30010  `"Bolivia"', add
label define bpl_lbl 30015  `"Brazil"', add
label define bpl_lbl 30020  `"Chile"', add
label define bpl_lbl 30025  `"Colombia"', add
label define bpl_lbl 30030  `"Ecuador"', add
label define bpl_lbl 30040  `"Guyana/British Guiana"', add
label define bpl_lbl 30050  `"Peru"', add
label define bpl_lbl 30060  `"Uruguay"', add
label define bpl_lbl 30065  `"Venezuala"', add
label define bpl_lbl 30070  `"Paraguay"', add
label define bpl_lbl 30090  `"South America, n.s."', add
label define bpl_lbl 31000  `"Americas, n.s."', add
label define bpl_lbl 40000  `"Denmark"', add
label define bpl_lbl 40100  `"Finland"', add
label define bpl_lbl 40200  `"Iceland"', add
label define bpl_lbl 40400  `"Norway"', add
label define bpl_lbl 40500  `"Sweden"', add
label define bpl_lbl 41000  `"England"', add
label define bpl_lbl 41100  `"Scotland"', add
label define bpl_lbl 41200  `"Wales"', add
label define bpl_lbl 41300  `"United Kingdom, n.s."', add
label define bpl_lbl 41400  `"Ireland"', add
label define bpl_lbl 41410  `"Northern Ireland"', add
label define bpl_lbl 42000  `"Belgium"', add
label define bpl_lbl 42100  `"France"', add
label define bpl_lbl 42500  `"Netherlands"', add
label define bpl_lbl 42600  `"Switzerland"', add
label define bpl_lbl 43300  `"Greece"', add
label define bpl_lbl 43400  `"Italy"', add
label define bpl_lbl 43600  `"Portugal"', add
label define bpl_lbl 43610  `"Azores"', add
label define bpl_lbl 43800  `"Spain"', add
label define bpl_lbl 45000  `"Austria"', add
label define bpl_lbl 45200  `"Czechoslavakia"', add
label define bpl_lbl 45212  `"Slovakia"', add
label define bpl_lbl 45213  `"Czech Republic"', add
label define bpl_lbl 45300  `"Germany"', add
label define bpl_lbl 45400  `"Hungary"', add
label define bpl_lbl 45500  `"Poland"', add
label define bpl_lbl 45600  `"Romania"', add
label define bpl_lbl 45650  `"Bulgaria"', add
label define bpl_lbl 45700  `"Yugoslavia"', add
label define bpl_lbl 45710  `"Albania"', add
label define bpl_lbl 45720  `"Bosnia and Herzegovina"', add
label define bpl_lbl 45730  `"Croatia"', add
label define bpl_lbl 45740  `"Macedonia"', add
label define bpl_lbl 45750  `"Serbia"', add
label define bpl_lbl 45760  `"Kosovo"', add
label define bpl_lbl 46100  `"Latvia"', add
label define bpl_lbl 46200  `"Lithuania"', add
label define bpl_lbl 46500  `"Other USSR/Russia"', add
label define bpl_lbl 46530  `"Ukraine"', add
label define bpl_lbl 46535  `"Belarus"', add
label define bpl_lbl 46540  `"Moldova"', add
label define bpl_lbl 46590  `"USSR, n.s."', add
label define bpl_lbl 49900  `"Europe, n.s."', add
label define bpl_lbl 50000  `"China"', add
label define bpl_lbl 50010  `"Hong Kong"', add
label define bpl_lbl 50030  `"Mongolia"', add
label define bpl_lbl 50040  `"Taiwan"', add
label define bpl_lbl 50100  `"Japan"', add
label define bpl_lbl 50200  `"Korea"', add
label define bpl_lbl 50220  `"South Korea"', add
label define bpl_lbl 51100  `"Cambodia"', add
label define bpl_lbl 51200  `"Indonesia"', add
label define bpl_lbl 51300  `"Laos"', add
label define bpl_lbl 51400  `"Malaysia"', add
label define bpl_lbl 51500  `"Philippines"', add
label define bpl_lbl 51600  `"Singapore"', add
label define bpl_lbl 51700  `"Thailand"', add
label define bpl_lbl 51800  `"Vietnam"', add
label define bpl_lbl 52000  `"Afghanistan"', add
label define bpl_lbl 52100  `"India"', add
label define bpl_lbl 52110  `"Bangladesh"', add
label define bpl_lbl 52120  `"Bhutan"', add
label define bpl_lbl 52130  `"Burma (Myanmar)"', add
label define bpl_lbl 52140  `"Pakistan"', add
label define bpl_lbl 52150  `"Sri Lanka"', add
label define bpl_lbl 52200  `"Nepal"', add
label define bpl_lbl 55100  `"Armenia"', add
label define bpl_lbl 55200  `"Azerbaijan"', add
label define bpl_lbl 55300  `"Georgia"', add
label define bpl_lbl 55400  `"Uzbekistan"', add
label define bpl_lbl 53000  `"Iran"', add
label define bpl_lbl 53200  `"Iraq"', add
label define bpl_lbl 53400  `"Isreal/Palestine"', add
label define bpl_lbl 53420  `"Palestine"', add
label define bpl_lbl 53500  `"Jordan"', add
label define bpl_lbl 53700  `"Lebanon"', add
label define bpl_lbl 54000  `"Saudi Arabia"', add
label define bpl_lbl 54100  `"Syria"', add
label define bpl_lbl 54200  `"Turkey"', add
label define bpl_lbl 54300  `"Cyprus"', add
label define bpl_lbl 54350  `"Kuwait"', add
label define bpl_lbl 54400  `"Yemen"', add
label define bpl_lbl 54700  `"Middle East, n.s."', add
label define bpl_lbl 59900  `"Asia, n.e.c. or n.s."', add
label define bpl_lbl 60010  `"Northern Africa"', add
label define bpl_lbl 60012  `"Egypt/United Arab Rep."', add
label define bpl_lbl 60014  `"Morocco"', add
label define bpl_lbl 60016  `"Algeria"', add
label define bpl_lbl 60018  `"Sudan"', add
label define bpl_lbl 60023  `"Ghana"', add
label define bpl_lbl 60024  `"Guinea"', add
label define bpl_lbl 60031  `"Nigeria"', add
label define bpl_lbl 60032  `"Cameroon"', add
label define bpl_lbl 60033  `"Cape Verde"', add
label define bpl_lbl 60034  `"Liberia"', add
label define bpl_lbl 60035  `"Senegal"', add
label define bpl_lbl 60036  `"Sierra Leone"', add
label define bpl_lbl 60040  `"Eritrea"', add
label define bpl_lbl 60044  `"Ethiopia"', add
label define bpl_lbl 60045  `"Kenya"', add
label define bpl_lbl 60050  `"Somalia"', add
label define bpl_lbl 60060  `"Tanzania"', add
label define bpl_lbl 60065  `"Uganda"', add
label define bpl_lbl 60070  `"Zimbabwe"', add
label define bpl_lbl 60075  `"Congo"', add
label define bpl_lbl 60079  `"Zaire"', add
label define bpl_lbl 60094  `"South Africa (Union of)"', add
label define bpl_lbl 60100  `"Africa, n.s."', add
label define bpl_lbl 70010  `"Australia"', add
label define bpl_lbl 70020  `"New Zealand"', add
label define bpl_lbl 71000  `"Pacific Islands"', add
label define bpl_lbl 71021  `"Fiji"', add
label define bpl_lbl 71023  `"Tonga"', add
label define bpl_lbl 71041  `"Marshall Islands"', add
label define bpl_lbl 71042  `"Micronesia"', add
label define bpl_lbl 71090  `"Oceania, n.s."', add
label define bpl_lbl 96000  `"Other, n.e.c. and unknown"', add
label define bpl_lbl 999999 `"NIU (Not in universe)"', add
label values bpl bpl_lbl

label define mbpl_lbl 9900   `"U.S., n.s."'
label define mbpl_lbl 10000  `"American Samoa"', add
label define mbpl_lbl 10500  `"Guam"', add
label define mbpl_lbl 11000  `"Puerto Rico"', add
label define mbpl_lbl 11500  `"U.S. Virgin Islands"', add
label define mbpl_lbl 12090  `"U.S. outlying areas, n.s."', add
label define mbpl_lbl 15000  `"Canada"', add
label define mbpl_lbl 16010  `"Bermuda"', add
label define mbpl_lbl 19900  `"North America, n.s."', add
label define mbpl_lbl 20000  `"Mexico"', add
label define mbpl_lbl 21010  `"Belize/British Honduras"', add
label define mbpl_lbl 21020  `"Costa Rica"', add
label define mbpl_lbl 21030  `"El Salvador"', add
label define mbpl_lbl 21040  `"Guatemala"', add
label define mbpl_lbl 21050  `"Honduras"', add
label define mbpl_lbl 21060  `"Nicaragua"', add
label define mbpl_lbl 21070  `"Panama"', add
label define mbpl_lbl 21090  `"Central America, n.s."', add
label define mbpl_lbl 25000  `"Cuba"', add
label define mbpl_lbl 26000  `"West Indies"', add
label define mbpl_lbl 26010  `"Dominican Republic"', add
label define mbpl_lbl 26020  `"Haiti"', add
label define mbpl_lbl 26030  `"Jamaica"', add
label define mbpl_lbl 26043  `"Bahamas"', add
label define mbpl_lbl 26044  `"Barbados"', add
label define mbpl_lbl 26054  `"Dominica"', add
label define mbpl_lbl 26055  `"Grenada"', add
label define mbpl_lbl 26060  `"Trinidad and Tobago"', add
label define mbpl_lbl 26065  `"Antigua and Barbuda"', add
label define mbpl_lbl 26070  `"St. Kitts--Nevis"', add
label define mbpl_lbl 26075  `"St. Lucia"', add
label define mbpl_lbl 26080  `"St. Vincent and the Grenadi"', add
label define mbpl_lbl 26090  `"Caribbean, n.s."', add
label define mbpl_lbl 30000  `"SOUTH AMERICA"', add
label define mbpl_lbl 30005  `"Argentina"', add
label define mbpl_lbl 30010  `"Bolivia"', add
label define mbpl_lbl 30015  `"Brazil"', add
label define mbpl_lbl 30020  `"Chile"', add
label define mbpl_lbl 30025  `"Colombia"', add
label define mbpl_lbl 30030  `"Ecuador"', add
label define mbpl_lbl 30040  `"Guyana/British Guiana"', add
label define mbpl_lbl 30050  `"Peru"', add
label define mbpl_lbl 30060  `"Uruguay"', add
label define mbpl_lbl 30065  `"Venezuala"', add
label define mbpl_lbl 30070  `"Paraguay"', add
label define mbpl_lbl 30090  `"South America, n.s."', add
label define mbpl_lbl 31000  `"Americas, n.s."', add
label define mbpl_lbl 40000  `"Denmark"', add
label define mbpl_lbl 40100  `"Finland"', add
label define mbpl_lbl 40200  `"Iceland"', add
label define mbpl_lbl 40400  `"Norway"', add
label define mbpl_lbl 40500  `"Sweden"', add
label define mbpl_lbl 41000  `"England"', add
label define mbpl_lbl 41100  `"Scotland"', add
label define mbpl_lbl 41200  `"Wales"', add
label define mbpl_lbl 41300  `"United Kingdom, n.s."', add
label define mbpl_lbl 41400  `"Ireland"', add
label define mbpl_lbl 41410  `"Northern Ireland"', add
label define mbpl_lbl 42000  `"Belgium"', add
label define mbpl_lbl 42100  `"France"', add
label define mbpl_lbl 42500  `"Netherlands"', add
label define mbpl_lbl 42600  `"Switzerland"', add
label define mbpl_lbl 43300  `"Greece"', add
label define mbpl_lbl 43400  `"Italy"', add
label define mbpl_lbl 43600  `"Portugal"', add
label define mbpl_lbl 43610  `"Azores"', add
label define mbpl_lbl 43800  `"Spain"', add
label define mbpl_lbl 45000  `"Austria"', add
label define mbpl_lbl 45200  `"Czechoslavakia"', add
label define mbpl_lbl 45212  `"Slovakia"', add
label define mbpl_lbl 45213  `"Czech Republic"', add
label define mbpl_lbl 45300  `"Germany"', add
label define mbpl_lbl 45400  `"Hungary"', add
label define mbpl_lbl 45500  `"Poland"', add
label define mbpl_lbl 45600  `"Romania"', add
label define mbpl_lbl 45650  `"Bulgaria"', add
label define mbpl_lbl 45700  `"Yugoslavia"', add
label define mbpl_lbl 45710  `"Albania"', add
label define mbpl_lbl 45720  `"Bosnia and Herzegovina"', add
label define mbpl_lbl 45730  `"Croatia"', add
label define mbpl_lbl 45740  `"Macedonia"', add
label define mbpl_lbl 45750  `"Serbia"', add
label define mbpl_lbl 45760  `"Kosovo"', add
label define mbpl_lbl 46100  `"Latvia"', add
label define mbpl_lbl 46200  `"Lithuania"', add
label define mbpl_lbl 46500  `"Other USSR/Russia"', add
label define mbpl_lbl 46520  `"Moldavia"', add
label define mbpl_lbl 46530  `"Ukraine"', add
label define mbpl_lbl 46535  `"Belarus"', add
label define mbpl_lbl 46540  `"Armenia"', add
label define mbpl_lbl 46541  `"Azerbaijan"', add
label define mbpl_lbl 46542  `"Georgia"', add
label define mbpl_lbl 46547  `"Uzbekistan"', add
label define mbpl_lbl 46590  `"USSR, n.s."', add
label define mbpl_lbl 49900  `"Europe, n.s."', add
label define mbpl_lbl 50000  `"China"', add
label define mbpl_lbl 50010  `"Hong Kong"', add
label define mbpl_lbl 50030  `"Mongolia"', add
label define mbpl_lbl 50040  `"Taiwan"', add
label define mbpl_lbl 50100  `"Japan"', add
label define mbpl_lbl 50200  `"Korea"', add
label define mbpl_lbl 50220  `"South Korea"', add
label define mbpl_lbl 51100  `"Cambodia"', add
label define mbpl_lbl 51200  `"Indonesia"', add
label define mbpl_lbl 51300  `"Laos"', add
label define mbpl_lbl 51400  `"Malaysia"', add
label define mbpl_lbl 51500  `"Philippines"', add
label define mbpl_lbl 51600  `"Singapore"', add
label define mbpl_lbl 51700  `"Thailand"', add
label define mbpl_lbl 51800  `"Vietnam"', add
label define mbpl_lbl 52000  `"Afghanistan"', add
label define mbpl_lbl 52100  `"India"', add
label define mbpl_lbl 52110  `"Bangladesh"', add
label define mbpl_lbl 52120  `"Bhutan"', add
label define mbpl_lbl 52130  `"Burma (Myanmar)"', add
label define mbpl_lbl 52140  `"Pakistan"', add
label define mbpl_lbl 52150  `"Sri Lanka"', add
label define mbpl_lbl 52400  `"Nepal"', add
label define mbpl_lbl 52200  `"Iran"', add
label define mbpl_lbl 53200  `"Iraq"', add
label define mbpl_lbl 53400  `"Isreal/Palestine"', add
label define mbpl_lbl 53420  `"Palestine"', add
label define mbpl_lbl 53500  `"Jordan"', add
label define mbpl_lbl 53700  `"Lebanon"', add
label define mbpl_lbl 54000  `"Saudi Arabia"', add
label define mbpl_lbl 54100  `"Syria"', add
label define mbpl_lbl 53100  `"Cyprus"', add
label define mbpl_lbl 53600  `"Kuwait"', add
label define mbpl_lbl 54200  `"Turkey"', add
label define mbpl_lbl 54300  `"United Arab Emirates"', add
label define mbpl_lbl 54400  `"Yemen"', add
label define mbpl_lbl 54700  `"Middle East, n.s."', add
label define mbpl_lbl 59900  `"Asia, n.e.c, /n.s."', add
label define mbpl_lbl 60000  `"AFRICA"', add
label define mbpl_lbl 60010  `"Northern Africa"', add
label define mbpl_lbl 60012  `"Egypt/United Arab Rep."', add
label define mbpl_lbl 60014  `"Morocco"', add
label define mbpl_lbl 60016  `"Algeria"', add
label define mbpl_lbl 60018  `"Sudan"', add
label define mbpl_lbl 60023  `"Ghana"', add
label define mbpl_lbl 60024  `"Guinea"', add
label define mbpl_lbl 60026  `"Ivory Coast"', add
label define mbpl_lbl 60031  `"Nigeria"', add
label define mbpl_lbl 60032  `"Cameroon"', add
label define mbpl_lbl 60033  `"Cape Verde"', add
label define mbpl_lbl 60034  `"Liberia"', add
label define mbpl_lbl 60035  `"Senegal"', add
label define mbpl_lbl 60036  `"Sierra Leone"', add
label define mbpl_lbl 60040  `"Eritrea"', add
label define mbpl_lbl 60044  `"Ethiopia"', add
label define mbpl_lbl 60045  `"Kenya"', add
label define mbpl_lbl 60053  `"Somalia"', add
label define mbpl_lbl 60054  `"Tanzania"', add
label define mbpl_lbl 60055  `"Uganda"', add
label define mbpl_lbl 60057  `"Zimbabwe"', add
label define mbpl_lbl 60070  `"Central Africa:"', add
label define mbpl_lbl 60075  `"Congo"', add
label define mbpl_lbl 60079  `"Zaire"', add
label define mbpl_lbl 60094  `"South Africa (Union of)"', add
label define mbpl_lbl 60100  `"Africa, n.s."', add
label define mbpl_lbl 70010  `"Australia"', add
label define mbpl_lbl 70020  `"New Zealand"', add
label define mbpl_lbl 71000  `"Pacific Islands"', add
label define mbpl_lbl 71021  `"Fiji"', add
label define mbpl_lbl 71023  `"Tonga"', add
label define mbpl_lbl 71041  `"Marshall Islands"', add
label define mbpl_lbl 71042  `"Micronesia"', add
label define mbpl_lbl 71090  `"Oceania, n.s."', add
label define mbpl_lbl 96000  `"Other, n.e.c. and unknown"', add
label define mbpl_lbl 999999 `"NIU (Not in universe)"', add
label values mbpl mbpl_lbl

label define fbpl_lbl 9900   `"U.S., n.s."'
label define fbpl_lbl 10000  `"American Samoa"', add
label define fbpl_lbl 10500  `"Guam"', add
label define fbpl_lbl 11000  `"Puerto Rico"', add
label define fbpl_lbl 11500  `"U.S. Virgin Islands"', add
label define fbpl_lbl 12090  `"U.S. outlying areas, n.s."', add
label define fbpl_lbl 15000  `"Canada"', add
label define fbpl_lbl 16010  `"Bermuda"', add
label define fbpl_lbl 19900  `"North America, n.s."', add
label define fbpl_lbl 20000  `"Mexico"', add
label define fbpl_lbl 21010  `"Belize/British Honduras"', add
label define fbpl_lbl 21020  `"Costa Rica"', add
label define fbpl_lbl 21030  `"El Salvador"', add
label define fbpl_lbl 21040  `"Guatemala"', add
label define fbpl_lbl 21050  `"Honduras"', add
label define fbpl_lbl 21060  `"Nicaragua"', add
label define fbpl_lbl 21070  `"Panama"', add
label define fbpl_lbl 21090  `"Central America, n.s."', add
label define fbpl_lbl 25000  `"Cuba"', add
label define fbpl_lbl 26000  `"West Indies"', add
label define fbpl_lbl 26010  `"Dominican Republic"', add
label define fbpl_lbl 26020  `"Haiti"', add
label define fbpl_lbl 26030  `"Jamaica"', add
label define fbpl_lbl 26043  `"Bahamas"', add
label define fbpl_lbl 26044  `"Barbados"', add
label define fbpl_lbl 26054  `"Dominica"', add
label define fbpl_lbl 26055  `"Grenada"', add
label define fbpl_lbl 26060  `"Trinidad and Tobago"', add
label define fbpl_lbl 26065  `"Antigua and Barbuda"', add
label define fbpl_lbl 26070  `"St. Kitts--Nevis"', add
label define fbpl_lbl 26075  `"St. Lucia"', add
label define fbpl_lbl 26080  `"St. Vincent and the Grenadi"', add
label define fbpl_lbl 26090  `"Caribbean, n.s."', add
label define fbpl_lbl 30000  `"SOUTH AMERICA"', add
label define fbpl_lbl 30005  `"Argentina"', add
label define fbpl_lbl 30010  `"Bolivia"', add
label define fbpl_lbl 30015  `"Brazil"', add
label define fbpl_lbl 30020  `"Chile"', add
label define fbpl_lbl 30025  `"Colombia"', add
label define fbpl_lbl 30030  `"Ecuador"', add
label define fbpl_lbl 30040  `"Guyana/British Guiana"', add
label define fbpl_lbl 30050  `"Peru"', add
label define fbpl_lbl 30060  `"Uruguay"', add
label define fbpl_lbl 30065  `"Venezuala"', add
label define fbpl_lbl 30070  `"Paraguay"', add
label define fbpl_lbl 30090  `"South America, n.s."', add
label define fbpl_lbl 31000  `"Americas, n.s."', add
label define fbpl_lbl 40000  `"Denmark"', add
label define fbpl_lbl 40100  `"Finland"', add
label define fbpl_lbl 40200  `"Iceland"', add
label define fbpl_lbl 40400  `"Norway"', add
label define fbpl_lbl 40500  `"Sweden"', add
label define fbpl_lbl 41000  `"England"', add
label define fbpl_lbl 41100  `"Scotland"', add
label define fbpl_lbl 41200  `"Wales"', add
label define fbpl_lbl 41300  `"United Kingdom, n.s."', add
label define fbpl_lbl 41400  `"Ireland"', add
label define fbpl_lbl 41410  `"Northern Ireland"', add
label define fbpl_lbl 42000  `"Belgium"', add
label define fbpl_lbl 42100  `"France"', add
label define fbpl_lbl 42500  `"Netherlands"', add
label define fbpl_lbl 42600  `"Switzerland"', add
label define fbpl_lbl 43300  `"Greece"', add
label define fbpl_lbl 43400  `"Italy"', add
label define fbpl_lbl 43600  `"Portugal"', add
label define fbpl_lbl 43610  `"Azores"', add
label define fbpl_lbl 43800  `"Spain"', add
label define fbpl_lbl 45000  `"Austria"', add
label define fbpl_lbl 45200  `"Czechoslavakia"', add
label define fbpl_lbl 45212  `"Slovakia"', add
label define fbpl_lbl 45213  `"Czech Republic"', add
label define fbpl_lbl 45300  `"Germany"', add
label define fbpl_lbl 45400  `"Hungary"', add
label define fbpl_lbl 45500  `"Poland"', add
label define fbpl_lbl 45600  `"Romania"', add
label define fbpl_lbl 45650  `"Bulgaria"', add
label define fbpl_lbl 45700  `"Yugoslavia"', add
label define fbpl_lbl 45710  `"Albania"', add
label define fbpl_lbl 45720  `"Bosnia and Herzegovina"', add
label define fbpl_lbl 45730  `"Croatia"', add
label define fbpl_lbl 45740  `"Macedonia"', add
label define fbpl_lbl 45750  `"Serbia"', add
label define fbpl_lbl 45760  `"Kosovo"', add
label define fbpl_lbl 46100  `"Latvia"', add
label define fbpl_lbl 46200  `"Lithuania"', add
label define fbpl_lbl 46500  `"Other USSR/Russia"', add
label define fbpl_lbl 46530  `"Ukraine"', add
label define fbpl_lbl 46535  `"Belarus"', add
label define fbpl_lbl 46540  `"Moldova"', add
label define fbpl_lbl 46590  `"USSR, n.s."', add
label define fbpl_lbl 49900  `"Europe, n.s."', add
label define fbpl_lbl 50000  `"China"', add
label define fbpl_lbl 50010  `"Hong Kong"', add
label define fbpl_lbl 50030  `"Mongolia"', add
label define fbpl_lbl 50040  `"Taiwan"', add
label define fbpl_lbl 50100  `"Japan"', add
label define fbpl_lbl 50200  `"Korea"', add
label define fbpl_lbl 50220  `"South Korea"', add
label define fbpl_lbl 51100  `"Cambodia"', add
label define fbpl_lbl 51200  `"Indonesia"', add
label define fbpl_lbl 51300  `"Laos"', add
label define fbpl_lbl 51400  `"Malaysia"', add
label define fbpl_lbl 51500  `"Philippines"', add
label define fbpl_lbl 51600  `"Singapore"', add
label define fbpl_lbl 51700  `"Thailand"', add
label define fbpl_lbl 51800  `"Vietnam"', add
label define fbpl_lbl 52000  `"Afghanistan"', add
label define fbpl_lbl 52100  `"India"', add
label define fbpl_lbl 52110  `"Bangladesh"', add
label define fbpl_lbl 52120  `"Bhutan"', add
label define fbpl_lbl 52130  `"Burma (Myanmar)"', add
label define fbpl_lbl 52140  `"Pakistan"', add
label define fbpl_lbl 52150  `"Sri Lanka"', add
label define fbpl_lbl 52200  `"Nepal"', add
label define fbpl_lbl 55100  `"Armenia"', add
label define fbpl_lbl 55200  `"Azerbaijan"', add
label define fbpl_lbl 55300  `"Georgia"', add
label define fbpl_lbl 55400  `"Uzbekistan"', add
label define fbpl_lbl 53000  `"Iran"', add
label define fbpl_lbl 53200  `"Iraq"', add
label define fbpl_lbl 53400  `"Isreal/Palestine"', add
label define fbpl_lbl 53420  `"Palestine"', add
label define fbpl_lbl 53500  `"Jordan"', add
label define fbpl_lbl 53700  `"Lebanon"', add
label define fbpl_lbl 54000  `"Saudi Arabia"', add
label define fbpl_lbl 54100  `"Syria"', add
label define fbpl_lbl 54200  `"Turkey"', add
label define fbpl_lbl 54300  `"Cyprus"', add
label define fbpl_lbl 54350  `"Kuwait"', add
label define fbpl_lbl 54400  `"Yemen"', add
label define fbpl_lbl 54700  `"Middle East, n.s."', add
label define fbpl_lbl 59900  `"Asia, n.e.c, /n.s."', add
label define fbpl_lbl 60000  `"AFRICA"', add
label define fbpl_lbl 60010  `"Northern Africa"', add
label define fbpl_lbl 60012  `"Egypt/United Arab Rep."', add
label define fbpl_lbl 60014  `"Morocco"', add
label define fbpl_lbl 60016  `"Algeria"', add
label define fbpl_lbl 60018  `"Sudan"', add
label define fbpl_lbl 60023  `"Ghana"', add
label define fbpl_lbl 60024  `"Guinea"', add
label define fbpl_lbl 60031  `"Nigeria"', add
label define fbpl_lbl 60032  `"Cameroon"', add
label define fbpl_lbl 60033  `"Cape Verde"', add
label define fbpl_lbl 60034  `"Liberia"', add
label define fbpl_lbl 60035  `"Senegal"', add
label define fbpl_lbl 60036  `"Sierra Leone"', add
label define fbpl_lbl 60040  `"Eritrea"', add
label define fbpl_lbl 60044  `"Ethiopia"', add
label define fbpl_lbl 60045  `"Kenya"', add
label define fbpl_lbl 60050  `"Somalia"', add
label define fbpl_lbl 60060  `"Tanzania"', add
label define fbpl_lbl 60065  `"Uganda"', add
label define fbpl_lbl 60070  `"Zimbabwe"', add
label define fbpl_lbl 60075  `"Congo"', add
label define fbpl_lbl 60079  `"Zaire"', add
label define fbpl_lbl 60094  `"South Africa (Union of)"', add
label define fbpl_lbl 60100  `"Africa, n.s."', add
label define fbpl_lbl 70010  `"Australia"', add
label define fbpl_lbl 70020  `"New Zealand"', add
label define fbpl_lbl 71000  `"Pacific Islands"', add
label define fbpl_lbl 71021  `"Fiji"', add
label define fbpl_lbl 71022  `"Tonga"', add
label define fbpl_lbl 71042  `"Micronesia"', add
label define fbpl_lbl 71090  `"Oceania, n.s."', add
label define fbpl_lbl 96000  `"Other, n.e.c. and unknown"', add
label define fbpl_lbl 999999 `"NIU (Not in universe)"', add
label values fbpl fbpl_lbl

label define relate_lbl 10  `"Self"'
label define relate_lbl 20  `"Spouse"', add
label define relate_lbl 21  `"Unmarried Partner"', add
label define relate_lbl 22  `"Own household child"', add
label define relate_lbl 23  `"Grandchild"', add
label define relate_lbl 24  `"Parent"', add
label define relate_lbl 25  `"Brother/Sister"', add
label define relate_lbl 26  `"Other relative"', add
label define relate_lbl 27  `"Foster child"', add
label define relate_lbl 28  `"Housemate/roommate"', add
label define relate_lbl 29  `"Roomer/boarder"', add
label define relate_lbl 30  `"Other nonrelative"', add
label define relate_lbl 40  `"Own non-household child lt 18"', add
label define relate_lbl 996 `"Refused"', add
label define relate_lbl 997 `"Don't know"', add
label define relate_lbl 999 `"NIU (Not in universe)"', add
label values relate relate_lbl

label define popstat_lbl 1  `"Adult civilian"'
label define popstat_lbl 2  `"Armed Forces"', add
label define popstat_lbl 3  `"Child"', add
label define popstat_lbl 99 `"NIU (Not in universe)"', add
label values popstat popstat_lbl

label define educ_lbl 10  `"Less than 1st grade"'
label define educ_lbl 11  `"1st, 2nd, 3rd, or 4th grade"', add
label define educ_lbl 12  `"5th or 6th grade"', add
label define educ_lbl 13  `"7th or 8th grade"', add
label define educ_lbl 14  `"9th grade"', add
label define educ_lbl 15  `"10th grade"', add
label define educ_lbl 16  `"11th grade"', add
label define educ_lbl 17  `"12th grade - no diploma"', add
label define educ_lbl 20  `"High school graduate - GED"', add
label define educ_lbl 21  `"High school graduate - diploma"', add
label define educ_lbl 30  `"Some college but no degree"', add
label define educ_lbl 31  `"Associate degree - occupational vocational"', add
label define educ_lbl 32  `"Associate degree - academic program"', add
label define educ_lbl 40  `"Bachelor's degree (BA, AB, BS, etc.)"', add
label define educ_lbl 41  `"Master's degree (MA, MS, MEng, MEd, MSW, etc.)"', add
label define educ_lbl 42  `"Professional school degree (MD, DDS, DVM, etc.)"', add
label define educ_lbl 43  `"Doctoral degree (PhD, EdD, etc.)"', add
label define educ_lbl 999 `"NIU (Not in universe)"', add
label values educ educ_lbl

label define educyrs_lbl 0   `"Less than first grade"'
label define educyrs_lbl 2   `"First through fourth grade"', add
label define educyrs_lbl 5   `"Fifth through sixth grade"', add
label define educyrs_lbl 7   `"Seventh through eighth grade"', add
label define educyrs_lbl 9   `"Ninth grade"', add
label define educyrs_lbl 10  `"Tenth grade"', add
label define educyrs_lbl 11  `"Eleventh grade"', add
label define educyrs_lbl 12  `"Twelfth grade"', add
label define educyrs_lbl 13  `"College--one year"', add
label define educyrs_lbl 14  `"College--two years"', add
label define educyrs_lbl 15  `"College--three years"', add
label define educyrs_lbl 16  `"College--four years"', add
label define educyrs_lbl 17  `"Master's degree--one year program"', add
label define educyrs_lbl 18  `"Master's degree--two year program"', add
label define educyrs_lbl 19  `"Professional, doctoral degree"', add
label define educyrs_lbl 999 `"NIU (Not in universe)"', add
label values educyrs educyrs_lbl

label define schlcoll_lbl 1  `"Not enrolled"'
label define schlcoll_lbl 2  `"High school part time"', add
label define schlcoll_lbl 3  `"High school full time"', add
label define schlcoll_lbl 4  `"College/university part time"', add
label define schlcoll_lbl 5  `"College/university full time"', add
label define schlcoll_lbl 96 `"Refused"', add
label define schlcoll_lbl 99 `"NIU (Not in universe)"', add
label values schlcoll schlcoll_lbl

label define schlcoll_cps8_lbl 1  `"Not enrolled"'
label define schlcoll_cps8_lbl 2  `"High school part time"', add
label define schlcoll_cps8_lbl 3  `"High school full time"', add
label define schlcoll_cps8_lbl 4  `"College/university part time"', add
label define schlcoll_cps8_lbl 5  `"College/university full time"', add
label define schlcoll_cps8_lbl 98 `"Blank"', add
label define schlcoll_cps8_lbl 99 `"NIU (Not in universe)"', add
label values schlcoll_cps8 schlcoll_cps8_lbl

label define empstat_lbl 1  `"Employed - at work"'
label define empstat_lbl 2  `"Employed - absent"', add
label define empstat_lbl 3  `"Unemployed - on layoff"', add
label define empstat_lbl 4  `"Unemployed - looking"', add
label define empstat_lbl 5  `"Not in labor force"', add
label define empstat_lbl 99 `"NIU (Not in universe)"', add
label values empstat empstat_lbl

label define multjobs_lbl 0  `"No"'
label define multjobs_lbl 1  `"Yes"', add
label define multjobs_lbl 99 `"NIU (Not in universe)"', add
label values multjobs multjobs_lbl

label define clwkr_lbl 1  `"Government, federal"'
label define clwkr_lbl 2  `"Government, state"', add
label define clwkr_lbl 3  `"Government, local"', add
label define clwkr_lbl 4  `"Private, for profit"', add
label define clwkr_lbl 5  `"Private, nonprofit"', add
label define clwkr_lbl 6  `"Self-employed, incorporated"', add
label define clwkr_lbl 7  `"Self-employed, unincorporated"', add
label define clwkr_lbl 8  `"Without pay"', add
label define clwkr_lbl 99 `"NIU (Not in universe)"', add
label values clwkr clwkr_lbl

label define occ2_lbl 110  `"Management occupations"'
label define occ2_lbl 111  `"Business and financial operations occupations"', add
label define occ2_lbl 120  `"Computer and mathematical science occupations"', add
label define occ2_lbl 121  `"Architecture and engineering occupations"', add
label define occ2_lbl 122  `"Life, physical, and social science occupations"', add
label define occ2_lbl 123  `"Community and social service occupations"', add
label define occ2_lbl 124  `"Legal occupations"', add
label define occ2_lbl 125  `"Education, training, and library occupations"', add
label define occ2_lbl 126  `"Arts, design, entertainment, sports, and media occupations"', add
label define occ2_lbl 127  `"Healthcare practitioner and technical occupations"', add
label define occ2_lbl 130  `"Healthcare support occupations"', add
label define occ2_lbl 131  `"Protective service occupations"', add
label define occ2_lbl 132  `"Food preparation and serving related occupations"', add
label define occ2_lbl 133  `"Building and grounds cleaning and maintenance occupations"', add
label define occ2_lbl 134  `"Personal care and service occupations"', add
label define occ2_lbl 140  `"Sales and related occupations"', add
label define occ2_lbl 150  `"Office and administrative support occupations"', add
label define occ2_lbl 160  `"Farming, fishing, and forestry occupations"', add
label define occ2_lbl 170  `"Construction and extraction occupations"', add
label define occ2_lbl 180  `"Installation, maintenance, and repair occupations"', add
label define occ2_lbl 190  `"Production occupations"', add
label define occ2_lbl 200  `"Transportation and material moving occupations"', add
label define occ2_lbl 9999 `"NIU (Not in universe)"', add
label values occ2 occ2_lbl

label define occ_lbl 10    `"Chief executives"'
label define occ_lbl 20    `"General and operations managers"', add
label define occ_lbl 40    `"Advertising and promotions managers"', add
label define occ_lbl 50    `"Marketing and sales managers"', add
label define occ_lbl 60    `"Public relations managers"', add
label define occ_lbl 100   `"Administrative services managers"', add
label define occ_lbl 110   `"Computer and information systems managers"', add
label define occ_lbl 120   `"Financial managers"', add
label define occ_lbl 130   `"Human resources managers"', add
label define occ_lbl 135   `"Compensation and benefits managers"', add
label define occ_lbl 136   `"Human resources managers"', add
label define occ_lbl 137   `"Training and development managers"', add
label define occ_lbl 140   `"Industrial production managers"', add
label define occ_lbl 150   `"Purchasing managers"', add
label define occ_lbl 160   `"Transportation, storage, and distribution managers"', add
label define occ_lbl 200   `"Farm, ranch, and other agricultural managers"', add
label define occ_lbl 205   `"Farmers, ranchers, and other agricultural mangers"', add
label define occ_lbl 210   `"Farmers and ranchers"', add
label define occ_lbl 220   `"Construction managers"', add
label define occ_lbl 230   `"Education administrators"', add
label define occ_lbl 300   `"Engineering managers"', add
label define occ_lbl 310   `"Food service managers"', add
label define occ_lbl 320   `"Funeral directors"', add
label define occ_lbl 325   `"Funeral service managers"', add
label define occ_lbl 330   `"Gaming managers"', add
label define occ_lbl 340   `"Lodging managers"', add
label define occ_lbl 350   `"Medical and health services managers"', add
label define occ_lbl 360   `"Natural sciences managers"', add
label define occ_lbl 410   `"Property, real estate, and community association managers"', add
label define occ_lbl 420   `"Social and community service managers"', add
label define occ_lbl 430   `"Managers, all other"', add
label define occ_lbl 500   `"Agents and business managers of artists, performers, and athletes"', add
label define occ_lbl 510   `"Purchasing agents and buyers, farm products"', add
label define occ_lbl 520   `"Wholesale and retail buyers, except farm products"', add
label define occ_lbl 530   `"Purchasing agents, except wholesale, retail, and farm products"', add
label define occ_lbl 540   `"Claims adjusters, appraisers, examiners, and investigators"', add
label define occ_lbl 560   `"Compliance officers, except agriculture, construction, health and safety, andtransportation"', add
label define occ_lbl 565   `"Compliance officers"', add
label define occ_lbl 600   `"Cost estimators"', add
label define occ_lbl 620   `"Human resources, training, and labor relations specialists"', add
label define occ_lbl 630   `"Human resources workers"', add
label define occ_lbl 640   `"Compensation, benefits, and job analysis specialists"', add
label define occ_lbl 650   `"Training and development specialists"', add
label define occ_lbl 700   `"Logisticians"', add
label define occ_lbl 710   `"Management analysts"', add
label define occ_lbl 720   `"Meeting and convention planners"', add
label define occ_lbl 725   `"Meeting, convention, and event planners"', add
label define occ_lbl 726   `"Fundraisers"', add
label define occ_lbl 730   `"Other business operations specialists"', add
label define occ_lbl 735   `"Market research analysts and marketing specialists"', add
label define occ_lbl 740   `"Business operations specialists, all other"', add
label define occ_lbl 800   `"Accountants and auditors"', add
label define occ_lbl 810   `"Appraisers and assessors of real estate"', add
label define occ_lbl 820   `"Budget analysts"', add
label define occ_lbl 830   `"Credit analysts"', add
label define occ_lbl 840   `"Financial analysts"', add
label define occ_lbl 850   `"Personal financial advisors"', add
label define occ_lbl 860   `"Insurance underwriters"', add
label define occ_lbl 900   `"Financial examiners"', add
label define occ_lbl 910   `"Loan counselors and officers"', add
label define occ_lbl 930   `"Tax examiners, collectors, and revenue agents"', add
label define occ_lbl 940   `"Tax preparers"', add
label define occ_lbl 950   `"Financial specialists, all other"', add
label define occ_lbl 1000  `"Computer scientists and systems analysts"', add
label define occ_lbl 1005  `"Computer and information research scientists"', add
label define occ_lbl 1006  `"Computer systems analysts"', add
label define occ_lbl 1007  `"Information security analysts"', add
label define occ_lbl 1010  `"Computer programmers"', add
label define occ_lbl 1020  `"Computer software engineers"', add
label define occ_lbl 1030  `"Web developers"', add
label define occ_lbl 1040  `"Computer support specialists"', add
label define occ_lbl 1050  `"Computer support specialists"', add
label define occ_lbl 1060  `"Database administrators"', add
label define occ_lbl 1100  `"Network and computer systems administrators"', add
label define occ_lbl 1105  `"Network and computer systems administrators"', add
label define occ_lbl 1106  `"Computer network architects"', add
label define occ_lbl 1107  `"Computer occupations, all other"', add
label define occ_lbl 1110  `"Network systems and data communications analysts"', add
label define occ_lbl 1200  `"Actuaries"', add
label define occ_lbl 1210  `"Mathematicians"', add
label define occ_lbl 1220  `"Operations research analysts"', add
label define occ_lbl 1230  `"Statisticians"', add
label define occ_lbl 1240  `"Miscellaneous mathematical science occupations"', add
label define occ_lbl 1300  `"Architects, except naval"', add
label define occ_lbl 1310  `"Surveyors, cartographers, and photogrammetrists"', add
label define occ_lbl 1320  `"Aerospace engineers"', add
label define occ_lbl 1330  `"Agricultural engineers"', add
label define occ_lbl 1340  `"Biomedical engineers"', add
label define occ_lbl 1350  `"Chemical engineers"', add
label define occ_lbl 1360  `"Civil engineers"', add
label define occ_lbl 1400  `"Computer hardware engineers"', add
label define occ_lbl 1410  `"Electrical and electronics engineers"', add
label define occ_lbl 1420  `"Environmental engineers"', add
label define occ_lbl 1430  `"Industrial engineers, including health and safety"', add
label define occ_lbl 1440  `"Marine engineers and naval architects"', add
label define occ_lbl 1450  `"Materials engineers"', add
label define occ_lbl 1460  `"Mechanical engineers"', add
label define occ_lbl 1500  `"Mining and geological engineers, including mining safety engineers"', add
label define occ_lbl 1510  `"Nuclear engineers"', add
label define occ_lbl 1520  `"Petroleum engineers"', add
label define occ_lbl 1530  `"Engineers, all other"', add
label define occ_lbl 1540  `"Drafters"', add
label define occ_lbl 1550  `"Engineering technicians, except drafters"', add
label define occ_lbl 1560  `"Surveying and mapping technicians"', add
label define occ_lbl 1600  `"Agricultural and food scientists"', add
label define occ_lbl 1610  `"Biological scientists"', add
label define occ_lbl 1640  `"Conservation scientists and foresters"', add
label define occ_lbl 1650  `"Medical scientists"', add
label define occ_lbl 1700  `"Astronomers and physicists"', add
label define occ_lbl 1710  `"Atmospheric and space scientists"', add
label define occ_lbl 1720  `"Chemists and materials scientists"', add
label define occ_lbl 1740  `"Environmental scientists and geoscientists"', add
label define occ_lbl 1760  `"Physical scientists, all other"', add
label define occ_lbl 1800  `"Economists"', add
label define occ_lbl 1810  `"Market and survey researchers"', add
label define occ_lbl 1815  `"Survey researchers"', add
label define occ_lbl 1820  `"Psychologists"', add
label define occ_lbl 1830  `"Sociologists"', add
label define occ_lbl 1840  `"Urban and regional planners"', add
label define occ_lbl 1860  `"Miscellaneous social scientists and related workers"', add
label define occ_lbl 1900  `"Agricultural and food science technicians"', add
label define occ_lbl 1910  `"Biological technicians"', add
label define occ_lbl 1920  `"Chemical technicians"', add
label define occ_lbl 1930  `"Geological and petroleum technicians"', add
label define occ_lbl 1940  `"Nuclear technicians"', add
label define occ_lbl 1960  `"Other life, physical, and social science technicians"', add
label define occ_lbl 1965  `"Miscellaneous life, physical, and social science technicians"', add
label define occ_lbl 2000  `"Counselors"', add
label define occ_lbl 2010  `"Social workers"', add
label define occ_lbl 2015  `"Probation officers and correctional treatment specialists"', add
label define occ_lbl 2016  `"Social and human service assistants"', add
label define occ_lbl 2020  `"Miscellaneous community and social service specialists"', add
label define occ_lbl 2025  `"Miscellaneous community and social service specialists, including health educators and community health workers"', add
label define occ_lbl 2040  `"Clergy"', add
label define occ_lbl 2050  `"Directors, religious activities and education"', add
label define occ_lbl 2060  `"Religious workers, all other"', add
label define occ_lbl 2100  `"Lawyers"', add
label define occ_lbl 2140  `"Paralegals and legal assistants"', add
label define occ_lbl 2145  `"Paralegals and legal assistants"', add
label define occ_lbl 2150  `"Miscellaneous legal support workers"', add
label define occ_lbl 2160  `"Miscellaneous legal support workers"', add
label define occ_lbl 2200  `"Postsecondary teachers"', add
label define occ_lbl 2300  `"Preschool and kindergarten teachers"', add
label define occ_lbl 2310  `"Elementary and middle school teachers"', add
label define occ_lbl 2320  `"Secondary school teachers"', add
label define occ_lbl 2330  `"Special education teachers"', add
label define occ_lbl 2340  `"Other teachers and instructors"', add
label define occ_lbl 2400  `"Archivists, curators, and museum technicians"', add
label define occ_lbl 2430  `"Librarians"', add
label define occ_lbl 2440  `"Library technicians"', add
label define occ_lbl 2540  `"Teacher assistants"', add
label define occ_lbl 2550  `"Other education, training, and library workers"', add
label define occ_lbl 2600  `"Artists and related workers"', add
label define occ_lbl 2630  `"Designers"', add
label define occ_lbl 2700  `"Actors"', add
label define occ_lbl 2710  `"Producers and directors"', add
label define occ_lbl 2720  `"Athletes, coaches, umpires, and related workers"', add
label define occ_lbl 2740  `"Dancers and choreographers"', add
label define occ_lbl 2750  `"Musicians, singers, and related workers"', add
label define occ_lbl 2760  `"Entertainers and performers, sports and related workers, all other"', add
label define occ_lbl 2800  `"Announcers"', add
label define occ_lbl 2810  `"News analysts, reporters and correspondents"', add
label define occ_lbl 2820  `"Public relations specialists"', add
label define occ_lbl 2825  `"Public relations specialists"', add
label define occ_lbl 2830  `"Editors"', add
label define occ_lbl 2840  `"Technical writers"', add
label define occ_lbl 2850  `"Writers and authors"', add
label define occ_lbl 2860  `"Miscellaneous media and communication workers"', add
label define occ_lbl 2900  `"Broadcast and sound engineering technicians and radio operators"', add
label define occ_lbl 2910  `"Photographers"', add
label define occ_lbl 2920  `"Television, video, and motion picture camera operators and editors"', add
label define occ_lbl 3000  `"Chiropractors"', add
label define occ_lbl 3010  `"Dentists"', add
label define occ_lbl 3030  `"Dietitians and nutritionists"', add
label define occ_lbl 3040  `"Optometrists"', add
label define occ_lbl 3050  `"Pharmacists"', add
label define occ_lbl 3060  `"Physicians and surgeons"', add
label define occ_lbl 3110  `"Physician assistants"', add
label define occ_lbl 3120  `"Podiatrists"', add
label define occ_lbl 3130  `"Registered nurses"', add
label define occ_lbl 3140  `"Audiologists"', add
label define occ_lbl 3150  `"Occupational therapists"', add
label define occ_lbl 3160  `"Physical therapists"', add
label define occ_lbl 3200  `"Radiation therapists"', add
label define occ_lbl 3210  `"Recreational therapists"', add
label define occ_lbl 3220  `"Respiratory therapists"', add
label define occ_lbl 3230  `"Speech-language pathologists"', add
label define occ_lbl 3240  `"Therapists, all other"', add
label define occ_lbl 3245  `"Other therapists, including exercise physiologists"', add
label define occ_lbl 3250  `"Veterinarians"', add
label define occ_lbl 3255  `"Registered nurses"', add
label define occ_lbl 3256  `"Nurse anesthetists"', add
label define occ_lbl 3258  `"Nurse practitioners"', add
label define occ_lbl 3260  `"Health diagnosing and treating practitioners, all other"', add
label define occ_lbl 3300  `"Clinical laboratory technologists and technicians"', add
label define occ_lbl 3310  `"Dental hygienists"', add
label define occ_lbl 3320  `"Diagnostic related technologists and technicians"', add
label define occ_lbl 3400  `"Emergency medical technicians and paramedics"', add
label define occ_lbl 3410  `"Health diagnosing and treating practitioner support technicians"', add
label define occ_lbl 3420  `"Health practitioner support technologists and technicians"', add
label define occ_lbl 3500  `"Licensed practical and licensed vocational nurses"', add
label define occ_lbl 3510  `"Medical records and health information technicians"', add
label define occ_lbl 3520  `"Opticians, dispensing"', add
label define occ_lbl 3530  `"Miscellaneous health technologists and technicians"', add
label define occ_lbl 3535  `"Miscellaneous health technologists and technicians"', add
label define occ_lbl 3540  `"Other healthcare practitioners and technical occupations"', add
label define occ_lbl 3600  `"Nursing, psychiatric, and home health aides"', add
label define occ_lbl 3610  `"Occupational therapist assistants and aides"', add
label define occ_lbl 3620  `"Physical therapist assistants and aides"', add
label define occ_lbl 3630  `"Massage therapists"', add
label define occ_lbl 3640  `"Dental assistants"', add
label define occ_lbl 3645  `"Medical assistants"', add
label define occ_lbl 3646  `"Medical transcriptionists"', add
label define occ_lbl 3648  `"Veterinary assistants and laboratory animal caretakers"', add
label define occ_lbl 3649  `"Phlebotomists"', add
label define occ_lbl 3650  `"Medical assistants and other healthcare support occupations"', add
label define occ_lbl 3655  `"Healthcare support workers, all other, including medical equipment preparers"', add
label define occ_lbl 3700  `"First-line supervisors managers of correctional officers"', add
label define occ_lbl 3710  `"First-line supervisors managers of police and detectives"', add
label define occ_lbl 3720  `"First-line supervisors managers of fire fighting and prevention workers"', add
label define occ_lbl 3730  `"Supervisors, protective service workers, all other"', add
label define occ_lbl 3740  `"Fire fighters"', add
label define occ_lbl 3750  `"Fire inspectors"', add
label define occ_lbl 3800  `"Bailiffs, correctional officers, and jailers"', add
label define occ_lbl 3820  `"Detectives and criminal investigators"', add
label define occ_lbl 3830  `"Fish and game wardens"', add
label define occ_lbl 3840  `"Parking enforcement workers"', add
label define occ_lbl 3850  `"Police and sheriff's patrol officers"', add
label define occ_lbl 3860  `"Transit and railroad police"', add
label define occ_lbl 3900  `"Animal control workers"', add
label define occ_lbl 3910  `"Private detectives and investigators"', add
label define occ_lbl 3920  `"Security guards and gaming surveillance officers"', add
label define occ_lbl 3930  `"Security guards and gaming surveillance officers"', add
label define occ_lbl 3940  `"Crossing guards"', add
label define occ_lbl 3945  `"Transportation security screeners"', add
label define occ_lbl 3950  `"Lifeguards and other protective service workers"', add
label define occ_lbl 3955  `"Lifeguards and other recreational, and all other protective service workers"', add
label define occ_lbl 4000  `"Chefs and head cooks"', add
label define occ_lbl 4010  `"First-line supervisors managers of food preparation and serving workers"', add
label define occ_lbl 4020  `"Cooks"', add
label define occ_lbl 4030  `"Food preparation workers"', add
label define occ_lbl 4040  `"Bartenders"', add
label define occ_lbl 4050  `"Combined food preparation and serving workers, including fast food"', add
label define occ_lbl 4060  `"Counter attendants, cafeteria, food concession, and coffee shop"', add
label define occ_lbl 4110  `"Waiters and waitresses"', add
label define occ_lbl 4120  `"Food servers, nonrestaurant"', add
label define occ_lbl 4130  `"Dining room and cafeteria attendants and bartender helpers"', add
label define occ_lbl 4140  `"Dishwashers"', add
label define occ_lbl 4150  `"Hosts and hostesses, restaurant, lounge, and coffee shop"', add
label define occ_lbl 4160  `"Food preparation and serving related workers, all other"', add
label define occ_lbl 4200  `"First-line supervisors managers of housekeeping and janitorial workers"', add
label define occ_lbl 4210  `"First-line supervisors managers of landscaping, lawn service, and groundskeeping workers"', add
label define occ_lbl 4220  `"Janitors and building cleaners"', add
label define occ_lbl 4230  `"Maids and housekeeping cleaners"', add
label define occ_lbl 4240  `"Pest control workers"', add
label define occ_lbl 4250  `"Grounds maintenance workers"', add
label define occ_lbl 4300  `"First-line supervisors managers of gaming workers"', add
label define occ_lbl 4320  `"First-line supervisors managers of personal service workers"', add
label define occ_lbl 4340  `"Animal trainers"', add
label define occ_lbl 4350  `"Nonfarm animal caretakers"', add
label define occ_lbl 4400  `"Gaming services workers"', add
label define occ_lbl 4410  `"Motion picture projectionists"', add
label define occ_lbl 4420  `"Ushers, lobby attendants, and ticket takers"', add
label define occ_lbl 4430  `"Miscellaneous entertainment attendants and related workers"', add
label define occ_lbl 4460  `"Funeral service workers"', add
label define occ_lbl 4465  `"Morticians, undertakers, and funeral directors"', add
label define occ_lbl 4500  `"Barbers"', add
label define occ_lbl 4510  `"Hairdressers, hairstylists, and cosmetologists"', add
label define occ_lbl 4520  `"Miscellaneous personal appearance workers"', add
label define occ_lbl 4530  `"Baggage porters, bellhops, and concierges"', add
label define occ_lbl 4540  `"Tour and travel guides"', add
label define occ_lbl 4550  `"Transportation attendants"', add
label define occ_lbl 4600  `"Child care workers"', add
label define occ_lbl 4610  `"Personal and home care aides"', add
label define occ_lbl 4620  `"Recreation and fitness workers"', add
label define occ_lbl 4640  `"Residential advisors"', add
label define occ_lbl 4650  `"Personal care and service workers, all other"', add
label define occ_lbl 4700  `"First-line supervisors managers of retail sales workers"', add
label define occ_lbl 4710  `"First-line supervisors managers of non-retail sales workers"', add
label define occ_lbl 4720  `"Cashiers"', add
label define occ_lbl 4740  `"Counter and rental clerks"', add
label define occ_lbl 4750  `"Parts salespersons"', add
label define occ_lbl 4760  `"Retail salespersons"', add
label define occ_lbl 4800  `"Advertising sales agents"', add
label define occ_lbl 4810  `"Insurance sales agents"', add
label define occ_lbl 4820  `"Securities, commodities, and financial services sales agents"', add
label define occ_lbl 4830  `"Travel agents"', add
label define occ_lbl 4840  `"Sales representatives, services, all other"', add
label define occ_lbl 4850  `"Sales representatives, wholesale and manufacturing"', add
label define occ_lbl 4900  `"Models, demonstrators, and product promoters"', add
label define occ_lbl 4920  `"Real estate brokers and sales agents"', add
label define occ_lbl 4930  `"Sales engineers"', add
label define occ_lbl 4940  `"Telemarketers"', add
label define occ_lbl 4950  `"Door-to-door sales workers, news and street vendors, and related workers"', add
label define occ_lbl 4960  `"Sales and related workers, all other"', add
label define occ_lbl 4965  `"Sales and related workers, all other"', add
label define occ_lbl 5000  `"First-line supervisors managers of office and administrative support workers"', add
label define occ_lbl 5010  `"Switchboard operators, including answering service"', add
label define occ_lbl 5020  `"Telephone operators"', add
label define occ_lbl 5030  `"Communications equipment operators, all other"', add
label define occ_lbl 5100  `"Bill and account collectors"', add
label define occ_lbl 5110  `"Billing and posting clerks and machine operators"', add
label define occ_lbl 5120  `"Bookkeeping, accounting, and auditing clerks"', add
label define occ_lbl 5130  `"Gaming cage workers"', add
label define occ_lbl 5140  `"Payroll and timekeeping clerks"', add
label define occ_lbl 5150  `"Procurement clerks"', add
label define occ_lbl 5160  `"Tellers"', add
label define occ_lbl 5165  `"Financial clerks, all other"', add
label define occ_lbl 5200  `"Brokerage clerks"', add
label define occ_lbl 5210  `"Correspondence clerks"', add
label define occ_lbl 5220  `"Court, municipal, and license clerks"', add
label define occ_lbl 5230  `"Credit authorizers, checkers, and clerks"', add
label define occ_lbl 5240  `"Customer service representatives"', add
label define occ_lbl 5250  `"Eligibility interviewers, government programs"', add
label define occ_lbl 5260  `"File clerks"', add
label define occ_lbl 5300  `"Hotel, motel, and resort desk clerks"', add
label define occ_lbl 5310  `"Interviewers, except eligibility and loan"', add
label define occ_lbl 5320  `"Library assistants, clerical"', add
label define occ_lbl 5330  `"Loan interviewers and clerks"', add
label define occ_lbl 5340  `"New accounts clerks"', add
label define occ_lbl 5350  `"Order clerks"', add
label define occ_lbl 5360  `"Human resources assistants, except payroll and timekeeping"', add
label define occ_lbl 5400  `"Receptionists and information clerks"', add
label define occ_lbl 5410  `"Reservation and transportation ticket agents and travel clerks"', add
label define occ_lbl 5420  `"Information and record clerks, all other"', add
label define occ_lbl 5500  `"Cargo and freight agents"', add
label define occ_lbl 5510  `"Couriers and messengers"', add
label define occ_lbl 5520  `"Dispatchers"', add
label define occ_lbl 5530  `"Meter readers, utilities"', add
label define occ_lbl 5540  `"Postal service clerks"', add
label define occ_lbl 5550  `"Postal service mail carriers"', add
label define occ_lbl 5560  `"Postal service mail sorters, processors, and processing machine operators"', add
label define occ_lbl 5600  `"Production, planning, and expediting clerks"', add
label define occ_lbl 5610  `"Shipping, receiving, and traffic clerks"', add
label define occ_lbl 5620  `"Stock clerks and order fillers"', add
label define occ_lbl 5630  `"Weighers, measurers, checkers, and samplers, recordkeeping"', add
label define occ_lbl 5700  `"Secretaries and administrative assistants"', add
label define occ_lbl 5800  `"Computer operators"', add
label define occ_lbl 5810  `"Data entry keyers"', add
label define occ_lbl 5820  `"Word processors and typists"', add
label define occ_lbl 5830  `"Desktop publishers"', add
label define occ_lbl 5840  `"Insurance claims and policy processing clerks"', add
label define occ_lbl 5850  `"Mail clerks and mail machine operators, except postal service"', add
label define occ_lbl 5860  `"Office clerks, general"', add
label define occ_lbl 5900  `"Office machine operators, except computer"', add
label define occ_lbl 5910  `"Proofreaders and copy markers"', add
label define occ_lbl 5920  `"Statistical assistants"', add
label define occ_lbl 5930  `"Office and administrative support workers, all other"', add
label define occ_lbl 5940  `"Miscellaneous office and administrative support workers including desktop publishers"', add
label define occ_lbl 6000  `"First-line supervisors managers of farming, fishing, and forestry workers"', add
label define occ_lbl 6005  `"First-line supervisors of farming, fishing, and forestry workers"', add
label define occ_lbl 6010  `"Agricultural inspectors"', add
label define occ_lbl 6020  `"Animal breeders"', add
label define occ_lbl 6040  `"Graders and sorters, agricultural products"', add
label define occ_lbl 6050  `"Miscellaneous agricultural workers"', add
label define occ_lbl 6100  `"Fishers and related fishing workers"', add
label define occ_lbl 6110  `"Hunters and trappers"', add
label define occ_lbl 6120  `"Forest and conservation workers"', add
label define occ_lbl 6130  `"Logging workers"', add
label define occ_lbl 6200  `"First-line supervisors managers of construction trades and extraction workers"', add
label define occ_lbl 6210  `"Boilermakers"', add
label define occ_lbl 6220  `"Brickmasons, blockmasons, and stonemasons"', add
label define occ_lbl 6230  `"Carpenters"', add
label define occ_lbl 6240  `"Carpet, floor, and tile installers and finishers"', add
label define occ_lbl 6250  `"Cement masons, concrete finishers, and terrazzo workers"', add
label define occ_lbl 6260  `"Construction laborers"', add
label define occ_lbl 6300  `"Paving, surfacing, and tamping equipment operators"', add
label define occ_lbl 6310  `"Pile-driver operators"', add
label define occ_lbl 6320  `"Operating engineers and other construction equipment operators"', add
label define occ_lbl 6330  `"Drywall installers, ceiling tile installers, and tapers"', add
label define occ_lbl 6350  `"Electricians"', add
label define occ_lbl 6355  `"Electricians"', add
label define occ_lbl 6360  `"Glaziers"', add
label define occ_lbl 6400  `"Insulation workers"', add
label define occ_lbl 6420  `"Painters, construction and maintenance"', add
label define occ_lbl 6430  `"Paperhangers"', add
label define occ_lbl 6440  `"Pipelayers, plumbers, pipefitters, and steamfitters"', add
label define occ_lbl 6460  `"Plasterers and stucco masons"', add
label define occ_lbl 6500  `"Reinforcing iron and rebar workers"', add
label define occ_lbl 6510  `"Roofers"', add
label define occ_lbl 6515  `"Roofers"', add
label define occ_lbl 6520  `"Sheet metal workers"', add
label define occ_lbl 6530  `"Structural iron and steel workers"', add
label define occ_lbl 6540  `"Solar photovoltaic installers"', add
label define occ_lbl 6600  `"Helpers, construction trades"', add
label define occ_lbl 6660  `"Construction and building inspectors"', add
label define occ_lbl 6700  `"Elevator installers and repairers"', add
label define occ_lbl 6710  `"Fence erectors"', add
label define occ_lbl 6720  `"Hazardous materials removal workers"', add
label define occ_lbl 6730  `"Highway maintenance workers"', add
label define occ_lbl 6740  `"Rail-track laying and maintenance equipment operators"', add
label define occ_lbl 6750  `"Septic tank servicers and sewer pipe cleaners"', add
label define occ_lbl 6760  `"Miscellaneous construction and related workers"', add
label define occ_lbl 6765  `"Miscellaneous construction workers including solar photovaltaic installers, septic tank servicers, and sewer pipe cleaners"', add
label define occ_lbl 6800  `"Derrick, rotary drill, and service unit operators, oil, gas, and mining"', add
label define occ_lbl 6820  `"Earth drillers, except oil and gas"', add
label define occ_lbl 6830  `"Explosives workers, ordnance handling experts, and blasters"', add
label define occ_lbl 6840  `"Mining machine operators"', add
label define occ_lbl 6920  `"Roustabouts, oil and gas"', add
label define occ_lbl 6930  `"Helpers--extraction workers"', add
label define occ_lbl 6940  `"Other extraction workers"', add
label define occ_lbl 7000  `"First-line supervisors managers of mechanics, installers, and repairers"', add
label define occ_lbl 7010  `"Computer, automated teller, and office machine repairers"', add
label define occ_lbl 7020  `"Radio and telecommunications equipment installers and repairers"', add
label define occ_lbl 7030  `"Avionics technicians"', add
label define occ_lbl 7040  `"Electric motor, power tool, and related repairers"', add
label define occ_lbl 7050  `"Electrical and electronics installers and repairers, transportation equipment"', add
label define occ_lbl 7100  `"Electrical and electronics repairers, industrial and utility"', add
label define occ_lbl 7110  `"Electronic equipment installers and repairers, motor vehicles"', add
label define occ_lbl 7120  `"Electronic home entertainment equipment installers and repairers"', add
label define occ_lbl 7130  `"Security and fire alarm systems installers"', add
label define occ_lbl 7140  `"Aircraft mechanics and service technicians"', add
label define occ_lbl 7150  `"Automotive body and related repairers"', add
label define occ_lbl 7160  `"Automotive glass installers and repairers"', add
label define occ_lbl 7200  `"Automotive service technicians and mechanics"', add
label define occ_lbl 7210  `"Bus and truck mechanics and diesel engine specialists"', add
label define occ_lbl 7220  `"Heavy vehicle and mobile equipment service technicians and mechanics"', add
label define occ_lbl 7240  `"Small engine mechanics"', add
label define occ_lbl 7260  `"Miscellaneous vehicle and mobile equipment mechanics, installers, and repairers"', add
label define occ_lbl 7300  `"Control and valve installers and repairers"', add
label define occ_lbl 7310  `"Heating, air conditioning, and refrigeration mechanics and installers"', add
label define occ_lbl 7315  `"Heating, air conditioning, and refrigeration mechanics and installers"', add
label define occ_lbl 7320  `"Home appliance repairers"', add
label define occ_lbl 7330  `"Industrial and refractory machinery mechanics"', add
label define occ_lbl 7340  `"Maintenance and repair workers, general"', add
label define occ_lbl 7350  `"Maintenance workers, machinery"', add
label define occ_lbl 7360  `"Millwrights"', add
label define occ_lbl 7410  `"Electrical power-line installers and repairers"', add
label define occ_lbl 7420  `"Telecommunications line installers and repairers"', add
label define occ_lbl 7430  `"Precision instrument and equipment repairers"', add
label define occ_lbl 7510  `"Coin, vending, and amusement machine servicers and repairers"', add
label define occ_lbl 7520  `"Commercial divers"', add
label define occ_lbl 7540  `"Locksmiths and safe repairers"', add
label define occ_lbl 7550  `"Manufactured building and mobile home installers"', add
label define occ_lbl 7560  `"Riggers"', add
label define occ_lbl 7600  `"Signal and track switch repairers"', add
label define occ_lbl 7610  `"Helpers--installation, maintenance, and repair workers"', add
label define occ_lbl 7620  `"Other installation, maintenance, and repair workers"', add
label define occ_lbl 7630  `"Other installation, maintenance, and repair workers, including wind turbine service technicians, commercial divers, and signal and track switch repairers"', add
label define occ_lbl 7700  `"First-line supervisors managers of production and operating workers"', add
label define occ_lbl 7710  `"Aircraft structure, surfaces, rigging, and systems assemblers"', add
label define occ_lbl 7720  `"Electrical, electronics, and electromechanical assemblers"', add
label define occ_lbl 7730  `"Engine and other machine assemblers"', add
label define occ_lbl 7740  `"Structural metal fabricators and fitters"', add
label define occ_lbl 7750  `"Miscellaneous assemblers and fabricators"', add
label define occ_lbl 7800  `"Bakers"', add
label define occ_lbl 7810  `"Butchers and other meat, poultry, and fish processing workers"', add
label define occ_lbl 7830  `"Food and tobacco roasting, baking, and drying machine operators and tenders"', add
label define occ_lbl 7840  `"Food batchmakers"', add
label define occ_lbl 7850  `"Food cooking machine operators and tenders"', add
label define occ_lbl 7855  `"Food processing workers, all other"', add
label define occ_lbl 7900  `"Computer control programmers and operators"', add
label define occ_lbl 7920  `"Extruding and drawing machine setters, operators, and tenders, metal and plastic"', add
label define occ_lbl 7930  `"Forging machine setters, operators, and tenders, metal and plastic"', add
label define occ_lbl 7940  `"Rolling machine setters, operators, and tenders, metal and plastic"', add
label define occ_lbl 7950  `"Cutting, punching, and press machine setters, operators, and tenders, metal and plastic"', add
label define occ_lbl 7960  `"Drilling and boring machine tool setters, operators, and tenders, metal and plastic"', add
label define occ_lbl 8000  `"Grinding, lapping, polishing, and buffing machine tool setters, operators, and tenders, metal and plastic"', add
label define occ_lbl 8010  `"Lathe and turning machine tool setters, operators, and tenders, metal and plastic"', add
label define occ_lbl 8020  `"Milling and planing machine setters, operators, and tenders, metal and plastic"', add
label define occ_lbl 8030  `"Machinists"', add
label define occ_lbl 8040  `"Metal furnace and kiln operators and tenders"', add
label define occ_lbl 8060  `"Model makers and patternmakers, metal and plastic"', add
label define occ_lbl 8100  `"Molders and molding machine setters, operators, and tenders, metal and plastic"', add
label define occ_lbl 8120  `"Multiple machine tool setters, operators, and tenders, metal and plastic"', add
label define occ_lbl 8130  `"Tool and die makers"', add
label define occ_lbl 8140  `"Welding, soldering, and brazing workers"', add
label define occ_lbl 8150  `"Heat treating equipment setters, operators, and tenders, metal and plastic"', add
label define occ_lbl 8160  `"Lay-out workers, metal and plastic"', add
label define occ_lbl 8200  `"Plating and coating machine setters, operators, and tenders, metal and plastic"', add
label define occ_lbl 8210  `"Tool grinders, filers, and sharpeners"', add
label define occ_lbl 8220  `"Metalworkers and plastic workers, all other"', add
label define occ_lbl 8230  `"Bookbinders and bindery workers"', add
label define occ_lbl 8240  `"Job printers"', add
label define occ_lbl 8250  `"Prepress technicians and workers"', add
label define occ_lbl 8255  `"Printing press operators"', add
label define occ_lbl 8256  `"Print binding and finishing workers"', add
label define occ_lbl 8260  `"Printing machine operators"', add
label define occ_lbl 8300  `"Laundry and dry-cleaning workers"', add
label define occ_lbl 8310  `"Pressers, textile, garment, and related materials"', add
label define occ_lbl 8320  `"Sewing machine operators"', add
label define occ_lbl 8330  `"Shoe and leather workers and repairers"', add
label define occ_lbl 8350  `"Tailors, dressmakers, and sewers"', add
label define occ_lbl 8360  `"Textile bleaching and dyeing machine operators and tenders"', add
label define occ_lbl 8400  `"Textile cutting machine setters, operators, and tenders"', add
label define occ_lbl 8410  `"Textile knitting and weaving machine setters, operators, and tenders"', add
label define occ_lbl 8420  `"Textile winding, twisting, and drawing out machine setters, operators, and tenders"', add
label define occ_lbl 8430  `"Extruding and forming machine setters, operators, and tenders, synthetic and glass fibers"', add
label define occ_lbl 8440  `"Fabric and apparel patternmakers"', add
label define occ_lbl 8450  `"Upholsterers"', add
label define occ_lbl 8460  `"Textile, apparel, and furnishings workers, all other"', add
label define occ_lbl 8500  `"Cabinetmakers and bench carpenters"', add
label define occ_lbl 8510  `"Furniture finishers"', add
label define occ_lbl 8520  `"Model makers and patternmakers, wood"', add
label define occ_lbl 8530  `"Sawing machine setters, operators, and tenders, wood"', add
label define occ_lbl 8540  `"Woodworking machine setters, operators, and tenders, except sawing"', add
label define occ_lbl 8550  `"Woodworkers, all other"', add
label define occ_lbl 8600  `"Power plant operators, distributors, and dispatchers"', add
label define occ_lbl 8610  `"Stationary engineers and boiler operators"', add
label define occ_lbl 8620  `"Water and liquid waste treatment plant and system operators"', add
label define occ_lbl 8630  `"Miscellaneous plant and system operators"', add
label define occ_lbl 8640  `"Chemical processing machine setters, operators, and tenders"', add
label define occ_lbl 8650  `"Crushing, grinding, polishing, mixing, and blending workers"', add
label define occ_lbl 8710  `"Cutting workers"', add
label define occ_lbl 8720  `"Extruding, forming, pressing, and compacting machine setters, operators, and  tenders"', add
label define occ_lbl 8730  `"Furnace, kiln, oven, drier, and kettle operators and tenders"', add
label define occ_lbl 8740  `"Inspectors, testers, sorters, samplers, and weighers"', add
label define occ_lbl 8750  `"Jewelers and precious stone and metal workers"', add
label define occ_lbl 8760  `"Medical, dental, and ophthalmic laboratory technicians"', add
label define occ_lbl 8800  `"Packaging and filling machine operators and tenders"', add
label define occ_lbl 8810  `"Painting workers"', add
label define occ_lbl 8830  `"Photographic process workers and processing machine operators"', add
label define occ_lbl 8840  `"Semiconductor processors"', add
label define occ_lbl 8850  `"Cementing and gluing machine operators and tenders"', add
label define occ_lbl 8860  `"Cleaning, washing, and metal pickling equipment operators and tenders"', add
label define occ_lbl 8900  `"Cooling and freezing equipment operators and tenders"', add
label define occ_lbl 8910  `"Etchers and engravers"', add
label define occ_lbl 8920  `"Molders, shapers, and casters, except metal and plastic"', add
label define occ_lbl 8930  `"Paper goods machine setters, operators, and tenders"', add
label define occ_lbl 8940  `"Tire builders"', add
label define occ_lbl 8950  `"Helpers--production workers"', add
label define occ_lbl 8960  `"Production workers, all other"', add
label define occ_lbl 8965  `"Other production workers, including semiconductor processors and cooling and freezing equipment operators"', add
label define occ_lbl 9000  `"Supervisors, transportation and material moving workers"', add
label define occ_lbl 9030  `"Aircraft pilots and flight engineers"', add
label define occ_lbl 9040  `"Air traffic controllers and airfield operations specialists"', add
label define occ_lbl 9050  `"Flight attendants"', add
label define occ_lbl 9110  `"Ambulance drivers and attendants, except emergency medical technicians"', add
label define occ_lbl 9120  `"Bus drivers"', add
label define occ_lbl 9130  `"Driver sales workers and truck drivers"', add
label define occ_lbl 9140  `"Taxi drivers and chauffeurs"', add
label define occ_lbl 9150  `"Motor vehicle operators, all other"', add
label define occ_lbl 9200  `"Locomotive engineers and operators"', add
label define occ_lbl 9230  `"Railroad brake, signal, and switch operators"', add
label define occ_lbl 9240  `"Railroad conductors and yardmasters"', add
label define occ_lbl 9260  `"Subway, streetcar, and other rail transportation workers"', add
label define occ_lbl 9300  `"Sailors and marine oilers"', add
label define occ_lbl 9310  `"Ship and boat captains and operators"', add
label define occ_lbl 9340  `"Bridge and lock tenders"', add
label define occ_lbl 9350  `"Parking lot attendants"', add
label define occ_lbl 9360  `"Service station attendants"', add
label define occ_lbl 9410  `"Transportation inspectors"', add
label define occ_lbl 9415  `"Transportation attendants, except flight attendants"', add
label define occ_lbl 9420  `"Other transportation workers"', add
label define occ_lbl 9500  `"Conveyor operators and tenders"', add
label define occ_lbl 9510  `"Crane and tower operators"', add
label define occ_lbl 9520  `"Dredge, excavating, and loading machine operators"', add
label define occ_lbl 9560  `"Hoist and winch operators"', add
label define occ_lbl 9600  `"Industrial truck and tractor operators"', add
label define occ_lbl 9610  `"Cleaners of vehicles and equipment"', add
label define occ_lbl 9620  `"Laborers and freight, stock, and material movers, hand"', add
label define occ_lbl 9630  `"Machine feeders and offbearers"', add
label define occ_lbl 9640  `"Packers and packagers, hand"', add
label define occ_lbl 9650  `"Pumping station operators"', add
label define occ_lbl 9720  `"Refuse and recyclable material collectors"', add
label define occ_lbl 9740  `"Tank car, truck, and ship loaders"', add
label define occ_lbl 9750  `"Material moving workers, all other"', add
label define occ_lbl 99999 `"NIU (Not in universe)"', add
label values occ occ_lbl

label define ind2_lbl 100  `"Agriculture"'
label define ind2_lbl 101  `"Forestry, logging, fishing, hunting, and trapping"', add
label define ind2_lbl 110  `"Mining"', add
label define ind2_lbl 120  `"Construction"', add
label define ind2_lbl 130  `"Nonmetallic mineral product manufacturing"', add
label define ind2_lbl 131  `"Primary metals and fabricated metal products"', add
label define ind2_lbl 132  `"Machinery manufacturing"', add
label define ind2_lbl 133  `"Computer and electronic product mfg"', add
label define ind2_lbl 134  `"Electrical equipment, appliance mfg"', add
label define ind2_lbl 135  `"Transportation equipment manufacturing"', add
label define ind2_lbl 136  `"Wood product manufacturing"', add
label define ind2_lbl 137  `"Furniture and fixtures manufacturing"', add
label define ind2_lbl 138  `"Miscellaneous and not specified mfg"', add
label define ind2_lbl 140  `"Food manufacturing"', add
label define ind2_lbl 141  `"Beverage and tobacco product mfg"', add
label define ind2_lbl 142  `"Textile, apparel, and leather manufacturing"', add
label define ind2_lbl 143  `"Paper manufacturing and printing"', add
label define ind2_lbl 144  `"Petroleum and coal products manufacturing"', add
label define ind2_lbl 145  `"Chemical manufacturing"', add
label define ind2_lbl 146  `"Plastics and rubber products manufacturing"', add
label define ind2_lbl 150  `"Wholesale trade"', add
label define ind2_lbl 160  `"Retail trade"', add
label define ind2_lbl 170  `"Transportation and warehousing"', add
label define ind2_lbl 180  `"Utilities"', add
label define ind2_lbl 190  `"Publishing industries (except internet)"', add
label define ind2_lbl 191  `"Motion picture and sound recording industries"', add
label define ind2_lbl 192  `"Broadcasting (except internet)"', add
label define ind2_lbl 193  `"Internet publishing and broadcasting"', add
label define ind2_lbl 194  `"Telecommunications"', add
label define ind2_lbl 195  `"Internet svc providers and data processing svcs"', add
label define ind2_lbl 196  `"Other information services"', add
label define ind2_lbl 200  `"Finance"', add
label define ind2_lbl 201  `"Insurance"', add
label define ind2_lbl 210  `"Real estate"', add
label define ind2_lbl 211  `"Rental and leasing services"', add
label define ind2_lbl 220  `"Professional, scientific, and technical services"', add
label define ind2_lbl 230  `"Management of companies and enterprises"', add
label define ind2_lbl 231  `"Administrative and support services"', add
label define ind2_lbl 232  `"Waste management and remediation services"', add
label define ind2_lbl 240  `"Educational services"', add
label define ind2_lbl 250  `"Hospitals"', add
label define ind2_lbl 251  `"Health care services, except hospitals"', add
label define ind2_lbl 252  `"Social assistance"', add
label define ind2_lbl 260  `"Arts, entertainment, and recreation"', add
label define ind2_lbl 270  `"Traveler accommodation"', add
label define ind2_lbl 271  `"Food services and drinking places"', add
label define ind2_lbl 280  `"Private households"', add
label define ind2_lbl 290  `"Repair and maintenance"', add
label define ind2_lbl 291  `"Personal and laundry services"', add
label define ind2_lbl 292  `"Membership associations and organizations"', add
label define ind2_lbl 300  `"Public administration"', add
label define ind2_lbl 9999 `"NIU (Not in universe)"', add
label values ind2 ind2_lbl

label define whyabsnt_lbl 1   `"On layoff (temporary or indefinite)"'
label define whyabsnt_lbl 2   `"Slack work/business conditions"', add
label define whyabsnt_lbl 3   `"Waiting for a new job to begin"', add
label define whyabsnt_lbl 4   `"Vacation/personal days"', add
label define whyabsnt_lbl 5   `"Own illness/injury/medical problems"', add
label define whyabsnt_lbl 6   `"Childcare problems"', add
label define whyabsnt_lbl 7   `"Other family/personal obligation"', add
label define whyabsnt_lbl 8   `"Maternity/paternity leave"', add
label define whyabsnt_lbl 9   `"Labor dispute"', add
label define whyabsnt_lbl 10  `"Weather affected job"', add
label define whyabsnt_lbl 11  `"School/training"', add
label define whyabsnt_lbl 12  `"Civic/military duty"', add
label define whyabsnt_lbl 13  `"Does not work in the business"', add
label define whyabsnt_lbl 14  `"Other family/personal obligation"', add
label define whyabsnt_lbl 999 `"NIU (Not in universe)"', add
label values whyabsnt whyabsnt_lbl

label define otpay_lbl 9999998 `"Blank"'
label define otpay_lbl 9999999 `"NIU (Not in universe)"', add
label values otpay otpay_lbl

label define otusual_lbl 0  `"No"'
label define otusual_lbl 1  `"Yes"', add
label define otusual_lbl 99 `"NIU (Not in universe)"', add
label values otusual otusual_lbl

label define hrsatrate_lbl 1   `"1"'
label define hrsatrate_lbl 2   `"2"', add
label define hrsatrate_lbl 3   `"3"', add
label define hrsatrate_lbl 4   `"4"', add
label define hrsatrate_lbl 5   `"5"', add
label define hrsatrate_lbl 6   `"6"', add
label define hrsatrate_lbl 7   `"7"', add
label define hrsatrate_lbl 8   `"8"', add
label define hrsatrate_lbl 9   `"9"', add
label define hrsatrate_lbl 10  `"10"', add
label define hrsatrate_lbl 11  `"11"', add
label define hrsatrate_lbl 12  `"12"', add
label define hrsatrate_lbl 13  `"13"', add
label define hrsatrate_lbl 14  `"14"', add
label define hrsatrate_lbl 15  `"15"', add
label define hrsatrate_lbl 16  `"16"', add
label define hrsatrate_lbl 17  `"17"', add
label define hrsatrate_lbl 18  `"18"', add
label define hrsatrate_lbl 19  `"19"', add
label define hrsatrate_lbl 20  `"20"', add
label define hrsatrate_lbl 21  `"21"', add
label define hrsatrate_lbl 22  `"22"', add
label define hrsatrate_lbl 23  `"23"', add
label define hrsatrate_lbl 24  `"24"', add
label define hrsatrate_lbl 25  `"25"', add
label define hrsatrate_lbl 26  `"26"', add
label define hrsatrate_lbl 27  `"27"', add
label define hrsatrate_lbl 28  `"28"', add
label define hrsatrate_lbl 29  `"29"', add
label define hrsatrate_lbl 30  `"30"', add
label define hrsatrate_lbl 31  `"31"', add
label define hrsatrate_lbl 32  `"32"', add
label define hrsatrate_lbl 33  `"33"', add
label define hrsatrate_lbl 34  `"34"', add
label define hrsatrate_lbl 35  `"35"', add
label define hrsatrate_lbl 36  `"36"', add
label define hrsatrate_lbl 37  `"37"', add
label define hrsatrate_lbl 38  `"38"', add
label define hrsatrate_lbl 39  `"39"', add
label define hrsatrate_lbl 40  `"40"', add
label define hrsatrate_lbl 41  `"41"', add
label define hrsatrate_lbl 42  `"42"', add
label define hrsatrate_lbl 43  `"43"', add
label define hrsatrate_lbl 44  `"44"', add
label define hrsatrate_lbl 45  `"45"', add
label define hrsatrate_lbl 46  `"46"', add
label define hrsatrate_lbl 47  `"47"', add
label define hrsatrate_lbl 48  `"48"', add
label define hrsatrate_lbl 49  `"49"', add
label define hrsatrate_lbl 50  `"50"', add
label define hrsatrate_lbl 51  `"51"', add
label define hrsatrate_lbl 52  `"52"', add
label define hrsatrate_lbl 53  `"53"', add
label define hrsatrate_lbl 54  `"54"', add
label define hrsatrate_lbl 55  `"55"', add
label define hrsatrate_lbl 56  `"56"', add
label define hrsatrate_lbl 57  `"57"', add
label define hrsatrate_lbl 58  `"58"', add
label define hrsatrate_lbl 59  `"59"', add
label define hrsatrate_lbl 60  `"60"', add
label define hrsatrate_lbl 61  `"61"', add
label define hrsatrate_lbl 62  `"62"', add
label define hrsatrate_lbl 63  `"63"', add
label define hrsatrate_lbl 64  `"64"', add
label define hrsatrate_lbl 65  `"65"', add
label define hrsatrate_lbl 66  `"66"', add
label define hrsatrate_lbl 67  `"67"', add
label define hrsatrate_lbl 68  `"68"', add
label define hrsatrate_lbl 69  `"69"', add
label define hrsatrate_lbl 70  `"70"', add
label define hrsatrate_lbl 71  `"71"', add
label define hrsatrate_lbl 72  `"72"', add
label define hrsatrate_lbl 73  `"73"', add
label define hrsatrate_lbl 74  `"74"', add
label define hrsatrate_lbl 75  `"75"', add
label define hrsatrate_lbl 76  `"76"', add
label define hrsatrate_lbl 77  `"77"', add
label define hrsatrate_lbl 78  `"78"', add
label define hrsatrate_lbl 79  `"79"', add
label define hrsatrate_lbl 80  `"80"', add
label define hrsatrate_lbl 81  `"81"', add
label define hrsatrate_lbl 82  `"82"', add
label define hrsatrate_lbl 83  `"83"', add
label define hrsatrate_lbl 84  `"84"', add
label define hrsatrate_lbl 85  `"85"', add
label define hrsatrate_lbl 86  `"86"', add
label define hrsatrate_lbl 87  `"87"', add
label define hrsatrate_lbl 88  `"88"', add
label define hrsatrate_lbl 89  `"89"', add
label define hrsatrate_lbl 90  `"90"', add
label define hrsatrate_lbl 91  `"91"', add
label define hrsatrate_lbl 92  `"92"', add
label define hrsatrate_lbl 93  `"93"', add
label define hrsatrate_lbl 94  `"94"', add
label define hrsatrate_lbl 95  `"95"', add
label define hrsatrate_lbl 96  `"96"', add
label define hrsatrate_lbl 97  `"97"', add
label define hrsatrate_lbl 98  `"98"', add
label define hrsatrate_lbl 99  `"99"', add
label define hrsatrate_lbl 100 `"100"', add
label define hrsatrate_lbl 996 `"Refused"', add
label define hrsatrate_lbl 997 `"Don't know"', add
label define hrsatrate_lbl 998 `"Blank"', add
label define hrsatrate_lbl 999 `"NIU (Not in universe)"', add
label values hrsatrate hrsatrate_lbl

label define hourwage_lbl 99999 `"NIU (Not in universe)"'
label values hourwage hourwage_lbl

label define earnrpt_lbl 1  `"Hourly"'
label define earnrpt_lbl 2  `"Weekly"', add
label define earnrpt_lbl 3  `"Bi-weekly"', add
label define earnrpt_lbl 4  `"Twice monthly"', add
label define earnrpt_lbl 5  `"Monthly"', add
label define earnrpt_lbl 6  `"Annually"', add
label define earnrpt_lbl 7  `"Other"', add
label define earnrpt_lbl 99 `"NIU (Not in universe)"', add
label values earnrpt earnrpt_lbl

label define paidhour_lbl 1  `"Paid hourly"'
label define paidhour_lbl 2  `"Not paid hourly"', add
label define paidhour_lbl 99 `"NIU (Not in universe)"', add
label values paidhour paidhour_lbl

label define earnweek_lbl 9999999 `"NIU (Not in universe)"'
label values earnweek earnweek_lbl

label define uhrswork1_lbl 995 `"Hours vary"'
label define uhrswork1_lbl 999 `"NIU (Not in universe)"', add
label define uhrswork1_lbl 40  `"40"', add
label define uhrswork1_lbl 16  `"16"', add
label define uhrswork1_lbl 32  `"32"', add
label define uhrswork1_lbl 70  `"70"', add
label define uhrswork1_lbl 20  `"20"', add
label define uhrswork1_lbl 22  `"22"', add
label define uhrswork1_lbl 60  `"60"', add
label define uhrswork1_lbl 45  `"45"', add
label define uhrswork1_lbl 10  `"10"', add
label define uhrswork1_lbl 24  `"24"', add
label define uhrswork1_lbl 12  `"12"', add
label define uhrswork1_lbl 50  `"50"', add
label define uhrswork1_lbl 15  `"15"', add
label define uhrswork1_lbl 55  `"55"', add
label define uhrswork1_lbl 47  `"47"', add
label define uhrswork1_lbl 35  `"35"', add
label define uhrswork1_lbl 43  `"43"', add
label define uhrswork1_lbl 30  `"30"', add
label define uhrswork1_lbl 28  `"28"', add
label define uhrswork1_lbl 37  `"37"', add
label define uhrswork1_lbl 33  `"33"', add
label define uhrswork1_lbl 3   `"3"', add
label define uhrswork1_lbl 29  `"29"', add
label define uhrswork1_lbl 80  `"80"', add
label define uhrswork1_lbl 38  `"38"', add
label define uhrswork1_lbl 5   `"5"', add
label define uhrswork1_lbl 13  `"13"', add
label define uhrswork1_lbl 2   `"2"', add
label define uhrswork1_lbl 49  `"49"', add
label define uhrswork1_lbl 27  `"27"', add
label define uhrswork1_lbl 18  `"18"', add
label define uhrswork1_lbl 25  `"25"', add
label define uhrswork1_lbl 21  `"21"', add
label define uhrswork1_lbl 39  `"39"', add
label define uhrswork1_lbl 99  `"99"', add
label define uhrswork1_lbl 19  `"19"', add
label define uhrswork1_lbl 36  `"36"', add
label define uhrswork1_lbl 95  `"95"', add
label define uhrswork1_lbl 41  `"41"', add
label define uhrswork1_lbl 34  `"34"', add
label define uhrswork1_lbl 48  `"48"', add
label define uhrswork1_lbl 65  `"65"', add
label define uhrswork1_lbl 44  `"44"', add
label define uhrswork1_lbl 42  `"42"', add
label define uhrswork1_lbl 17  `"17"', add
label define uhrswork1_lbl 8   `"8"', add
label define uhrswork1_lbl 66  `"66"', add
label define uhrswork1_lbl 9   `"9"', add
label define uhrswork1_lbl 26  `"26"', add
label define uhrswork1_lbl 7   `"7"', add
label define uhrswork1_lbl 14  `"14"', add
label define uhrswork1_lbl 23  `"23"', add
label define uhrswork1_lbl 4   `"4"', add
label define uhrswork1_lbl 6   `"6"', add
label define uhrswork1_lbl 59  `"59"', add
label define uhrswork1_lbl 46  `"46"', add
label define uhrswork1_lbl 84  `"84"', add
label define uhrswork1_lbl 56  `"56"', add
label define uhrswork1_lbl 53  `"53"', add
label define uhrswork1_lbl 90  `"90"', add
label define uhrswork1_lbl 0   `"0"', add
label define uhrswork1_lbl 58  `"58"', add
label define uhrswork1_lbl 11  `"11"', add
label define uhrswork1_lbl 52  `"52"', add
label define uhrswork1_lbl 54  `"54"', add
label define uhrswork1_lbl 72  `"72"', add
label define uhrswork1_lbl 85  `"85"', add
label define uhrswork1_lbl 31  `"31"', add
label define uhrswork1_lbl 57  `"57"', add
label define uhrswork1_lbl 75  `"75"', add
label define uhrswork1_lbl 1   `"1"', add
label define uhrswork1_lbl 82  `"82"', add
label define uhrswork1_lbl 63  `"63"', add
label define uhrswork1_lbl 96  `"96"', add
label define uhrswork1_lbl 98  `"98"', add
label define uhrswork1_lbl 61  `"61"', add
label define uhrswork1_lbl 74  `"74"', add
label define uhrswork1_lbl 68  `"68"', add
label define uhrswork1_lbl 62  `"62"', add
label define uhrswork1_lbl 88  `"88"', add
label define uhrswork1_lbl 51  `"51"', add
label define uhrswork1_lbl 78  `"78"', add
label define uhrswork1_lbl 76  `"76"', add
label define uhrswork1_lbl 64  `"64"', add
label define uhrswork1_lbl 77  `"77"', add
label define uhrswork1_lbl 69  `"69"', add
label define uhrswork1_lbl 86  `"86"', add
label define uhrswork1_lbl 67  `"67"', add
label define uhrswork1_lbl 94  `"94"', add
label define uhrswork1_lbl 73  `"73"', add
label define uhrswork1_lbl 92  `"92"', add
label define uhrswork1_lbl 93  `"93"', add
label values uhrswork1 uhrswork1_lbl

label define fullpart_lbl 1  `"Full time"'
label define fullpart_lbl 2  `"Part time"', add
label define fullpart_lbl 99 `"NIU (Not in universe)"', add
label values fullpart fullpart_lbl

label define spousepres_lbl 1  `"Spouse present"'
label define spousepres_lbl 2  `"Unmarried partner present"', add
label define spousepres_lbl 3  `"No spouse or unmarried partner present"', add
label define spousepres_lbl 99 `"NIU (Not in universe)"', add
label values spousepres spousepres_lbl

label define spage_lbl 15  `"15"'
label define spage_lbl 16  `"16"', add
label define spage_lbl 17  `"17"', add
label define spage_lbl 18  `"18"', add
label define spage_lbl 19  `"19"', add
label define spage_lbl 20  `"20"', add
label define spage_lbl 21  `"21"', add
label define spage_lbl 22  `"22"', add
label define spage_lbl 23  `"23"', add
label define spage_lbl 24  `"24"', add
label define spage_lbl 25  `"25"', add
label define spage_lbl 26  `"26"', add
label define spage_lbl 27  `"27"', add
label define spage_lbl 28  `"28"', add
label define spage_lbl 29  `"29"', add
label define spage_lbl 30  `"30"', add
label define spage_lbl 31  `"31"', add
label define spage_lbl 32  `"32"', add
label define spage_lbl 33  `"33"', add
label define spage_lbl 34  `"34"', add
label define spage_lbl 35  `"35"', add
label define spage_lbl 36  `"36"', add
label define spage_lbl 37  `"37"', add
label define spage_lbl 38  `"38"', add
label define spage_lbl 39  `"39"', add
label define spage_lbl 40  `"40"', add
label define spage_lbl 41  `"41"', add
label define spage_lbl 42  `"42"', add
label define spage_lbl 43  `"43"', add
label define spage_lbl 44  `"44"', add
label define spage_lbl 45  `"45"', add
label define spage_lbl 46  `"46"', add
label define spage_lbl 47  `"47"', add
label define spage_lbl 48  `"48"', add
label define spage_lbl 49  `"49"', add
label define spage_lbl 50  `"50"', add
label define spage_lbl 51  `"51"', add
label define spage_lbl 52  `"52"', add
label define spage_lbl 53  `"53"', add
label define spage_lbl 54  `"54"', add
label define spage_lbl 55  `"55"', add
label define spage_lbl 56  `"56"', add
label define spage_lbl 57  `"57"', add
label define spage_lbl 58  `"58"', add
label define spage_lbl 59  `"59"', add
label define spage_lbl 60  `"60"', add
label define spage_lbl 61  `"61"', add
label define spage_lbl 62  `"62"', add
label define spage_lbl 63  `"63"', add
label define spage_lbl 64  `"64"', add
label define spage_lbl 65  `"65"', add
label define spage_lbl 66  `"66"', add
label define spage_lbl 67  `"67"', add
label define spage_lbl 68  `"68"', add
label define spage_lbl 69  `"69"', add
label define spage_lbl 70  `"70"', add
label define spage_lbl 71  `"71"', add
label define spage_lbl 72  `"72"', add
label define spage_lbl 73  `"73"', add
label define spage_lbl 74  `"74"', add
label define spage_lbl 75  `"75"', add
label define spage_lbl 76  `"76"', add
label define spage_lbl 77  `"77"', add
label define spage_lbl 78  `"78"', add
label define spage_lbl 79  `"79"', add
label define spage_lbl 80  `"80"', add
label define spage_lbl 85  `"85"', add
label define spage_lbl 996 `"Refused"', add
label define spage_lbl 997 `"Don't know"', add
label define spage_lbl 998 `"Blank"', add
label define spage_lbl 999 `"NIU (Not in universe)"', add
label define spage_lbl 6   `"6"', add
label values spage spage_lbl

label define sprace_lbl 100  `"White only"'
label define sprace_lbl 200  `"Black only"', add
label define sprace_lbl 300  `"American Indian, Alaskan Native"', add
label define sprace_lbl 400  `"Asian or Pacific Islander"', add
label define sprace_lbl 401  `"Asian only"', add
label define sprace_lbl 402  `"Hawaiian Pacific Islander only"', add
label define sprace_lbl 501  `"White-Black"', add
label define sprace_lbl 502  `"White-American Indian"', add
label define sprace_lbl 503  `"White-Asian"', add
label define sprace_lbl 504  `"White-Hawaiian"', add
label define sprace_lbl 505  `"Black-American Indian"', add
label define sprace_lbl 506  `"Black-Asian"', add
label define sprace_lbl 507  `"Black-Hawaiian"', add
label define sprace_lbl 508  `"American Indian-Asian"', add
label define sprace_lbl 509  `"Asian-Hawaiian"', add
label define sprace_lbl 510  `"White-Black-American Indian"', add
label define sprace_lbl 511  `"White-Black-Asian"', add
label define sprace_lbl 512  `"White-American Indian-Asian"', add
label define sprace_lbl 513  `"White-Asian-Hawaiian"', add
label define sprace_lbl 514  `"White-Black-American Indian-Asian"', add
label define sprace_lbl 515  `"2 or 3 races, unspecified"', add
label define sprace_lbl 516  `"4 or 5 races, unspecified"', add
label define sprace_lbl 9998 `"Not Available (see description)"', add
label define sprace_lbl 9999 `"NIU (Not in universe)"', add
label define sprace_lbl 131  `"131"', add
label define sprace_lbl 110  `"110"', add
label define sprace_lbl 132  `"132"', add
label define sprace_lbl 120  `"120"', add
label define sprace_lbl 201  `"201"', add
label define sprace_lbl 202  `"202"', add
label define sprace_lbl 230  `"230"', add
label define sprace_lbl 220  `"220"', add
label define sprace_lbl 320  `"320"', add
label define sprace_lbl 210  `"210"', add
label define sprace_lbl 599  `"599"', add
label define sprace_lbl 399  `"399"', add
label define sprace_lbl 203  `"203"', add
label define sprace_lbl 301  `"301"', add
label define sprace_lbl 211  `"211"', add
label define sprace_lbl 310  `"310"', add
label values sprace sprace_lbl

label define sphispan_lbl 100  `"Not Hispanic"'
label define sphispan_lbl 210  `"Mexican"', add
label define sphispan_lbl 211  `"Mexican American"', add
label define sphispan_lbl 212  `"Chicano"', add
label define sphispan_lbl 213  `"Mexcian (Mexicano)"', add
label define sphispan_lbl 220  `"Puerto Rican"', add
label define sphispan_lbl 230  `"Cuban"', add
label define sphispan_lbl 240  `"Central-South American"', add
label define sphispan_lbl 250  `"Other Spanish"', add
label define sphispan_lbl 9998 `"Not available (see description)"', add
label define sphispan_lbl 9999 `"NIU (Not in universe)"', add
label values sphispan sphispan_lbl

label define speduc_lbl 10  `"Less than 1st grade"'
label define speduc_lbl 11  `"1st, 2nd, 3rd, or 4th grade"', add
label define speduc_lbl 12  `"5th or 6th grade"', add
label define speduc_lbl 13  `"7th or 8th grade"', add
label define speduc_lbl 14  `"9th grade"', add
label define speduc_lbl 15  `"10th grade"', add
label define speduc_lbl 16  `"11th grade"', add
label define speduc_lbl 17  `"12th grade - no diploma"', add
label define speduc_lbl 20  `"High school graduate - GED"', add
label define speduc_lbl 21  `"High school graduate - diploma"', add
label define speduc_lbl 30  `"Some college but no degree"', add
label define speduc_lbl 31  `"Associate degree - occupational vocational"', add
label define speduc_lbl 32  `"Associate degree - academic program"', add
label define speduc_lbl 40  `"Bachelor's degree (BA, AB, BS, etc.)"', add
label define speduc_lbl 41  `"Master's degree (MA, MS, MEng, MEd, MSW, etc.)"', add
label define speduc_lbl 42  `"Professional school degree (MD, DDS, DVM, etc.)"', add
label define speduc_lbl 43  `"Doctoral degree (PhD, EdD, etc.)"', add
label define speduc_lbl 998 `"Not available (see description)"', add
label define speduc_lbl 999 `"NIU (Not in universe)"', add
label values speduc speduc_lbl

label define spempnot_lbl 0  `"Not employed"'
label define spempnot_lbl 1  `"Employed"', add
label define spempnot_lbl 99 `"NIU (Not in universe)"', add
label values spempnot spempnot_lbl

label define spempstat_lbl 1  `"Employed - at work"'
label define spempstat_lbl 2  `"Employed - not at work"', add
label define spempstat_lbl 3  `"Not employed"', add
label define spempstat_lbl 4  `"Retired"', add
label define spempstat_lbl 5  `"Disabled"', add
label define spempstat_lbl 6  `"Unable to work"', add
label define spempstat_lbl 96 `"Refused"', add
label define spempstat_lbl 97 `"Don't know"', add
label define spempstat_lbl 98 `"Blank"', add
label define spempstat_lbl 99 `"NIU (Not in universe)"', add
label values spempstat spempstat_lbl

label define spusualhrs_lbl 0   `"0"'
label define spusualhrs_lbl 1   `"1"', add
label define spusualhrs_lbl 2   `"2"', add
label define spusualhrs_lbl 3   `"3"', add
label define spusualhrs_lbl 4   `"4"', add
label define spusualhrs_lbl 5   `"5"', add
label define spusualhrs_lbl 6   `"6"', add
label define spusualhrs_lbl 7   `"7"', add
label define spusualhrs_lbl 8   `"8"', add
label define spusualhrs_lbl 9   `"9"', add
label define spusualhrs_lbl 10  `"10"', add
label define spusualhrs_lbl 11  `"11"', add
label define spusualhrs_lbl 12  `"12"', add
label define spusualhrs_lbl 13  `"13"', add
label define spusualhrs_lbl 14  `"14"', add
label define spusualhrs_lbl 15  `"15"', add
label define spusualhrs_lbl 16  `"16"', add
label define spusualhrs_lbl 17  `"17"', add
label define spusualhrs_lbl 18  `"18"', add
label define spusualhrs_lbl 19  `"19"', add
label define spusualhrs_lbl 20  `"20"', add
label define spusualhrs_lbl 21  `"21"', add
label define spusualhrs_lbl 22  `"22"', add
label define spusualhrs_lbl 23  `"23"', add
label define spusualhrs_lbl 24  `"24"', add
label define spusualhrs_lbl 25  `"25"', add
label define spusualhrs_lbl 26  `"26"', add
label define spusualhrs_lbl 27  `"27"', add
label define spusualhrs_lbl 28  `"28"', add
label define spusualhrs_lbl 29  `"29"', add
label define spusualhrs_lbl 30  `"30"', add
label define spusualhrs_lbl 31  `"31"', add
label define spusualhrs_lbl 32  `"32"', add
label define spusualhrs_lbl 33  `"33"', add
label define spusualhrs_lbl 34  `"34"', add
label define spusualhrs_lbl 35  `"35"', add
label define spusualhrs_lbl 36  `"36"', add
label define spusualhrs_lbl 37  `"37"', add
label define spusualhrs_lbl 38  `"38"', add
label define spusualhrs_lbl 39  `"39"', add
label define spusualhrs_lbl 40  `"40"', add
label define spusualhrs_lbl 41  `"41"', add
label define spusualhrs_lbl 42  `"42"', add
label define spusualhrs_lbl 43  `"43"', add
label define spusualhrs_lbl 44  `"44"', add
label define spusualhrs_lbl 45  `"45"', add
label define spusualhrs_lbl 46  `"46"', add
label define spusualhrs_lbl 47  `"47"', add
label define spusualhrs_lbl 48  `"48"', add
label define spusualhrs_lbl 49  `"49"', add
label define spusualhrs_lbl 50  `"50"', add
label define spusualhrs_lbl 51  `"51"', add
label define spusualhrs_lbl 52  `"52"', add
label define spusualhrs_lbl 53  `"53"', add
label define spusualhrs_lbl 54  `"54"', add
label define spusualhrs_lbl 55  `"55"', add
label define spusualhrs_lbl 56  `"56"', add
label define spusualhrs_lbl 57  `"57"', add
label define spusualhrs_lbl 58  `"58"', add
label define spusualhrs_lbl 59  `"59"', add
label define spusualhrs_lbl 60  `"60"', add
label define spusualhrs_lbl 61  `"61"', add
label define spusualhrs_lbl 62  `"62"', add
label define spusualhrs_lbl 63  `"63"', add
label define spusualhrs_lbl 64  `"64"', add
label define spusualhrs_lbl 65  `"65"', add
label define spusualhrs_lbl 66  `"66"', add
label define spusualhrs_lbl 67  `"67"', add
label define spusualhrs_lbl 68  `"68"', add
label define spusualhrs_lbl 69  `"69"', add
label define spusualhrs_lbl 70  `"70"', add
label define spusualhrs_lbl 71  `"71"', add
label define spusualhrs_lbl 72  `"72"', add
label define spusualhrs_lbl 73  `"73"', add
label define spusualhrs_lbl 74  `"74"', add
label define spusualhrs_lbl 75  `"75"', add
label define spusualhrs_lbl 76  `"76"', add
label define spusualhrs_lbl 77  `"77"', add
label define spusualhrs_lbl 78  `"78"', add
label define spusualhrs_lbl 79  `"79"', add
label define spusualhrs_lbl 80  `"80"', add
label define spusualhrs_lbl 81  `"81"', add
label define spusualhrs_lbl 82  `"82"', add
label define spusualhrs_lbl 83  `"83"', add
label define spusualhrs_lbl 84  `"84"', add
label define spusualhrs_lbl 85  `"85"', add
label define spusualhrs_lbl 86  `"86"', add
label define spusualhrs_lbl 87  `"87"', add
label define spusualhrs_lbl 88  `"88"', add
label define spusualhrs_lbl 89  `"89"', add
label define spusualhrs_lbl 90  `"90"', add
label define spusualhrs_lbl 91  `"91"', add
label define spusualhrs_lbl 92  `"92"', add
label define spusualhrs_lbl 93  `"93"', add
label define spusualhrs_lbl 94  `"94"', add
label define spusualhrs_lbl 95  `"95"', add
label define spusualhrs_lbl 96  `"96"', add
label define spusualhrs_lbl 97  `"97"', add
label define spusualhrs_lbl 98  `"98"', add
label define spusualhrs_lbl 99  `"99"', add
label define spusualhrs_lbl 995 `"Hours vary"', add
label define spusualhrs_lbl 999 `"NIU (Not in universe)"', add
label values spusualhrs spusualhrs_lbl

label define spearnweek_lbl 9999998 `"Blank"'
label define spearnweek_lbl 9999999 `"NIU (Not in universe)"', add
label values spearnweek spearnweek_lbl

label define kidund18_lbl 0  `"No"'
label define kidund18_lbl 1  `"Yes"', add
label define kidund18_lbl 99 `"NIU (Not in universe)"', add
label values kidund18 kidund18_lbl

label define hh_numownkids_lbl 0  `"0"'
label define hh_numownkids_lbl 1  `"1"', add
label define hh_numownkids_lbl 2  `"2"', add
label define hh_numownkids_lbl 3  `"3"', add
label define hh_numownkids_lbl 4  `"4"', add
label define hh_numownkids_lbl 5  `"5"', add
label define hh_numownkids_lbl 6  `"6"', add
label define hh_numownkids_lbl 7  `"7"', add
label define hh_numownkids_lbl 8  `"8"', add
label define hh_numownkids_lbl 9  `"9"', add
label define hh_numownkids_lbl 10 `"10"', add
label define hh_numownkids_lbl 99 `"NIU (Not in universe)"', add
label values hh_numownkids hh_numownkids_lbl

label define kidund13_lbl 0  `"No"'
label define kidund13_lbl 1  `"Yes"', add
label define kidund13_lbl 99 `"NIU (Not in universe)"', add
label values kidund13 kidund13_lbl

label define kidund1_lbl 0  `"No"'
label define kidund1_lbl 1  `"Yes"', add
label define kidund1_lbl 99 `"NIU (Not in universe)"', add
label values kidund1 kidund1_lbl

label define kid1to2_lbl 0  `"No"'
label define kid1to2_lbl 1  `"Yes"', add
label define kid1to2_lbl 99 `"NIU (Not in universe)"', add
label values kid1to2 kid1to2_lbl

label define kid3to5_lbl 0  `"No"'
label define kid3to5_lbl 1  `"Yes"', add
label define kid3to5_lbl 99 `"NIU (Not in universe)"', add
label values kid3to5 kid3to5_lbl

label define kid6to12_lbl 0  `"No"'
label define kid6to12_lbl 1  `"Yes"', add
label define kid6to12_lbl 99 `"NIU (Not in universe)"', add
label values kid6to12 kid6to12_lbl

label define kid13to17_lbl 0  `"No"'
label define kid13to17_lbl 1  `"Yes"', add
label define kid13to17_lbl 99 `"NIU (Not in universe)"', add
label values kid13to17 kid13to17_lbl

label define dtrund18_lbl 0  `"No"'
label define dtrund18_lbl 1  `"Yes"', add
label define dtrund18_lbl 99 `"NIU (Not in universe)"', add
label values dtrund18 dtrund18_lbl

label define dtrund1_lbl 0  `"No"'
label define dtrund1_lbl 1  `"Yes"', add
label define dtrund1_lbl 99 `"NIU (Not in universe)"', add
label values dtrund1 dtrund1_lbl

label define dtr1to2_lbl 0  `"No"'
label define dtr1to2_lbl 1  `"Yes"', add
label define dtr1to2_lbl 99 `"NIU (Not in universe)"', add
label values dtr1to2 dtr1to2_lbl

label define dtr3to5_lbl 0  `"No"'
label define dtr3to5_lbl 1  `"Yes"', add
label define dtr3to5_lbl 99 `"NIU (Not in universe)"', add
label values dtr3to5 dtr3to5_lbl

label define dtr6to12_lbl 0  `"No"'
label define dtr6to12_lbl 1  `"Yes"', add
label define dtr6to12_lbl 99 `"NIU (Not in universe)"', add
label values dtr6to12 dtr6to12_lbl

label define dtr13to17_lbl 0  `"No"'
label define dtr13to17_lbl 1  `"Yes"', add
label define dtr13to17_lbl 99 `"NIU (Not in universe)"', add
label values dtr13to17 dtr13to17_lbl

label define sonund18_lbl 0  `"No"'
label define sonund18_lbl 1  `"Yes"', add
label define sonund18_lbl 99 `"NIU (Not in universe)"', add
label values sonund18 sonund18_lbl

label define sonund1_lbl 0  `"No"'
label define sonund1_lbl 1  `"Yes"', add
label define sonund1_lbl 99 `"NIU (Not in universe)"', add
label values sonund1 sonund1_lbl

label define son1to2_lbl 0  `"No"'
label define son1to2_lbl 1  `"Yes"', add
label define son1to2_lbl 99 `"NIU (Not in universe)"', add
label values son1to2 son1to2_lbl

label define son3to5_lbl 0  `"No"'
label define son3to5_lbl 1  `"Yes"', add
label define son3to5_lbl 99 `"NIU (Not in universe)"', add
label values son3to5 son3to5_lbl

label define son6to12_lbl 0  `"No"'
label define son6to12_lbl 1  `"Yes"', add
label define son6to12_lbl 99 `"NIU (Not in universe)"', add
label values son6to12 son6to12_lbl

label define son13to17_lbl 0  `"No"'
label define son13to17_lbl 1  `"Yes"', add
label define son13to17_lbl 99 `"NIU (Not in universe)"', add
label values son13to17 son13to17_lbl

label define nonhhchild_lbl 0  `"No"'
label define nonhhchild_lbl 1  `"Yes"', add
label define nonhhchild_lbl 99 `"NIU (Not in universe)"', add
label values nonhhchild nonhhchild_lbl

label define activity_lbl 10101  `"Sleeping"'
label define activity_lbl 10102  `"Sleeplessness"', add
label define activity_lbl 10199  `"Sleeping, n.e.c."', add
label define activity_lbl 10201  `"Washing, dressing, and grooming oneself"', add
label define activity_lbl 10299  `"Grooming, n.e.c."', add
label define activity_lbl 10301  `"Health-related self care"', add
label define activity_lbl 10399  `"Self care, n.e.c."', add
label define activity_lbl 10401  `"Personal or private activities"', add
label define activity_lbl 10499  `"Personal activities, n.e.c."', add
label define activity_lbl 10501  `"Personal emergencies"', add
label define activity_lbl 10599  `"Personal care emergencies, n.e.c."', add
label define activity_lbl 19999  `"Personal care, n.e.c."', add
label define activity_lbl 20101  `"Interior cleaning"', add
label define activity_lbl 20102  `"Laundry"', add
label define activity_lbl 20103  `"Sewing, repairing, and maintaining textiles"', add
label define activity_lbl 20104  `"Storing interior household items, including food"', add
label define activity_lbl 20199  `"Housework, n.e.c."', add
label define activity_lbl 20201  `"Food and drink preparation"', add
label define activity_lbl 20202  `"Food presentation"', add
label define activity_lbl 20203  `"Kitchen and food clean-up"', add
label define activity_lbl 20299  `"Food and drink preparation, presentation, and clean-up, n.e.c."', add
label define activity_lbl 20301  `"Interior arrangement, decoration, and repairs"', add
label define activity_lbl 20302  `"Building and repairing furniture"', add
label define activity_lbl 20303  `"Heating and cooling"', add
label define activity_lbl 20399  `"Interior maintenance, repair, and decoration, n.e.c."', add
label define activity_lbl 20401  `"Exterior cleaning"', add
label define activity_lbl 20402  `"Exterior repair, improvements, and decoration"', add
label define activity_lbl 20499  `"Exterior maintenance, repair, and decoration, n.e.c."', add
label define activity_lbl 20501  `"Lawn, garden, and houseplant care"', add
label define activity_lbl 20502  `"Ponds, pools, and hot tubs"', add
label define activity_lbl 20599  `"Lawn and garden, n.e.c."', add
label define activity_lbl 20601  `"Care for animals and pets (not veterinary care) (2003-2007)"', add
label define activity_lbl 20602  `"Care for animals and pets (not veterinary care) (2008+)"', add
label define activity_lbl 20603  `"Walking, exercising, playing with animals (2008+)"', add
label define activity_lbl 20699  `"Pet and animal care, n.e.c."', add
label define activity_lbl 20701  `"Vehicle repair and maintenance (by self)"', add
label define activity_lbl 20799  `"Vehicles, n.e.c."', add
label define activity_lbl 20801  `"Appliance, tool, and toy set-up, repair, and maintenance (by self)"', add
label define activity_lbl 20899  `"Appliances and tools, n.e.c."', add
label define activity_lbl 20901  `"Financial management"', add
label define activity_lbl 20902  `"Household and personal organization and planning"', add
label define activity_lbl 20903  `"Household and personal mail and messages (except e-mail)"', add
label define activity_lbl 20904  `"Household and personal e-mail and messages"', add
label define activity_lbl 20905  `"Home security"', add
label define activity_lbl 20999  `"Household management, n.e.c."', add
label define activity_lbl 29999  `"Household activities, n.e.c."', add
label define activity_lbl 30101  `"Physical care for household children"', add
label define activity_lbl 30102  `"Reading to or with household children"', add
label define activity_lbl 30103  `"Playing with household children, not sports"', add
label define activity_lbl 30104  `"Arts and crafts with household children"', add
label define activity_lbl 30105  `"Playing sports with household children"', add
label define activity_lbl 30106  `"Talking with or listening to household children"', add
label define activity_lbl 30107  `"Helping or teaching household children (not related to education) (2003)"', add
label define activity_lbl 30108  `"Organization and planning for household children"', add
label define activity_lbl 30109  `"Looking after household children (as a primary activity)"', add
label define activity_lbl 30110  `"Attending household children's events"', add
label define activity_lbl 30111  `"Waiting for or with household children"', add
label define activity_lbl 30112  `"Picking up or dropping off household children"', add
label define activity_lbl 30199  `"Caring for and helping household children, n.e.c."', add
label define activity_lbl 30201  `"Homework (household children)"', add
label define activity_lbl 30202  `"Meetings and school conferences (household children)"', add
label define activity_lbl 30203  `"Home schooling of household children"', add
label define activity_lbl 30204  `"Waiting associated with household children's education"', add
label define activity_lbl 30299  `"Activities related to household child's education, n.e.c."', add
label define activity_lbl 30301  `"Providing medical care to household children"', add
label define activity_lbl 30302  `"Obtaining medical care for household children"', add
label define activity_lbl 30303  `"Waiting associated with household children's health"', add
label define activity_lbl 30399  `"Activities related to household child's health, n.e.c."', add
label define activity_lbl 30401  `"Physical care for household adults"', add
label define activity_lbl 30402  `"Looking after household adult (as a primary activity)"', add
label define activity_lbl 30403  `"Providing medical care to household adult"', add
label define activity_lbl 30404  `"Obtaining medical and care services for household adult"', add
label define activity_lbl 30405  `"Waiting associated with caring for household adults"', add
label define activity_lbl 30499  `"Caring for household adults, n.e.c."', add
label define activity_lbl 30501  `"Helping household adults"', add
label define activity_lbl 30502  `"Organization and planning for household adults"', add
label define activity_lbl 30503  `"Picking up or dropping off household adult"', add
label define activity_lbl 30504  `"Waiting associated with helping household adults"', add
label define activity_lbl 30599  `"Helping household adults, n.e.c."', add
label define activity_lbl 39999  `"Caring for and helping household members, n.e.c."', add
label define activity_lbl 40101  `"Physical care for non-household children"', add
label define activity_lbl 40102  `"Reading to or with non-household children"', add
label define activity_lbl 40103  `"Playing with non-household children, not sports"', add
label define activity_lbl 40104  `"Arts and crafts with non-household children"', add
label define activity_lbl 40105  `"Playing sports with non-household children"', add
label define activity_lbl 40106  `"Talking with or listening to non-household children"', add
label define activity_lbl 40107  `"Helping or teaching non-household children (not related to education) (2003)"', add
label define activity_lbl 40108  `"Organization and planning for non-household children"', add
label define activity_lbl 40109  `"Looking after non-household children (as primary activity)"', add
label define activity_lbl 40110  `"Attending non-household children's events"', add
label define activity_lbl 40111  `"Waiting for or with non-household children"', add
label define activity_lbl 40112  `"Dropping off or picking up non-household children"', add
label define activity_lbl 40199  `"Caring for and helping non-household children, n.e.c."', add
label define activity_lbl 40201  `"Homework (non-household children)"', add
label define activity_lbl 40202  `"Meetings and school conferences (non-household children)"', add
label define activity_lbl 40203  `"Home schooling of non-household children"', add
label define activity_lbl 40204  `"Waiting associated with non-household children's education"', add
label define activity_lbl 40299  `"Activities related to non-household child's education, n.e.c."', add
label define activity_lbl 40301  `"Providing medical care to non-household children"', add
label define activity_lbl 40302  `"Obtaining medical care for non-household children"', add
label define activity_lbl 40303  `"Waiting associated with non-household children's health"', add
label define activity_lbl 40399  `"Activities related to non-household child's health, n.e.c."', add
label define activity_lbl 40401  `"Physical care for non-household adults"', add
label define activity_lbl 40402  `"Looking after non-household adult (as a primary activity)"', add
label define activity_lbl 40403  `"Providing medical care to non-household adult"', add
label define activity_lbl 40404  `"Obtaining medical and care services for non-household adult"', add
label define activity_lbl 40405  `"Waiting associated with caring for non-household adults"', add
label define activity_lbl 40499  `"Caring for non-household adults, n.e.c."', add
label define activity_lbl 40501  `"Housework, cooking, and shopping assistance for non-household adults"', add
label define activity_lbl 40502  `"House and lawn maintenance and repair assistance for non-household adults"', add
label define activity_lbl 40503  `"Animal and pet care assistance for non-household adults"', add
label define activity_lbl 40504  `"Vehicle and appliance maintenance or repair assistance for non-household adults"', add
label define activity_lbl 40505  `"Financial management assistance for non-household adults"', add
label define activity_lbl 40506  `"Household management and paperwork assistance for non-household adults"', add
label define activity_lbl 40507  `"Picking up or dropping off non-household adult"', add
label define activity_lbl 40508  `"Waiting associated with helping non-household adults"', add
label define activity_lbl 40599  `"Helping non-household adults, n.e.c."', add
label define activity_lbl 49999  `"Caring for and helping non-household members, n.e.c."', add
label define activity_lbl 50101  `"Work, main job"', add
label define activity_lbl 50102  `"Work, other job(s)"', add
label define activity_lbl 50103  `"Security procedures related to work"', add
label define activity_lbl 50104  `"Waiting associated with working (2004+)"', add
label define activity_lbl 50199  `"Working, n.e.c."', add
label define activity_lbl 50201  `"Socializing, relaxing, and leisure as part of job"', add
label define activity_lbl 50202  `"Eating and drinking as part of job"', add
label define activity_lbl 50203  `"Sports and exercise as part of job"', add
label define activity_lbl 50204  `"Security procedures as part of job"', add
label define activity_lbl 50205  `"Waiting associated with work-related activities (2004+)"', add
label define activity_lbl 50299  `"Work-related activities, n.e.c."', add
label define activity_lbl 50301  `"Income-generating hobbies, crafts, and food"', add
label define activity_lbl 50302  `"Income-generating performances"', add
label define activity_lbl 50303  `"Income-generating services"', add
label define activity_lbl 50304  `"Income-generating rental property activities"', add
label define activity_lbl 50305  `"Waiting associated with other income-generating activities (2004+)"', add
label define activity_lbl 50399  `"Other income-generating activities, n.e.c."', add
label define activity_lbl 50401  `"Job search activities"', add
label define activity_lbl 50403  `"Job interviewing"', add
label define activity_lbl 50404  `"Waiting associated with job search or interview"', add
label define activity_lbl 50405  `"Security procedures related to job search or interviewing"', add
label define activity_lbl 50499  `"Job search and interviewing, n.e.c."', add
label define activity_lbl 59999  `"Work and work-related activities, n.e.c."', add
label define activity_lbl 60101  `"Taking class for degree, certification, or licensure"', add
label define activity_lbl 60102  `"Taking class for personal interest"', add
label define activity_lbl 60103  `"Waiting associated with taking classes"', add
label define activity_lbl 60104  `"Security procedures related to taking classes"', add
label define activity_lbl 60199  `"Taking class, n.e.c."', add
label define activity_lbl 60201  `"Extracurricular club activities"', add
label define activity_lbl 60202  `"Extracurricular music and performance activities"', add
label define activity_lbl 60203  `"Extracurricular student government activities"', add
label define activity_lbl 60204  `"Waiting associated with extracurricular activities (2004+)"', add
label define activity_lbl 60299  `"Education-related extracurricular activities, n.e.c."', add
label define activity_lbl 60301  `"Research or homework for class (for degree, certification, or licensure)"', add
label define activity_lbl 60302  `"Research or homework for class (for personal interest)"', add
label define activity_lbl 60303  `"Waiting associated with research or homework"', add
label define activity_lbl 60399  `"Research or homework, n.e.c."', add
label define activity_lbl 60401  `"Administrative activities: class for degree, certification, or licensure"', add
label define activity_lbl 60402  `"Administrative activities: class for personal interest"', add
label define activity_lbl 60403  `"Waiting associated with administrative activities (education)"', add
label define activity_lbl 60499  `"Administrative for education, n.e.c."', add
label define activity_lbl 69999  `"Education, n.e.c."', add
label define activity_lbl 70101  `"Grocery shopping"', add
label define activity_lbl 70102  `"Purchasing gas"', add
label define activity_lbl 70103  `"Purchasing food (not groceries)"', add
label define activity_lbl 70104  `"Shopping, except groceries, food, and gas"', add
label define activity_lbl 70105  `"Waiting associated with shopping"', add
label define activity_lbl 70199  `"Shopping, n.e.c."', add
label define activity_lbl 70201  `"Comparison shopping"', add
label define activity_lbl 70299  `"Researching purchases, n.e.c."', add
label define activity_lbl 70301  `"Security procedures related to consumer purchases"', add
label define activity_lbl 70399  `"Security procedures related to consumer purchases, n.e.c."', add
label define activity_lbl 79999  `"Consumer purchases, n.e.c."', add
label define activity_lbl 80101  `"Using paid childcare services"', add
label define activity_lbl 80102  `"Waiting associated with purchasing childcare services"', add
label define activity_lbl 80199  `"Using paid childcare services, n.e.c."', add
label define activity_lbl 80201  `"Banking"', add
label define activity_lbl 80202  `"Using other financial services"', add
label define activity_lbl 80203  `"Waiting associated with banking or financial services"', add
label define activity_lbl 80299  `"Using financial services and banking, n.e.c."', add
label define activity_lbl 80301  `"Using legal services"', add
label define activity_lbl 80302  `"Waiting associated with legal services"', add
label define activity_lbl 80399  `"Using legal services, n.e.c."', add
label define activity_lbl 80401  `"Using health and care services outside the home"', add
label define activity_lbl 80402  `"Using in-home health and care services"', add
label define activity_lbl 80403  `"Waiting associated with medical services"', add
label define activity_lbl 80499  `"Using medical services, n.e.c."', add
label define activity_lbl 80501  `"Using personal care services"', add
label define activity_lbl 80502  `"Waiting associated with personal care services"', add
label define activity_lbl 80599  `"Using personal care services, n.e.c."', add
label define activity_lbl 80601  `"Activities related to purchasing or selling real estate"', add
label define activity_lbl 80602  `"Waiting associated with purchasing or selling real estate"', add
label define activity_lbl 80699  `"Using real estate services, n.e.c."', add
label define activity_lbl 80701  `"Using veterinary services"', add
label define activity_lbl 80702  `"Waiting associated with veterinary services"', add
label define activity_lbl 80799  `"Using veterinary services, n.e.c."', add
label define activity_lbl 80801  `"Security procedures related to professional or personal services"', add
label define activity_lbl 80899  `"Security procedures related to professional or personal services, n.e.c."', add
label define activity_lbl 89999  `"Professional and personal services, n.e.c."', add
label define activity_lbl 90101  `"Using interior cleaning services"', add
label define activity_lbl 90102  `"Using meal preparation services"', add
label define activity_lbl 90103  `"Using clothing repair and cleaning services"', add
label define activity_lbl 90104  `"Waiting associated with using household services"', add
label define activity_lbl 90199  `"Using household services, n.e.c."', add
label define activity_lbl 90201  `"Using home maintenance, repair, decoration, or construction services"', add
label define activity_lbl 90202  `"Waiting associated with home maintenance, repair, decoration, or construction"', add
label define activity_lbl 90299  `"Using home maintenance, repair, decoration, or construction services, n.e.c."', add
label define activity_lbl 90301  `"Using pet services"', add
label define activity_lbl 90302  `"Waiting associated with pet services"', add
label define activity_lbl 90399  `"Using pet services, n.e.c."', add
label define activity_lbl 90401  `"Using lawn and garden services"', add
label define activity_lbl 90402  `"Waiting associated with using lawn and garden services"', add
label define activity_lbl 90499  `"Using lawn and garden services, n.e.c."', add
label define activity_lbl 90501  `"Using vehicle maintenance or repair services"', add
label define activity_lbl 90502  `"Waiting associated with vehicle maintenance or repair services"', add
label define activity_lbl 90599  `"Using vehicle maintenance and repair services, n.e.c."', add
label define activity_lbl 99999  `"Using household services, n.e.c."', add
label define activity_lbl 100101 `"Using police and fire services"', add
label define activity_lbl 100102 `"Using social services"', add
label define activity_lbl 100103 `"Obtaining licenses and paying fines, fees, or taxes"', add
label define activity_lbl 100199 `"Using government services, n.e.c."', add
label define activity_lbl 100201 `"Civic obligations and participation"', add
label define activity_lbl 100299 `"Civic obligations and participation, n.e.c."', add
label define activity_lbl 100303 `"Waiting associated with civic obligations and participation"', add
label define activity_lbl 100304 `"Waiting associated with using government services"', add
label define activity_lbl 100399 `"Waiting associated with government services or civic obligations, n.e.c."', add
label define activity_lbl 100401 `"Security procedures related to government services or civic obligations"', add
label define activity_lbl 100499 `"Security procedures related to government services or civic obligations, n.e.c."', add
label define activity_lbl 109999 `"Government services, n.e.c."', add
label define activity_lbl 110101 `"Eating and drinking"', add
label define activity_lbl 110199 `"Eating and drinking, n.e.c."', add
label define activity_lbl 110201 `"Waiting associated with eating and drinking"', add
label define activity_lbl 110299 `"Waiting associated with eating and drinking, n.e.c."', add
label define activity_lbl 119999 `"Eating and drinking, n.e.c."', add
label define activity_lbl 120101 `"Socializing and communicating with others"', add
label define activity_lbl 120199 `"Socializing and communicating, n.e.c."', add
label define activity_lbl 120201 `"Attending or hosting parties, receptions, or ceremonies"', add
label define activity_lbl 120202 `"Attending meetings for personal interest (not volunteering)"', add
label define activity_lbl 120299 `"Attending or hosting social events, n.e.c."', add
label define activity_lbl 120301 `"Relaxing, thinking"', add
label define activity_lbl 120302 `"Tobacco and drug use"', add
label define activity_lbl 120303 `"Television and movies (not religious)"', add
label define activity_lbl 120304 `"Television (religious)"', add
label define activity_lbl 120305 `"Listening to the radio"', add
label define activity_lbl 120306 `"Listening to or playing music (not radio)"', add
label define activity_lbl 120307 `"Playing games"', add
label define activity_lbl 120308 `"Computer use for leisure (excluding games)"', add
label define activity_lbl 120309 `"Arts and crafts as a hobby"', add
label define activity_lbl 120310 `"Collecting as a hobby"', add
label define activity_lbl 120311 `"Hobbies, except arts and crafts and collecting"', add
label define activity_lbl 120312 `"Reading for personal interest"', add
label define activity_lbl 120313 `"Writing for personal interest"', add
label define activity_lbl 120399 `"Relaxing and leisure, n.e.c."', add
label define activity_lbl 120401 `"Attending performing arts"', add
label define activity_lbl 120402 `"Attending museums"', add
label define activity_lbl 120403 `"Attending movies or film"', add
label define activity_lbl 120404 `"Attending gambling establishments"', add
label define activity_lbl 120405 `"Security procedures related to arts and entertainment"', add
label define activity_lbl 120499 `"Arts and entertainment, n.e.c."', add
label define activity_lbl 120501 `"Waiting associated with socializing and communicating"', add
label define activity_lbl 120502 `"Waiting associated with attending or hosting social events"', add
label define activity_lbl 120503 `"Waiting associated with relaxing or leisure"', add
label define activity_lbl 120504 `"Waiting associated with arts and entertainment"', add
label define activity_lbl 120599 `"Waiting associated with socializing, n.e.c."', add
label define activity_lbl 129999 `"Socializing, relaxing, and leisure, n.e.c."', add
label define activity_lbl 130101 `"Doing aerobics"', add
label define activity_lbl 130102 `"Playing baseball"', add
label define activity_lbl 130103 `"Playing basketball"', add
label define activity_lbl 130104 `"Biking"', add
label define activity_lbl 130105 `"Playing billiards"', add
label define activity_lbl 130106 `"Boating"', add
label define activity_lbl 130107 `"Bowling"', add
label define activity_lbl 130108 `"Climbing, spelunking, caving"', add
label define activity_lbl 130109 `"Dancing"', add
label define activity_lbl 130110 `"Participating in equestrian sports"', add
label define activity_lbl 130111 `"Fencing"', add
label define activity_lbl 130112 `"Fishing"', add
label define activity_lbl 130113 `"Playing football"', add
label define activity_lbl 130114 `"Golfing"', add
label define activity_lbl 130115 `"Doing gymnastics"', add
label define activity_lbl 130116 `"Hiking"', add
label define activity_lbl 130117 `"Playing hockey"', add
label define activity_lbl 130118 `"Hunting"', add
label define activity_lbl 130119 `"Participating in martial arts"', add
label define activity_lbl 130120 `"Playing racquet sports"', add
label define activity_lbl 130121 `"Participating in rodeo competitions"', add
label define activity_lbl 130122 `"Rollerblading"', add
label define activity_lbl 130123 `"Playing rugby"', add
label define activity_lbl 130124 `"Running"', add
label define activity_lbl 130125 `"Skiing, ice skating, snowboarding"', add
label define activity_lbl 130126 `"Playing soccer"', add
label define activity_lbl 130127 `"Playing softball"', add
label define activity_lbl 130128 `"Using cardiovascular equipment"', add
label define activity_lbl 130129 `"Vehicle touring or racing"', add
label define activity_lbl 130130 `"Playing volleyball"', add
label define activity_lbl 130131 `"Walking"', add
label define activity_lbl 130132 `"Participating in water sports"', add
label define activity_lbl 130133 `"Weightlifting or strength training"', add
label define activity_lbl 130134 `"Working out, unspecified"', add
label define activity_lbl 130135 `"Wrestling"', add
label define activity_lbl 130136 `"Doing yoga"', add
label define activity_lbl 130199 `"Playing sports, n.e.c."', add
label define activity_lbl 130201 `"Watching aerobics"', add
label define activity_lbl 130202 `"Watching baseball"', add
label define activity_lbl 130203 `"Watching basketball"', add
label define activity_lbl 130204 `"Watching biking"', add
label define activity_lbl 130205 `"Watching billiards"', add
label define activity_lbl 130206 `"Watching boating"', add
label define activity_lbl 130207 `"Watching bowling"', add
label define activity_lbl 130208 `"Watching climbing, spelunking, caving"', add
label define activity_lbl 130209 `"Watching dancing"', add
label define activity_lbl 130210 `"Watching equestrian sports"', add
label define activity_lbl 130211 `"Watching fencing"', add
label define activity_lbl 130212 `"Watching fishing"', add
label define activity_lbl 130213 `"Watching football"', add
label define activity_lbl 130214 `"Watching golfing"', add
label define activity_lbl 130215 `"Watching gymnastics"', add
label define activity_lbl 130216 `"Watching hockey"', add
label define activity_lbl 130217 `"Watching martial arts"', add
label define activity_lbl 130218 `"Watching racquet sports"', add
label define activity_lbl 130219 `"Watching rodeo competitions"', add
label define activity_lbl 130220 `"Watching rollerblading"', add
label define activity_lbl 130221 `"Watching rugby"', add
label define activity_lbl 130222 `"Watching running"', add
label define activity_lbl 130223 `"Watching skiing, ice skating, snowboarding"', add
label define activity_lbl 130224 `"Watching soccer"', add
label define activity_lbl 130225 `"Watching softball"', add
label define activity_lbl 130226 `"Watching vehicle touring or racing"', add
label define activity_lbl 130227 `"Watching volleyball"', add
label define activity_lbl 130228 `"Watching walking"', add
label define activity_lbl 130229 `"Watching water sports"', add
label define activity_lbl 130230 `"Watching weightlifting or strength training"', add
label define activity_lbl 130231 `"Watching people working out, unspecified"', add
label define activity_lbl 130232 `"Watching wrestling"', add
label define activity_lbl 130299 `"Attending sporting events, n.e.c."', add
label define activity_lbl 130301 `"Waiting related to playing sports or exercising"', add
label define activity_lbl 130302 `"Waiting related to attending sporting events"', add
label define activity_lbl 130399 `"Waiting associated with sports, exercise, and recreation, n.e.c."', add
label define activity_lbl 130401 `"Security related to playing sports or exercising"', add
label define activity_lbl 130402 `"Security related to attending sporting events"', add
label define activity_lbl 130499 `"Security related to sports, exercise, and recreation, n.e.c."', add
label define activity_lbl 139999 `"Sports, exercise, and recreation, n.e.c."', add
label define activity_lbl 140101 `"Attending religious services"', add
label define activity_lbl 140102 `"Participation in religious practices"', add
label define activity_lbl 140103 `"Waiting associated with religious and spiritual activities"', add
label define activity_lbl 140104 `"Security procedures related to religious and spiritual activities"', add
label define activity_lbl 140105 `"Religious education activities (2007+)"', add
label define activity_lbl 149999 `"Religious and spiritual activities, n.e.c."', add
label define activity_lbl 150101 `"Computer use"', add
label define activity_lbl 150102 `"Organizing and preparing"', add
label define activity_lbl 150103 `"Reading"', add
label define activity_lbl 150104 `"Telephone calls (except hotline counseling)"', add
label define activity_lbl 150105 `"Writing"', add
label define activity_lbl 150106 `"Fundraising"', add
label define activity_lbl 150199 `"Administrative and support activities, n.e.c."', add
label define activity_lbl 150201 `"Food preparation, presentation, clean-up"', add
label define activity_lbl 150202 `"Collecting and delivering clothing and other goods"', add
label define activity_lbl 150203 `"Providing care"', add
label define activity_lbl 150204 `"Teaching, leading, counseling, mentoring"', add
label define activity_lbl 150299 `"Social service and care activities, n.e.c."', add
label define activity_lbl 150301 `"Building houses, wildlife sites, and other structures"', add
label define activity_lbl 150302 `"Indoor and outdoor maintenance, repair, and clean-up"', add
label define activity_lbl 150399 `"Indoor and outdoor maintenance, building, and clean-up activities, n.e.c."', add
label define activity_lbl 150401 `"Performing"', add
label define activity_lbl 150402 `"Serving at volunteer events and cultural activities"', add
label define activity_lbl 150499 `"Participating in performance and cultural activities, n.e.c."', add
label define activity_lbl 150501 `"Attending meetings, conferences, and training"', add
label define activity_lbl 150599 `"Attending meetings, conferences, and training, n.e.c."', add
label define activity_lbl 150601 `"Public health activities"', add
label define activity_lbl 150602 `"Public safety activities"', add
label define activity_lbl 150699 `"Public health and safety activities, n.e.c."', add
label define activity_lbl 150701 `"Waiting associated with volunteer activities (2004+)"', add
label define activity_lbl 150799 `"Waiting associated with volunteer activities, n.e.c. (2004+)"', add
label define activity_lbl 150801 `"Security procedures related to volunteer activities (2007+)"', add
label define activity_lbl 150899 `"Security proecdures related to voluteer activities, n.e.c. (2007+)"', add
label define activity_lbl 159999 `"Volunteer activities, n.e.c."', add
label define activity_lbl 160101 `"Telephone calls to or from family members"', add
label define activity_lbl 160102 `"Telephone calls to or from friends, neighbors, or acquaintances"', add
label define activity_lbl 160103 `"Telephone calls to or from education services providers"', add
label define activity_lbl 160104 `"Telephone calls to or from salespeople"', add
label define activity_lbl 160105 `"Telephone calls to or from professional or personal care services providers"', add
label define activity_lbl 160106 `"Telephone calls to or from household services providers"', add
label define activity_lbl 160107 `"Telephone calls to or from paid child or adult care providers"', add
label define activity_lbl 160108 `"Telephone calls to or from government officials"', add
label define activity_lbl 160199 `"Telephone calls (to or from), n.e.c. (2004+)"', add
label define activity_lbl 160201 `"Waiting associated with telephone calls (2004+)"', add
label define activity_lbl 160299 `"Waiting associated with telephone calls, n.e.c. (2004+)"', add
label define activity_lbl 169999 `"Telephone calls, n.e.c."', add
label define activity_lbl 180101 `"Travel related to personal care"', add
label define activity_lbl 180199 `"Travel related to personal care, n.e.c."', add
label define activity_lbl 180201 `"Travel related to housework"', add
label define activity_lbl 180202 `"Travel related to food and drink preparation, clean-up, and presentation (2004+)"', add
label define activity_lbl 180203 `"Travel related to interior maintenance, repair, and decoration (2004+)"', add
label define activity_lbl 180204 `"Travel related to exterior maintenance, repair, and decoration (2004+)"', add
label define activity_lbl 180205 `"Travel related to lawn, garden, and houseplant care (2004+)"', add
label define activity_lbl 180206 `"Travel related to care for animals and pets (not veterinary care) (2004+)"', add
label define activity_lbl 180207 `"Travel related to vehicle care and maintenance (by self) (2004+)"', add
label define activity_lbl 180208 `"Travel related to appliance, tool, and toy set-up, repair, and maintenance (by self) (2004+)"', add
label define activity_lbl 180209 `"Travel related to household management"', add
label define activity_lbl 180299 `"Travel related to household activities, n.e.c."', add
label define activity_lbl 180301 `"Travel related to caring for and helping household children, inclusive (2003, 2004)"', add
label define activity_lbl 180302 `"Travel related to caring for and helping household children (2005+)"', add
label define activity_lbl 180303 `"Travel related to household children's education (2005+)"', add
label define activity_lbl 180304 `"Travel related to household children's health (2005+)"', add
label define activity_lbl 180305 `"Travel related to caring for household adults (2005+)"', add
label define activity_lbl 180306 `"Travel related to helping household adults (2005+)"', add
label define activity_lbl 180307 `"Travel related to caring for and helping household adults (2003, 2004)"', add
label define activity_lbl 180399 `"Travel related to caring for and helping household members, n.e.c."', add
label define activity_lbl 180401 `"Travel related to caring for and helping non-household children, inclusive (2003, 2004)"', add
label define activity_lbl 180402 `"Travel related to caring for and helping non-household children (2005+)"', add
label define activity_lbl 180403 `"Travel related to non-household children's education (2005+)"', add
label define activity_lbl 180404 `"Travel related to non-household children's health (2005+)"', add
label define activity_lbl 180405 `"Travel related to caring for non-household adults (2005+)"', add
label define activity_lbl 180406 `"Travel related to helping non-household adults (2005+)"', add
label define activity_lbl 180407 `"Travel related to caring for and helping non-household adults (2003, 2004)"', add
label define activity_lbl 180499 `"Travel related to caring for and helping non-household members, n.e.c."', add
label define activity_lbl 180501 `"Travel related to working"', add
label define activity_lbl 180502 `"Travel related to work-related activities"', add
label define activity_lbl 180503 `"Travel related to income-generating activities (2004+)"', add
label define activity_lbl 180504 `"Travel related to job search and interviewing (2004+)"', add
label define activity_lbl 180599 `"Travel related to work, n.e.c."', add
label define activity_lbl 180601 `"Travel related to taking class"', add
label define activity_lbl 180602 `"Travel related to extracurricular activities (ex. sports) (2005+)"', add
label define activity_lbl 180603 `"Travel related to research or homework (2005+)"', add
label define activity_lbl 180604 `"Travel related to registration or administrative activities (2005+)"', add
label define activity_lbl 180605 `"Education-related travel, not commuting (2003, 2004)"', add
label define activity_lbl 180699 `"Travel related to education, n.e.c."', add
label define activity_lbl 180701 `"Travel related to grocery shopping"', add
label define activity_lbl 180702 `"Travel related to other shopping, inclusive (2003, 2004)"', add
label define activity_lbl 180703 `"Travel related to purchasing food (not groceries) (2005+)"', add
label define activity_lbl 180704 `"Travel related to shopping, ex groceries, food, and gas (2005+)"', add
label define activity_lbl 180705 `"Travel related to purchasing gas (2004+)"', add
label define activity_lbl 180799 `"Travel related to consumer purchases, n.e.c."', add
label define activity_lbl 180801 `"Travel related to using childcare services"', add
label define activity_lbl 180802 `"Travel related to using financial services and banking"', add
label define activity_lbl 180803 `"Travel related to using legal services"', add
label define activity_lbl 180804 `"Travel related to using medical services"', add
label define activity_lbl 180805 `"Travel related to using personal care services"', add
label define activity_lbl 180806 `"Travel related to using real estate services"', add
label define activity_lbl 180807 `"Travel related to using veterinary services"', add
label define activity_lbl 180899 `"Travel related to using professional and personal care services, n.e.c."', add
label define activity_lbl 180901 `"Travel related to using household services"', add
label define activity_lbl 180902 `"Travel related to using home maintenance, repair, decoration, or construction services"', add
label define activity_lbl 180903 `"Travel related to using pet services (not veterinary care)"', add
label define activity_lbl 180904 `"Travel related to using lawn and garden services"', add
label define activity_lbl 180905 `"Travel related to using vehicle maintenance and repair services"', add
label define activity_lbl 180999 `"Travel related to using household services, n.e.c."', add
label define activity_lbl 181001 `"Travel related to using government services"', add
label define activity_lbl 181002 `"Travel related to civic obligations and participation"', add
label define activity_lbl 181099 `"Travel related to government services and civic obligations, n.e.c."', add
label define activity_lbl 181101 `"Travel related to eating and drinking"', add
label define activity_lbl 181199 `"Travel related to eating and drinking, n.e.c."', add
label define activity_lbl 181201 `"Travel related to socializing and communicating"', add
label define activity_lbl 181202 `"Travel related to attending or hosting social events"', add
label define activity_lbl 181203 `"Travel related to relaxing and leisure (2003, 2004)"', add
label define activity_lbl 181204 `"Travel related to arts and entertainment"', add
label define activity_lbl 181205 `"Travel as a form of entertainment (2005+)"', add
label define activity_lbl 181206 `"Travel related to relaxing and leisure (2005+)"', add
label define activity_lbl 181299 `"Travel related to socializing, relaxing, and leisure, n.e.c."', add
label define activity_lbl 181301 `"Travel related to participating in sports, exercise, or recreation"', add
label define activity_lbl 181302 `"Travel related to attending sporting or recreational events"', add
label define activity_lbl 181399 `"Travel related to sports, exercise, and recreation, n.e.c."', add
label define activity_lbl 181401 `"Travel related to religious or spiritual practices"', add
label define activity_lbl 181499 `"Travel related to religious or spiritual activities, n.e.c."', add
label define activity_lbl 181501 `"Travel related to volunteering"', add
label define activity_lbl 181599 `"Travel related to volunteer activities, n.e.c."', add
label define activity_lbl 181601 `"Travel related to phone calls"', add
label define activity_lbl 181699 `"Travel related to phone calls, n.e.c."', add
label define activity_lbl 181801 `"Security procedures related to traveling"', add
label define activity_lbl 181899 `"Security procedures related to traveling, n.e.c."', add
label define activity_lbl 189999 `"Traveling, n.e.c."', add
label define activity_lbl 500101 `"Insufficient detail in verbatim"', add
label define activity_lbl 500102 `"Recorded activity using incorrect words (ex. going, went, in, at) (2003 only)"', add
label define activity_lbl 500103 `"Missing travel or destination"', add
label define activity_lbl 500104 `"Recorded simultaneous activities incorrectly"', add
label define activity_lbl 500105 `"Respondent refused to provide information or responded 'none of your business'"', add
label define activity_lbl 500106 `"Gap or can't remember"', add
label define activity_lbl 500107 `"Unable to code activity at 1st tier"', add
label define activity_lbl 509999 `"Data codes, n.e.c."', add
label values activity activity_lbl

label define where_lbl 101  `"Respondent's home or yard"'
label define where_lbl 102  `"Respondent's workplace"', add
label define where_lbl 103  `"Someone else's home"', add
label define where_lbl 104  `"Restaurant or bar"', add
label define where_lbl 105  `"Place of worship"', add
label define where_lbl 106  `"Grocery store"', add
label define where_lbl 107  `"Other store, mall"', add
label define where_lbl 108  `"School"', add
label define where_lbl 109  `"Outdoors away from home"', add
label define where_lbl 110  `"Library"', add
label define where_lbl 111  `"Bank (2004+)"', add
label define where_lbl 112  `"Gym/health club (2004+)"', add
label define where_lbl 113  `"Post Office (2004+)"', add
label define where_lbl 114  `"Other place"', add
label define where_lbl 115  `"Unspecified place"', add
label define where_lbl 230  `"Car, truck or motorcycle (driver)"', add
label define where_lbl 231  `"Car, truck or motorcycle (passenger)"', add
label define where_lbl 232  `"Walking"', add
label define where_lbl 233  `"Bus"', add
label define where_lbl 234  `"Subway, train"', add
label define where_lbl 235  `"Bicycle"', add
label define where_lbl 236  `"Boat, ferry"', add
label define where_lbl 237  `"Taxi, limousine service"', add
label define where_lbl 238  `"Airplane"', add
label define where_lbl 239  `"Other mode of transportation"', add
label define where_lbl 240  `"Unspecified mode of transportation"', add
label define where_lbl 9997 `"Don't know"', add
label define where_lbl 9998 `"Refused"', add
label define where_lbl 9999 `"NIU (Not in universe)"', add
label values where where_lbl

label define scc_hhnhhown_ln_lbl 0 `"0"'
label values scc_hhnhhown_ln scc_hhnhhown_ln_lbl

label define scc_nownnhh_ln_lbl 0 `"0"'
label values scc_nownnhh_ln scc_nownnhh_ln_lbl

label define sex_cps8_lbl 1  `"Male"'
label define sex_cps8_lbl 2  `"Female"', add
label define sex_cps8_lbl 99 `"NIU (Not in universe)"', add
label values sex_cps8 sex_cps8_lbl

label define month_lbl 1   `"January"'
label define month_lbl 2   `"February"', add
label define month_lbl 3   `"March"', add
label define month_lbl 4   `"April"', add
label define month_lbl 5   `"May"', add
label define month_lbl 6   `"June"', add
label define month_lbl 7   `"July"', add
label define month_lbl 8   `"August"', add
label define month_lbl 9   `"September"', add
label define month_lbl 10  `"October"', add
label define month_lbl 11  `"November"', add
label define month_lbl 12  `"December"', add
label define month_lbl 999 `"NIU (Not in universe)"', add
label values month month_lbl

label define date_lbl 999999999 `"NIU (Not in universe)"'
label values date date_lbl

save ../data/output/atus_prelim, replace
