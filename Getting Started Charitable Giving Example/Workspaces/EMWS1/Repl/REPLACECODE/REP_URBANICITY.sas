   
* ;
* Defining: REP_URBANICITY;
* ;
Length REP_URBANICITY$4;
Label REP_URBANICITY='Replacement: URBANICITY';
REP_URBANICITY=URBANICITY;
* ;
* Variable: URBANICITY;
* ;
_UFORMAT200 = strip(URBANICITY);
if _UFORMAT200 =  "?" then
REP_URBANICITY="";
