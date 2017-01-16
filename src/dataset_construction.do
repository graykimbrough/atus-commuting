#delimit;
/* Construct dataset with ATUS commuting calculations,
	retaining all activity spells.

	Steps:
	
	(1) Set up set of workers
	(2) Identify home and work location; use as anchors
		Convert into tours, with tour counter for each individual
	(3) For each tour, calculate:
		(a) max stop length
		(b) number of stops
		(c) predominant travel mode type
		(d) predominant stop type
	(4) Classify travel within tour as commute or not based on max stop length
	(5) Sum up commute times by person
	
Inputs:
 (1) atus_pared

Outputs:
 (1) atus_pared2 (intermediate dataset)
 (2) atus_final_spells
 
Preferred measure is stored using variable commutetimeLT30.
*/

use ../data/output/atus_pared, clear;

/* Travel spells

Want all 18xxxx spells, EXCEPT:

181801: Security procedures related to traveling
181899: Security procedures related to traveling, not elsewhere classified
189999: Traveling, not elsewhere classified -- could include e.g. travel with 
		no destination,	activities associated with travel 
		(picking up baggage), etc.
*/

gen travspell =  act2 == 18 & 
	~(activity == 189999 | activity == 181801 |
		activity == 181899);


/* Home spells defined as:
	where==101 ("Respondent's home or yard")

Dealing with personal care:
  (1) code first and last spells of the diary day as taking place at home if they
      are sleep spells
  (2) Recode location of personal care activities if contiguous spells (i.e. no
    intermediate travel) have a location
*/

by caseid: gen firstline = (_n==1);
replace where=101 if where==9999 & firstline & activity==10101;
by caseid : gen lastline= (_n==_N);
replace where=101 if where==9999 & lastline & activity==10101;


qui count if where==9999 & act2 ==01 & travspell[_n-1]==0 & where[_n-1]~=9999 & 
	caseid[_n-1]==caseid; 
while r(N){;
by caseid: replace where = where[_n-1] 
    if where==9999 & act2 ==01 & travspell[_n-1]==0 & where[_n-1]~=9999;
qui count if where==9999 & act2 ==01 & travspell[_n-1]==0 & where[_n-1]~=9999 & 
	caseid[_n-1]==caseid; 
};

qui count if where==9999 & act2 ==01 & travspell[_n+1]==0 & where[_n+1]~=9999 &
	caseid[_n+1]==caseid;
while r(N){;
by caseid: replace where = where[_n+1] 
    if where==9999 & act2 ==01 & travspell[_n+1]==0 & where[_n+1]~=9999;
qui count if where==9999 & act2 ==01 & travspell[_n+1]==0 & where[_n+1]~=9999 &
	caseid[_n+1]==caseid;
};

gen homespell = where==101;
replace homespell=0 if travspell==1;

/* Keep only those with home spells to begin and end the day */

by caseid: gen firsthome = (homespell==1 & _n==1);
by caseid: gen lasthome = (homespell==1 & _n == _N);

by caseid: egen beginhome = total(firsthome);
by caseid: egen endhome = total(lasthome);

tab beginhome endhome if firstline;
svy: prop beginhome endhome, subpop(firstline);

keep if beginhome & endhome;

save ../data/output/atus_pared2, replace;


/* Define spells as I'd like, then generate counts of people by number of each.  */

/* Recode travel spells without a mode, unless the previous or next spell
    is a travel spell. */

by caseid: replace travspell=0 if ~((where>=230 & where <=240) | where==9999)
	& (travspell[_n+1] ==0 & travspell[_n-1]) ==0;
	
/* Combine consecutive travel spells */
generate consecutivetravel=0;
generate keepflag = 0;
by caseid: replace consecutivetravel = 1 if 
      travspell	& (travspell[_n-1] | travspell[_n+1]);

tab consecutivetravel;

by caseid: replace duration=duration+duration[_n-1] if
	consecutivetravel & travspell[_n-1];
	
by caseid: replace starttime=starttime[_n-1] if
	consecutivetravel & travspell[_n-1];
by caseid: replace keepflag=1 if
	travspell & ~travspell[_n+1];
	
drop if consecutivetravel==1 & keepflag == 0;
drop consecutivetravel keepflag;

/*  Work spells defined as:
	050101: work, main job
	050102: work, other job(s)

Limit to only work spells outside of the home (where~=101).

*/
gen workspell = (activity==050101 | activity==050102) & where~=101;

/* If there are spells before and after work spells that are:
  (a) not travel or home (or work)
  (b) in same location as the work spell

then combine.

  I am not worried about measuring work time, so just change these to work spells.
*/
qui count if 
    workspell[_n+1] &
    ~travspell & ~workspell & ~homespell &
    where[_n+1]==where &
    caseid[_n+1]==caseid;
while r(N){;
      by caseid: replace workspell=1 if
	workspell[_n+1] &
	~travspell & ~workspell & ~homespell &
	where[_n+1]==where;

      qui count if 
	  workspell[_n+1] &
	  ~travspell & ~workspell & ~homespell &
	  where[_n+1]==where &
	  caseid[_n+1]==caseid;
      };

qui count if 
    workspell[_n-1] &
    ~travspell & ~workspell & ~homespell &
    where[_n-1]==where &
    caseid[_n-1]==caseid;
while r(N){;
      by caseid: replace workspell=1 if
	workspell[_n-1] &
	~travspell & ~workspell & ~homespell &
	where[_n-1]==where;

      qui count if 
	  workspell[_n-1] &
	  ~travspell & ~workspell & ~homespell &
	  where[_n-1]==where &
	  caseid[_n-1]==caseid;
      };

/* Produce tours */
gen tourchange=0;
by caseid: replace tourchange=1 if
	(~firstline &
	((workspell & ~workspell[_n-1]) |
	(homespell & ~homespell[_n-1])));
gen tour_increment = firstline+tourchange;
by caseid: gen tournum=sum(tour_increment);

/* Necessary for some reason, but has no effect on ordering */
sort caseid tournum;

/* Record origin */
gen str4 tour_origin="";
replace tour_origin="home" if (tourchange | firstline) & homespell;
replace tour_origin="work" if (tourchange | firstline) & workspell;

gen str4 tour_dest="";
replace tour_dest="home" if 
	(tourchange[_n+1] & homespell[_n+1] & caseid[_n+1]==caseid);
replace tour_dest="work" if 
	(tourchange[_n+1] & workspell[_n+1] & caseid[_n+1]==caseid);

by caseid tournum: replace tour_origin=tour_origin[_n-1] if _n~=1;

qui count if missing(tour_dest);
while r(N){;
	by caseid tournum: replace tour_dest=tour_dest[_n+1] if ~missing(tour_dest[_n+1]);
	qui count if missing(tour_dest)&~missing(tour_dest[_n+1]) & caseid[_n+1]==caseid;
};
	
/* Step 3:
	(3) For each tour, calculate:
		(a) max stop length
		(b) total stop time
		(c) number of stops
		(d) predominant travel mode type
		(e) predominant stop type
*/

/* (a) max stop length */
gen stoplength=0;
by caseid tournum: 
	replace stoplength=stoplength[_n-1]+duration if
		~workspell & ~homespell & ~travspell & _n~=1;
by caseid tournum:
	egen max_stop_length=max(stoplength);

/* (b) total stop length */
by caseid tournum:
	egen tour_stop_length=total(stoplength);

/* (c) number of stops */
gen newstop=0;
by caseid tournum:
	replace newstop=1 if
		~workspell & ~homespell & ~travspell & _n~=1 &
		(workspell[_n-1] | homespell[_n-1] | travspell[_n-1]);
by caseid tournum:
	egen stopnum=total(newstop);
		
/* Step 4: Calculate commute times and numbers of stops based on thresholds */
gen commutespelltime=duration*travspell*
	((tour_origin=="home" & tour_dest=="work")| (tour_origin=="work" & tour_dest=="home"));
gen HWcommutespelltime=duration*travspell*(tour_origin=="home" & tour_dest=="work");
gen WHcommutespelltime=duration*travspell*(tour_origin=="work" & tour_dest=="home");

/* This bit of code was created to be flexible and allow for multiple
	stop length allowances, but here I use only a 30 minute stop threshold */
foreach len of numlist 30 {;
	gen commutespelltimemax`len'=commutespelltime*(max_stop_length<=`len');
	gen HWcommutespelltimemax`len'=HWcommutespelltime*(max_stop_length<=`len');
	gen WHcommutespelltimemax`len'=WHcommutespelltime*(max_stop_length<=`len');
	gen newstopmax`len'=newstop*(max_stop_length<=`len');
	gen stoplengthmax`len'=stoplength*(max_stop_length<=`len');
	
	by caseid: egen commutetimemax`len'=total(commutespelltimemax`len');
	by caseid: egen HWcommutetimemax`len'=total(HWcommutespelltimemax`len');
	by caseid: egen WHcommutetimemax`len'=total(WHcommutespelltimemax`len');
	by caseid: egen numstopsmax`len'=total(newstopmax`len');
	by caseid: egen stoptimemax`len'=total(stoplengthmax`len');
	
	gen max`len'tour=0;
	by caseid tournum: replace max`len'tour=1 if 
		_n==1 &
		max_stop_length<=`len';
		
	by caseid: egen numcommutetoursmax`len'=total(max`len'tour);
	gen nonzerocommutemax`len'= ~missing(numcommutetoursmax`len') &
		numcommutetoursmax`len'>0;
};

gen commutespellLT30 = travspell & 
		(max_stop_length<=30) & 
		((tour_origin=="work" & tour_dest=="home") |
				(tour_origin=="home" & tour_dest=="work"));				

gen toworkLT30 = travspell & 
		(max_stop_length<=30) & 
				(tour_origin=="home" & tour_dest=="work");
by caseid tournum: egen tourtoworkLT30 = total(toworkLT30);
replace tourtoworkLT30=1 if tourtoworkLT30>1 & ~missing(tourtoworkLT30);
by caseid tournum: replace tourtoworkLT30=0 if _n~=1;
								
by caseid: egen numtoworkLT30=total(tourtoworkLT30);				
				
by caseid tournum: gen fromworkLT30 = travspell & 
		(max_stop_length<=30) & 
				(tour_origin=="work" & tour_dest=="home");		

by caseid tournum: egen tourfromworkLT30 = total(fromworkLT30);
replace tourfromworkLT30=1 if tourfromworkLT30>1 & ~missing(tourfromworkLT30);
by caseid tournum: replace tourfromworkLT30=0 if _n~=1;
				
by caseid: egen numfromworkLT30=total(tourfromworkLT30);	

foreach type in LT30{;
	bysort caseid: egen commutetime`type' = total(commutespelltime*commutespell`type');
	bysort caseid: egen commutetime`type'towork = total(commutespelltime*commutespell`type'*
		(tour_origin=="home" & tour_dest=="work"));
	bysort caseid: egen commutetime`type'fromwork = total(commutespelltime*commutespell`type'*
		(tour_origin=="work" & tour_dest=="home"));
};
				
compress;
save ../data/output/atus_final_spells, replace;
