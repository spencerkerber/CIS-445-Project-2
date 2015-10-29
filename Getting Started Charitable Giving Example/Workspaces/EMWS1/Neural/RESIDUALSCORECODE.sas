***********************************;
*** Begin Scoring Code for Neural;
***********************************;
DROP _DM_BAD _EPS _NOCL_ _MAX_ _MAXP_ _SUM_ _NTRIALS;
 _DM_BAD = 0;
 _NOCL_ = .;
 _MAX_ = .;
 _MAXP_ = .;
 _SUM_ = .;
 _NTRIALS = .;
 _EPS =                1E-10;
LENGTH _WARN_ $4 
      F_TARGET_B  $ 12
;
      label S_LG10_LAST_GIFT_AMT = 'Standard: LG10_LAST_GIFT_AMT' ;

      label S_MONTHS_SINCE_LAST_GIFT = 'Standard: MONTHS_SINCE_LAST_GIFT' ;

      label PEP_STAR0 = 'Dummy: PEP_STAR=0' ;

      label FREQUENCY_STATUS_97NK1 = 'Dummy: FREQUENCY_STATUS_97NK=1' ;

      label FREQUENCY_STATUS_97NK2 = 'Dummy: FREQUENCY_STATUS_97NK=2' ;

      label FREQUENCY_STATUS_97NK3 = 'Dummy: FREQUENCY_STATUS_97NK=3' ;

      label G_CARD_PROM_120 = 'Dummy: G_CARD_PROM_12=0' ;

      label G_CARD_PROM_121 = 'Dummy: G_CARD_PROM_12=1' ;

      label G_CARD_PROM_122 = 'Dummy: G_CARD_PROM_12=2' ;

      label G_CARD_PROM_123 = 'Dummy: G_CARD_PROM_12=3' ;

      label G_CARD_PROM_124 = 'Dummy: G_CARD_PROM_12=4' ;

      label G_CARD_PROM_125 = 'Dummy: G_CARD_PROM_12=5' ;

      label G_CLUSTER_CODE0 = 'Dummy: G_CLUSTER_CODE=0' ;

      label G_CLUSTER_CODE1 = 'Dummy: G_CLUSTER_CODE=1' ;

      label G_CLUSTER_CODE2 = 'Dummy: G_CLUSTER_CODE=2' ;

      label G_CLUSTER_CODE3 = 'Dummy: G_CLUSTER_CODE=3' ;

      label G_CLUSTER_CODE4 = 'Dummy: G_CLUSTER_CODE=4' ;

      label G_CLUSTER_CODE5 = 'Dummy: G_CLUSTER_CODE=5' ;

      label G_CLUSTER_CODE6 = 'Dummy: G_CLUSTER_CODE=6' ;

      label G_CLUSTER_CODE7 = 'Dummy: G_CLUSTER_CODE=7' ;

      label G_RECENT_CARD_RESPONSE_COUNT0 = 
'Dummy: G_RECENT_CARD_RESPONSE_COUNT=0' ;

      label G_RECENT_CARD_RESPONSE_COUNT1 = 
'Dummy: G_RECENT_CARD_RESPONSE_COUNT=1' ;

      label G_RECENT_CARD_RESPONSE_COUNT2 = 
'Dummy: G_RECENT_CARD_RESPONSE_COUNT=2' ;

      label G_RECENT_CARD_RESPONSE_COUNT3 = 
'Dummy: G_RECENT_CARD_RESPONSE_COUNT=3' ;

      label G_RECENT_RESPONSE_COUNT0 = 'Dummy: G_RECENT_RESPONSE_COUNT=0' ;

      label G_RECENT_RESPONSE_COUNT1 = 'Dummy: G_RECENT_RESPONSE_COUNT=1' ;

      label G_RECENT_RESPONSE_COUNT2 = 'Dummy: G_RECENT_RESPONSE_COUNT=2' ;

      label OPT_LIFETIME_CA01_low_7_5 = 
'Dummy: OPT_LIFETIME_CARD_PROM=01:low-7.5' ;

      label OPT_LIFETIME_CA02_7_5_12_5 = 
'Dummy: OPT_LIFETIME_CARD_PROM=02:7.5-12.5' ;

      label OPT_LIFETIME_CA03_12_5_39_5__M = 
'Dummy: OPT_LIFETIME_CARD_PROM=03:12.5-39.5, MISSING' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label H14 = 'Hidden: H1=4' ;

      label H15 = 'Hidden: H1=5' ;

      label I_TARGET_B = 'Into: TARGET_B' ;

      label F_TARGET_B = 'From: TARGET_B' ;

      label U_TARGET_B = 'Unnormalized Into: TARGET_B' ;

      label P_TARGET_B1 = 'Predicted: TARGET_B=1' ;

      label R_TARGET_B1 = 'Residual: TARGET_B=1' ;

      label P_TARGET_B0 = 'Predicted: TARGET_B=0' ;

      label R_TARGET_B0 = 'Residual: TARGET_B=0' ;

      label  _WARN_ = "Warnings"; 

*** Generate dummy variables for PEP_STAR ;
drop PEP_STAR0 ;
if missing( PEP_STAR ) then do;
   PEP_STAR0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( PEP_STAR , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      PEP_STAR0 = -1;
   end;
   else if _dm12 = '0'  then do;
      PEP_STAR0 = 1;
   end;
   else do;
      PEP_STAR0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for FREQUENCY_STATUS_97NK ;
drop FREQUENCY_STATUS_97NK1 FREQUENCY_STATUS_97NK2 FREQUENCY_STATUS_97NK3 ;
if missing( FREQUENCY_STATUS_97NK ) then do;
   FREQUENCY_STATUS_97NK1 = .;
   FREQUENCY_STATUS_97NK2 = .;
   FREQUENCY_STATUS_97NK3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( FREQUENCY_STATUS_97NK , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      FREQUENCY_STATUS_97NK1 = 1;
      FREQUENCY_STATUS_97NK2 = 0;
      FREQUENCY_STATUS_97NK3 = 0;
   end;
   else if _dm12 = '2'  then do;
      FREQUENCY_STATUS_97NK1 = 0;
      FREQUENCY_STATUS_97NK2 = 1;
      FREQUENCY_STATUS_97NK3 = 0;
   end;
   else if _dm12 = '3'  then do;
      FREQUENCY_STATUS_97NK1 = 0;
      FREQUENCY_STATUS_97NK2 = 0;
      FREQUENCY_STATUS_97NK3 = 1;
   end;
   else if _dm12 = '4'  then do;
      FREQUENCY_STATUS_97NK1 = -1;
      FREQUENCY_STATUS_97NK2 = -1;
      FREQUENCY_STATUS_97NK3 = -1;
   end;
   else do;
      FREQUENCY_STATUS_97NK1 = .;
      FREQUENCY_STATUS_97NK2 = .;
      FREQUENCY_STATUS_97NK3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_CARD_PROM_12 ;
drop G_CARD_PROM_120 G_CARD_PROM_121 G_CARD_PROM_122 G_CARD_PROM_123 
        G_CARD_PROM_124 G_CARD_PROM_125 ;
*** encoding is sparse, initialize to zero;
G_CARD_PROM_120 = 0;
G_CARD_PROM_121 = 0;
G_CARD_PROM_122 = 0;
G_CARD_PROM_123 = 0;
G_CARD_PROM_124 = 0;
G_CARD_PROM_125 = 0;
if missing( G_CARD_PROM_12 ) then do;
   G_CARD_PROM_120 = .;
   G_CARD_PROM_121 = .;
   G_CARD_PROM_122 = .;
   G_CARD_PROM_123 = .;
   G_CARD_PROM_124 = .;
   G_CARD_PROM_125 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_CARD_PROM_12 , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      G_CARD_PROM_125 = 1;
   end;
   else if _dm12 = '6'  then do;
      G_CARD_PROM_120 = -1;
      G_CARD_PROM_121 = -1;
      G_CARD_PROM_122 = -1;
      G_CARD_PROM_123 = -1;
      G_CARD_PROM_124 = -1;
      G_CARD_PROM_125 = -1;
   end;
   else if _dm12 = '3'  then do;
      G_CARD_PROM_123 = 1;
   end;
   else if _dm12 = '4'  then do;
      G_CARD_PROM_124 = 1;
   end;
   else if _dm12 = '2'  then do;
      G_CARD_PROM_122 = 1;
   end;
   else if _dm12 = '1'  then do;
      G_CARD_PROM_121 = 1;
   end;
   else if _dm12 = '0'  then do;
      G_CARD_PROM_120 = 1;
   end;
   else do;
      G_CARD_PROM_120 = .;
      G_CARD_PROM_121 = .;
      G_CARD_PROM_122 = .;
      G_CARD_PROM_123 = .;
      G_CARD_PROM_124 = .;
      G_CARD_PROM_125 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_CLUSTER_CODE ;
drop G_CLUSTER_CODE0 G_CLUSTER_CODE1 G_CLUSTER_CODE2 G_CLUSTER_CODE3 
        G_CLUSTER_CODE4 G_CLUSTER_CODE5 G_CLUSTER_CODE6 G_CLUSTER_CODE7 ;
*** encoding is sparse, initialize to zero;
G_CLUSTER_CODE0 = 0;
G_CLUSTER_CODE1 = 0;
G_CLUSTER_CODE2 = 0;
G_CLUSTER_CODE3 = 0;
G_CLUSTER_CODE4 = 0;
G_CLUSTER_CODE5 = 0;
G_CLUSTER_CODE6 = 0;
G_CLUSTER_CODE7 = 0;
if missing( G_CLUSTER_CODE ) then do;
   G_CLUSTER_CODE0 = .;
   G_CLUSTER_CODE1 = .;
   G_CLUSTER_CODE2 = .;
   G_CLUSTER_CODE3 = .;
   G_CLUSTER_CODE4 = .;
   G_CLUSTER_CODE5 = .;
   G_CLUSTER_CODE6 = .;
   G_CLUSTER_CODE7 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_CLUSTER_CODE , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '1'  then do;
            if _dm12 = '0'  then do;
               G_CLUSTER_CODE0 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '1'  then do;
                  G_CLUSTER_CODE1 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               G_CLUSTER_CODE2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            G_CLUSTER_CODE3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               G_CLUSTER_CODE4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '6'  then do;
         if _dm12 = '5'  then do;
            G_CLUSTER_CODE5 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '6'  then do;
               G_CLUSTER_CODE6 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '7'  then do;
            G_CLUSTER_CODE7 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '8'  then do;
               G_CLUSTER_CODE0 = -1;
               G_CLUSTER_CODE1 = -1;
               G_CLUSTER_CODE2 = -1;
               G_CLUSTER_CODE3 = -1;
               G_CLUSTER_CODE4 = -1;
               G_CLUSTER_CODE5 = -1;
               G_CLUSTER_CODE6 = -1;
               G_CLUSTER_CODE7 = -1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      G_CLUSTER_CODE0 = .;
      G_CLUSTER_CODE1 = .;
      G_CLUSTER_CODE2 = .;
      G_CLUSTER_CODE3 = .;
      G_CLUSTER_CODE4 = .;
      G_CLUSTER_CODE5 = .;
      G_CLUSTER_CODE6 = .;
      G_CLUSTER_CODE7 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_RECENT_CARD_RESPONSE_COUNT ;
drop G_RECENT_CARD_RESPONSE_COUNT0 G_RECENT_CARD_RESPONSE_COUNT1 
        G_RECENT_CARD_RESPONSE_COUNT2 G_RECENT_CARD_RESPONSE_COUNT3 ;
*** encoding is sparse, initialize to zero;
G_RECENT_CARD_RESPONSE_COUNT0 = 0;
G_RECENT_CARD_RESPONSE_COUNT1 = 0;
G_RECENT_CARD_RESPONSE_COUNT2 = 0;
G_RECENT_CARD_RESPONSE_COUNT3 = 0;
if missing( G_RECENT_CARD_RESPONSE_COUNT ) then do;
   G_RECENT_CARD_RESPONSE_COUNT0 = .;
   G_RECENT_CARD_RESPONSE_COUNT1 = .;
   G_RECENT_CARD_RESPONSE_COUNT2 = .;
   G_RECENT_CARD_RESPONSE_COUNT3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_RECENT_CARD_RESPONSE_COUNT , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '2'  then do;
      if _dm12 <= '1'  then do;
         if _dm12 = '0'  then do;
            G_RECENT_CARD_RESPONSE_COUNT0 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '1'  then do;
               G_RECENT_CARD_RESPONSE_COUNT1 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '2'  then do;
            G_RECENT_CARD_RESPONSE_COUNT2 = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 = '3'  then do;
         G_RECENT_CARD_RESPONSE_COUNT3 = 1;
         _dm_find = 1;
      end;
      else do;
         if _dm12 = '4'  then do;
            G_RECENT_CARD_RESPONSE_COUNT0 = -1;
            G_RECENT_CARD_RESPONSE_COUNT1 = -1;
            G_RECENT_CARD_RESPONSE_COUNT2 = -1;
            G_RECENT_CARD_RESPONSE_COUNT3 = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      G_RECENT_CARD_RESPONSE_COUNT0 = .;
      G_RECENT_CARD_RESPONSE_COUNT1 = .;
      G_RECENT_CARD_RESPONSE_COUNT2 = .;
      G_RECENT_CARD_RESPONSE_COUNT3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_RECENT_RESPONSE_COUNT ;
drop G_RECENT_RESPONSE_COUNT0 G_RECENT_RESPONSE_COUNT1 
        G_RECENT_RESPONSE_COUNT2 ;
if missing( G_RECENT_RESPONSE_COUNT ) then do;
   G_RECENT_RESPONSE_COUNT0 = .;
   G_RECENT_RESPONSE_COUNT1 = .;
   G_RECENT_RESPONSE_COUNT2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_RECENT_RESPONSE_COUNT , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      G_RECENT_RESPONSE_COUNT0 = 0;
      G_RECENT_RESPONSE_COUNT1 = 1;
      G_RECENT_RESPONSE_COUNT2 = 0;
   end;
   else if _dm12 = '2'  then do;
      G_RECENT_RESPONSE_COUNT0 = 0;
      G_RECENT_RESPONSE_COUNT1 = 0;
      G_RECENT_RESPONSE_COUNT2 = 1;
   end;
   else if _dm12 = '3'  then do;
      G_RECENT_RESPONSE_COUNT0 = -1;
      G_RECENT_RESPONSE_COUNT1 = -1;
      G_RECENT_RESPONSE_COUNT2 = -1;
   end;
   else if _dm12 = '0'  then do;
      G_RECENT_RESPONSE_COUNT0 = 1;
      G_RECENT_RESPONSE_COUNT1 = 0;
      G_RECENT_RESPONSE_COUNT2 = 0;
   end;
   else do;
      G_RECENT_RESPONSE_COUNT0 = .;
      G_RECENT_RESPONSE_COUNT1 = .;
      G_RECENT_RESPONSE_COUNT2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for OPT_LIFETIME_CARD_PROM ;
drop OPT_LIFETIME_CA01_low_7_5 OPT_LIFETIME_CA02_7_5_12_5 
        OPT_LIFETIME_CA03_12_5_39_5__M ;
if missing( OPT_LIFETIME_CARD_PROM ) then do;
   OPT_LIFETIME_CA01_low_7_5 = .;
   OPT_LIFETIME_CA02_7_5_12_5 = .;
   OPT_LIFETIME_CA03_12_5_39_5__M = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm32 $ 32; drop _dm32 ;
   %DMNORMCP( OPT_LIFETIME_CARD_PROM , _dm32 )
   if _dm32 = '03:12.5-39.5, MISSING'  then do;
      OPT_LIFETIME_CA01_low_7_5 = 0;
      OPT_LIFETIME_CA02_7_5_12_5 = 0;
      OPT_LIFETIME_CA03_12_5_39_5__M = 1;
   end;
   else if _dm32 = '02:7.5-12.5'  then do;
      OPT_LIFETIME_CA01_low_7_5 = 0;
      OPT_LIFETIME_CA02_7_5_12_5 = 1;
      OPT_LIFETIME_CA03_12_5_39_5__M = 0;
   end;
   else if _dm32 = '01:LOW-7.5'  then do;
      OPT_LIFETIME_CA01_low_7_5 = 1;
      OPT_LIFETIME_CA02_7_5_12_5 = 0;
      OPT_LIFETIME_CA03_12_5_39_5__M = 0;
   end;
   else if _dm32 = '04:39.5-HIGH'  then do;
      OPT_LIFETIME_CA01_low_7_5 = -1;
      OPT_LIFETIME_CA02_7_5_12_5 = -1;
      OPT_LIFETIME_CA03_12_5_39_5__M = -1;
   end;
   else do;
      OPT_LIFETIME_CA01_low_7_5 = .;
      OPT_LIFETIME_CA02_7_5_12_5 = .;
      OPT_LIFETIME_CA03_12_5_39_5__M = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   LG10_LAST_GIFT_AMT , 
   MONTHS_SINCE_LAST_GIFT   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_LG10_LAST_GIFT_AMT  =    -5.04963340818956 +     4.26588117171544 * 
        LG10_LAST_GIFT_AMT ;
   S_MONTHS_SINCE_LAST_GIFT  =    -4.51352840067237 +     0.24813657655727 * 
        MONTHS_SINCE_LAST_GIFT ;
END;
ELSE DO;
   IF MISSING( LG10_LAST_GIFT_AMT ) THEN S_LG10_LAST_GIFT_AMT  = . ;
   ELSE S_LG10_LAST_GIFT_AMT  =    -5.04963340818956 +     4.26588117171544 * 
        LG10_LAST_GIFT_AMT ;
   IF MISSING( MONTHS_SINCE_LAST_GIFT ) THEN S_MONTHS_SINCE_LAST_GIFT  = . ;
   ELSE S_MONTHS_SINCE_LAST_GIFT
          =    -4.51352840067237 +     0.24813657655727 * 
        MONTHS_SINCE_LAST_GIFT ;
END;
*** *************************;
*** Writing the Node bin ;
*** *************************;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.25007471264748 * S_LG10_LAST_GIFT_AMT
          +     0.10498832743618 * S_MONTHS_SINCE_LAST_GIFT ;
   H12  =    -0.39538724747515 * S_LG10_LAST_GIFT_AMT
          +     0.21734155947532 * S_MONTHS_SINCE_LAST_GIFT ;
   H13  =     0.03651134728903 * S_LG10_LAST_GIFT_AMT
          +    -0.09664002352067 * S_MONTHS_SINCE_LAST_GIFT ;
   H14  =    -0.17363634739902 * S_LG10_LAST_GIFT_AMT
          +    -0.11281438991641 * S_MONTHS_SINCE_LAST_GIFT ;
   H15  =    -0.14254997101594 * S_LG10_LAST_GIFT_AMT
          +    -0.15655966113876 * S_MONTHS_SINCE_LAST_GIFT ;
   H11  = H11  +     0.03005913876546 * PEP_STAR0 ;
   H12  = H12  +    -0.20300181645568 * PEP_STAR0 ;
   H13  = H13  +     -0.0702326980168 * PEP_STAR0 ;
   H14  = H14  +     0.11231253274944 * PEP_STAR0 ;
   H15  = H15  +     0.12761725344185 * PEP_STAR0 ;
   H11  = H11  +    -0.14563113114845 * FREQUENCY_STATUS_97NK1
          +     0.20212594449096 * FREQUENCY_STATUS_97NK2
          +      0.0014929554507 * FREQUENCY_STATUS_97NK3
          +     -0.3940730057307 * G_CARD_PROM_120  +     0.23611176024002 * 
        G_CARD_PROM_121  +    -0.04191022783843 * G_CARD_PROM_122
          +    -0.15096620679125 * G_CARD_PROM_123  +     0.05924770061396 * 
        G_CARD_PROM_124  +    -0.01543688591302 * G_CARD_PROM_125
          +     0.26860316904537 * G_CLUSTER_CODE0  +    -0.14130396415989 * 
        G_CLUSTER_CODE1  +    -0.01140664525568 * G_CLUSTER_CODE2
          +     0.02006369183742 * G_CLUSTER_CODE3  +    -0.17418810574957 * 
        G_CLUSTER_CODE4  +     0.19361103269638 * G_CLUSTER_CODE5
          +     0.11922218519382 * G_CLUSTER_CODE6  +    -0.21686647521989 * 
        G_CLUSTER_CODE7  +    -0.06010688189404 * 
        G_RECENT_CARD_RESPONSE_COUNT0  +      0.1913505144762 * 
        G_RECENT_CARD_RESPONSE_COUNT1  +    -0.06710273665895 * 
        G_RECENT_CARD_RESPONSE_COUNT2  +     0.24474589642934 * 
        G_RECENT_CARD_RESPONSE_COUNT3  +     -0.2677452207491 * 
        G_RECENT_RESPONSE_COUNT0  +    -0.01933616335513 * 
        G_RECENT_RESPONSE_COUNT1  +    -0.09968572062077 * 
        G_RECENT_RESPONSE_COUNT2  +     0.25212507530897 * 
        OPT_LIFETIME_CA01_low_7_5  +    -0.01069103886115 * 
        OPT_LIFETIME_CA02_7_5_12_5  +    -0.05078242863735 * 
        OPT_LIFETIME_CA03_12_5_39_5__M ;
   H12  = H12  +    -0.15922294620858 * FREQUENCY_STATUS_97NK1
          +    -0.07230440371065 * FREQUENCY_STATUS_97NK2
          +     0.19651639022078 * FREQUENCY_STATUS_97NK3
          +     0.03450407854231 * G_CARD_PROM_120  +     0.54519622345246 * 
        G_CARD_PROM_121  +     0.00590725896404 * G_CARD_PROM_122
          +    -0.00190622772802 * G_CARD_PROM_123  +     0.03704515845455 * 
        G_CARD_PROM_124  +     0.04494738024974 * G_CARD_PROM_125
          +     0.02509541631996 * G_CLUSTER_CODE0  +     0.28228578843993 * 
        G_CLUSTER_CODE1  +    -0.03490481006781 * G_CLUSTER_CODE2
          +     0.24458007180613 * G_CLUSTER_CODE3  +    -0.11377030781566 * 
        G_CLUSTER_CODE4  +       0.070813064555 * G_CLUSTER_CODE5
          +     0.04243998767648 * G_CLUSTER_CODE6  +    -0.13575994294521 * 
        G_CLUSTER_CODE7  +     0.16034581822961 * 
        G_RECENT_CARD_RESPONSE_COUNT0  +     0.13143121791703 * 
        G_RECENT_CARD_RESPONSE_COUNT1  +     0.01595129526801 * 
        G_RECENT_CARD_RESPONSE_COUNT2  +     -0.2446477302246 * 
        G_RECENT_CARD_RESPONSE_COUNT3  +    -0.33705333365062 * 
        G_RECENT_RESPONSE_COUNT0  +     0.13157294335724 * 
        G_RECENT_RESPONSE_COUNT1  +    -0.18135166952765 * 
        G_RECENT_RESPONSE_COUNT2  +     0.00473806905498 * 
        OPT_LIFETIME_CA01_low_7_5  +      0.0385899725921 * 
        OPT_LIFETIME_CA02_7_5_12_5  +     0.24306387190096 * 
        OPT_LIFETIME_CA03_12_5_39_5__M ;
   H13  = H13  +     -0.1696906013875 * FREQUENCY_STATUS_97NK1
          +     0.40692947294537 * FREQUENCY_STATUS_97NK2
          +    -0.05734106633692 * FREQUENCY_STATUS_97NK3
          +     0.00484710407197 * G_CARD_PROM_120  +    -0.22900315315716 * 
        G_CARD_PROM_121  +     -0.1654198369454 * G_CARD_PROM_122
          +    -0.06663310381687 * G_CARD_PROM_123  +    -0.05896495648004 * 
        G_CARD_PROM_124  +    -0.26859656461372 * G_CARD_PROM_125
          +    -0.00784646645783 * G_CLUSTER_CODE0  +     0.11431550816909 * 
        G_CLUSTER_CODE1  +    -0.11983779104434 * G_CLUSTER_CODE2
          +    -0.02173959144578 * G_CLUSTER_CODE3  +    -0.06575806168267 * 
        G_CLUSTER_CODE4  +     0.22091202516084 * G_CLUSTER_CODE5
          +    -0.27731416675693 * G_CLUSTER_CODE6  +     0.05420932906241 * 
        G_CLUSTER_CODE7  +    -0.13408597060288 * 
        G_RECENT_CARD_RESPONSE_COUNT0  +     0.17972293211417 * 
        G_RECENT_CARD_RESPONSE_COUNT1  +     0.20599895754343 * 
        G_RECENT_CARD_RESPONSE_COUNT2  +    -0.01071237536063 * 
        G_RECENT_CARD_RESPONSE_COUNT3  +     0.02554398537131 * 
        G_RECENT_RESPONSE_COUNT0  +     0.16098973900149 * 
        G_RECENT_RESPONSE_COUNT1  +    -0.16666227055982 * 
        G_RECENT_RESPONSE_COUNT2  +    -0.27758801103872 * 
        OPT_LIFETIME_CA01_low_7_5  +     0.25757463583859 * 
        OPT_LIFETIME_CA02_7_5_12_5  +     0.25237716930391 * 
        OPT_LIFETIME_CA03_12_5_39_5__M ;
   H14  = H14  +    -0.03443861703329 * FREQUENCY_STATUS_97NK1
          +     0.25396033344922 * FREQUENCY_STATUS_97NK2
          +     0.26162238812084 * FREQUENCY_STATUS_97NK3
          +    -0.01577837970421 * G_CARD_PROM_120  +    -0.04100216988281 * 
        G_CARD_PROM_121  +     0.00567927330601 * G_CARD_PROM_122
          +    -0.13184132585823 * G_CARD_PROM_123  +    -0.02412146842202 * 
        G_CARD_PROM_124  +    -0.02942687972544 * G_CARD_PROM_125
          +     0.02755483757796 * G_CLUSTER_CODE0  +    -0.14031288884306 * 
        G_CLUSTER_CODE1  +    -0.17104676518115 * G_CLUSTER_CODE2
          +      0.0714048658162 * G_CLUSTER_CODE3  +    -0.19368179923697 * 
        G_CLUSTER_CODE4  +     0.04423930483681 * G_CLUSTER_CODE5
          +    -0.12878883597515 * G_CLUSTER_CODE6  +     0.15510351027961 * 
        G_CLUSTER_CODE7  +      0.1860788202747 * 
        G_RECENT_CARD_RESPONSE_COUNT0  +    -0.34769629166766 * 
        G_RECENT_CARD_RESPONSE_COUNT1  +     -0.3487122552139 * 
        G_RECENT_CARD_RESPONSE_COUNT2  +    -0.00671606308498 * 
        G_RECENT_CARD_RESPONSE_COUNT3  +    -0.17813215537047 * 
        G_RECENT_RESPONSE_COUNT0  +     0.18702606774865 * 
        G_RECENT_RESPONSE_COUNT1  +    -0.03579815700308 * 
        G_RECENT_RESPONSE_COUNT2  +       0.163759524503 * 
        OPT_LIFETIME_CA01_low_7_5  +    -0.06082717997309 * 
        OPT_LIFETIME_CA02_7_5_12_5  +    -0.11457813018401 * 
        OPT_LIFETIME_CA03_12_5_39_5__M ;
   H15  = H15  +    -0.24636583525145 * FREQUENCY_STATUS_97NK1
          +    -0.13397467541673 * FREQUENCY_STATUS_97NK2
          +     0.03738446556582 * FREQUENCY_STATUS_97NK3
          +    -0.04028604364442 * G_CARD_PROM_120  +     0.25890223458841 * 
        G_CARD_PROM_121  +    -0.32315566530631 * G_CARD_PROM_122
          +     0.24088252059109 * G_CARD_PROM_123  +    -0.12162837044901 * 
        G_CARD_PROM_124  +     0.19399925575937 * G_CARD_PROM_125
          +     0.31384309760906 * G_CLUSTER_CODE0  +    -0.05837182941526 * 
        G_CLUSTER_CODE1  +    -0.24457979427513 * G_CLUSTER_CODE2
          +    -0.38348549398829 * G_CLUSTER_CODE3  +     0.16093257412791 * 
        G_CLUSTER_CODE4  +     0.19312287587839 * G_CLUSTER_CODE5
          +     0.05694856113051 * G_CLUSTER_CODE6  +    -0.14592394866605 * 
        G_CLUSTER_CODE7  +     0.10136853908125 * 
        G_RECENT_CARD_RESPONSE_COUNT0  +     0.09013931998392 * 
        G_RECENT_CARD_RESPONSE_COUNT1  +    -0.17333289980295 * 
        G_RECENT_CARD_RESPONSE_COUNT2  +    -0.13541861153861 * 
        G_RECENT_CARD_RESPONSE_COUNT3  +    -0.17636606720962 * 
        G_RECENT_RESPONSE_COUNT0  +    -0.33374677941973 * 
        G_RECENT_RESPONSE_COUNT1  +     0.13347672256229 * 
        G_RECENT_RESPONSE_COUNT2  +      0.0081287800932 * 
        OPT_LIFETIME_CA01_low_7_5  +     0.04271317088041 * 
        OPT_LIFETIME_CA02_7_5_12_5  +     0.28825592588835 * 
        OPT_LIFETIME_CA03_12_5_39_5__M ;
   H11  =    -0.12061348926487 + H11 ;
   H12  =     1.44828367707358 + H12 ;
   H13  =     0.66939934654328 + H13 ;
   H14  =    -1.05032736753047 + H14 ;
   H15  =     0.63427443678027 + H15 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
   H14  = TANH(H14 );
   H15  = TANH(H15 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
   H14  = .;
   H15  = .;
END;
*** *************************;
*** Writing the Node TARGET_B ;
*** *************************;

*** Generate dummy variables for TARGET_B ;
drop TARGET_B1 TARGET_B0 ;
label F_TARGET_B = 'From: TARGET_B' ;
length F_TARGET_B $ 12;
F_TARGET_B = put( TARGET_B , BEST12. );
%DMNORMIP( F_TARGET_B )
if missing( TARGET_B ) then do;
   TARGET_B1 = .;
   TARGET_B0 = .;
end;
else do;
   if F_TARGET_B = '0'  then do;
      TARGET_B1 = 0;
      TARGET_B0 = 1;
   end;
   else if F_TARGET_B = '1'  then do;
      TARGET_B1 = 1;
      TARGET_B0 = 0;
   end;
   else do;
      TARGET_B1 = .;
      TARGET_B0 = .;
   end;
end;
IF _DM_BAD EQ 0 THEN DO;
   P_TARGET_B1  =     0.02195352842033 * H11  +     0.21907912260295 * H12
          +    -0.00602000947085 * H13  +    -0.16721387837298 * H14
          +     0.00921300971748 * H15 ;
   P_TARGET_B1  = P_TARGET_B1  +    -0.07788676399924 * S_LG10_LAST_GIFT_AMT
          +     -0.1126115350924 * S_MONTHS_SINCE_LAST_GIFT ;
   P_TARGET_B1  = P_TARGET_B1  +    -0.06296582382211 * PEP_STAR0 ;
   P_TARGET_B1  = P_TARGET_B1  +    -0.18493968438091 * FREQUENCY_STATUS_97NK1
          +     -0.0649803954514 * FREQUENCY_STATUS_97NK2
          +     0.08894436136873 * FREQUENCY_STATUS_97NK3
          +     0.05460935752949 * G_CARD_PROM_120  +     0.14425413681475 * 
        G_CARD_PROM_121  +     0.05916771935944 * G_CARD_PROM_122
          +    -0.02256668123949 * G_CARD_PROM_123  +     0.17355405358596 * 
        G_CARD_PROM_124  +    -0.33281630485931 * G_CARD_PROM_125
          +     0.26831752125435 * G_CLUSTER_CODE0  +     0.31093381696928 * 
        G_CLUSTER_CODE1  +       0.162142533014 * G_CLUSTER_CODE2
          +     0.12085717714535 * G_CLUSTER_CODE3  +     0.02721673499213 * 
        G_CLUSTER_CODE4  +    -0.05819891225349 * G_CLUSTER_CODE5
          +    -0.10468782734892 * G_CLUSTER_CODE6  +    -0.31378426726894 * 
        G_CLUSTER_CODE7  +     0.31663647867234 * 
        G_RECENT_CARD_RESPONSE_COUNT0  +    -0.00979202314261 * 
        G_RECENT_CARD_RESPONSE_COUNT1  +    -0.06666722392774 * 
        G_RECENT_CARD_RESPONSE_COUNT2  +     -0.0496077950265 * 
        G_RECENT_CARD_RESPONSE_COUNT3  +      0.0792950327838 * 
        G_RECENT_RESPONSE_COUNT0  +     0.01232282922993 * 
        G_RECENT_RESPONSE_COUNT1  +    -0.03593917372911 * 
        G_RECENT_RESPONSE_COUNT2  +    -0.31035309637507 * 
        OPT_LIFETIME_CA01_low_7_5  +    -0.02898637915334 * 
        OPT_LIFETIME_CA02_7_5_12_5  +     0.03588269807094 * 
        OPT_LIFETIME_CA03_12_5_39_5__M ;
   P_TARGET_B1  =    -1.09866682917952 + P_TARGET_B1 ;
   P_TARGET_B0  = 0; 
   _MAX_ = MAX (P_TARGET_B1 , P_TARGET_B0 );
   _SUM_ = 0.; 
   P_TARGET_B1  = EXP(P_TARGET_B1  - _MAX_);
   _SUM_ = _SUM_ + P_TARGET_B1 ;
   P_TARGET_B0  = EXP(P_TARGET_B0  - _MAX_);
   _SUM_ = _SUM_ + P_TARGET_B0 ;
   P_TARGET_B1  = P_TARGET_B1  / _SUM_;
   P_TARGET_B0  = P_TARGET_B0  / _SUM_;
END;
ELSE DO;
   P_TARGET_B1  = .;
   P_TARGET_B0  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_TARGET_B1  =     0.25004693073024;
   P_TARGET_B0  =     0.74995306926975;
END;
*** *****************************;
*** Writing the Residuals  of the Node TARGET_B ;
*** ******************************;
IF MISSING( TARGET_B1 ) THEN R_TARGET_B1  = . ;
ELSE R_TARGET_B1  = TARGET_B1  - P_TARGET_B1 ;
IF MISSING( TARGET_B0 ) THEN R_TARGET_B0  = . ;
ELSE R_TARGET_B0  = TARGET_B0  - P_TARGET_B0 ;


*** Update Posterior Probabilities;
P_TARGET_B1 = P_TARGET_B1 * 0.05 / 0.25004693073024;
P_TARGET_B0 = P_TARGET_B0 * 0.95 / 0.74995306926975;
drop _sum; _sum = P_TARGET_B1 + P_TARGET_B0 ;
if _sum > 4.135903E-25 then do;
   P_TARGET_B1 = P_TARGET_B1 / _sum;
   P_TARGET_B0 = P_TARGET_B0 / _sum;
end;

*** Decision Processing;
label D_TARGET_B = 'Decision: TARGET_B' ;
label EP_TARGET_B = 'Expected Profit: TARGET_B' ;
label BP_TARGET_B = 'Best Profit: TARGET_B' ;
label CP_TARGET_B = 'Computed Profit: TARGET_B' ;

length D_TARGET_B $ 9;

D_TARGET_B = ' ';
EP_TARGET_B = .;
BP_TARGET_B = .;
CP_TARGET_B = .;

*** Compute Expected Consequences and Choose Decision;
_decnum = 1; drop _decnum;

D_TARGET_B = '1' ;
EP_TARGET_B = P_TARGET_B1 * 14.5 + P_TARGET_B0 * -0.5;
drop _sum; 
_sum = P_TARGET_B1 * 0 + P_TARGET_B0 * 0;
if _sum > EP_TARGET_B + 6.593837E-12 then do;
   EP_TARGET_B = _sum; _decnum = 2;
   D_TARGET_B = '0' ;
end;

*** Decision Matrix;
array NEURALdema [2,2] _temporary_ (
/* row 1 */  14.5 0
/* row 2 */  -0.5 0
);

*** Find Index of Target Category;
drop _tarnum; select( F_TARGET_B );
   when('1' ) _tarnum = 1;
   when('0' ) _tarnum = 2;
   otherwise _tarnum = 0;
end;
if _tarnum <= 0 then goto NEURALdeex;

*** Computed Consequence of Chosen Decision;
CP_TARGET_B = NEURALdema [_tarnum,_decnum];

*** Best Possible Consequence of Any Decision without Cost;
array NEURALdebe [2] _temporary_ ( 14.5 0);
BP_TARGET_B = NEURALdebe [_tarnum];


NEURALdeex:;

*** End Decision Processing ;
*** *************************;
*** Writing the I_TARGET_B  AND U_TARGET_B ;
*** *************************;
_MAXP_ = P_TARGET_B1 ;
I_TARGET_B  = "1           " ;
U_TARGET_B  =                    1;
IF( _MAXP_ LT P_TARGET_B0  ) THEN DO; 
   _MAXP_ = P_TARGET_B0 ;
   I_TARGET_B  = "0           " ;
   U_TARGET_B  =                    0;
END;
********************************;
*** End Scoring Code for Neural;
********************************;
