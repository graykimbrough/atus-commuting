/* Lightly edited version of labels and formatting assignments from
	.do file provided by IPUMS at ATUS-X */

use ../data/output/atus_prelim, clear

replace earnweek        = earnweek        / 100
replace hourwage        = hourwage        / 100
replace otpay           = otpay           / 100
replace spearnweek      = spearnweek      / 100

format caseid          %14.0f
format hrhhid_cps8     %15.0f
format date            %9.0f
format wt06            %17.0f
format earnweek        %7.2f
format hourwage        %5.2f
format otpay           %7.2f
format spearnweek      %7.2f

label var rectype         `"Record Type"'
label var caseid          `"ATUS Case ID"'
label var year            `"Survey year"'
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
label var famincome       `"Family income"'
label var hh_size         `"Number of people in household"'
label var poverty130      `"Household income greater or less than 130% of poverty level"'
label var poverty185      `"Household income greater or less than 185% of poverty level"'
label var povertylevel    `"Income values used in POVERTY185 and POVERTY130"'
label var foodstamp       `"Household received food stamps in past 30 days"'
label var hhtenure        `"Living quarters owned, rented, or occupied without rent"'
label var hh_child        `"Children under 18 in household"'
label var housetype       `"Type of housing unit"'
label var hh_numkids      `"Number of children under 18 in household"'
label var fambus          `"Business or farm owned by household member"'
label var ageychild       `"Age of youngest household child"'
label var fambus_resp     `"Business or farm owned by respondent"'
label var hh_numadults    `"Number of adults in household"'
label var fambus_spouse   `"Business or farm owned by respondent's spouse or unmarried partner"'
label var fambus_other    `"Business or farm owned by other hh member"'
label var pernum          `"Person number (general)"'
label var lineno          `"Person line number"'
label var lineno_cps8     `"Person line number (CPS)"'
label var presence        `"Presence in household"'
label var month           `"Month of ATUS interview"'
label var day             `"ATUS interview day of the week"'
label var holiday         `"Day of ATUS interview was a holiday"'
label var date            `"Date of ATUS interview"'
label var wt06            `"Person weight, 2006 methodology"'
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
label var relate          `"Relationship to ATUS respondent"'
label var sex_cps8        `"Sex (CPS)"'
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
label var fullpart        `"Full time/part time employment status"'
label var uhrswork1       `"Hours usually worked per week at main job"'
label var earnweek        `"Weekly earnings"'
label var paidhour        `"Hourly or non-hourly pay"'
label var earnrpt         `"Easiest way to report earnings"'
label var hourwage        `"Hourly earnings"'
label var hrsatrate       `"Hours worked at hourly rate"'
label var otusual         `"Usually receives overtime, tips, commission at main job"'
label var otpay           `"Weekly overtime earnings"'
label var spousepres      `"Spouse or unmarried partner in household"'
label var spage           `"Age (spouse or partner)"'
label var sprace          `"Race (spouse or partner)"'
label var sphispan        `"Hispanic origin (spouse or partner)"'
label var speduc          `"Highest level of school completed (spouse or partner)"'
label var spempnot        `"Employed (spouse or partner)"'
label var spempstat       `"Employment status (spouse or partner)"'
label var spusualhrs      `"Usual work hours (spouse or partner)"'
label var spearnweek      `"Weekly earnings (spouse or partner)"'
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
label var scc_hhnhhown_ln `"Time spent during activity on secondary child care of household and own, non-hou"'
label var scc_nownnhh_ln  `"Time spent during activity on secondary child care of non-own, non-household chi"'
label var sed_all_ln      `"Time spent during activity on secondary eating and drinking"'
label var start           `"Activity start time"'
label var stop            `"Activity stop time"'
label var hhtime          `"Total HH time"'
label var totalhhtime     `"Total (not specific) HH time"'

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
label define year_cps8_lbl 2013 `"2013"', add
label define year_cps8_lbl 2014 `"2014"', add
label define year_cps8_lbl 2015 `"2015"', add
label values year_cps8 year_cps8_lbl

label define month_cps8_lbl 01 `"January"'
label define month_cps8_lbl 02 `"February"', add
label define month_cps8_lbl 03 `"March"', add
label define month_cps8_lbl 04 `"April"', add
label define month_cps8_lbl 05 `"May"', add
label define month_cps8_lbl 06 `"June"', add
label define month_cps8_lbl 07 `"July"', add
label define month_cps8_lbl 08 `"August"', add
label define month_cps8_lbl 09 `"September"', add
label define month_cps8_lbl 10 `"October"', add
label define month_cps8_lbl 11 `"November"', add
label define month_cps8_lbl 12 `"December"', add
label values month_cps8 month_cps8_lbl

label define region_lbl 1 `"Northeast"'
label define region_lbl 2 `"Midwest"', add
label define region_lbl 3 `"South"', add
label define region_lbl 4 `"West"', add
label values region region_lbl

label define statefip_lbl 01 `"Alabama"'
label define statefip_lbl 02 `"Alaska"', add
label define statefip_lbl 04 `"Arizona"', add
label define statefip_lbl 05 `"Arkansas"', add
label define statefip_lbl 06 `"California"', add
label define statefip_lbl 08 `"Colorado"', add
label define statefip_lbl 09 `"Connecticut"', add
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

label define metro_lbl 01 `"Metropolitan, central city"'
label define metro_lbl 02 `"Metropolitan, balance of MSA"', add
label define metro_lbl 03 `"Metropolitan, not identified"', add
label define metro_lbl 04 `"Nonmetropolitan"', add
label define metro_lbl 05 `"Not identified"', add
label values metro metro_lbl

label define msasize_lbl 0 `"Not identified or non-metropolitan"'
label define msasize_lbl 2 `"100,000 - 249,999"', add
label define msasize_lbl 3 `"250,000 - 499,999"', add
label define msasize_lbl 4 `"500,000 - 999,999"', add
label define msasize_lbl 5 `"1,000,000 - 2,499,999"', add
label define msasize_lbl 6 `"2,500,000 - 4,999,999"', add
label define msasize_lbl 7 `"5,000,000+"', add
label values msasize msasize_lbl

label define metarea_lbl 00000 `"Not Identified or NonMetropolitan"'
label define metarea_lbl 00460 `"Appleton-Oshkosh-Neenah, WI"', add
label define metarea_lbl 01120 `"Boston, MA"', add
label define metarea_lbl 01121 `"Boston-Worchester-Manchester, MS-NH-CT-ME"', add
label define metarea_lbl 01160 `"Bridgeport-New Haven-Stamford, CT"', add
label define metarea_lbl 01600 `"Chicago-Gary-Kenosha, IL-IN-WI"', add
label define metarea_lbl 01601 `"Chicago-Naperville-Michigan City, IL-IN-WI"', add
label define metarea_lbl 01640 `"Cincinnati-Hamilton, OH-KY-IN"', add
label define metarea_lbl 01641 `"Cincinnati-Middletown-Wilmington, OH-KY-IN"', add
label define metarea_lbl 01680 `"Cleveland-Akron, OH"', add
label define metarea_lbl 01681 `"Cleveland-Akron-Elyria, OH"', add
label define metarea_lbl 01920 `"Dallas-Fort Worth, TX"', add
label define metarea_lbl 01921 `"Dallas-Fort Worth, TX"', add
label define metarea_lbl 02000 `"Dayton-Springfield-Greenville, OH"', add
label define metarea_lbl 02080 `"Denver-Boulder-Greeley, CO"', add
label define metarea_lbl 02081 `"Denver-Aurora-Boulder, CO"', add
label define metarea_lbl 02160 `"Detroit-Ann Arbor-Flint, MI"', add
label define metarea_lbl 02161 `"Detroit-Warren-Flint, MI"', add
label define metarea_lbl 02840 `"Fresno-Madera, CA"', add
label define metarea_lbl 03000 `"Grand Rapids-Muskegon-Holland, MI (part)"', add
label define metarea_lbl 03120 `"Greensboro-Winston-Salem-High Point, NC (part)"', add
label define metarea_lbl 03160 `"Greenville-Anderson-Seneca, SC (part)"', add
label define metarea_lbl 03360 `"Houston-Galveston-Brazoria, TX"', add
label define metarea_lbl 03361 `"Houston-Baytown-Huntsville, TX (part)"', add
label define metarea_lbl 03440 `"Huntsville-Decatur, AL"', add
label define metarea_lbl 03480 `"Indianapolis-Anderson-Columbus, IN (part)"', add
label define metarea_lbl 03660 `"Johnson City-Kingsport-Bristol, TN-VA (part)"', add
label define metarea_lbl 04480 `"Los Angeles-Riverside-Orange County, CA"', add
label define metarea_lbl 04481 `"Los Angeles-Long Beach-Riverside, CA"', add
label define metarea_lbl 04680 `"Macon-Warner-Robins-Fort Valley, GA (part)"', add
label define metarea_lbl 05000 `"Miami-Fort Lauderdale, FL"', add
label define metarea_lbl 05080 `"Milwaukee-Racine, WI"', add
label define metarea_lbl 05081 `"Milwaukee-Racine-Waukesha, WI"', add
label define metarea_lbl 05120 `"Minneapolis-St. Paul-St. Cloud, MN-WI (part)"', add
label define metarea_lbl 05600 `"New York-Northern New Jersey-Long Island, NY-NJ-CT-PA"', add
label define metarea_lbl 05601 `"New York-Newark-Bridgeport, NY-NH-CT-PA"', add
label define metarea_lbl 06160 `"Philadelphia-Wilmington-Atlantic City, PA-NJ-DE-MD"', add
label define metarea_lbl 06161 `"Philadelphia-Camden-Vineland, PA-NJ-DE-MD"', add
label define metarea_lbl 06400 `"Portland-Salem, OR-WA"', add
label define metarea_lbl 06640 `"Raleigh-Durham-Cary, NC (part)"', add
label define metarea_lbl 06920 `"Sacramento-Yolo, CA"', add
label define metarea_lbl 06921 `"Sacramento-Arden-Arcade-Truckee, CA-NV"', add
label define metarea_lbl 07160 `"Salt Lake City-Ogden-Clearfield, UT (part)"', add
label define metarea_lbl 07360 `"San Francisco-Oakland-San Jose, CA"', add
label define metarea_lbl 07600 `"Seattle-Tacoma-Bremerton, WA"', add
label define metarea_lbl 07601 `"Seattle-Tacoma-Olympia, WA"', add
label define metarea_lbl 08840 `"Washington-Baltimore, DC-MD-VA-WV"', add
label define metarea_lbl 08841 `"Washington-Baltimore-Northern Virginia, DC-MD-VA-WV"', add
label define metarea_lbl 99998 `"Blank"', add
label define metarea_lbl 99999 `"NIU (Not in universe)"', add
label values metarea metarea_lbl

label define famincome_lbl 001 `"Less than $5,000"'
label define famincome_lbl 002 `"$5,000 to $7,499"', add
label define famincome_lbl 003 `"$7,500 to $9,999"', add
label define famincome_lbl 004 `"$10,000 to $12,499"', add
label define famincome_lbl 005 `"$12,500 to $14,999"', add
label define famincome_lbl 006 `"$15,000 to $19,999"', add
label define famincome_lbl 007 `"$20,000 to $24,999"', add
label define famincome_lbl 008 `"$25,000 to $29,999"', add
label define famincome_lbl 009 `"$30,000 to $34,999"', add
label define famincome_lbl 010 `"$35,000 to $39,999"', add
label define famincome_lbl 011 `"$40,000 to $49,999"', add
label define famincome_lbl 012 `"$50,000 to $59,999"', add
label define famincome_lbl 013 `"$60,000 to $74,999"', add
label define famincome_lbl 014 `"$75,000 to $99,999"', add
label define famincome_lbl 015 `"$100,000 to $149,999"', add
label define famincome_lbl 016 `"$150,000 and over"', add
label define famincome_lbl 996 `"Refused"', add
label define famincome_lbl 997 `"Don't know"', add
label define famincome_lbl 998 `"Blank"', add
label values famincome famincome_lbl

label define hh_size_lbl 001 `"1"'
label define hh_size_lbl 002 `"2"', add
label define hh_size_lbl 003 `"3"', add
label define hh_size_lbl 004 `"4"', add
label define hh_size_lbl 005 `"5"', add
label define hh_size_lbl 006 `"6"', add
label define hh_size_lbl 007 `"7"', add
label define hh_size_lbl 008 `"8"', add
label define hh_size_lbl 009 `"9"', add
label define hh_size_lbl 010 `"10"', add
label define hh_size_lbl 011 `"11"', add
label define hh_size_lbl 012 `"12"', add
label define hh_size_lbl 013 `"13"', add
label define hh_size_lbl 014 `"14"', add
label define hh_size_lbl 015 `"15"', add
label define hh_size_lbl 016 `"16"', add
label define hh_size_lbl 999 `"NIU (Not in universe)"', add
label values hh_size hh_size_lbl

label define poverty130_lbl 10 `"HH income lt or equal to 130% of poverty threshold"'
label define poverty130_lbl 11 `"HH income lt 130% of poverty threshold"', add
label define poverty130_lbl 12 `"HH income equal to 130% of poverty threshold"', add
label define poverty130_lbl 20 `"HH income gt 130% of poverty threshold"', add
label define poverty130_lbl 96 `"Refused"', add
label define poverty130_lbl 97 `"Don't know"', add
label define poverty130_lbl 99 `"NIU (Not in universe)"', add
label values poverty130 poverty130_lbl

label define poverty185_lbl 10 `"HH income lt or equal to 185% of poverty threshold"'
label define poverty185_lbl 11 `"HH income lt 185% of poverty threshold"', add
label define poverty185_lbl 12 `"HH income equal to 185% of poverty threshold"', add
label define poverty185_lbl 20 `"HH income gt 185% of poverty threshold"', add
label define poverty185_lbl 96 `"Refused"', add
label define poverty185_lbl 97 `"Don't know"', add
label define poverty185_lbl 99 `"NIU (Not in universe)"', add
label values poverty185 poverty185_lbl

label define povertylevel_lbl 01 `"Fiscal year 2006 poverty thresholds"'
label define povertylevel_lbl 02 `"Fiscal year 2007 poverty thresholds"', add
label define povertylevel_lbl 03 `"Fiscal year 2008 poverty thresholds"', add
label define povertylevel_lbl 04 `"Fiscal year 2009 poverty thresholds"', add
label define povertylevel_lbl 05 `"Fiscal year 2014 poverty thresholds"', add
label define povertylevel_lbl 06 `"Fiscal year 2015 poverty thresholds"', add
label define povertylevel_lbl 99 `"NIU (Not in universe)"', add
label values povertylevel povertylevel_lbl

label define foodstamp_lbl 01 `"Yes"'
label define foodstamp_lbl 02 `"No"', add
label define foodstamp_lbl 96 `"Refused"', add
label define foodstamp_lbl 97 `"Don't know"', add
label define foodstamp_lbl 99 `"NIU (Not in universe)"', add
label values foodstamp foodstamp_lbl

label define hhtenure_lbl 01 `"Owned or being bought by a household member"'
label define hhtenure_lbl 02 `"Rented for cash"', add
label define hhtenure_lbl 03 `"Occupied without payment of cash rent"', add
label define hhtenure_lbl 99 `"NIU (Not in universe)"', add
label values hhtenure hhtenure_lbl

label define hh_child_lbl 00 `"No"'
label define hh_child_lbl 01 `"Yes"', add
label define hh_child_lbl 99 `"NIU (Not in universe)"', add
label values hh_child hh_child_lbl

label define housetype_lbl 01 `"House, apartment, flat"'
label define housetype_lbl 02 `"Housing unit in nontransient hotel, motel, etc."', add
label define housetype_lbl 03 `"Housing unit permanent in transient hotel, motel"', add
label define housetype_lbl 04 `"Housing unit in rooming house"', add
label define housetype_lbl 05 `"Mobile home or trailer with no permanent room added"', add
label define housetype_lbl 06 `"Mobile home or trailer with 1 or more rooms added"', add
label define housetype_lbl 07 `"Housing unit not specified above"', add
label define housetype_lbl 08 `"Quarters not housing unit in rooming boarding house"', add
label define housetype_lbl 09 `"Unit not permanent, in transient hotel or motel"', add
label define housetype_lbl 10 `"Unoccupied tent site or trailer site"', add
label define housetype_lbl 11 `"Student quarters in college dorm"', add
label define housetype_lbl 12 `"Other unit not specified above"', add
label values housetype housetype_lbl

label define hh_numkids_lbl 00 `"0"'
label define hh_numkids_lbl 01 `"1"', add
label define hh_numkids_lbl 02 `"2"', add
label define hh_numkids_lbl 03 `"3"', add
label define hh_numkids_lbl 04 `"4"', add
label define hh_numkids_lbl 05 `"5"', add
label define hh_numkids_lbl 06 `"6"', add
label define hh_numkids_lbl 07 `"7"', add
label define hh_numkids_lbl 08 `"8"', add
label define hh_numkids_lbl 09 `"9"', add
label define hh_numkids_lbl 10 `"10"', add
label define hh_numkids_lbl 11 `"11"', add
label define hh_numkids_lbl 12 `"12"', add
label define hh_numkids_lbl 99 `"NIU (Not in universe)"', add
label values hh_numkids hh_numkids_lbl

label define fambus_lbl 00 `"No family business"'
label define fambus_lbl 01 `"Family business"', add
label define fambus_lbl 96 `"Refused"', add
label define fambus_lbl 97 `"Don't know"', add
label define fambus_lbl 99 `"NIU (Not in universe)"', add
label values fambus fambus_lbl

label define ageychild_lbl 000 `"0"'
label define ageychild_lbl 001 `"1"', add
label define ageychild_lbl 002 `"2"', add
label define ageychild_lbl 003 `"3"', add
label define ageychild_lbl 004 `"4"', add
label define ageychild_lbl 005 `"5"', add
label define ageychild_lbl 006 `"6"', add
label define ageychild_lbl 007 `"7"', add
label define ageychild_lbl 008 `"8"', add
label define ageychild_lbl 009 `"9"', add
label define ageychild_lbl 010 `"10"', add
label define ageychild_lbl 011 `"11"', add
label define ageychild_lbl 012 `"12"', add
label define ageychild_lbl 013 `"13"', add
label define ageychild_lbl 014 `"14"', add
label define ageychild_lbl 015 `"15"', add
label define ageychild_lbl 016 `"16"', add
label define ageychild_lbl 017 `"17"', add
label define ageychild_lbl 999 `"NIU (Not in universe)"', add
label values ageychild ageychild_lbl

label define fambus_resp_lbl 00 `"No"'
label define fambus_resp_lbl 01 `"Yes"', add
label define fambus_resp_lbl 99 `"NIU (Not in universe)"', add
label values fambus_resp fambus_resp_lbl

label define hh_numadults_lbl 00 `"0"'
label define hh_numadults_lbl 01 `"1"', add
label define hh_numadults_lbl 02 `"2"', add
label define hh_numadults_lbl 03 `"3"', add
label define hh_numadults_lbl 04 `"4"', add
label define hh_numadults_lbl 05 `"5"', add
label define hh_numadults_lbl 06 `"6"', add
label define hh_numadults_lbl 07 `"7"', add
label define hh_numadults_lbl 08 `"8"', add
label define hh_numadults_lbl 09 `"9"', add
label define hh_numadults_lbl 99 `"NIU (Not in universe)"', add
label values hh_numadults hh_numadults_lbl

label define fambus_spouse_lbl 00 `"No"'
label define fambus_spouse_lbl 01 `"Yes"', add
label define fambus_spouse_lbl 99 `"NIU (Not in universe)"', add
label values fambus_spouse fambus_spouse_lbl

label define fambus_other_lbl 00 `"No"'
label define fambus_other_lbl 01 `"Yes"', add
label define fambus_other_lbl 99 `"NIU (Not in universe)"', add
label values fambus_other fambus_other_lbl

label define pernum_lbl 01 `"1"'
label define pernum_lbl 02 `"2"', add
label define pernum_lbl 03 `"3"', add
label define pernum_lbl 04 `"4"', add
label define pernum_lbl 05 `"5"', add
label define pernum_lbl 06 `"6"', add
label define pernum_lbl 07 `"7"', add
label define pernum_lbl 08 `"8"', add
label define pernum_lbl 09 `"9"', add
label define pernum_lbl 10 `"10"', add
label define pernum_lbl 11 `"11"', add
label define pernum_lbl 12 `"12"', add
label define pernum_lbl 13 `"13"', add
label define pernum_lbl 14 `"14"', add
label define pernum_lbl 15 `"15"', add
label define pernum_lbl 16 `"16"', add
label values pernum pernum_lbl

label define lineno_lbl 001 `"1"'
label define lineno_lbl 002 `"2"', add
label define lineno_lbl 003 `"3"', add
label define lineno_lbl 004 `"4"', add
label define lineno_lbl 005 `"5"', add
label define lineno_lbl 006 `"6"', add
label define lineno_lbl 007 `"7"', add
label define lineno_lbl 008 `"8"', add
label define lineno_lbl 009 `"9"', add
label define lineno_lbl 010 `"10"', add
label define lineno_lbl 011 `"11"', add
label define lineno_lbl 012 `"12"', add
label define lineno_lbl 013 `"13"', add
label define lineno_lbl 014 `"14"', add
label define lineno_lbl 015 `"15"', add
label define lineno_lbl 016 `"16"', add
label define lineno_lbl 017 `"17"', add
label define lineno_lbl 018 `"18"', add
label define lineno_lbl 019 `"19"', add
label define lineno_lbl 999 `"NIU (Not in universe)"', add
label values lineno lineno_lbl

label define lineno_cps8_lbl 001 `"1"'
label define lineno_cps8_lbl 002 `"2"', add
label define lineno_cps8_lbl 003 `"3"', add
label define lineno_cps8_lbl 004 `"4"', add
label define lineno_cps8_lbl 005 `"5"', add
label define lineno_cps8_lbl 006 `"6"', add
label define lineno_cps8_lbl 007 `"7"', add
label define lineno_cps8_lbl 008 `"8"', add
label define lineno_cps8_lbl 009 `"9"', add
label define lineno_cps8_lbl 010 `"10"', add
label define lineno_cps8_lbl 011 `"11"', add
label define lineno_cps8_lbl 012 `"12"', add
label define lineno_cps8_lbl 013 `"13"', add
label define lineno_cps8_lbl 014 `"14"', add
label define lineno_cps8_lbl 015 `"15"', add
label define lineno_cps8_lbl 016 `"16"', add
label define lineno_cps8_lbl 999 `"NIU (Not in universe)"', add
label values lineno_cps8 lineno_cps8_lbl

label define presence_lbl 1 `"ATUS and CPS"'
label define presence_lbl 2 `"ATUS only"', add
label define presence_lbl 3 `"CPS only"', add
label values presence presence_lbl

label define month_lbl 001 `"January"'
label define month_lbl 002 `"February"', add
label define month_lbl 003 `"March"', add
label define month_lbl 004 `"April"', add
label define month_lbl 005 `"May"', add
label define month_lbl 006 `"June"', add
label define month_lbl 007 `"July"', add
label define month_lbl 008 `"August"', add
label define month_lbl 009 `"September"', add
label define month_lbl 010 `"October"', add
label define month_lbl 011 `"November"', add
label define month_lbl 012 `"December"', add
label define month_lbl 999 `"NIU (Not in universe)"', add
label values month month_lbl

label define day_lbl 01 `"Sunday"'
label define day_lbl 02 `"Monday"', add
label define day_lbl 03 `"Tuesday"', add
label define day_lbl 04 `"Wednesday"', add
label define day_lbl 05 `"Thursday"', add
label define day_lbl 06 `"Friday"', add
label define day_lbl 07 `"Saturday"', add
label define day_lbl 99 `"NIU (Not in universe)"', add
label values day day_lbl

label define holiday_lbl 00 `"No"'
label define holiday_lbl 01 `"Yes"', add
label define holiday_lbl 99 `"NIU (Not in universe)"', add
label values holiday holiday_lbl

label define sex_lbl 01 `"Male"'
label define sex_lbl 02 `"Female"', add
label define sex_lbl 99 `"NIU (Not in universe)"', add
label values sex sex_lbl

label define race_lbl 0100 `"White only"'
label define race_lbl 0110 `"Black only"', add
label define race_lbl 0120 `"American Indian, Alaskan Native"', add
label define race_lbl 0130 `"Asian or Pacific Islander"', add
label define race_lbl 0131 `"Asian only"', add
label define race_lbl 0132 `"Hawaiian Pacific Islander only"', add
label define race_lbl 0200 `"White-Black"', add
label define race_lbl 0201 `"White-American Indian"', add
label define race_lbl 0202 `"White-Asian"', add
label define race_lbl 0203 `"White-Hawaiian"', add
label define race_lbl 0210 `"Black-American Indian"', add
label define race_lbl 0211 `"Black-Asian"', add
label define race_lbl 0212 `"Black-Hawaiian"', add
label define race_lbl 0220 `"American Indian-Asian"', add
label define race_lbl 0221 `"American Indian-Hawaiian"', add
label define race_lbl 0230 `"Asian-Hawaiian"', add
label define race_lbl 0300 `"White-Black-American Indian"', add
label define race_lbl 0301 `"White-Black-Asian"', add
label define race_lbl 0302 `"White-Black-Hawaiian"', add
label define race_lbl 0310 `"White-American Indian-Asian"', add
label define race_lbl 0311 `"White-American Indian-Hawaiian"', add
label define race_lbl 0320 `"White-Asian-Hawaiian"', add
label define race_lbl 0330 `"Black-American Indian-Asian"', add
label define race_lbl 0331 `"Black-American Indian-Hawaiian"', add
label define race_lbl 0340 `"Black-Asian-Hawaiian"', add
label define race_lbl 0350 `"American Indian-Asian-Hawaiian"', add
label define race_lbl 0398 `"Other 3 race combinations"', add
label define race_lbl 0399 `"2 or 3 races, unspecified"', add
label define race_lbl 0400 `"White-Black-American Indian-Asian"', add
label define race_lbl 0401 `"White-Black-American Indian-Hawaiian"', add
label define race_lbl 0402 `"White-Black-Asian-Hawaiian"', add
label define race_lbl 0403 `"Black-American Indian-Asian-Hawaiian"', add
label define race_lbl 0404 `"White-American Indian-Asian-Hawaiian"', add
label define race_lbl 0500 `"White-Black-American Indian-Asian-Hawaiian"', add
label define race_lbl 0599 `"4 or 5 races, unspecified"', add
label define race_lbl 9999 `"NIU (Not in universe)"', add
label values race race_lbl

label define hispan_lbl 0100 `"Not Hispanic"'
label define hispan_lbl 0210 `"Mexican"', add
label define hispan_lbl 0211 `"Mexican American"', add
label define hispan_lbl 0212 `"Chicano"', add
label define hispan_lbl 0213 `"Mexcian (Mexicano)"', add
label define hispan_lbl 0220 `"Puerto Rican"', add
label define hispan_lbl 0230 `"Cuban"', add
label define hispan_lbl 0240 `"Central-South American"', add
label define hispan_lbl 0241 `"Dominican"', add
label define hispan_lbl 0242 `"Salvadoran"', add
label define hispan_lbl 0243 `"Other Central American"', add
label define hispan_lbl 0244 `"South American"', add
label define hispan_lbl 0250 `"Other Spanish"', add
label define hispan_lbl 9999 `"NIU (Not in universe)"', add
label values hispan hispan_lbl

label define marst_lbl 01 `"Married - spouse present"'
label define marst_lbl 02 `"Married - spouse absent"', add
label define marst_lbl 03 `"Widowed"', add
label define marst_lbl 04 `"Divorced"', add
label define marst_lbl 05 `"Separated"', add
label define marst_lbl 06 `"Never married"', add
label define marst_lbl 99 `"NIU (Not in universe)"', add
label values marst marst_lbl

label define yrimmig_lbl 000 `"Not foreign born"'
label define yrimmig_lbl 001 `"Before 1950"', add
label define yrimmig_lbl 002 `"1950-1959"', add
label define yrimmig_lbl 003 `"1960-1964"', add
label define yrimmig_lbl 004 `"1965-1969"', add
label define yrimmig_lbl 005 `"1970-1974"', add
label define yrimmig_lbl 006 `"1975-1979"', add
label define yrimmig_lbl 007 `"1980-1981"', add
label define yrimmig_lbl 008 `"1982-1983"', add
label define yrimmig_lbl 009 `"1984-1985"', add
label define yrimmig_lbl 010 `"1986-1987"', add
label define yrimmig_lbl 011 `"1988-1989"', add
label define yrimmig_lbl 012 `"1990-1991"', add
label define yrimmig_lbl 013 `"1992-1993"', add
label define yrimmig_lbl 014 `"1994-1995"', add
label define yrimmig_lbl 015 `"1996-1997"', add
label define yrimmig_lbl 016 `"1998-1999"', add
label define yrimmig_lbl 017 `"2000-2001"', add
label define yrimmig_lbl 018 `"2002-2003"', add
label define yrimmig_lbl 019 `"2002-2004"', add
label define yrimmig_lbl 020 `"2002-2005"', add
label define yrimmig_lbl 021 `"2004-2005"', add
label define yrimmig_lbl 022 `"2004-2006"', add
label define yrimmig_lbl 023 `"2004-2007"', add
label define yrimmig_lbl 024 `"2006-2007"', add
label define yrimmig_lbl 025 `"2006-2008"', add
label define yrimmig_lbl 026 `"2006-2009"', add
label define yrimmig_lbl 027 `"2008-2009"', add
label define yrimmig_lbl 028 `"2008-2010"', add
label define yrimmig_lbl 029 `"2008-2011"', add
label define yrimmig_lbl 030 `"2010-2011"', add
label define yrimmig_lbl 031 `"2010-2012"', add
label define yrimmig_lbl 032 `"2010-2013"', add
label define yrimmig_lbl 033 `"2012-2013"', add
label define yrimmig_lbl 034 `"2012-2014"', add
label define yrimmig_lbl 998 `"Blank"', add
label define yrimmig_lbl 999 `"NIU (Not in universe)"', add
label values yrimmig yrimmig_lbl

label define citizen_lbl 001 `"Native, born in United States"'
label define citizen_lbl 002 `"Native, born in Puerto Rico or U.S. Outlying Area"', add
label define citizen_lbl 003 `"Native, born abroad of American parent or parents"', add
label define citizen_lbl 004 `"Foreign born, U.S. citizen by naturalization"', add
label define citizen_lbl 005 `"Foreign born, not a U.S. citizen"', add
label define citizen_lbl 999 `"NIU (Not in universe)"', add
label values citizen citizen_lbl

label define bpl_lbl 009900 `"U.S., n.s."'
label define bpl_lbl 010000 `"American Samoa"', add
label define bpl_lbl 010500 `"Guam"', add
label define bpl_lbl 010750 `"Nothern Marianas"', add
label define bpl_lbl 011000 `"Puerto Rico"', add
label define bpl_lbl 011500 `"U.S. Virgin Islands"', add
label define bpl_lbl 012090 `"U.S. outlying areas, n.s."', add
label define bpl_lbl 015000 `"Canada"', add
label define bpl_lbl 016010 `"Bermuda"', add
label define bpl_lbl 019900 `"North America, n.s."', add
label define bpl_lbl 020000 `"Mexico"', add
label define bpl_lbl 021010 `"Belize/British Honduras"', add
label define bpl_lbl 021020 `"Costa Rica"', add
label define bpl_lbl 021030 `"El Salvador"', add
label define bpl_lbl 021040 `"Guatemala"', add
label define bpl_lbl 021050 `"Honduras"', add
label define bpl_lbl 021060 `"Nicaragua"', add
label define bpl_lbl 021070 `"Panama"', add
label define bpl_lbl 021090 `"Central America, n.s."', add
label define bpl_lbl 025000 `"Cuba"', add
label define bpl_lbl 026000 `"West Indies"', add
label define bpl_lbl 026010 `"Dominican Republic"', add
label define bpl_lbl 026020 `"Haiti"', add
label define bpl_lbl 026030 `"Jamaica"', add
label define bpl_lbl 026043 `"Bahamas"', add
label define bpl_lbl 026044 `"Barbados"', add
label define bpl_lbl 026054 `"Dominica"', add
label define bpl_lbl 026055 `"Grenada"', add
label define bpl_lbl 026060 `"Trinidad and Tobago"', add
label define bpl_lbl 026065 `"Antigua and Barbuda"', add
label define bpl_lbl 026070 `"St. Kitts--Nevis"', add
label define bpl_lbl 026075 `"St. Lucia"', add
label define bpl_lbl 026080 `"St. Vincent and the Grenadi"', add
label define bpl_lbl 026091 `"Caribbean, n.s."', add
label define bpl_lbl 030005 `"Argentina"', add
label define bpl_lbl 030010 `"Bolivia"', add
label define bpl_lbl 030015 `"Brazil"', add
label define bpl_lbl 030020 `"Chile"', add
label define bpl_lbl 030025 `"Colombia"', add
label define bpl_lbl 030030 `"Ecuador"', add
label define bpl_lbl 030040 `"Guyana/British Guiana"', add
label define bpl_lbl 030050 `"Peru"', add
label define bpl_lbl 030060 `"Uruguay"', add
label define bpl_lbl 030065 `"Venezuala"', add
label define bpl_lbl 030070 `"Paraguay"', add
label define bpl_lbl 030090 `"South America, n.s."', add
label define bpl_lbl 031000 `"Americas, n.s."', add
label define bpl_lbl 040000 `"Denmark"', add
label define bpl_lbl 040100 `"Finland"', add
label define bpl_lbl 040200 `"Iceland"', add
label define bpl_lbl 040400 `"Norway"', add
label define bpl_lbl 040500 `"Sweden"', add
label define bpl_lbl 041000 `"England"', add
label define bpl_lbl 041100 `"Scotland"', add
label define bpl_lbl 041200 `"Wales"', add
label define bpl_lbl 041300 `"United Kingdom, n.s."', add
label define bpl_lbl 041400 `"Ireland"', add
label define bpl_lbl 041410 `"Northern Ireland"', add
label define bpl_lbl 042000 `"Belgium"', add
label define bpl_lbl 042100 `"France"', add
label define bpl_lbl 042500 `"Netherlands"', add
label define bpl_lbl 042600 `"Switzerland"', add
label define bpl_lbl 043300 `"Greece"', add
label define bpl_lbl 043400 `"Italy"', add
label define bpl_lbl 043600 `"Portugal"', add
label define bpl_lbl 043610 `"Azores"', add
label define bpl_lbl 043800 `"Spain"', add
label define bpl_lbl 045000 `"Austria"', add
label define bpl_lbl 045200 `"Czechoslavakia"', add
label define bpl_lbl 045212 `"Slovakia"', add
label define bpl_lbl 045213 `"Czech Republic"', add
label define bpl_lbl 045300 `"Germany"', add
label define bpl_lbl 045400 `"Hungary"', add
label define bpl_lbl 045500 `"Poland"', add
label define bpl_lbl 045600 `"Romania"', add
label define bpl_lbl 045650 `"Bulgaria"', add
label define bpl_lbl 045675 `"Albania"', add
label define bpl_lbl 045700 `"Yugoslavia"', add
label define bpl_lbl 045720 `"Bosnia and Herzegovina"', add
label define bpl_lbl 045730 `"Croatia"', add
label define bpl_lbl 045740 `"Macedonia"', add
label define bpl_lbl 045750 `"Serbia"', add
label define bpl_lbl 045760 `"Kosovo"', add
label define bpl_lbl 045770 `"Montenegro"', add
label define bpl_lbl 046100 `"Estonia"', add
label define bpl_lbl 046200 `"Latvia"', add
label define bpl_lbl 046300 `"Lithuania"', add
label define bpl_lbl 046500 `"Other USSR/Russia"', add
label define bpl_lbl 046530 `"Ukraine"', add
label define bpl_lbl 046535 `"Belarus"', add
label define bpl_lbl 046540 `"Moldova"', add
label define bpl_lbl 046590 `"USSR, n.s."', add
label define bpl_lbl 049900 `"Europe, n.s."', add
label define bpl_lbl 050000 `"China"', add
label define bpl_lbl 050010 `"Hong Kong"', add
label define bpl_lbl 050040 `"Taiwan"', add
label define bpl_lbl 050100 `"Japan"', add
label define bpl_lbl 050200 `"Korea"', add
label define bpl_lbl 050220 `"South Korea"', add
label define bpl_lbl 050300 `"Mongolia"', add
label define bpl_lbl 051100 `"Cambodia"', add
label define bpl_lbl 051200 `"Indonesia"', add
label define bpl_lbl 051300 `"Laos"', add
label define bpl_lbl 051400 `"Malaysia"', add
label define bpl_lbl 051500 `"Philippines"', add
label define bpl_lbl 051600 `"Singapore"', add
label define bpl_lbl 051700 `"Thailand"', add
label define bpl_lbl 051800 `"Vietnam"', add
label define bpl_lbl 052000 `"Afghanistan"', add
label define bpl_lbl 052100 `"India"', add
label define bpl_lbl 052110 `"Bangladesh"', add
label define bpl_lbl 052120 `"Bhutan"', add
label define bpl_lbl 052130 `"Burma (Myanmar)"', add
label define bpl_lbl 052140 `"Pakistan"', add
label define bpl_lbl 052150 `"Sri Lanka"', add
label define bpl_lbl 052200 `"Nepal"', add
label define bpl_lbl 055100 `"Armenia"', add
label define bpl_lbl 055200 `"Azerbaijan"', add
label define bpl_lbl 055300 `"Georgia"', add
label define bpl_lbl 055400 `"Uzbekistan"', add
label define bpl_lbl 055500 `"Kazakhstan"', add
label define bpl_lbl 053000 `"Iran"', add
label define bpl_lbl 053200 `"Iraq"', add
label define bpl_lbl 053400 `"Isreal/Palestine"', add
label define bpl_lbl 053420 `"Palestine"', add
label define bpl_lbl 053500 `"Jordan"', add
label define bpl_lbl 053700 `"Lebanon"', add
label define bpl_lbl 054000 `"Saudi Arabia"', add
label define bpl_lbl 054100 `"Syria"', add
label define bpl_lbl 054200 `"Turkey"', add
label define bpl_lbl 054300 `"Cyprus"', add
label define bpl_lbl 054350 `"Kuwait"', add
label define bpl_lbl 054400 `"Yemen"', add
label define bpl_lbl 054500 `"United Arab Emirates"', add
label define bpl_lbl 054700 `"Middle East, n.s."', add
label define bpl_lbl 059900 `"Asia, n.e.c. or n.s."', add
label define bpl_lbl 060010 `"Northern Africa"', add
label define bpl_lbl 060012 `"Egypt/United Arab Rep."', add
label define bpl_lbl 060014 `"Morocco"', add
label define bpl_lbl 060016 `"Algeria"', add
label define bpl_lbl 060018 `"Sudan"', add
label define bpl_lbl 060019 `"Lybia"', add
label define bpl_lbl 060023 `"Ghana"', add
label define bpl_lbl 060031 `"Nigeria"', add
label define bpl_lbl 060032 `"Cameroon"', add
label define bpl_lbl 060033 `"Cape Verde"', add
label define bpl_lbl 060034 `"Liberia"', add
label define bpl_lbl 060035 `"Senegal"', add
label define bpl_lbl 060036 `"Sierra Leone"', add
label define bpl_lbl 060037 `"Guinea"', add
label define bpl_lbl 060038 `"Ivory Coast"', add
label define bpl_lbl 060039 `"Togo"', add
label define bpl_lbl 060040 `"Eritrea"', add
label define bpl_lbl 060044 `"Ethiopia"', add
label define bpl_lbl 060045 `"Kenya"', add
label define bpl_lbl 060050 `"Somalia"', add
label define bpl_lbl 060060 `"Tanzania"', add
label define bpl_lbl 060065 `"Uganda"', add
label define bpl_lbl 060070 `"Zimbabwe"', add
label define bpl_lbl 060094 `"South Africa (Union of)"', add
label define bpl_lbl 060095 `"Zaire"', add
label define bpl_lbl 060096 `"Congo"', add
label define bpl_lbl 060097 `"Zambia"', add
label define bpl_lbl 060099 `"Africa, n.s."', add
label define bpl_lbl 070010 `"Australia"', add
label define bpl_lbl 070020 `"New Zealand"', add
label define bpl_lbl 071000 `"Pacific Islands"', add
label define bpl_lbl 071021 `"Fiji"', add
label define bpl_lbl 071022 `"Tonga"', add
label define bpl_lbl 071023 `"Samoa"', add
label define bpl_lbl 071024 `"Marshall Islands"', add
label define bpl_lbl 072000 `"Micronesia"', add
label define bpl_lbl 071090 `"Oceania, n.s."', add
label define bpl_lbl 096000 `"Other, n.e.c. and unknown"', add
label define bpl_lbl 999999 `"NIU (Not in universe)"', add
label values bpl bpl_lbl

label define mbpl_lbl 009900 `"U.S., n.s."'
label define mbpl_lbl 010000 `"American Samoa"', add
label define mbpl_lbl 010500 `"Guam"', add
label define mbpl_lbl 010750 `"Northern Marianas Islands"', add
label define mbpl_lbl 011000 `"Puerto Rico"', add
label define mbpl_lbl 011500 `"U.S. Virgin Islands"', add
label define mbpl_lbl 012090 `"U.S. outlying areas, n.s."', add
label define mbpl_lbl 015000 `"Canada"', add
label define mbpl_lbl 016010 `"Bermuda"', add
label define mbpl_lbl 019900 `"North America, n.s."', add
label define mbpl_lbl 020000 `"Mexico"', add
label define mbpl_lbl 021010 `"Belize/British Honduras"', add
label define mbpl_lbl 021020 `"Costa Rica"', add
label define mbpl_lbl 021030 `"El Salvador"', add
label define mbpl_lbl 021040 `"Guatemala"', add
label define mbpl_lbl 021050 `"Honduras"', add
label define mbpl_lbl 021060 `"Nicaragua"', add
label define mbpl_lbl 021070 `"Panama"', add
label define mbpl_lbl 021090 `"Central America, n.s."', add
label define mbpl_lbl 025000 `"Cuba"', add
label define mbpl_lbl 026000 `"West Indies"', add
label define mbpl_lbl 026010 `"Dominican Republic"', add
label define mbpl_lbl 026020 `"Haiti"', add
label define mbpl_lbl 026030 `"Jamaica"', add
label define mbpl_lbl 026043 `"Bahamas"', add
label define mbpl_lbl 026044 `"Barbados"', add
label define mbpl_lbl 026054 `"Dominica"', add
label define mbpl_lbl 026055 `"Grenada"', add
label define mbpl_lbl 026060 `"Trinidad and Tobago"', add
label define mbpl_lbl 026065 `"Antigua and Barbuda"', add
label define mbpl_lbl 026070 `"St. Kitts--Nevis"', add
label define mbpl_lbl 026075 `"St. Lucia"', add
label define mbpl_lbl 026080 `"St. Vincent and the Grenadi"', add
label define mbpl_lbl 026091 `"Caribbean, n.s."', add
label define mbpl_lbl 030005 `"Argentina"', add
label define mbpl_lbl 030010 `"Bolivia"', add
label define mbpl_lbl 030015 `"Brazil"', add
label define mbpl_lbl 030020 `"Chile"', add
label define mbpl_lbl 030025 `"Colombia"', add
label define mbpl_lbl 030030 `"Ecuador"', add
label define mbpl_lbl 030040 `"Guyana/British Guiana"', add
label define mbpl_lbl 030050 `"Peru"', add
label define mbpl_lbl 030060 `"Uruguay"', add
label define mbpl_lbl 030065 `"Venezuala"', add
label define mbpl_lbl 030070 `"Paraguay"', add
label define mbpl_lbl 030090 `"South America, n.s."', add
label define mbpl_lbl 031000 `"Americas, n.s."', add
label define mbpl_lbl 040000 `"Denmark"', add
label define mbpl_lbl 040100 `"Finland"', add
label define mbpl_lbl 040200 `"Iceland"', add
label define mbpl_lbl 040400 `"Norway"', add
label define mbpl_lbl 040500 `"Sweden"', add
label define mbpl_lbl 041000 `"England"', add
label define mbpl_lbl 041100 `"Scotland"', add
label define mbpl_lbl 041200 `"Wales"', add
label define mbpl_lbl 041300 `"United Kingdom, n.s."', add
label define mbpl_lbl 041400 `"Ireland"', add
label define mbpl_lbl 041410 `"Northern Ireland"', add
label define mbpl_lbl 042000 `"Belgium"', add
label define mbpl_lbl 042100 `"France"', add
label define mbpl_lbl 042500 `"Netherlands"', add
label define mbpl_lbl 042600 `"Switzerland"', add
label define mbpl_lbl 043300 `"Greece"', add
label define mbpl_lbl 043400 `"Italy"', add
label define mbpl_lbl 043600 `"Portugal"', add
label define mbpl_lbl 043610 `"Azores"', add
label define mbpl_lbl 043800 `"Spain"', add
label define mbpl_lbl 045000 `"Austria"', add
label define mbpl_lbl 045200 `"Czechoslavakia"', add
label define mbpl_lbl 045212 `"Slovakia"', add
label define mbpl_lbl 045213 `"Czech Republic"', add
label define mbpl_lbl 045300 `"Germany"', add
label define mbpl_lbl 045400 `"Hungary"', add
label define mbpl_lbl 045500 `"Poland"', add
label define mbpl_lbl 045600 `"Romania"', add
label define mbpl_lbl 045650 `"Bulgaria"', add
label define mbpl_lbl 045675 `"Albania"', add
label define mbpl_lbl 045700 `"Yugoslavia"', add
label define mbpl_lbl 045720 `"Bosnia and Herzegovina"', add
label define mbpl_lbl 045730 `"Croatia"', add
label define mbpl_lbl 045740 `"Macedonia"', add
label define mbpl_lbl 045750 `"Serbia"', add
label define mbpl_lbl 045760 `"Kosovo"', add
label define mbpl_lbl 045770 `"Montenegro"', add
label define mbpl_lbl 046100 `"Estonia"', add
label define mbpl_lbl 046200 `"Latvia"', add
label define mbpl_lbl 046300 `"Lithuania"', add
label define mbpl_lbl 046500 `"Other USSR/"Russia""', add
label define mbpl_lbl 046530 `"Ukraine"', add
label define mbpl_lbl 046535 `"Belarus"', add
label define mbpl_lbl 046540 `"Moldova"', add
label define mbpl_lbl 046590 `"USSR, n.s."', add
label define mbpl_lbl 049900 `"Europe, n.s."', add
label define mbpl_lbl 050000 `"China"', add
label define mbpl_lbl 050010 `"Hong Kong"', add
label define mbpl_lbl 050040 `"Taiwan"', add
label define mbpl_lbl 050100 `"Japan"', add
label define mbpl_lbl 050200 `"Korea"', add
label define mbpl_lbl 050220 `"South Korea"', add
label define mbpl_lbl 050300 `"Mongolia"', add
label define mbpl_lbl 051100 `"Cambodia"', add
label define mbpl_lbl 051200 `"Indonesia"', add
label define mbpl_lbl 051300 `"Laos"', add
label define mbpl_lbl 051400 `"Malaysia"', add
label define mbpl_lbl 051500 `"Philippines"', add
label define mbpl_lbl 051600 `"Singapore"', add
label define mbpl_lbl 051700 `"Thailand"', add
label define mbpl_lbl 051800 `"Vietnam"', add
label define mbpl_lbl 052000 `"Afghanistan"', add
label define mbpl_lbl 052100 `"India"', add
label define mbpl_lbl 052110 `"Bangladesh"', add
label define mbpl_lbl 052120 `"Bhutan"', add
label define mbpl_lbl 052130 `"Burma (Myanmar)"', add
label define mbpl_lbl 052140 `"Pakistan"', add
label define mbpl_lbl 052150 `"Sri Lanka"', add
label define mbpl_lbl 052200 `"Nepal"', add
label define mbpl_lbl 055100 `"Armenia"', add
label define mbpl_lbl 055200 `"Azerbaijan"', add
label define mbpl_lbl 055300 `"Georgia"', add
label define mbpl_lbl 055400 `"Uzbekistan"', add
label define mbpl_lbl 055500 `"Kazakhstan"', add
label define mbpl_lbl 053000 `"Iran"', add
label define mbpl_lbl 053200 `"Iraq"', add
label define mbpl_lbl 053400 `"Isreal/Palestine"', add
label define mbpl_lbl 053420 `"Palestine"', add
label define mbpl_lbl 053500 `"Jordan"', add
label define mbpl_lbl 053700 `"Lebanon"', add
label define mbpl_lbl 054000 `"Saudi Arabia"', add
label define mbpl_lbl 054100 `"Syria"', add
label define mbpl_lbl 054200 `"Turkey"', add
label define mbpl_lbl 054300 `"Cyprus"', add
label define mbpl_lbl 054350 `"Kuwait"', add
label define mbpl_lbl 054400 `"Yemen"', add
label define mbpl_lbl 054500 `"United Arab Emirates"', add
label define mbpl_lbl 054700 `"Middle East, n.s."', add
label define mbpl_lbl 059900 `"Asia, n.e.c, /n.s."', add
label define mbpl_lbl 060010 `"Northern Africa"', add
label define mbpl_lbl 060012 `"Egypt/United Arab Rep."', add
label define mbpl_lbl 060014 `"Morocco"', add
label define mbpl_lbl 060016 `"Algeria"', add
label define mbpl_lbl 060018 `"Sudan"', add
label define mbpl_lbl 060019 `"Lybia"', add
label define mbpl_lbl 060023 `"Ghana"', add
label define mbpl_lbl 060031 `"Nigeria"', add
label define mbpl_lbl 060032 `"Cameroon"', add
label define mbpl_lbl 060033 `"Cape Verde"', add
label define mbpl_lbl 060034 `"Liberia"', add
label define mbpl_lbl 060035 `"Senegal"', add
label define mbpl_lbl 060036 `"Sierra Leone"', add
label define mbpl_lbl 060037 `"Guinea"', add
label define mbpl_lbl 060038 `"Ivory Coast"', add
label define mbpl_lbl 060039 `"Togo"', add
label define mbpl_lbl 060040 `"Eritrea"', add
label define mbpl_lbl 060044 `"Ethiopia"', add
label define mbpl_lbl 060045 `"Kenya"', add
label define mbpl_lbl 060050 `"Somalia"', add
label define mbpl_lbl 060060 `"Tanzania"', add
label define mbpl_lbl 060065 `"Uganda"', add
label define mbpl_lbl 060070 `"Zimbabwe"', add
label define mbpl_lbl 060094 `"South Africa (Union of)"', add
label define mbpl_lbl 060095 `"Zaire"', add
label define mbpl_lbl 060096 `"Congo"', add
label define mbpl_lbl 060097 `"Zambia"', add
label define mbpl_lbl 060099 `"Africa, n.s."', add
label define mbpl_lbl 070010 `"Australia"', add
label define mbpl_lbl 070020 `"New Zealand"', add
label define mbpl_lbl 071000 `"Pacific Islands"', add
label define mbpl_lbl 071021 `"Fiji"', add
label define mbpl_lbl 071022 `"Tonga"', add
label define mbpl_lbl 071023 `"Samoa"', add
label define mbpl_lbl 071024 `"Marshall Islands"', add
label define mbpl_lbl 072000 `"Micronesia"', add
label define mbpl_lbl 071090 `"Oceania, n.s."', add
label define mbpl_lbl 096000 `"Other, n.e.c. and unknown"', add
label define mbpl_lbl 999999 `"NIU (Not in universe)"', add
label values mbpl mbpl_lbl

label define fbpl_lbl 009900 `"U.S., n.s."'
label define fbpl_lbl 010000 `"American Samoa"', add
label define fbpl_lbl 010500 `"Guam"', add
label define fbpl_lbl 010750 `"Northern Marianas"', add
label define fbpl_lbl 011000 `"Puerto Rico"', add
label define fbpl_lbl 011500 `"U.S. Virgin Islands"', add
label define fbpl_lbl 012090 `"U.S. outlying areas, n.s."', add
label define fbpl_lbl 015000 `"Canada"', add
label define fbpl_lbl 016010 `"Bermuda"', add
label define fbpl_lbl 019900 `"North America, n.s."', add
label define fbpl_lbl 020000 `"Mexico"', add
label define fbpl_lbl 021010 `"Belize/British Honduras"', add
label define fbpl_lbl 021020 `"Costa Rica"', add
label define fbpl_lbl 021030 `"El Salvador"', add
label define fbpl_lbl 021040 `"Guatemala"', add
label define fbpl_lbl 021050 `"Honduras"', add
label define fbpl_lbl 021060 `"Nicaragua"', add
label define fbpl_lbl 021070 `"Panama"', add
label define fbpl_lbl 021090 `"Central America, n.s."', add
label define fbpl_lbl 025000 `"Cuba"', add
label define fbpl_lbl 026000 `"West Indies"', add
label define fbpl_lbl 026010 `"Dominican Republic"', add
label define fbpl_lbl 026020 `"Haiti"', add
label define fbpl_lbl 026030 `"Jamaica"', add
label define fbpl_lbl 026043 `"Bahamas"', add
label define fbpl_lbl 026044 `"Barbados"', add
label define fbpl_lbl 026054 `"Dominica"', add
label define fbpl_lbl 026055 `"Grenada"', add
label define fbpl_lbl 026060 `"Trinidad and Tobago"', add
label define fbpl_lbl 026065 `"Antigua and Barbuda"', add
label define fbpl_lbl 026070 `"St. Kitts--Nevis"', add
label define fbpl_lbl 026075 `"St. Lucia"', add
label define fbpl_lbl 026080 `"St. Vincent and the Grenadi"', add
label define fbpl_lbl 026091 `"Caribbean, n.s."', add
label define fbpl_lbl 030005 `"Argentina"', add
label define fbpl_lbl 030010 `"Bolivia"', add
label define fbpl_lbl 030015 `"Brazil"', add
label define fbpl_lbl 030020 `"Chile"', add
label define fbpl_lbl 030025 `"Colombia"', add
label define fbpl_lbl 030030 `"Ecuador"', add
label define fbpl_lbl 030040 `"Guyana/British Guiana"', add
label define fbpl_lbl 030050 `"Peru"', add
label define fbpl_lbl 030060 `"Uruguay"', add
label define fbpl_lbl 030065 `"Venezuala"', add
label define fbpl_lbl 030070 `"Paraguay"', add
label define fbpl_lbl 030090 `"South America, n.s."', add
label define fbpl_lbl 031000 `"Americas, n.s."', add
label define fbpl_lbl 040000 `"Denmark"', add
label define fbpl_lbl 040100 `"Finland"', add
label define fbpl_lbl 040200 `"Iceland"', add
label define fbpl_lbl 040400 `"Norway"', add
label define fbpl_lbl 040500 `"Sweden"', add
label define fbpl_lbl 041000 `"England"', add
label define fbpl_lbl 041100 `"Scotland"', add
label define fbpl_lbl 041200 `"Wales"', add
label define fbpl_lbl 041300 `"United Kingdom, n.s."', add
label define fbpl_lbl 041400 `"Ireland"', add
label define fbpl_lbl 041410 `"Northern Ireland"', add
label define fbpl_lbl 042000 `"Belgium"', add
label define fbpl_lbl 042100 `"France"', add
label define fbpl_lbl 042500 `"Netherlands"', add
label define fbpl_lbl 042600 `"Switzerland"', add
label define fbpl_lbl 043300 `"Greece"', add
label define fbpl_lbl 043400 `"Italy"', add
label define fbpl_lbl 043600 `"Portugal"', add
label define fbpl_lbl 043610 `"Azores"', add
label define fbpl_lbl 043800 `"Spain"', add
label define fbpl_lbl 045000 `"Austria"', add
label define fbpl_lbl 045200 `"Czechoslavakia"', add
label define fbpl_lbl 045212 `"Slovakia"', add
label define fbpl_lbl 045213 `"Czech Republic"', add
label define fbpl_lbl 045300 `"Germany"', add
label define fbpl_lbl 045400 `"Hungary"', add
label define fbpl_lbl 045500 `"Poland"', add
label define fbpl_lbl 045600 `"Romania"', add
label define fbpl_lbl 045650 `"Bulgaria"', add
label define fbpl_lbl 045675 `"Albania"', add
label define fbpl_lbl 045700 `"Yugoslavia"', add
label define fbpl_lbl 045720 `"Bosnia and Herzegovina"', add
label define fbpl_lbl 045730 `"Croatia"', add
label define fbpl_lbl 045740 `"Macedonia"', add
label define fbpl_lbl 045750 `"Serbia"', add
label define fbpl_lbl 045760 `"Kosovo"', add
label define fbpl_lbl 045770 `"Montenegro"', add
label define fbpl_lbl 046100 `"Estonia"', add
label define fbpl_lbl 046200 `"Latvia"', add
label define fbpl_lbl 046300 `"Lithuania"', add
label define fbpl_lbl 046500 `"Other USSR/Russia"', add
label define fbpl_lbl 046530 `"Ukraine"', add
label define fbpl_lbl 046535 `"Belarus"', add
label define fbpl_lbl 046540 `"Moldova"', add
label define fbpl_lbl 046590 `"USSR, n.s."', add
label define fbpl_lbl 049900 `"Europe, n.s."', add
label define fbpl_lbl 050000 `"China"', add
label define fbpl_lbl 050010 `"Hong Kong"', add
label define fbpl_lbl 050040 `"Taiwan"', add
label define fbpl_lbl 050100 `"Japan"', add
label define fbpl_lbl 050200 `"Korea"', add
label define fbpl_lbl 050220 `"South Korea"', add
label define fbpl_lbl 050300 `"Mongolia"', add
label define fbpl_lbl 051100 `"Cambodia"', add
label define fbpl_lbl 051200 `"Indonesia"', add
label define fbpl_lbl 051300 `"Laos"', add
label define fbpl_lbl 051400 `"Malaysia"', add
label define fbpl_lbl 051500 `"Philippines"', add
label define fbpl_lbl 051600 `"Singapore"', add
label define fbpl_lbl 051700 `"Thailand"', add
label define fbpl_lbl 051800 `"Vietnam"', add
label define fbpl_lbl 052000 `"Afghanistan"', add
label define fbpl_lbl 052100 `"India"', add
label define fbpl_lbl 052110 `"Bangladesh"', add
label define fbpl_lbl 052120 `"Bhutan"', add
label define fbpl_lbl 052130 `"Burma (Myanmar)"', add
label define fbpl_lbl 052140 `"Pakistan"', add
label define fbpl_lbl 052150 `"Sri Lanka"', add
label define fbpl_lbl 052200 `"Nepal"', add
label define fbpl_lbl 055100 `"Armenia"', add
label define fbpl_lbl 055200 `"Azerbaijan"', add
label define fbpl_lbl 055300 `"Georgia"', add
label define fbpl_lbl 055400 `"Uzbekistan"', add
label define fbpl_lbl 055500 `"Kazakhstan"', add
label define fbpl_lbl 053000 `"Iran"', add
label define fbpl_lbl 053200 `"Iraq"', add
label define fbpl_lbl 053400 `"Isreal/Palestine"', add
label define fbpl_lbl 053420 `"Palestine"', add
label define fbpl_lbl 053500 `"Jordan"', add
label define fbpl_lbl 053700 `"Lebanon"', add
label define fbpl_lbl 054000 `"Saudi Arabia"', add
label define fbpl_lbl 054100 `"Syria"', add
label define fbpl_lbl 054200 `"Turkey"', add
label define fbpl_lbl 054300 `"Cyprus"', add
label define fbpl_lbl 054350 `"Kuwait"', add
label define fbpl_lbl 054400 `"Yemen"', add
label define fbpl_lbl 054500 `"United Arab Emirates"', add
label define fbpl_lbl 054700 `"Middle East, n.s."', add
label define fbpl_lbl 059900 `"Asia, n.e.c, /n.s."', add
label define fbpl_lbl 060010 `"Northern Africa"', add
label define fbpl_lbl 060012 `"Egypt/United Arab Rep."', add
label define fbpl_lbl 060014 `"Morocco"', add
label define fbpl_lbl 060016 `"Algeria"', add
label define fbpl_lbl 060018 `"Sudan"', add
label define fbpl_lbl 060019 `"Lybia"', add
label define fbpl_lbl 060023 `"Ghana"', add
label define fbpl_lbl 060031 `"Nigeria"', add
label define fbpl_lbl 060032 `"Cameroon"', add
label define fbpl_lbl 060033 `"Cape Verde"', add
label define fbpl_lbl 060034 `"Liberia"', add
label define fbpl_lbl 060035 `"Senegal"', add
label define fbpl_lbl 060036 `"Sierra Leone"', add
label define fbpl_lbl 060037 `"Guinea"', add
label define fbpl_lbl 060038 `"Ivory Coast"', add
label define fbpl_lbl 060039 `"Togo"', add
label define fbpl_lbl 060040 `"Eritrea"', add
label define fbpl_lbl 060044 `"Ethiopia"', add
label define fbpl_lbl 060045 `"Kenya"', add
label define fbpl_lbl 060050 `"Somalia"', add
label define fbpl_lbl 060060 `"Tanzania"', add
label define fbpl_lbl 060065 `"Uganda"', add
label define fbpl_lbl 060070 `"Zimbabwe"', add
label define fbpl_lbl 060094 `"South Africa (Union of)"', add
label define fbpl_lbl 060095 `"Zaire"', add
label define fbpl_lbl 060096 `"Congo"', add
label define fbpl_lbl 060097 `"Zambia"', add
label define fbpl_lbl 060099 `"Africa, n.s."', add
label define fbpl_lbl 070010 `"Australia"', add
label define fbpl_lbl 070020 `"New Zealand"', add
label define fbpl_lbl 071000 `"Pacific Islands"', add
label define fbpl_lbl 071021 `"Fiji"', add
label define fbpl_lbl 071022 `"Tonga"', add
label define fbpl_lbl 071023 `"Samoa"', add
label define fbpl_lbl 071024 `"Marshall Islands"', add
label define fbpl_lbl 072000 `"Micronesia"', add
label define fbpl_lbl 071090 `"Oceania, n.s."', add
label define fbpl_lbl 096000 `"Other, n.e.c. and unknown"', add
label define fbpl_lbl 999999 `"NIU (Not in universe)"', add
label values fbpl fbpl_lbl

label define relate_lbl 010 `"Self"'
label define relate_lbl 020 `"Spouse"', add
label define relate_lbl 021 `"Unmarried Partner"', add
label define relate_lbl 022 `"Own household child"', add
label define relate_lbl 023 `"Grandchild"', add
label define relate_lbl 024 `"Parent"', add
label define relate_lbl 025 `"Brother/Sister"', add
label define relate_lbl 026 `"Other relative"', add
label define relate_lbl 027 `"Foster child"', add
label define relate_lbl 028 `"Housemate/roommate"', add
label define relate_lbl 029 `"Roomer/boarder"', add
label define relate_lbl 030 `"Other nonrelative"', add
label define relate_lbl 040 `"Own non-household child lt 18"', add
label define relate_lbl 996 `"Refused"', add
label define relate_lbl 997 `"Don't know"', add
label define relate_lbl 999 `"NIU (Not in universe)"', add
label values relate relate_lbl

label define sex_cps8_lbl 01 `"Male"'
label define sex_cps8_lbl 02 `"Female"', add
label define sex_cps8_lbl 99 `"NIU (Not in universe)"', add
label values sex_cps8 sex_cps8_lbl

label define popstat_lbl 01 `"Adult civilian"'
label define popstat_lbl 02 `"Armed Forces"', add
label define popstat_lbl 03 `"Child"', add
label define popstat_lbl 99 `"NIU (Not in universe)"', add
label values popstat popstat_lbl

label define educ_lbl 010 `"Less than 1st grade"'
label define educ_lbl 011 `"1st, 2nd, 3rd, or 4th grade"', add
label define educ_lbl 012 `"5th or 6th grade"', add
label define educ_lbl 013 `"7th or 8th grade"', add
label define educ_lbl 014 `"9th grade"', add
label define educ_lbl 015 `"10th grade"', add
label define educ_lbl 016 `"11th grade"', add
label define educ_lbl 017 `"12th grade - no diploma"', add
label define educ_lbl 020 `"High school graduate - GED"', add
label define educ_lbl 021 `"High school graduate - diploma"', add
label define educ_lbl 030 `"Some college but no degree"', add
label define educ_lbl 031 `"Associate degree - occupational vocational"', add
label define educ_lbl 032 `"Associate degree - academic program"', add
label define educ_lbl 040 `"Bachelor's degree (BA, AB, BS, etc.)"', add
label define educ_lbl 041 `"Master's degree (MA, MS, MEng, MEd, MSW, etc.)"', add
label define educ_lbl 042 `"Professional school degree (MD, DDS, DVM, etc.)"', add
label define educ_lbl 043 `"Doctoral degree (PhD, EdD, etc.)"', add
label define educ_lbl 999 `"NIU (Not in universe)"', add
label values educ educ_lbl

label define educyrs_lbl 100 `"Grades 1-12"'
label define educyrs_lbl 101 `"Less than first grade"', add
label define educyrs_lbl 102 `"First through fourth grade"', add
label define educyrs_lbl 105 `"Fifth through sixth grade"', add
label define educyrs_lbl 107 `"Seventh through eighth grade"', add
label define educyrs_lbl 109 `"Ninth grade"', add
label define educyrs_lbl 110 `"Tenth grade"', add
label define educyrs_lbl 111 `"Eleventh grade"', add
label define educyrs_lbl 112 `"Twelfth grade"', add
label define educyrs_lbl 200 `"College"', add
label define educyrs_lbl 213 `"College--one year"', add
label define educyrs_lbl 214 `"College--two years"', add
label define educyrs_lbl 215 `"College--three years"', add
label define educyrs_lbl 216 `"College--four years"', add
label define educyrs_lbl 217 `"Bachelor's degree"', add
label define educyrs_lbl 300 `"Advanced degree"', add
label define educyrs_lbl 316 `"Master's degree"', add
label define educyrs_lbl 317 `"Master's degree--one year program"', add
label define educyrs_lbl 318 `"Master's degree--two year program"', add
label define educyrs_lbl 319 `"Master's degree--three+ year program"', add
label define educyrs_lbl 320 `"Professional degree"', add
label define educyrs_lbl 321 `"Doctoral degree"', add
label define educyrs_lbl 999 `"NIU (Not in universe)"', add
label values educyrs educyrs_lbl

label define schlcoll_lbl 01 `"Not enrolled"'
label define schlcoll_lbl 02 `"High school part time"', add
label define schlcoll_lbl 03 `"High school full time"', add
label define schlcoll_lbl 04 `"College/university part time"', add
label define schlcoll_lbl 05 `"College/university full time"', add
label define schlcoll_lbl 96 `"Refused"', add
label define schlcoll_lbl 99 `"NIU (Not in universe)"', add
label values schlcoll schlcoll_lbl

label define schlcoll_cps8_lbl 01 `"Not enrolled"'
label define schlcoll_cps8_lbl 02 `"High school part time"', add
label define schlcoll_cps8_lbl 03 `"High school full time"', add
label define schlcoll_cps8_lbl 04 `"College/university part time"', add
label define schlcoll_cps8_lbl 05 `"College/university full time"', add
label define schlcoll_cps8_lbl 98 `"Blank"', add
label define schlcoll_cps8_lbl 99 `"NIU (Not in universe)"', add
label values schlcoll_cps8 schlcoll_cps8_lbl

label define empstat_lbl 01 `"Employed - at work"'
label define empstat_lbl 02 `"Employed - absent"', add
label define empstat_lbl 03 `"Unemployed - on layoff"', add
label define empstat_lbl 04 `"Unemployed - looking"', add
label define empstat_lbl 05 `"Not in labor force"', add
label define empstat_lbl 99 `"NIU (Not in universe)"', add
label values empstat empstat_lbl

label define multjobs_lbl 00 `"No"'
label define multjobs_lbl 01 `"Yes"', add
label define multjobs_lbl 99 `"NIU (Not in universe)"', add
label values multjobs multjobs_lbl

label define clwkr_lbl 01 `"Government, federal"'
label define clwkr_lbl 02 `"Government, state"', add
label define clwkr_lbl 03 `"Government, local"', add
label define clwkr_lbl 04 `"Private, for profit"', add
label define clwkr_lbl 05 `"Private, nonprofit"', add
label define clwkr_lbl 06 `"Self-employed, incorporated"', add
label define clwkr_lbl 07 `"Self-employed, unincorporated"', add
label define clwkr_lbl 08 `"Without pay"', add
label define clwkr_lbl 99 `"NIU (Not in universe)"', add
label values clwkr clwkr_lbl

label define occ2_lbl 0110 `"Management occupations"'
label define occ2_lbl 0111 `"Business and financial operations occupations"', add
label define occ2_lbl 0120 `"Computer and mathematical science occupations"', add
label define occ2_lbl 0121 `"Architecture and engineering occupations"', add
label define occ2_lbl 0122 `"Life, physical, and social science occupations"', add
label define occ2_lbl 0123 `"Community and social service occupations"', add
label define occ2_lbl 0124 `"Legal occupations"', add
label define occ2_lbl 0125 `"Education, training, and library occupations"', add
label define occ2_lbl 0126 `"Arts, design, entertainment, sports, and media occupations"', add
label define occ2_lbl 0127 `"Healthcare practitioner and technical occupations"', add
label define occ2_lbl 0130 `"Healthcare support occupations"', add
label define occ2_lbl 0131 `"Protective service occupations"', add
label define occ2_lbl 0132 `"Food preparation and serving related occupations"', add
label define occ2_lbl 0133 `"Building and grounds cleaning and maintenance occupations"', add
label define occ2_lbl 0134 `"Personal care and service occupations"', add
label define occ2_lbl 0140 `"Sales and related occupations"', add
label define occ2_lbl 0150 `"Office and administrative support occupations"', add
label define occ2_lbl 0160 `"Farming, fishing, and forestry occupations"', add
label define occ2_lbl 0170 `"Construction and extraction occupations"', add
label define occ2_lbl 0180 `"Installation, maintenance, and repair occupations"', add
label define occ2_lbl 0190 `"Production occupations"', add
label define occ2_lbl 0200 `"Transportation and material moving occupations"', add
label define occ2_lbl 9999 `"NIU (Not in universe)"', add
label values occ2 occ2_lbl

label define ind2_lbl 0100 `"Agriculture"'
label define ind2_lbl 0101 `"Forestry, logging, fishing, hunting, and trapping"', add
label define ind2_lbl 0110 `"Mining"', add
label define ind2_lbl 0120 `"Construction"', add
label define ind2_lbl 0130 `"Nonmetallic mineral product manufacturing"', add
label define ind2_lbl 0131 `"Primary metals and fabricated metal products"', add
label define ind2_lbl 0132 `"Machinery manufacturing"', add
label define ind2_lbl 0133 `"Computer and electronic product mfg"', add
label define ind2_lbl 0134 `"Electrical equipment, appliance mfg"', add
label define ind2_lbl 0135 `"Transportation equipment manufacturing"', add
label define ind2_lbl 0136 `"Wood product manufacturing"', add
label define ind2_lbl 0137 `"Furniture and fixtures manufacturing"', add
label define ind2_lbl 0138 `"Miscellaneous and not specified mfg"', add
label define ind2_lbl 0140 `"Food manufacturing"', add
label define ind2_lbl 0141 `"Beverage and tobacco product mfg"', add
label define ind2_lbl 0142 `"Textile, apparel, and leather manufacturing"', add
label define ind2_lbl 0143 `"Paper manufacturing and printing"', add
label define ind2_lbl 0144 `"Petroleum and coal products manufacturing"', add
label define ind2_lbl 0145 `"Chemical manufacturing"', add
label define ind2_lbl 0146 `"Plastics and rubber products manufacturing"', add
label define ind2_lbl 0150 `"Wholesale trade"', add
label define ind2_lbl 0160 `"Retail trade"', add
label define ind2_lbl 0170 `"Transportation and warehousing"', add
label define ind2_lbl 0180 `"Utilities"', add
label define ind2_lbl 0190 `"Publishing industries (except internet)"', add
label define ind2_lbl 0191 `"Motion picture and sound recording industries"', add
label define ind2_lbl 0192 `"Broadcasting (except internet)"', add
label define ind2_lbl 0193 `"Internet publishing and broadcasting"', add
label define ind2_lbl 0194 `"Telecommunications"', add
label define ind2_lbl 0195 `"Internet svc providers and data processing svcs"', add
label define ind2_lbl 0196 `"Other information services"', add
label define ind2_lbl 0200 `"Finance"', add
label define ind2_lbl 0201 `"Insurance"', add
label define ind2_lbl 0210 `"Real estate"', add
label define ind2_lbl 0211 `"Rental and leasing services"', add
label define ind2_lbl 0220 `"Professional, scientific, and technical services"', add
label define ind2_lbl 0230 `"Management of companies and enterprises"', add
label define ind2_lbl 0231 `"Administrative and support services"', add
label define ind2_lbl 0232 `"Waste management and remediation services"', add
label define ind2_lbl 0240 `"Educational services"', add
label define ind2_lbl 0250 `"Hospitals"', add
label define ind2_lbl 0251 `"Health care services, except hospitals"', add
label define ind2_lbl 0252 `"Social assistance"', add
label define ind2_lbl 0260 `"Arts, entertainment, and recreation"', add
label define ind2_lbl 0270 `"Traveler accommodation"', add
label define ind2_lbl 0271 `"Food services and drinking places"', add
label define ind2_lbl 0280 `"Private households"', add
label define ind2_lbl 0290 `"Repair and maintenance"', add
label define ind2_lbl 0291 `"Personal and laundry services"', add
label define ind2_lbl 0292 `"Membership associations and organizations"', add
label define ind2_lbl 0300 `"Public administration"', add
label define ind2_lbl 9999 `"NIU (Not in universe)"', add
label values ind2 ind2_lbl

label define whyabsnt_lbl 001 `"On layoff (temporary or indefinite)"'
label define whyabsnt_lbl 002 `"Slack work/business conditions"', add
label define whyabsnt_lbl 003 `"Waiting for a new job to begin"', add
label define whyabsnt_lbl 004 `"Vacation/personal days"', add
label define whyabsnt_lbl 005 `"Own illness/injury/medical problems"', add
label define whyabsnt_lbl 006 `"Childcare problems"', add
label define whyabsnt_lbl 007 `"Other family/personal obligation"', add
label define whyabsnt_lbl 008 `"Maternity/paternity leave"', add
label define whyabsnt_lbl 009 `"Labor dispute"', add
label define whyabsnt_lbl 010 `"Weather affected job"', add
label define whyabsnt_lbl 011 `"School/training"', add
label define whyabsnt_lbl 012 `"Civic/military duty"', add
label define whyabsnt_lbl 013 `"Does not work in the business"', add
label define whyabsnt_lbl 014 `"Other family/personal obligation"', add
label define whyabsnt_lbl 999 `"NIU (Not in universe)"', add
label values whyabsnt whyabsnt_lbl

label define fullpart_lbl 01 `"Full time"'
label define fullpart_lbl 02 `"Part time"', add
label define fullpart_lbl 99 `"NIU (Not in universe)"', add
label values fullpart fullpart_lbl

label define paidhour_lbl 01 `"Paid hourly"'
label define paidhour_lbl 02 `"Not paid hourly"', add
label define paidhour_lbl 99 `"NIU (Not in universe)"', add
label values paidhour paidhour_lbl

label define earnrpt_lbl 01 `"Hourly"'
label define earnrpt_lbl 02 `"Weekly"', add
label define earnrpt_lbl 03 `"Bi-weekly"', add
label define earnrpt_lbl 04 `"Twice monthly"', add
label define earnrpt_lbl 05 `"Monthly"', add
label define earnrpt_lbl 06 `"Annually"', add
label define earnrpt_lbl 07 `"Other"', add
label define earnrpt_lbl 99 `"NIU (Not in universe)"', add
label values earnrpt earnrpt_lbl

label define hrsatrate_lbl 001 `"1"'
label define hrsatrate_lbl 002 `"2"', add
label define hrsatrate_lbl 003 `"3"', add
label define hrsatrate_lbl 004 `"4"', add
label define hrsatrate_lbl 005 `"5"', add
label define hrsatrate_lbl 006 `"6"', add
label define hrsatrate_lbl 007 `"7"', add
label define hrsatrate_lbl 008 `"8"', add
label define hrsatrate_lbl 009 `"9"', add
label define hrsatrate_lbl 010 `"10"', add
label define hrsatrate_lbl 011 `"11"', add
label define hrsatrate_lbl 012 `"12"', add
label define hrsatrate_lbl 013 `"13"', add
label define hrsatrate_lbl 014 `"14"', add
label define hrsatrate_lbl 015 `"15"', add
label define hrsatrate_lbl 016 `"16"', add
label define hrsatrate_lbl 017 `"17"', add
label define hrsatrate_lbl 018 `"18"', add
label define hrsatrate_lbl 019 `"19"', add
label define hrsatrate_lbl 020 `"20"', add
label define hrsatrate_lbl 021 `"21"', add
label define hrsatrate_lbl 022 `"22"', add
label define hrsatrate_lbl 023 `"23"', add
label define hrsatrate_lbl 024 `"24"', add
label define hrsatrate_lbl 025 `"25"', add
label define hrsatrate_lbl 026 `"26"', add
label define hrsatrate_lbl 027 `"27"', add
label define hrsatrate_lbl 028 `"28"', add
label define hrsatrate_lbl 029 `"29"', add
label define hrsatrate_lbl 030 `"30"', add
label define hrsatrate_lbl 031 `"31"', add
label define hrsatrate_lbl 032 `"32"', add
label define hrsatrate_lbl 033 `"33"', add
label define hrsatrate_lbl 034 `"34"', add
label define hrsatrate_lbl 035 `"35"', add
label define hrsatrate_lbl 036 `"36"', add
label define hrsatrate_lbl 037 `"37"', add
label define hrsatrate_lbl 038 `"38"', add
label define hrsatrate_lbl 039 `"39"', add
label define hrsatrate_lbl 040 `"40"', add
label define hrsatrate_lbl 041 `"41"', add
label define hrsatrate_lbl 042 `"42"', add
label define hrsatrate_lbl 043 `"43"', add
label define hrsatrate_lbl 044 `"44"', add
label define hrsatrate_lbl 045 `"45"', add
label define hrsatrate_lbl 046 `"46"', add
label define hrsatrate_lbl 047 `"47"', add
label define hrsatrate_lbl 048 `"48"', add
label define hrsatrate_lbl 049 `"49"', add
label define hrsatrate_lbl 050 `"50"', add
label define hrsatrate_lbl 051 `"51"', add
label define hrsatrate_lbl 052 `"52"', add
label define hrsatrate_lbl 053 `"53"', add
label define hrsatrate_lbl 054 `"54"', add
label define hrsatrate_lbl 055 `"55"', add
label define hrsatrate_lbl 056 `"56"', add
label define hrsatrate_lbl 057 `"57"', add
label define hrsatrate_lbl 058 `"58"', add
label define hrsatrate_lbl 059 `"59"', add
label define hrsatrate_lbl 060 `"60"', add
label define hrsatrate_lbl 061 `"61"', add
label define hrsatrate_lbl 062 `"62"', add
label define hrsatrate_lbl 063 `"63"', add
label define hrsatrate_lbl 064 `"64"', add
label define hrsatrate_lbl 065 `"65"', add
label define hrsatrate_lbl 066 `"66"', add
label define hrsatrate_lbl 067 `"67"', add
label define hrsatrate_lbl 068 `"68"', add
label define hrsatrate_lbl 069 `"69"', add
label define hrsatrate_lbl 070 `"70"', add
label define hrsatrate_lbl 071 `"71"', add
label define hrsatrate_lbl 072 `"72"', add
label define hrsatrate_lbl 073 `"73"', add
label define hrsatrate_lbl 074 `"74"', add
label define hrsatrate_lbl 075 `"75"', add
label define hrsatrate_lbl 076 `"76"', add
label define hrsatrate_lbl 077 `"77"', add
label define hrsatrate_lbl 078 `"78"', add
label define hrsatrate_lbl 079 `"79"', add
label define hrsatrate_lbl 080 `"80"', add
label define hrsatrate_lbl 081 `"81"', add
label define hrsatrate_lbl 082 `"82"', add
label define hrsatrate_lbl 083 `"83"', add
label define hrsatrate_lbl 084 `"84"', add
label define hrsatrate_lbl 085 `"85"', add
label define hrsatrate_lbl 086 `"86"', add
label define hrsatrate_lbl 087 `"87"', add
label define hrsatrate_lbl 088 `"88"', add
label define hrsatrate_lbl 089 `"89"', add
label define hrsatrate_lbl 090 `"90"', add
label define hrsatrate_lbl 091 `"91"', add
label define hrsatrate_lbl 092 `"92"', add
label define hrsatrate_lbl 093 `"93"', add
label define hrsatrate_lbl 094 `"94"', add
label define hrsatrate_lbl 095 `"95"', add
label define hrsatrate_lbl 096 `"96"', add
label define hrsatrate_lbl 097 `"97"', add
label define hrsatrate_lbl 098 `"98"', add
label define hrsatrate_lbl 099 `"99"', add
label define hrsatrate_lbl 100 `"100"', add
label define hrsatrate_lbl 996 `"Refused"', add
label define hrsatrate_lbl 997 `"Don't know"', add
label define hrsatrate_lbl 998 `"Blank"', add
label define hrsatrate_lbl 999 `"NIU (Not in universe)"', add
label values hrsatrate hrsatrate_lbl

label define otusual_lbl 00 `"No"'
label define otusual_lbl 01 `"Yes"', add
label define otusual_lbl 99 `"NIU (Not in universe)"', add
label values otusual otusual_lbl

label define spousepres_lbl 01 `"Spouse present"'
label define spousepres_lbl 02 `"Unmarried partner present"', add
label define spousepres_lbl 03 `"No spouse or unmarried partner present"', add
label define spousepres_lbl 99 `"NIU (Not in universe)"', add
label values spousepres spousepres_lbl

label define sprace_lbl 0100 `"White only"'
label define sprace_lbl 0110 `"Black only"', add
label define sprace_lbl 0120 `"American Indian, Alaskan Native"', add
label define sprace_lbl 0130 `"Asian or Pacific Islander"', add
label define sprace_lbl 0131 `"Asian only"', add
label define sprace_lbl 0132 `"Hawaiian Pacific Islander only"', add
label define sprace_lbl 0200 `"White-Black"', add
label define sprace_lbl 0201 `"White-American Indian"', add
label define sprace_lbl 0202 `"White-Asian"', add
label define sprace_lbl 0203 `"White-Hawaiian"', add
label define sprace_lbl 0210 `"Black-American Indian"', add
label define sprace_lbl 0211 `"Black-Asian"', add
label define sprace_lbl 0212 `"Black-Hawaiian"', add
label define sprace_lbl 0220 `"American Indian-Asian"', add
label define sprace_lbl 0221 `"American Indian-Hawaiian"', add
label define sprace_lbl 0230 `"Asian-Hawaiian"', add
label define sprace_lbl 0300 `"White-Black-American Indian"', add
label define sprace_lbl 0301 `"White-Black-Asian"', add
label define sprace_lbl 0302 `"White-Black-Hawaiian"', add
label define sprace_lbl 0310 `"White-American Indian-Asian"', add
label define sprace_lbl 0311 `"White-American Indian-Hawaiian"', add
label define sprace_lbl 0320 `"White-Asian-Hawaiian"', add
label define sprace_lbl 0330 `"Black-American Indian-Asian"', add
label define sprace_lbl 0331 `"Black-American Indian-Hawaiian"', add
label define sprace_lbl 0340 `"Black-Asian-Hawaiian"', add
label define sprace_lbl 0350 `"American Indian-Asian-Hawaiian"', add
label define sprace_lbl 0398 `"Other 3 race combinations"', add
label define sprace_lbl 0399 `"2 or 3 races, unspecified"', add
label define sprace_lbl 0400 `"White-Black-American Indian-Asian"', add
label define sprace_lbl 0401 `"White-Black-American Indian-Hawaiian"', add
label define sprace_lbl 0402 `"White-Black-Asian-Hawaiian"', add
label define sprace_lbl 0403 `"Black-American Indian-Asian-Hawaiian"', add
label define sprace_lbl 0500 `"White-Black-American Indian-Asian-Hawaiian"', add
label define sprace_lbl 0599 `"4 or 5 races, unspecified"', add
label define sprace_lbl 9998 `"Not Available (see description)"', add
label define sprace_lbl 9999 `"NIU (Not in universe)"', add
label values sprace sprace_lbl

label define sphispan_lbl 0100 `"Not Hispanic"'
label define sphispan_lbl 0210 `"Mexican"', add
label define sphispan_lbl 0211 `"Mexican American"', add
label define sphispan_lbl 0212 `"Chicano"', add
label define sphispan_lbl 0213 `"Mexcian (Mexicano)"', add
label define sphispan_lbl 0220 `"Puerto Rican"', add
label define sphispan_lbl 0230 `"Cuban"', add
label define sphispan_lbl 0240 `"Central-South American"', add
label define sphispan_lbl 0250 `"Other Spanish"', add
label define sphispan_lbl 9998 `"Not available (see description)"', add
label define sphispan_lbl 9999 `"NIU (Not in universe)"', add
label values sphispan sphispan_lbl

label define speduc_lbl 010 `"Less than 1st grade"'
label define speduc_lbl 011 `"1st, 2nd, 3rd, or 4th grade"', add
label define speduc_lbl 012 `"5th or 6th grade"', add
label define speduc_lbl 013 `"7th or 8th grade"', add
label define speduc_lbl 014 `"9th grade"', add
label define speduc_lbl 015 `"10th grade"', add
label define speduc_lbl 016 `"11th grade"', add
label define speduc_lbl 017 `"12th grade - no diploma"', add
label define speduc_lbl 020 `"High school graduate - GED"', add
label define speduc_lbl 021 `"High school graduate - diploma"', add
label define speduc_lbl 030 `"Some college but no degree"', add
label define speduc_lbl 031 `"Associate degree - occupational vocational"', add
label define speduc_lbl 032 `"Associate degree - academic program"', add
label define speduc_lbl 040 `"Bachelor's degree (BA, AB, BS, etc.)"', add
label define speduc_lbl 041 `"Master's degree (MA, MS, MEng, MEd, MSW, etc.)"', add
label define speduc_lbl 042 `"Professional school degree (MD, DDS, DVM, etc.)"', add
label define speduc_lbl 043 `"Doctoral degree (PhD, EdD, etc.)"', add
label define speduc_lbl 998 `"Not available (see description)"', add
label define speduc_lbl 999 `"NIU (Not in universe)"', add
label values speduc speduc_lbl

label define spempnot_lbl 00 `"Not employed"'
label define spempnot_lbl 01 `"Employed"', add
label define spempnot_lbl 99 `"NIU (Not in universe)"', add
label values spempnot spempnot_lbl

label define spempstat_lbl 01 `"Employed - at work"'
label define spempstat_lbl 02 `"Employed - not at work"', add
label define spempstat_lbl 03 `"Not employed"', add
label define spempstat_lbl 04 `"Retired"', add
label define spempstat_lbl 05 `"Disabled"', add
label define spempstat_lbl 06 `"Unable to work"', add
label define spempstat_lbl 96 `"Refused"', add
label define spempstat_lbl 97 `"Don't know"', add
label define spempstat_lbl 98 `"Blank"', add
label define spempstat_lbl 99 `"NIU (Not in universe)"', add
label values spempstat spempstat_lbl

label define spusualhrs_lbl 000 `"0"'
label define spusualhrs_lbl 001 `"1"', add
label define spusualhrs_lbl 002 `"2"', add
label define spusualhrs_lbl 003 `"3"', add
label define spusualhrs_lbl 004 `"4"', add
label define spusualhrs_lbl 005 `"5"', add
label define spusualhrs_lbl 006 `"6"', add
label define spusualhrs_lbl 007 `"7"', add
label define spusualhrs_lbl 008 `"8"', add
label define spusualhrs_lbl 009 `"9"', add
label define spusualhrs_lbl 010 `"10"', add
label define spusualhrs_lbl 011 `"11"', add
label define spusualhrs_lbl 012 `"12"', add
label define spusualhrs_lbl 013 `"13"', add
label define spusualhrs_lbl 014 `"14"', add
label define spusualhrs_lbl 015 `"15"', add
label define spusualhrs_lbl 016 `"16"', add
label define spusualhrs_lbl 017 `"17"', add
label define spusualhrs_lbl 018 `"18"', add
label define spusualhrs_lbl 019 `"19"', add
label define spusualhrs_lbl 020 `"20"', add
label define spusualhrs_lbl 021 `"21"', add
label define spusualhrs_lbl 022 `"22"', add
label define spusualhrs_lbl 023 `"23"', add
label define spusualhrs_lbl 024 `"24"', add
label define spusualhrs_lbl 025 `"25"', add
label define spusualhrs_lbl 026 `"26"', add
label define spusualhrs_lbl 027 `"27"', add
label define spusualhrs_lbl 028 `"28"', add
label define spusualhrs_lbl 029 `"29"', add
label define spusualhrs_lbl 030 `"30"', add
label define spusualhrs_lbl 031 `"31"', add
label define spusualhrs_lbl 032 `"32"', add
label define spusualhrs_lbl 033 `"33"', add
label define spusualhrs_lbl 034 `"34"', add
label define spusualhrs_lbl 035 `"35"', add
label define spusualhrs_lbl 036 `"36"', add
label define spusualhrs_lbl 037 `"37"', add
label define spusualhrs_lbl 038 `"38"', add
label define spusualhrs_lbl 039 `"39"', add
label define spusualhrs_lbl 040 `"40"', add
label define spusualhrs_lbl 041 `"41"', add
label define spusualhrs_lbl 042 `"42"', add
label define spusualhrs_lbl 043 `"43"', add
label define spusualhrs_lbl 044 `"44"', add
label define spusualhrs_lbl 045 `"45"', add
label define spusualhrs_lbl 046 `"46"', add
label define spusualhrs_lbl 047 `"47"', add
label define spusualhrs_lbl 048 `"48"', add
label define spusualhrs_lbl 049 `"49"', add
label define spusualhrs_lbl 050 `"50"', add
label define spusualhrs_lbl 051 `"51"', add
label define spusualhrs_lbl 052 `"52"', add
label define spusualhrs_lbl 053 `"53"', add
label define spusualhrs_lbl 054 `"54"', add
label define spusualhrs_lbl 055 `"55"', add
label define spusualhrs_lbl 056 `"56"', add
label define spusualhrs_lbl 057 `"57"', add
label define spusualhrs_lbl 058 `"58"', add
label define spusualhrs_lbl 059 `"59"', add
label define spusualhrs_lbl 060 `"60"', add
label define spusualhrs_lbl 061 `"61"', add
label define spusualhrs_lbl 062 `"62"', add
label define spusualhrs_lbl 063 `"63"', add
label define spusualhrs_lbl 064 `"64"', add
label define spusualhrs_lbl 065 `"65"', add
label define spusualhrs_lbl 066 `"66"', add
label define spusualhrs_lbl 067 `"67"', add
label define spusualhrs_lbl 068 `"68"', add
label define spusualhrs_lbl 069 `"69"', add
label define spusualhrs_lbl 070 `"70"', add
label define spusualhrs_lbl 071 `"71"', add
label define spusualhrs_lbl 072 `"72"', add
label define spusualhrs_lbl 073 `"73"', add
label define spusualhrs_lbl 074 `"74"', add
label define spusualhrs_lbl 075 `"75"', add
label define spusualhrs_lbl 076 `"76"', add
label define spusualhrs_lbl 077 `"77"', add
label define spusualhrs_lbl 078 `"78"', add
label define spusualhrs_lbl 079 `"79"', add
label define spusualhrs_lbl 080 `"80"', add
label define spusualhrs_lbl 081 `"81"', add
label define spusualhrs_lbl 082 `"82"', add
label define spusualhrs_lbl 083 `"83"', add
label define spusualhrs_lbl 084 `"84"', add
label define spusualhrs_lbl 085 `"85"', add
label define spusualhrs_lbl 086 `"86"', add
label define spusualhrs_lbl 087 `"87"', add
label define spusualhrs_lbl 088 `"88"', add
label define spusualhrs_lbl 089 `"89"', add
label define spusualhrs_lbl 090 `"90"', add
label define spusualhrs_lbl 091 `"91"', add
label define spusualhrs_lbl 092 `"92"', add
label define spusualhrs_lbl 093 `"93"', add
label define spusualhrs_lbl 094 `"94"', add
label define spusualhrs_lbl 095 `"95"', add
label define spusualhrs_lbl 096 `"96"', add
label define spusualhrs_lbl 097 `"97"', add
label define spusualhrs_lbl 098 `"98"', add
label define spusualhrs_lbl 099 `"99"', add
label define spusualhrs_lbl 995 `"Hours vary"', add
label define spusualhrs_lbl 999 `"NIU (Not in universe)"', add
label values spusualhrs spusualhrs_lbl

label define kidund18_lbl 00 `"No"'
label define kidund18_lbl 01 `"Yes"', add
label define kidund18_lbl 99 `"NIU (Not in universe)"', add
label values kidund18 kidund18_lbl

label define hh_numownkids_lbl 00 `"0"'
label define hh_numownkids_lbl 01 `"1"', add
label define hh_numownkids_lbl 02 `"2"', add
label define hh_numownkids_lbl 03 `"3"', add
label define hh_numownkids_lbl 04 `"4"', add
label define hh_numownkids_lbl 05 `"5"', add
label define hh_numownkids_lbl 06 `"6"', add
label define hh_numownkids_lbl 07 `"7"', add
label define hh_numownkids_lbl 08 `"8"', add
label define hh_numownkids_lbl 09 `"9"', add
label define hh_numownkids_lbl 10 `"10"', add
label define hh_numownkids_lbl 99 `"NIU (Not in universe)"', add
label values hh_numownkids hh_numownkids_lbl

label define kidund13_lbl 00 `"No"'
label define kidund13_lbl 01 `"Yes"', add
label define kidund13_lbl 99 `"NIU (Not in universe)"', add
label values kidund13 kidund13_lbl

label define kidund1_lbl 00 `"No"'
label define kidund1_lbl 01 `"Yes"', add
label define kidund1_lbl 99 `"NIU (Not in universe)"', add
label values kidund1 kidund1_lbl

label define kid1to2_lbl 00 `"No"'
label define kid1to2_lbl 01 `"Yes"', add
label define kid1to2_lbl 99 `"NIU (Not in universe)"', add
label values kid1to2 kid1to2_lbl

label define kid3to5_lbl 00 `"No"'
label define kid3to5_lbl 01 `"Yes"', add
label define kid3to5_lbl 99 `"NIU (Not in universe)"', add
label values kid3to5 kid3to5_lbl

label define kid6to12_lbl 00 `"No"'
label define kid6to12_lbl 01 `"Yes"', add
label define kid6to12_lbl 99 `"NIU (Not in universe)"', add
label values kid6to12 kid6to12_lbl

label define kid13to17_lbl 00 `"No"'
label define kid13to17_lbl 01 `"Yes"', add
label define kid13to17_lbl 99 `"NIU (Not in universe)"', add
label values kid13to17 kid13to17_lbl

label define dtrund18_lbl 00 `"No"'
label define dtrund18_lbl 01 `"Yes"', add
label define dtrund18_lbl 99 `"NIU (Not in universe)"', add
label values dtrund18 dtrund18_lbl

label define dtrund1_lbl 00 `"No"'
label define dtrund1_lbl 01 `"Yes"', add
label define dtrund1_lbl 99 `"NIU (Not in universe)"', add
label values dtrund1 dtrund1_lbl

label define dtr1to2_lbl 00 `"No"'
label define dtr1to2_lbl 01 `"Yes"', add
label define dtr1to2_lbl 99 `"NIU (Not in universe)"', add
label values dtr1to2 dtr1to2_lbl

label define dtr3to5_lbl 00 `"No"'
label define dtr3to5_lbl 01 `"Yes"', add
label define dtr3to5_lbl 99 `"NIU (Not in universe)"', add
label values dtr3to5 dtr3to5_lbl

label define dtr6to12_lbl 00 `"No"'
label define dtr6to12_lbl 01 `"Yes"', add
label define dtr6to12_lbl 99 `"NIU (Not in universe)"', add
label values dtr6to12 dtr6to12_lbl

label define dtr13to17_lbl 00 `"No"'
label define dtr13to17_lbl 01 `"Yes"', add
label define dtr13to17_lbl 99 `"NIU (Not in universe)"', add
label values dtr13to17 dtr13to17_lbl

label define sonund18_lbl 00 `"No"'
label define sonund18_lbl 01 `"Yes"', add
label define sonund18_lbl 99 `"NIU (Not in universe)"', add
label values sonund18 sonund18_lbl

label define sonund1_lbl 00 `"No"'
label define sonund1_lbl 01 `"Yes"', add
label define sonund1_lbl 99 `"NIU (Not in universe)"', add
label values sonund1 sonund1_lbl

label define son1to2_lbl 00 `"No"'
label define son1to2_lbl 01 `"Yes"', add
label define son1to2_lbl 99 `"NIU (Not in universe)"', add
label values son1to2 son1to2_lbl

label define son3to5_lbl 00 `"No"'
label define son3to5_lbl 01 `"Yes"', add
label define son3to5_lbl 99 `"NIU (Not in universe)"', add
label values son3to5 son3to5_lbl

label define son6to12_lbl 00 `"No"'
label define son6to12_lbl 01 `"Yes"', add
label define son6to12_lbl 99 `"NIU (Not in universe)"', add
label values son6to12 son6to12_lbl

label define son13to17_lbl 00 `"No"'
label define son13to17_lbl 01 `"Yes"', add
label define son13to17_lbl 99 `"NIU (Not in universe)"', add
label values son13to17 son13to17_lbl

label define nonhhchild_lbl 00 `"No"'
label define nonhhchild_lbl 01 `"Yes"', add
label define nonhhchild_lbl 99 `"NIU (Not in universe)"', add
label values nonhhchild nonhhchild_lbl

label define activity_lbl 010000 `"Personal Care"'
label define activity_lbl 010100 `"Sleeping"', add
label define activity_lbl 010101 `"Sleeping"', add
label define activity_lbl 010102 `"Sleeplessness"', add
label define activity_lbl 010199 `"Sleeping, n.e.c."', add
label define activity_lbl 010200 `"Grooming"', add
label define activity_lbl 010201 `"Washing, dressing and grooming oneself"', add
label define activity_lbl 010299 `"Grooming, n.e.c."', add
label define activity_lbl 010300 `"Health-Related Self Care"', add
label define activity_lbl 010301 `"Health-related self care"', add
label define activity_lbl 010399 `"Self care, n.e.c."', add
label define activity_lbl 010400 `"Personal Activities"', add
label define activity_lbl 010401 `"Personal/Private activities"', add
label define activity_lbl 010499 `"Personal activities, n.e.c."', add
label define activity_lbl 010500 `"Personal Care Emergencies"', add
label define activity_lbl 010501 `"Personal emergencies"', add
label define activity_lbl 010599 `"Personal care emergencies, n.e.c."', add
label define activity_lbl 019900 `"Personal Care, n.e.c."', add
label define activity_lbl 019999 `"Personal care, n.e.c."', add
label define activity_lbl 020000 `"Household Activities"', add
label define activity_lbl 020100 `"Housework"', add
label define activity_lbl 020101 `"Interior cleaning"', add
label define activity_lbl 020102 `"Laundry"', add
label define activity_lbl 020103 `"Sewing, repairing, and maintaining textiles"', add
label define activity_lbl 020104 `"Storing interior hh items, inc. food"', add
label define activity_lbl 020199 `"Housework, n.e.c."', add
label define activity_lbl 020200 `"Food and Drink Preparation, Presentation, and Clean-up"', add
label define activity_lbl 020201 `"Food and drink preparation "', add
label define activity_lbl 020202 `"Food presentation"', add
label define activity_lbl 020203 `"Kitchen and food clean-up"', add
label define activity_lbl 020299 `"Food and drink prep, serving and clean-up, n.e.c."', add
label define activity_lbl 020300 `"Interior Maintenance, Repair, and Decoration"', add
label define activity_lbl 020301 `"Interior arrangement, decoration, and repairs"', add
label define activity_lbl 020302 `"Building and repairing furniture"', add
label define activity_lbl 020303 `"Heating and cooling"', add
label define activity_lbl 020399 `"Interior maintenance, repair, and decoration, n.e.c."', add
label define activity_lbl 020400 `"Exterior Maintenance, Repair, and Decoration"', add
label define activity_lbl 020401 `"Exterior cleaning"', add
label define activity_lbl 020402 `"Exterior repair, improvements, and decoration"', add
label define activity_lbl 020499 `"Exterior maintenance, repair and decoration, n.e.c."', add
label define activity_lbl 020500 `"Lawn, Garden, and Houseplants"', add
label define activity_lbl 020501 `"Lawn, garden, and houseplant care"', add
label define activity_lbl 020502 `"Ponds, pools, and hot tubs"', add
label define activity_lbl 020599 `"Lawn and garden, n.e.c."', add
label define activity_lbl 020600 `"Animals and Pets"', add
label define activity_lbl 020601 `"Care for animals and pets (not veterinary care)"', add
label define activity_lbl 020602 `"Care for animals and pets (not veterinary care) (2008+)"', add
label define activity_lbl 020603 `"Walking, exercising, playing with animals (2008+)"', add
label define activity_lbl 020699 `"Pet and animal care, n.e.c."', add
label define activity_lbl 020700 `"Vehicles"', add
label define activity_lbl 020701 `"Vehicle repair and maintenance (by self)"', add
label define activity_lbl 020799 `"Vehicles, n.e.c."', add
label define activity_lbl 020800 `"Appliances, Tools, and Toys"', add
label define activity_lbl 020801 `"App, tool, toy set-up, repair, and maint (by self)"', add
label define activity_lbl 020899 `"Appliances and tools, n.e.c."', add
label define activity_lbl 020900 `"Household Management"', add
label define activity_lbl 020901 `"Financial management"', add
label define activity_lbl 020902 `"Household and personal organization and planning"', add
label define activity_lbl 020903 `"HH and personal mail and messages (except e-mail)"', add
label define activity_lbl 020904 `"HH and personal e-mail and messages"', add
label define activity_lbl 020905 `"Home security"', add
label define activity_lbl 020999 `"Household management, n.e.c."', add
label define activity_lbl 029900 `"Household Activities, n.e.c."', add
label define activity_lbl 029999 `"Household activities, n.e.c."', add
label define activity_lbl 030000 `"Caring for and Helping Household Members"', add
label define activity_lbl 030100 `"Caring for and Helping Household Children"', add
label define activity_lbl 030101 `"Physical care for hh children"', add
label define activity_lbl 030102 `"Reading to/with hh children"', add
label define activity_lbl 030103 `"Playing with hh children, not sports"', add
label define activity_lbl 030104 `"Arts and crafts with hh children"', add
label define activity_lbl 030105 `"Playing sports with hh children"', add
label define activity_lbl 030106 `"Talking with/listening to hh children"', add
label define activity_lbl 030107 `"Helping or teaching hh children"', add
label define activity_lbl 030108 `"Organization and planning for hh children"', add
label define activity_lbl 030109 `"Looking after hh children (as a primary activity)"', add
label define activity_lbl 030110 `"Attending hh children's events"', add
label define activity_lbl 030111 `"Waiting for/with hh children"', add
label define activity_lbl 030112 `"Picking up/dropping off hh children"', add
label define activity_lbl 030199 `"Caring for and helping hh children, n.e.c."', add
label define activity_lbl 030200 `"Activities Related to Household Children's Education"', add
label define activity_lbl 030201 `"Homework (hh children)"', add
label define activity_lbl 030202 `"Meetings and school conferences (hh children)"', add
label define activity_lbl 030203 `"Home schooling of hh children"', add
label define activity_lbl 030204 `"Waiting associated with hh children's education"', add
label define activity_lbl 030299 `"Activities related to hh child's education, n.e.c."', add
label define activity_lbl 030300 `"Activities Related to Household Children's Health"', add
label define activity_lbl 030301 `"Providing medical care to hh children"', add
label define activity_lbl 030302 `"Obtaining medical care for hh children"', add
label define activity_lbl 030303 `"Waiting associated with hh children's health"', add
label define activity_lbl 030399 `"Activities related to hh child's health, n.e.c."', add
label define activity_lbl 030400 `"Caring for Household Adults"', add
label define activity_lbl 030401 `"Physical care for hh adults"', add
label define activity_lbl 030402 `"Looking after hh adult (as a primary activity)"', add
label define activity_lbl 030403 `"Providing medical care to hh adult"', add
label define activity_lbl 030404 `"Obtaining medical and care services for hh adult"', add
label define activity_lbl 030405 `"Waiting associated with caring for hh adults"', add
label define activity_lbl 030499 `"Caring for household adults, n.e.c."', add
label define activity_lbl 030500 `"Helping Household Adults"', add
label define activity_lbl 030501 `"Helping hh adults"', add
label define activity_lbl 030502 `"Organization and planning for hh adults"', add
label define activity_lbl 030503 `"Picking up/dropping off hh adult"', add
label define activity_lbl 030504 `"Waiting associated with helping hh adults"', add
label define activity_lbl 030599 `"Helping household adults, n.e.c."', add
label define activity_lbl 039900 `"Caring for and Helping Household Members, n.e.c."', add
label define activity_lbl 039999 `"Caring for and helping hh members, n.e.c."', add
label define activity_lbl 040000 `"Caring for and Helping Non-Household Members"', add
label define activity_lbl 040100 `"Caring for and Helping Non-Household Children"', add
label define activity_lbl 040101 `"Physical care for nonhh children"', add
label define activity_lbl 040102 `"Reading to/with nonhh children"', add
label define activity_lbl 040103 `"Playing with nonhh children, not sports"', add
label define activity_lbl 040104 `"Arts and crafts with nonhh children"', add
label define activity_lbl 040105 `"Playing sports with nonhh children"', add
label define activity_lbl 040106 `"Talking with/listening to nonhh children"', add
label define activity_lbl 040107 `"Helping or teaching nonhh children"', add
label define activity_lbl 040108 `"Organization and planning for nonhh children"', add
label define activity_lbl 040109 `"Looking after nonhh children (as primary activity)"', add
label define activity_lbl 040110 `"Attending nonhh children's events"', add
label define activity_lbl 040111 `"Waiting for/with nonhh children"', add
label define activity_lbl 040112 `"Dropping off/picking up nonhh children"', add
label define activity_lbl 040199 `"Caring for and helping nonhh children, n.e.c."', add
label define activity_lbl 040200 `"Activities Related to Non-Household Children's Education"', add
label define activity_lbl 040201 `"Homework (nonhh children)"', add
label define activity_lbl 040202 `"Mtgs and school conferences (nonhh children)"', add
label define activity_lbl 040203 `"Home schooling of nonhh children"', add
label define activity_lbl 040204 `"Waiting assoc w/ nonhh children's education"', add
label define activity_lbl 040299 `"Activities related to nonhh child's educ., n.e.c."', add
label define activity_lbl 040300 `"Activities Related to Non-Household Children's Health"', add
label define activity_lbl 040301 `"Providing medical care to nonhh children"', add
label define activity_lbl 040302 `"Obtaining medical care for nonhh children"', add
label define activity_lbl 040303 `"Waiting associated with nonhh children's health"', add
label define activity_lbl 040399 `"Activities related to nonhh child's health, n.e.c."', add
label define activity_lbl 040400 `"Caring for Non-Household Adults"', add
label define activity_lbl 040401 `"Physical care for nonhh adults"', add
label define activity_lbl 040402 `"Looking after nonhh adult (as a primary activity)"', add
label define activity_lbl 040403 `"Providing medical care to nonhh adult"', add
label define activity_lbl 040404 `"Obtaining medical and care svcs for nonhh adult"', add
label define activity_lbl 040405 `"Waiting associated with caring for nonhh adults"', add
label define activity_lbl 040499 `"Caring for nonhh adults, n.e.c."', add
label define activity_lbl 040500 `"Helping Non-Household Adults"', add
label define activity_lbl 040501 `"Hswrk, cooking, and shopping asst, nonhh adults"', add
label define activity_lbl 040502 `"House and lawn maint and repair asst, nonhh adults"', add
label define activity_lbl 040503 `"Animal and pet care assistance for nonhh adults"', add
label define activity_lbl 040504 `"Vehicle/appliance maint/repair asst, nonhh adults"', add
label define activity_lbl 040505 `"Financial mgmt asst for nonhh adults"', add
label define activity_lbl 040506 `"HH mgmt and paperwork asst, nonhh adults"', add
label define activity_lbl 040507 `"Picking up/dropping off nonhh adult"', add
label define activity_lbl 040508 `"Waiting associated with helping nonhh adults"', add
label define activity_lbl 040599 `"Helping nonhh adults, n.e.c."', add
label define activity_lbl 049900 `"Caring for and Helping Non-Household Members, n.e.c."', add
label define activity_lbl 049999 `"Caring for and helping nonhh members, n.e.c."', add
label define activity_lbl 050000 `"Work and Work-Related Activities"', add
label define activity_lbl 050100 `"Working"', add
label define activity_lbl 050101 `"Work, main job"', add
label define activity_lbl 050102 `"Work, other job(s)"', add
label define activity_lbl 050103 `"Security procedures related to work"', add
label define activity_lbl 050104 `"Waiting associated with working"', add
label define activity_lbl 050199 `"Working, n.e.c."', add
label define activity_lbl 050200 `"Work-Related Activities"', add
label define activity_lbl 050201 `"Socializing, relaxing, and leisure as part of job"', add
label define activity_lbl 050202 `"Eating and drinking as part of job"', add
label define activity_lbl 050203 `"Sports and exercise as part of job"', add
label define activity_lbl 050204 `"Security procedures as part of job"', add
label define activity_lbl 050205 `"Waiting associated with work-related activities"', add
label define activity_lbl 050299 `"Work-related activities, n.e.c."', add
label define activity_lbl 050300 `"Other Income-Generating Activities"', add
label define activity_lbl 050301 `"Income-generating hobbies, crafts, and food"', add
label define activity_lbl 050302 `"Income-generating performances "', add
label define activity_lbl 050303 `"Income-generating services "', add
label define activity_lbl 050304 `"Income-generating rental property activities"', add
label define activity_lbl 050305 `"Waiting assoc w/other income-generating acts"', add
label define activity_lbl 050399 `"Other income-generating activities, n.e.c."', add
label define activity_lbl 050400 `"Job Search and Interviewing"', add
label define activity_lbl 050401 `"Job search activities"', add
label define activity_lbl 050403 `"Job interviewing "', add
label define activity_lbl 050404 `"Waiting associated with job search or interview"', add
label define activity_lbl 050405 `"Sec. procedures rel. to job search/interviewing"', add
label define activity_lbl 050499 `"Job search and Interviewing, n.e.c."', add
label define activity_lbl 059900 `"Work and Work-Related Activities, n.e.c."', add
label define activity_lbl 059999 `"Work and work-related activities, n.e.c."', add
label define activity_lbl 060000 `"Education"', add
label define activity_lbl 060100 `"Taking Class"', add
label define activity_lbl 060101 `"Taking class for degree, certification, or lic"', add
label define activity_lbl 060102 `"Taking class for personal interest"', add
label define activity_lbl 060103 `"Waiting associated with taking classes"', add
label define activity_lbl 060104 `"Security procedures rel. to taking classes"', add
label define activity_lbl 060199 `"Taking class, n.e.c."', add
label define activity_lbl 060200 `"Extracurricular School Activities (except sports)"', add
label define activity_lbl 060201 `"Extracurricular club activities"', add
label define activity_lbl 060202 `"Extracurricular music and performance activities"', add
label define activity_lbl 060203 `"Extracurricular student government activities"', add
label define activity_lbl 060204 `"Waiting associated with extracurricular activities"', add
label define activity_lbl 060299 `"Education-related extracurricular activities, n.e.c."', add
label define activity_lbl 060300 `"Research or Homework"', add
label define activity_lbl 060301 `"Rsrch/HW for class for degree, cert, or lic"', add
label define activity_lbl 060302 `"Research/homework for class for pers. interest"', add
label define activity_lbl 060303 `"Waiting associated with research/homework"', add
label define activity_lbl 060399 `"Research/homework n.e.c."', add
label define activity_lbl 060400 `"Registration or Administrative Activities"', add
label define activity_lbl 060401 `"Admin activities: class for degree, cert, or lic"', add
label define activity_lbl 060402 `"Admin activities: class for personal interest"', add
label define activity_lbl 060403 `"Waiting assoc w/admin. activities (education)"', add
label define activity_lbl 060499 `"Administrative for education, n.e.c."', add
label define activity_lbl 069900 `"Education, n.e.c."', add
label define activity_lbl 069999 `"Education, n.e.c."', add
label define activity_lbl 070000 `"Consumer Purchases"', add
label define activity_lbl 070100 `"Shopping (store, telephone, internet)"', add
label define activity_lbl 070101 `"Grocery shopping"', add
label define activity_lbl 070102 `"Purchasing gas"', add
label define activity_lbl 070103 `"Purchasing food (not groceries)"', add
label define activity_lbl 070104 `"Shopping, except groceries, food and gas"', add
label define activity_lbl 070105 `"Waiting associated with shopping"', add
label define activity_lbl 070199 `"Shopping, n.e.c."', add
label define activity_lbl 070200 `"Researching Purchases"', add
label define activity_lbl 070201 `"Comparison shopping"', add
label define activity_lbl 070299 `"Researching purchases, n.e.c."', add
label define activity_lbl 070300 `"Security Procedures Related to Consumer Purchases"', add
label define activity_lbl 070301 `"Security procedures rel. to consumer purchases"', add
label define activity_lbl 070399 `"Sec procedures rel. to cons purchases, n.e.c."', add
label define activity_lbl 079900 `"Consumer Purchases, n.e.c."', add
label define activity_lbl 079999 `"Consumer purchases, n.e.c."', add
label define activity_lbl 080000 `"Professional and Personal Care Services"', add
label define activity_lbl 080100 `"Childcare Services"', add
label define activity_lbl 080101 `"Using paid childcare services"', add
label define activity_lbl 080102 `"Waiting associated w/purchasing childcare svcs"', add
label define activity_lbl 080199 `"Using paid childcare services, n.e.c."', add
label define activity_lbl 080200 `"Financial Services and Banking"', add
label define activity_lbl 080201 `"Banking"', add
label define activity_lbl 080202 `"Using other financial services"', add
label define activity_lbl 080203 `"Waiting associated w/banking/financial services"', add
label define activity_lbl 080299 `"Using financial services and banking, n.e.c."', add
label define activity_lbl 080300 `"Legal Services"', add
label define activity_lbl 080301 `"Using legal services"', add
label define activity_lbl 080302 `"Waiting associated with legal services"', add
label define activity_lbl 080399 `"Using legal services, n.e.c."', add
label define activity_lbl 080400 `"Medical and Care Services"', add
label define activity_lbl 080401 `"Using health and care services outside the home"', add
label define activity_lbl 080402 `"Using in-home health and care services"', add
label define activity_lbl 080403 `"Waiting associated with medical services"', add
label define activity_lbl 080499 `"Using medical services, n.e.c."', add
label define activity_lbl 080500 `"Personal Care Services"', add
label define activity_lbl 080501 `"Using personal care services"', add
label define activity_lbl 080502 `"Waiting associated w/personal care services"', add
label define activity_lbl 080599 `"Using personal care services, n.e.c."', add
label define activity_lbl 080600 `"Real Estate"', add
label define activity_lbl 080601 `"Activities rel. to purchasing/selling real estate"', add
label define activity_lbl 080602 `"Waiting assoc w/purchasing/selling real estate"', add
label define activity_lbl 080699 `"Using real estate services, n.e.c."', add
label define activity_lbl 080700 `"Veterinary Services (excluding grooming)"', add
label define activity_lbl 080701 `"Using veterinary services"', add
label define activity_lbl 080702 `"Waiting associated with veterinary services"', add
label define activity_lbl 080799 `"Using veterinary services, n.e.c."', add
label define activity_lbl 080800 `"Security Procedures Related to Professional or Personal Services"', add
label define activity_lbl 080801 `"Security procedures rel. to prof/personal svcs."', add
label define activity_lbl 080899 `"Sec procedures rel. to prof/personal svcs n.e.c."', add
label define activity_lbl 089900 `"Professional and Personal Services, n.e.c."', add
label define activity_lbl 089999 `"Professional and personal services, n.e.c."', add
label define activity_lbl 090000 `"Household Services"', add
label define activity_lbl 090100 `"Household Services (not done by self)"', add
label define activity_lbl 090101 `"Using interior cleaning services "', add
label define activity_lbl 090102 `"Using meal preparation services"', add
label define activity_lbl 090103 `"Using clothing repair and cleaning services"', add
label define activity_lbl 090104 `"Waiting associated with using household services"', add
label define activity_lbl 090199 `"Using household services, n.e.c."', add
label define activity_lbl 090200 `"Home Maintenance, Repair, Decoration, and Construction (not done by self)"', add
label define activity_lbl 090201 `"Using home maint/repair/d??cor/construction svcs"', add
label define activity_lbl 090202 `"Wtg assoc w/ home main/repair/d??cor/constr"', add
label define activity_lbl 090299 `"Using home maint/repair/d??cor/constr svcs n.e.c."', add
label define activity_lbl 090300 `"Pet Services (not done by self and not veterinary care)"', add
label define activity_lbl 090301 `"Using pet services"', add
label define activity_lbl 090302 `"Waiting associated with pet services"', add
label define activity_lbl 090399 `"Using pet services, n.e.c."', add
label define activity_lbl 090400 `"Lawn and Garden Services (not done by self)"', add
label define activity_lbl 090401 `"Using lawn and garden services"', add
label define activity_lbl 090402 `"Waiting assoc with using lawn and garden svcs"', add
label define activity_lbl 090499 `"Using lawn and garden services, n.e.c."', add
label define activity_lbl 090500 `"Vehicle Maintenance and Repair Services (not done by self)"', add
label define activity_lbl 090501 `"Using vehicle maintenance or repair services"', add
label define activity_lbl 090502 `"Waiting assoc with vehicle main. or repair svcs"', add
label define activity_lbl 090599 `"Using vehicle maint. and repair svcs, n.e.c."', add
label define activity_lbl 099900 `"Household Services, n.e.c."', add
label define activity_lbl 099999 `"Using household services, n.e.c."', add
label define activity_lbl 100000 `"Government Services and Civic Obligations"', add
label define activity_lbl 100100 `"Using Government Services"', add
label define activity_lbl 100101 `"Using police and fire services"', add
label define activity_lbl 100102 `"Using social services"', add
label define activity_lbl 100103 `"Obtaining licenses and paying fines, fees, taxes"', add
label define activity_lbl 100199 `"Using government services, n.e.c."', add
label define activity_lbl 100200 `"Civic Obligations and Participation"', add
label define activity_lbl 100201 `"Civic obligations and participation"', add
label define activity_lbl 100299 `"Civic obligations and participation, n.e.c."', add
label define activity_lbl 100300 `"Waiting Associated with Government Services or Civic Obligations"', add
label define activity_lbl 100303 `"Waiting assoc w/civic obligations and participation"', add
label define activity_lbl 100304 `"Waiting associated with using government services"', add
label define activity_lbl 100399 `"Wtg assoc w/govt svcs or civic obligations, n.e.c."', add
label define activity_lbl 100400 `"Security Procedures Related to Government Services or Civic Obligations"', add
label define activity_lbl 100401 `"Sec procedures rel. to govt svcs/civic obligations"', add
label define activity_lbl 100499 `"Sec procs rel. to govt svcs/civic obligations, n.e.c."', add
label define activity_lbl 109900 `"Government Services, n.e.c."', add
label define activity_lbl 109999 `"Government services, n.e.c."', add
label define activity_lbl 110000 `"Eating and Drinking"', add
label define activity_lbl 110100 `"Eating and Drinking"', add
label define activity_lbl 110101 `"Eating and drinking"', add
label define activity_lbl 110199 `"Eating and drinking, n.e.c."', add
label define activity_lbl 110200 `"Waiting Associated with Eating and Drinking"', add
label define activity_lbl 110201 `"Waiting associated w/eating and drinking"', add
label define activity_lbl 110299 `"Waiting associated with eating and drinking, n.e.c."', add
label define activity_lbl 119900 `"Eating and Drinking, n.e.c."', add
label define activity_lbl 119999 `"Eating and drinking, n.e.c."', add
label define activity_lbl 120000 `"Socializing, Relaxing, and Leisure"', add
label define activity_lbl 120100 `"Socializing and Communicating"', add
label define activity_lbl 120101 `"Socializing and communicating with others"', add
label define activity_lbl 120199 `"Socializing and communicating, n.e.c."', add
label define activity_lbl 120200 `"Attending or Hosting Social Events"', add
label define activity_lbl 120201 `"Attending or hosting parties/receptions/ceremonies"', add
label define activity_lbl 120202 `"Attending meetings for personal interest (not volunteering)"', add
label define activity_lbl 120299 `"Attending/hosting social events, n.e.c."', add
label define activity_lbl 120300 `"Relaxing and Leisure"', add
label define activity_lbl 120301 `"Relaxing, thinking "', add
label define activity_lbl 120302 `"Tobacco and drug use"', add
label define activity_lbl 120303 `"Television and movies (not religious)"', add
label define activity_lbl 120304 `"Television (religious)"', add
label define activity_lbl 120305 `"Listening to the radio"', add
label define activity_lbl 120306 `"Listening to/playing music (not radio)"', add
label define activity_lbl 120307 `"Playing games"', add
label define activity_lbl 120308 `"Computer use for leisure (exc. Games)"', add
label define activity_lbl 120309 `"Arts and crafts as a hobby"', add
label define activity_lbl 120310 `"Collecting as a hobby"', add
label define activity_lbl 120311 `"Hobbies, except arts and crafts and collecting"', add
label define activity_lbl 120312 `"Reading for personal interest"', add
label define activity_lbl 120313 `"Writing for personal interest "', add
label define activity_lbl 120399 `"Relaxing and leisure, n.e.c."', add
label define activity_lbl 120400 `"Arts and Entertainment (other than sports)"', add
label define activity_lbl 120401 `"Attending performing arts"', add
label define activity_lbl 120402 `"Attending museums"', add
label define activity_lbl 120403 `"Attending movies/film"', add
label define activity_lbl 120404 `"Attending gambling establishments"', add
label define activity_lbl 120405 `"Security procedures rel. to arts and entertainment"', add
label define activity_lbl 120499 `"Arts and entertainment, n.e.c."', add
label define activity_lbl 120500 `"Waiting Associated with Socializing, Relaxing, and Leisure"', add
label define activity_lbl 120501 `"Waiting assoc. w/socializing and communicating"', add
label define activity_lbl 120502 `"Waiting assoc. w/attending/hosting social events"', add
label define activity_lbl 120503 `"Waiting associated with relaxing/leisure"', add
label define activity_lbl 120504 `"Waiting associated with arts and entertainment"', add
label define activity_lbl 120599 `"Waiting associated with socializing, n.e.c."', add
label define activity_lbl 129900 `"Socializing, Relaxing, and Leisure, n.e.c."', add
label define activity_lbl 129999 `"Socializing, relaxing, and leisure, n.e.c."', add
label define activity_lbl 130000 `"Sports, Exercise, and Recreation"', add
label define activity_lbl 130100 `"Participating in Sports, Exercise, or Recreation"', add
label define activity_lbl 130101 `"Doing aerobics"', add
label define activity_lbl 130102 `"Playing baseball"', add
label define activity_lbl 130103 `"Playing basketball"', add
label define activity_lbl 130104 `"Biking"', add
label define activity_lbl 130105 `"Playing billiards"', add
label define activity_lbl 130106 `"Boating"', add
label define activity_lbl 130107 `"Bowling "', add
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
label define activity_lbl 130120 `"Playing racquet sports "', add
label define activity_lbl 130121 `"Participating in rodeo competitions"', add
label define activity_lbl 130122 `"Rollerblading"', add
label define activity_lbl 130123 `"Playing rugby"', add
label define activity_lbl 130124 `"Running"', add
label define activity_lbl 130125 `"Skiing, ice skating, snowboarding"', add
label define activity_lbl 130126 `"Playing soccer"', add
label define activity_lbl 130127 `"Playing softball"', add
label define activity_lbl 130128 `"Using cardiovascular equipment"', add
label define activity_lbl 130129 `"Vehicle touring/racing"', add
label define activity_lbl 130130 `"Playing volleyball"', add
label define activity_lbl 130131 `"Walking"', add
label define activity_lbl 130132 `"Participating in water sports"', add
label define activity_lbl 130133 `"Weightlifting/strength training"', add
label define activity_lbl 130134 `"Working out, unspecified"', add
label define activity_lbl 130135 `"Wrestling"', add
label define activity_lbl 130136 `"Doing yoga"', add
label define activity_lbl 130199 `"Playing sports n.e.c."', add
label define activity_lbl 130200 `"Attending Sports or Recreational Events"', add
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
label define activity_lbl 130217 `"Watching martial arts "', add
label define activity_lbl 130218 `"Watching racquet sports"', add
label define activity_lbl 130219 `"Watching rodeo competitions"', add
label define activity_lbl 130220 `"Watching rollerblading"', add
label define activity_lbl 130221 `"Watching rugby"', add
label define activity_lbl 130222 `"Watching running"', add
label define activity_lbl 130223 `"Watching skiing, ice skating, snowboarding"', add
label define activity_lbl 130224 `"Watching soccer"', add
label define activity_lbl 130225 `"Watching softball"', add
label define activity_lbl 130226 `"Watching vehicle touring/racing"', add
label define activity_lbl 130227 `"Watching volleyball"', add
label define activity_lbl 130228 `"Watching walking"', add
label define activity_lbl 130229 `"Watching water sports"', add
label define activity_lbl 130230 `"Watching weightlifting/strength training"', add
label define activity_lbl 130231 `"Watching people working out, unspecified"', add
label define activity_lbl 130232 `"Watching wrestling"', add
label define activity_lbl 130299 `"Attending sporting events, n.e.c."', add
label define activity_lbl 130300 `"Waiting Associated with Sports, Exercise, and Recreation"', add
label define activity_lbl 130301 `"Waiting related to playing sports or exercising"', add
label define activity_lbl 130302 `"Waiting related to attending sporting events"', add
label define activity_lbl 130399 `"Wtg assoc with sports, exercise, and rec, n.e.c."', add
label define activity_lbl 130400 `"Security Procedures Related to Sports, Exercise, and Recreation"', add
label define activity_lbl 130401 `"Security related to playing sports or exercising"', add
label define activity_lbl 130402 `"Security related to attending sporting events"', add
label define activity_lbl 130499 `"Sec related to sports, exercise, and rec, n.e.c."', add
label define activity_lbl 139900 `"Sports, Exercise, and Recreation, n.e.c."', add
label define activity_lbl 139999 `"Sports, exercise, and recreation, n.e.c."', add
label define activity_lbl 140000 `"Religious and Spiritual Activities"', add
label define activity_lbl 140100 `"Religious or Spiritual Practices"', add
label define activity_lbl 140101 `"Attending religious services"', add
label define activity_lbl 140102 `"Participation in religious practices"', add
label define activity_lbl 140103 `"Waiting assoc w/religious and spiritual activities"', add
label define activity_lbl 140104 `"Sec procedures rel. to relig and spiritual activities"', add
label define activity_lbl 140105 `"Religious education activities (2007+)"', add
label define activity_lbl 149900 `"Religious and Spiritual Activities, n.e.c."', add
label define activity_lbl 149999 `"Religious and spiritual activities, n.e.c."', add
label define activity_lbl 150000 `"Volunteer Activities"', add
label define activity_lbl 150100 `"Administrative and Support Activities"', add
label define activity_lbl 150101 `"Computer use"', add
label define activity_lbl 150102 `"Organizing and preparing"', add
label define activity_lbl 150103 `"Reading"', add
label define activity_lbl 150104 `"Telephone calls (except hotline counseling)"', add
label define activity_lbl 150105 `"Writing"', add
label define activity_lbl 150106 `"Fundraising"', add
label define activity_lbl 150199 `"Administrative and support activities, n.e.c."', add
label define activity_lbl 150200 `"Social Service and Care Activities (except medical)"', add
label define activity_lbl 150201 `"Food preparation, presentation, clean-up"', add
label define activity_lbl 150202 `"Collecting and delivering clothing and other goods"', add
label define activity_lbl 150203 `"Providing care"', add
label define activity_lbl 150204 `"Teaching, leading, counseling, mentoring"', add
label define activity_lbl 150299 `"Social service and care activities, n.e.c."', add
label define activity_lbl 150300 `"Indoor and Outdoor Maintenance, Building, and Clean-Up Activities"', add
label define activity_lbl 150301 `"Building houses, wildlife sites, and other structures"', add
label define activity_lbl 150302 `"Indoor and outdoor maintenance, repair, and clean-up"', add
label define activity_lbl 150399 `"Indoor and outdoor maint, bldg and clean-up, n.e.c."', add
label define activity_lbl 150400 `"Participating in Performance and Cultural Activities"', add
label define activity_lbl 150401 `"Performing"', add
label define activity_lbl 150402 `"Serving at volunteer events and cultural activities"', add
label define activity_lbl 150499 `"Participating performance, cultural act., n.e.c."', add
label define activity_lbl 150500 `"Attending Meetings, Conferences, and Training"', add
label define activity_lbl 150501 `"Attending meetings, conferences, and training"', add
label define activity_lbl 150599 `"Attending mtgs conferences, and training, n.e.c."', add
label define activity_lbl 150600 `"Public Health and Safety Activities"', add
label define activity_lbl 150601 `"Public health activities"', add
label define activity_lbl 150602 `"Public safety activities"', add
label define activity_lbl 150699 `"Public health and safety activities, n.e.c."', add
label define activity_lbl 150700 `"Waiting Associated with Volunteer Activities"', add
label define activity_lbl 150701 `"Waiting associated with volunteer activities"', add
label define activity_lbl 150799 `"Waiting assoc with volunteer activities, n.e.c."', add
label define activity_lbl 150800 `"Security Procedures Related to Volunteer Activities"', add
label define activity_lbl 150801 `"Security procedures related to volunteer activities (2007+)"', add
label define activity_lbl 150899 `"Security proecdures related to voluteer activities, n.e.c. (2007+)"', add
label define activity_lbl 159900 `"Volunteer Activities, n.e.c."', add
label define activity_lbl 159999 `"Volunteer activities, n.e.c."', add
label define activity_lbl 160000 `"Telephone Calls"', add
label define activity_lbl 160100 `"Telephone Calls (to or from)"', add
label define activity_lbl 160101 `"Telephone calls to/from family members"', add
label define activity_lbl 160102 `"Phone calls to/from friends, neighbors"', add
label define activity_lbl 160103 `"Telephone calls to/from education svcs providers"', add
label define activity_lbl 160104 `"Telephone calls to/from salespeople"', add
label define activity_lbl 160105 `"Phone calls to/from prof, personal svcs providers"', add
label define activity_lbl 160106 `"Phone calls to/from household services providers"', add
label define activity_lbl 160107 `"Phone calls to/from child or adult care providers"', add
label define activity_lbl 160108 `"Telephone calls to/from government officials"', add
label define activity_lbl 160199 `"Telephone calls (to or from), n.e.c."', add
label define activity_lbl 160200 `"Waiting Associated with Telephone Calls"', add
label define activity_lbl 160201 `"Waiting associated with telephone calls"', add
label define activity_lbl 160299 `"Waiting associated with telephone calls, n.e.c."', add
label define activity_lbl 169900 `"Telephone Calls, n.e.c."', add
label define activity_lbl 169999 `"Telephone calls, n.e.c."', add
label define activity_lbl 180000 `"Traveling"', add
label define activity_lbl 180100 `"Travel Related to Personal Care"', add
label define activity_lbl 180101 `"Travel related to personal care"', add
label define activity_lbl 180199 `"Travel related to personal care, n.e.c."', add
label define activity_lbl 180200 `"Travel Related to Household Activities"', add
label define activity_lbl 180201 `"Travel related to housework"', add
label define activity_lbl 180202 `"Travel related to food and drink prep"', add
label define activity_lbl 180203 `"Travel related to int. maint, repair, and decoration"', add
label define activity_lbl 180204 `"Travel related to ext. maint, repair, and decoration"', add
label define activity_lbl 180205 `"Travel related to lawn, garden, and houseplants"', add
label define activity_lbl 180206 `"Travel related to care for animals (not vet care)"', add
label define activity_lbl 180207 `"Travel related to vehicle care and maint (by self)"', add
label define activity_lbl 180208 `"Trvl rel to app, tool, toy set-up, repair, and maint"', add
label define activity_lbl 180209 `"Travel related to household management"', add
label define activity_lbl 180299 `"Travel related to household activities, n.e.c."', add
label define activity_lbl 180300 `"Travel Related to Caring for and Helping Household Members"', add
label define activity_lbl 180301 `"Travel related to caring for and helping HH children"', add
label define activity_lbl 180302 `"Travel related to caring for and helping household children (2005+)"', add
label define activity_lbl 180303 `"Travel related to hh children's education"', add
label define activity_lbl 180304 `"Travel related to hh children's health"', add
label define activity_lbl 180305 `"Travel related to caring for hh adults"', add
label define activity_lbl 180306 `"Travel related to helping hh adults"', add
label define activity_lbl 180307 `"Travel related to caring for and helping HH adults"', add
label define activity_lbl 180399 `"Trvl rel. to caring for, helping HH members, n.e.c."', add
label define activity_lbl 180400 `"Travel Related to Caring for and Helping Non-Household Members"', add
label define activity_lbl 180401 `"Trvl rel to caring for and helping nonHH kids, inclusive"', add
label define activity_lbl 180402 `"Trvl rel to caring for and helping nonHH kids"', add
label define activity_lbl 180403 `"Travel related to nonhh children's education"', add
label define activity_lbl 180404 `"Travel related to nonhh children's health"', add
label define activity_lbl 180405 `"Travel related to caring for nonhh adults"', add
label define activity_lbl 180406 `"Travel related to helping nonhh adults"', add
label define activity_lbl 180407 `"Travel related to caring for, helping NonHH adults"', add
label define activity_lbl 180499 `"Trvl rel. to caring for, helping NonHH,  n.e.c."', add
label define activity_lbl 180500 `"Travel Related to Work"', add
label define activity_lbl 180501 `"Travel related to working"', add
label define activity_lbl 180502 `"Travel related to work-related activities"', add
label define activity_lbl 180503 `"Travel related to income-generating activities"', add
label define activity_lbl 180504 `"Travel related to job search and interviewing"', add
label define activity_lbl 180599 `"Travel related to work, n.e.c."', add
label define activity_lbl 180600 `"Travel Related to Education"', add
label define activity_lbl 180601 `"Travel related to taking class"', add
label define activity_lbl 180602 `"Trvl rel to extracurricular activities (ex. Sports)"', add
label define activity_lbl 180603 `"Travel related to research/homework"', add
label define activity_lbl 180604 `"Travel related to registration/admin activities"', add
label define activity_lbl 180605 `"Education-related travel, not commuting"', add
label define activity_lbl 180699 `"Education travel, n.e.c."', add
label define activity_lbl 180700 `"Travel Related to Consumer Purchases"', add
label define activity_lbl 180701 `"Traveling to/from the grocery store"', add
label define activity_lbl 180702 `"Travel related to other shopping"', add
label define activity_lbl 180703 `"Travel related to purchasing food (not groceries)"', add
label define activity_lbl 180704 `"Travel related to shopping, ex groc, food, gas"', add
label define activity_lbl 180705 `"Traveling to/from gas station"', add
label define activity_lbl 180799 `"Travel related to consumer purchases, n.e.c."', add
label define activity_lbl 180800 `"Travel Related to Using Professional and Personal Care Services"', add
label define activity_lbl 180801 `"Travel related to using childcare services"', add
label define activity_lbl 180802 `"Travel related to using financial svcs and banking"', add
label define activity_lbl 180803 `"Travel related to using legal services"', add
label define activity_lbl 180804 `"Travel related to using medical services"', add
label define activity_lbl 180805 `"Travel related to using personal care services"', add
label define activity_lbl 180806 `"Travel related to using real estate services"', add
label define activity_lbl 180807 `"Travel related to using veterinary services"', add
label define activity_lbl 180899 `"Travel rel. to using prof, personal care svcs n.e.c."', add
label define activity_lbl 180900 `"Travel Related to Using Household Services"', add
label define activity_lbl 180901 `"Travel related to using household services"', add
label define activity_lbl 180902 `"Trvl rel to using home maint etc svcs"', add
label define activity_lbl 180903 `"Travel related to using pet services (not vet)"', add
label define activity_lbl 180904 `"Travel related to using lawn and garden services"', add
label define activity_lbl 180905 `"Trvl rel to using vehicle maint and repair services"', add
label define activity_lbl 180999 `"Travel related to using household services, n.e.c."', add
label define activity_lbl 181000 `"Travel Related to Using Government Services and Civic Obligations"', add
label define activity_lbl 181001 `"Travel related to using government services"', add
label define activity_lbl 181002 `"Travel related to civic obligations and participation"', add
label define activity_lbl 181099 `"Travel rel. to govt svcs and civic obligations, n.e.c."', add
label define activity_lbl 181100 `"Travel Related to Eating and Drinking"', add
label define activity_lbl 181101 `"Travel related to eating and drinking"', add
label define activity_lbl 181199 `"Travel related to eating and drinking, n.e.c."', add
label define activity_lbl 181200 `"Travel Related to Socializing, Relaxing, and Leisure"', add
label define activity_lbl 181201 `"Travel related to socializing and communicating"', add
label define activity_lbl 181202 `"Trvl related to attending or hosting social events"', add
label define activity_lbl 181203 `"Travel related to relaxing and leisure (2003, 2004)"', add
label define activity_lbl 181204 `"Travel related to arts and entertainment"', add
label define activity_lbl 181205 `"Travel as a form of entertainment"', add
label define activity_lbl 181206 `"Travel related to relaxing and leisure (2005+)"', add
label define activity_lbl 181299 `"Travel rel. to socializing, relaxing, leisure, n.e.c."', add
label define activity_lbl 181300 `"Travel Related to Sports, Exercise, and Recreation"', add
label define activity_lbl 181301 `"Trvl rel to doing sports/exercise/recreation"', add
label define activity_lbl 181302 `"Trvl rel to attending sporting/recreational events"', add
label define activity_lbl 181399 `"Travel rel to sports, exercise, recreation, n.e.c."', add
label define activity_lbl 181400 `"Travel Related to Religious or Spiritual Activities"', add
label define activity_lbl 181401 `"Travel related to religious/spiritual practices"', add
label define activity_lbl 181499 `"Travel rel. to religious/spiritual activities, n.e.c."', add
label define activity_lbl 181500 `"Travel Related to Volunteering"', add
label define activity_lbl 181501 `"Travel related to volunteering"', add
label define activity_lbl 181599 `"Travel related to volunteer activities, n.e.c."', add
label define activity_lbl 181600 `"Travel Related to Phone Calls"', add
label define activity_lbl 181601 `"Travel related to phone calls"', add
label define activity_lbl 181699 `"Travel rel. to phone calls, n.e.c."', add
label define activity_lbl 181800 `"Security Procedures Related to Traveling"', add
label define activity_lbl 181801 `"Security procedures related to traveling"', add
label define activity_lbl 181899 `"Security procedures related to traveling, n.e.c."', add
label define activity_lbl 189900 `"Traveling, n.e.c."', add
label define activity_lbl 189999 `"Traveling, n.e.c."', add
label define activity_lbl 500000 `"Data Codes"', add
label define activity_lbl 500100 `"Unable to Code"', add
label define activity_lbl 500101 `"Insufficient detail in verbatim"', add
label define activity_lbl 500102 `"Recorded activity using incorrect words"', add
label define activity_lbl 500103 `"Missing travel or destination"', add
label define activity_lbl 500104 `"Recorded simultaneous activities incorrectly"', add
label define activity_lbl 500105 `"Respondent refused to provide information"', add
label define activity_lbl 500106 `"Gap/can't remember"', add
label define activity_lbl 500107 `"Unable to code activity at 1st tier"', add
label define activity_lbl 509900 `"Data codes, n.e.c."', add
label define activity_lbl 509999 `"Data codes, n.e.c."', add
label values activity activity_lbl

label define where_lbl 0100 `"Place"'
label define where_lbl 0101 `"R's home or yard"', add
label define where_lbl 0102 `"R's workplace"', add
label define where_lbl 0103 `"Someone else's home"', add
label define where_lbl 0104 `"Restaurant or bar"', add
label define where_lbl 0105 `"Place of worship"', add
label define where_lbl 0106 `"Grocery store"', add
label define where_lbl 0107 `"Other store/mall"', add
label define where_lbl 0108 `"School"', add
label define where_lbl 0109 `"Outdoors--not at home"', add
label define where_lbl 0110 `"Library"', add
label define where_lbl 0111 `"Bank"', add
label define where_lbl 0112 `"Gym/health club"', add
label define where_lbl 0113 `"Post Office"', add
label define where_lbl 0114 `"Other place"', add
label define where_lbl 0115 `"Unspecified place"', add
label define where_lbl 0200 `"Mode of Transportation"', add
label define where_lbl 0230 `"Driver of car, truck, or motorcycle"', add
label define where_lbl 0231 `"Passenger of car, truck, or motorcycle"', add
label define where_lbl 0232 `"Walking"', add
label define where_lbl 0233 `"Bus"', add
label define where_lbl 0234 `"Subway/train"', add
label define where_lbl 0235 `"Bicycle"', add
label define where_lbl 0236 `"Boat/ferry"', add
label define where_lbl 0237 `"Taxi/limousine service"', add
label define where_lbl 0238 `"Airplane"', add
label define where_lbl 0239 `"Other mode of transportation"', add
label define where_lbl 0240 `"Unspecified mode of transportation"', add
label define where_lbl 9997 `"Don't know"', add
label define where_lbl 9998 `"Refused"', add
label define where_lbl 9999 `"NIU (Not in universe)"', add
label values where where_lbl

save ../data/output/atus_labeled, replace
