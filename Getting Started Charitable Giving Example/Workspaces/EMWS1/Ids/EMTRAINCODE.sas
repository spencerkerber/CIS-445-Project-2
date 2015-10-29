*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS1 "C:\Users\sakerb01\Desktop\SAS EM 12.3 Tutorials _ Projects\Getting Started Charitable Giving Example\Workspaces\EMWS1";
*------------------------------------------------------------*;
* Ids: Creating DATA data;
*------------------------------------------------------------*;
data EMWS1.Ids_DATA (label="")
/ view=EMWS1.Ids_DATA
;
set DONOR.DONOR_RAW_DATA;
run;
