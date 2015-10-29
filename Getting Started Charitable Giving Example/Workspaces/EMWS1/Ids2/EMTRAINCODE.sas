*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS1 "C:\Users\sakerb01\Desktop\SAS EM 12.3 Tutorials _ Projects\Getting Started Charitable Giving Example\Workspaces\EMWS1";
*------------------------------------------------------------*;
* Ids2: Creating DATA data;
*------------------------------------------------------------*;
data EMWS1.Ids2_DATA (label="")
/ view=EMWS1.Ids2_DATA
;
set DONOR.DONOR_SCORE_DATA;
run;
