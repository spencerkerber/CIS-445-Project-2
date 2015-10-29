****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH F_TARGET_B  $   12; 
LENGTH I_TARGET_B  $   12; 
LENGTH _WARN_  $    4; 

******              LABELS FOR NEW VARIABLES              ******;
LABEL P_TARGET_B1  = 'Predicted: TARGET_B=1' ;
      P_TARGET_B1  = 0;
LABEL P_TARGET_B0  = 'Predicted: TARGET_B=0' ;
      P_TARGET_B0  = 0;
LABEL Q_TARGET_B1  = 'Unadjusted P: TARGET_B=1' ;
      Q_TARGET_B1  = 0;
LABEL Q_TARGET_B0  = 'Unadjusted P: TARGET_B=0' ;
      Q_TARGET_B0  = 0;
LABEL R_TARGET_B1  = 'Residual: TARGET_B=1' ;
LABEL R_TARGET_B0  = 'Residual: TARGET_B=0' ;
LABEL F_TARGET_B  = 'From: TARGET_B' ;
LABEL I_TARGET_B  = 'Into: TARGET_B' ;
LABEL U_TARGET_B  = 'Unnormalized Into: TARGET_B' ;
LABEL _WARN_  = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12; 
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_2 $      2; DROP _ARBFMT_2; 
_ARBFMT_2 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_5 $      5; DROP _ARBFMT_5; 
_ARBFMT_5 = ' '; /* Initialize to avoid warning. */


_ARBFMT_12 = PUT( TARGET_B , BEST12.);
 %DMNORMCP( _ARBFMT_12, F_TARGET_B );

 DROP _ARB_F_;
 DROP _ARB_BADF_;
     _ARB_F_ = 0.5491810036;
     _ARB_BADF_ = 0;
******             ASSIGN OBSERVATION TO NODE             ******;
 DROP _ARB_P_;
 _ARB_P_ = 0;
 DROP _ARB_PPATH_; _ARB_PPATH_ = 1;

********** LEAF     1  NODE   306 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

   DROP _BRANCH_;
  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FREQUENCY_STATUS_97NK  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'4' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'42' ,'25' ,'01' ,'37' ,'38' ,'48' ,
      '31' ,'35' ,'40' ,'13' ,'28' ,'14' ,'17' ,'11' ,'47' ,'03' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.004132905;
      END;
    END;
  END;

********** LEAF     2  NODE   307 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FREQUENCY_STATUS_97NK  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'4' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('49' ,'50' ,'43' ,'46' ,'45' ,'20' ,'16' ,'30' ,'07' ,
      '34' ,'23' ,'09' ,'02' ,'41' ,'15' ,'18' ,'36' ,'24' ,'08' ,'12' ,'19' ,
      '27' ,'26' ,'21' ,'51' ,'44' ,'29' ,'05' ,'39' ,'33' ,'22' ,'06' ,'32' ,
      '52' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'53' ,'42' ,'25' ,'01' ,'37' ,'38' ,'48' ,'31' ,'35' ,
        '40' ,'13' ,'28' ,'14' ,'17' ,'11' ,'47' ,'03' ,'49' ,'50' ,'43' ,
        '46' ,'45' ,'20' ,'16' ,'30' ,'07' ,'34' ,'23' ,'09' ,'02' ,'41' ,
        '15' ,'18' ,'36' ,'24' ,'08' ,'12' ,'19' ,'27' ,'26' ,'21' ,'51' ,
        '44' ,'29' ,'05' ,'39' ,'33' ,'22' ,'06' ,'32' ,'52' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.019567829;
      END;
    END;
  END;

********** LEAF     3  NODE   305 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('3' ,'4' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.024649371;
    END;
  END;

********** LEAF     4  NODE   311 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_AVG_GIFT ) AND 
    FILE_AVG_GIFT  <               10.195 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'42' ,'01' ,'37' ,'31' ,'13' ,'17' ,'47' ,'50' ,
      '43' ,'46' ,'45' ,'30' ,'07' ,'34' ,'09' ,'02' ,'15' ,'19' ,'26' ,'21' ,
      '44' ,'29' ,'33' ,'06' ,'32' ,'10' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.000924504;
      END;
    END;
  END;

********** LEAF     5  NODE   312 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_AVG_GIFT ) AND 
    FILE_AVG_GIFT  <               10.195 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('04' ,'53' ,'25' ,'38' ,'48' ,'35' ,'40' ,'28' ,'14' ,
      '11' ,'03' ,'49' ,'20' ,'16' ,'23' ,'41' ,'18' ,'36' ,'24' ,'08' ,'12' ,
      '27' ,'51' ,'05' ,'39' ,'22' ,'52' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'42' ,'01' ,'37' ,'31' ,'13' ,'17' ,'47' ,'50' ,'43' ,'46' ,
        '45' ,'30' ,'07' ,'34' ,'09' ,'02' ,'15' ,'19' ,'26' ,'21' ,'44' ,
        '29' ,'33' ,'06' ,'32' ,'10' ,'04' ,'53' ,'25' ,'38' ,'48' ,'35' ,
        '40' ,'28' ,'14' ,'11' ,'03' ,'49' ,'20' ,'16' ,'23' ,'41' ,'18' ,
        '36' ,'24' ,'08' ,'12' ,'27' ,'51' ,'05' ,'39' ,'22' ,'52' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.024904351;
      END;
    END;
  END;

********** LEAF     6  NODE   313 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_AVG_GIFT ) AND 
                  10.195 <= FILE_AVG_GIFT  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FILE_AVG_GIFT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(MEDIAN_HOME_VALUE ) AND 
      MEDIAN_HOME_VALUE  <                678.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0253072226;
      END;
    END;
  END;

********** LEAF     7  NODE   314 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_AVG_GIFT ) AND 
                  10.195 <= FILE_AVG_GIFT  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FILE_AVG_GIFT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(MEDIAN_HOME_VALUE ) AND 
                     678.5 <= MEDIAN_HOME_VALUE  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( MEDIAN_HOME_VALUE  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0034517842;
      END;
    END;
  END;

********** LEAF     8  NODE   318 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'11' ,'4' ,'12' ,'0' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENT_RESPONSE_COUNT  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'11' ,'4' ,'12' ,'0' ,'9' ,'7' ,'5' ,'8' ,'6' ,'10' ,
      '13' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(FILE_CARD_GIFT ) AND 
      FILE_CARD_GIFT  <                  1.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0220779529;
      END;
    END;
  END;

********** LEAF     9  NODE   319 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'11' ,'4' ,'12' ,'0' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENT_RESPONSE_COUNT  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'11' ,'4' ,'12' ,'0' ,'9' ,'7' ,'5' ,'8' ,'6' ,'10' ,
      '13' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(FILE_CARD_GIFT ) AND 
                       1.5 <= FILE_CARD_GIFT  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( FILE_CARD_GIFT  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0011250563;
      END;
    END;
  END;

********** LEAF    10  NODE   317 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('9' ,'7' ,'5' ,'8' ,'6' ,'10' ,'13' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.028358292;
    END;
  END;

********** LEAF    11  NODE   323 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'4' ,'12' ,'0' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENT_RESPONSE_COUNT  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'4' ,'12' ,'0' ,'11' ,'9' ,'7' ,'5' ,'8' ,'6' ,'10' ,
      '13' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('1' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.005138931;
      END;
    END;
  END;

********** LEAF    12  NODE   324 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'4' ,'12' ,'0' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENT_RESPONSE_COUNT  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'4' ,'12' ,'0' ,'11' ,'9' ,'7' ,'5' ,'8' ,'6' ,'10' ,
      '13' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('0' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( PEP_STAR  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_12 NOTIN (
        '1' ,'0' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0153891406;
      END;
    END;
  END;

********** LEAF    13  NODE   322 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('11' ,'9' ,'7' ,'5' ,'8' ,'6' ,'10' ,'13' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.026431605;
    END;
  END;

********** LEAF    14  NODE   328 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ,'12' ,'0' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENT_RESPONSE_COUNT  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'12' ,'0' ,'3' ,'11' ,'4' ,'9' ,'7' ,'5' ,'8' ,'6' ,'10' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'42' ,'25' ,'01' ,'38' ,'48' ,'31' ,
      '35' ,'40' ,'13' ,'28' ,'47' ,'03' ,'46' ,'07' ,'02' ,'18' ,'12' ,'19' ,
      '26' ,'21' ,'51' ,'05' ,'22' ,'06' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0001994945;
      END;
    END;
  END;

********** LEAF    15  NODE   329 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ,'12' ,'0' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENT_RESPONSE_COUNT  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'12' ,'0' ,'3' ,'11' ,'4' ,'9' ,'7' ,'5' ,'8' ,'6' ,'10' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('37' ,'14' ,'17' ,'11' ,'49' ,'50' ,'43' ,'45' ,'20' ,
      '16' ,'30' ,'34' ,'23' ,'09' ,'41' ,'15' ,'36' ,'24' ,'08' ,'27' ,'44' ,
      '29' ,'39' ,'33' ,'32' ,'52' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'53' ,'42' ,'25' ,'01' ,'38' ,'48' ,'31' ,'35' ,'40' ,
        '13' ,'28' ,'47' ,'03' ,'46' ,'07' ,'02' ,'18' ,'12' ,'19' ,'26' ,
        '21' ,'51' ,'05' ,'22' ,'06' ,'37' ,'14' ,'17' ,'11' ,'49' ,'50' ,
        '43' ,'45' ,'20' ,'16' ,'30' ,'34' ,'23' ,'09' ,'41' ,'15' ,'36' ,
        '24' ,'08' ,'27' ,'44' ,'29' ,'39' ,'33' ,'32' ,'52' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0242020752;
      END;
    END;
  END;

********** LEAF    16  NODE   330 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('3' ,'11' ,'4' ,'9' ,'7' ,'5' ,'8' ,'6' ,'10' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(MONTHS_SINCE_LAST_GIFT ) AND 
      MONTHS_SINCE_LAST_GIFT  <                 16.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.026813126;
      END;
    END;
  END;

********** LEAF    17  NODE   331 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('3' ,'11' ,'4' ,'9' ,'7' ,'5' ,'8' ,'6' ,'10' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(MONTHS_SINCE_LAST_GIFT ) AND 
                      16.5 <= MONTHS_SINCE_LAST_GIFT  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( MONTHS_SINCE_LAST_GIFT  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.004459446;
      END;
    END;
  END;

********** LEAF    18  NODE   335 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'53' ,'38' ,'35' ,'17' ,'11' ,'47' ,'03' ,'43' ,
      '45' ,'20' ,'16' ,'30' ,'34' ,'23' ,'09' ,'02' ,'41' ,'36' ,'24' ,'19' ,
      '27' ,'51' ,'44' ,'33' ,'06' ,'32' ,'52' ,'10' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'53' ,'38' ,'35' ,'17' ,'11' ,'47' ,'03' ,'43' ,'45' ,'20' ,
        '16' ,'30' ,'34' ,'23' ,'09' ,'02' ,'41' ,'36' ,'24' ,'19' ,'27' ,
        '51' ,'44' ,'33' ,'06' ,'32' ,'52' ,'10' ,'04' ,'42' ,'25' ,'01' ,
        '37' ,'48' ,'31' ,'40' ,'13' ,'28' ,'14' ,'49' ,'50' ,'46' ,'07' ,
        '15' ,'18' ,'08' ,'12' ,'26' ,'21' ,'29' ,'05' ,'39' ,'22' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0223101739;
      END;
    END;
  END;

********** LEAF    19  NODE   336 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('04' ,'42' ,'25' ,'01' ,'37' ,'48' ,'31' ,'40' ,'13' ,
      '28' ,'14' ,'49' ,'50' ,'46' ,'07' ,'15' ,'18' ,'08' ,'12' ,'26' ,'21' ,
      '29' ,'05' ,'39' ,'22' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.001097654;
      END;
    END;
  END;

********** LEAF    20  NODE   337 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('2' ,'3' ,'4' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FREQUENCY_STATUS_97NK  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'4' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'01' ,'38' ,'40' ,'13' ,'28' ,'14' ,
      '11' ,'03' ,'43' ,'20' ,'34' ,'09' ,'41' ,'15' ,'36' ,'24' ,'19' ,'27' ,
      '39' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.023508015;
      END;
    END;
  END;

********** LEAF    21  NODE   338 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('2' ,'3' ,'4' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FREQUENCY_STATUS_97NK  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'4' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('42' ,'25' ,'37' ,'48' ,'31' ,'35' ,'17' ,'47' ,'49' ,
      '50' ,'46' ,'45' ,'16' ,'30' ,'07' ,'23' ,'02' ,'18' ,'08' ,'12' ,'26' ,
      '21' ,'51' ,'44' ,'29' ,'05' ,'33' ,'22' ,'06' ,'32' ,'52' ,'10' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'53' ,'01' ,'38' ,'40' ,'13' ,'28' ,'14' ,'11' ,'03' ,
        '43' ,'20' ,'34' ,'09' ,'41' ,'15' ,'36' ,'24' ,'19' ,'27' ,'39' ,
        '42' ,'25' ,'37' ,'48' ,'31' ,'35' ,'17' ,'47' ,'49' ,'50' ,'46' ,
        '45' ,'16' ,'30' ,'07' ,'23' ,'02' ,'18' ,'08' ,'12' ,'26' ,'21' ,
        '51' ,'44' ,'29' ,'05' ,'33' ,'22' ,'06' ,'32' ,'52' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0026901648;
      END;
    END;
  END;

********** LEAF    22  NODE   342 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'37' ,'14' ,'11' ,'49' ,'50' ,'43' ,
      '45' ,'30' ,'34' ,'23' ,'09' ,'02' ,'41' ,'36' ,'21' ,'51' ,'29' ,'05' ,
      '39' ,'33' ,'06' ,'32' ,'52' ,'10' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0233229454;
      END;
    END;
  END;

********** LEAF    23  NODE   343 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('42' ,'25' ,'01' ,'38' ,'48' ,'31' ,'35' ,'40' ,'13' ,
      '28' ,'17' ,'47' ,'03' ,'46' ,'20' ,'16' ,'07' ,'15' ,'18' ,'24' ,'08' ,
      '12' ,'19' ,'27' ,'26' ,'44' ,'22' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'53' ,'37' ,'14' ,'11' ,'49' ,'50' ,'43' ,'45' ,'30' ,
        '34' ,'23' ,'09' ,'02' ,'41' ,'36' ,'21' ,'51' ,'29' ,'05' ,'39' ,
        '33' ,'06' ,'32' ,'52' ,'10' ,'42' ,'25' ,'01' ,'38' ,'48' ,'31' ,
        '35' ,'40' ,'13' ,'28' ,'17' ,'47' ,'03' ,'46' ,'20' ,'16' ,'07' ,
        '15' ,'18' ,'24' ,'08' ,'12' ,'19' ,'27' ,'26' ,'44' ,'22' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.001726972;
      END;
    END;
  END;

********** LEAF    24  NODE   344 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('2' ,'3' ,'4' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FREQUENCY_STATUS_97NK  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'4' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'53' ,'38' ,'31' ,'35' ,'40' ,'13' ,'28' ,'14' ,
      '11' ,'03' ,'43' ,'20' ,'16' ,'07' ,'34' ,'09' ,'15' ,'18' ,'36' ,'24' ,
      '27' ,'26' ,'51' ,'29' ,'05' ,'39' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'53' ,'38' ,'31' ,'35' ,'40' ,'13' ,'28' ,'14' ,'11' ,'03' ,
        '43' ,'20' ,'16' ,'07' ,'34' ,'09' ,'15' ,'18' ,'36' ,'24' ,'27' ,
        '26' ,'51' ,'29' ,'05' ,'39' ,'04' ,'42' ,'25' ,'01' ,'37' ,'48' ,
        '17' ,'47' ,'49' ,'50' ,'46' ,'45' ,'30' ,'23' ,'02' ,'41' ,'08' ,
        '12' ,'19' ,'21' ,'44' ,'33' ,'22' ,'06' ,'32' ,'52' ,'10' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.016584144;
      END;
    END;
  END;

********** LEAF    25  NODE   345 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('2' ,'3' ,'4' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FREQUENCY_STATUS_97NK  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'4' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('04' ,'42' ,'25' ,'01' ,'37' ,'48' ,'17' ,'47' ,'49' ,
      '50' ,'46' ,'45' ,'30' ,'23' ,'02' ,'41' ,'08' ,'12' ,'19' ,'21' ,'44' ,
      '33' ,'22' ,'06' ,'32' ,'52' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0055738909;
      END;
    END;
  END;

********** LEAF    26  NODE   349 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FREQUENCY_STATUS_97NK  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'4' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'42' ,'01' ,'38' ,'48' ,'31' ,'35' ,'40' ,
      '13' ,'28' ,'14' ,'17' ,'11' ,'03' ,'16' ,'07' ,'41' ,'24' ,'08' ,'12' ,
      '19' ,'32' ,'52' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.003266764;
      END;
    END;
  END;

********** LEAF    27  NODE   350 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FREQUENCY_STATUS_97NK  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'4' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('53' ,'25' ,'37' ,'47' ,'49' ,'50' ,'43' ,'46' ,'45' ,
      '20' ,'30' ,'34' ,'23' ,'09' ,'02' ,'15' ,'18' ,'36' ,'27' ,'26' ,'21' ,
      '51' ,'44' ,'29' ,'05' ,'39' ,'33' ,'22' ,'06' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'42' ,'01' ,'38' ,'48' ,'31' ,'35' ,'40' ,'13' ,'28' ,
        '14' ,'17' ,'11' ,'03' ,'16' ,'07' ,'41' ,'24' ,'08' ,'12' ,'19' ,
        '32' ,'52' ,'53' ,'25' ,'37' ,'47' ,'49' ,'50' ,'43' ,'46' ,'45' ,
        '20' ,'30' ,'34' ,'23' ,'09' ,'02' ,'15' ,'18' ,'36' ,'27' ,'26' ,
        '21' ,'51' ,'44' ,'29' ,'05' ,'39' ,'33' ,'22' ,'06' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0163449098;
      END;
    END;
  END;

********** LEAF    28  NODE   348 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('3' ,'4' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.013155494;
    END;
  END;

********** LEAF    29  NODE   354 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_CARD_GIFT ) AND 
    FILE_CARD_GIFT  <                  3.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'25' ,'48' ,'31' ,'35' ,'49' ,'50' ,'43' ,
      '45' ,'16' ,'30' ,'34' ,'09' ,'41' ,'18' ,'36' ,'08' ,'19' ,'21' ,'51' ,
      '05' ,'33' ,'32' ,'52' ,'10' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.02222169;
      END;
    END;
  END;

********** LEAF    30  NODE   355 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_CARD_GIFT ) AND 
    FILE_CARD_GIFT  <                  3.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('53' ,'42' ,'01' ,'37' ,'38' ,'40' ,'13' ,'28' ,'14' ,
      '17' ,'11' ,'47' ,'03' ,'46' ,'20' ,'07' ,'23' ,'02' ,'15' ,'24' ,'12' ,
      '27' ,'26' ,'44' ,'29' ,'39' ,'22' ,'06' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'25' ,'48' ,'31' ,'35' ,'49' ,'50' ,'43' ,'45' ,'16' ,
        '30' ,'34' ,'09' ,'41' ,'18' ,'36' ,'08' ,'19' ,'21' ,'51' ,'05' ,
        '33' ,'32' ,'52' ,'10' ,'53' ,'42' ,'01' ,'37' ,'38' ,'40' ,'13' ,
        '28' ,'14' ,'17' ,'11' ,'47' ,'03' ,'46' ,'20' ,'07' ,'23' ,'02' ,
        '15' ,'24' ,'12' ,'27' ,'26' ,'44' ,'29' ,'39' ,'22' ,'06' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.00106465;
      END;
    END;
  END;

********** LEAF    31  NODE   356 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_CARD_GIFT ) AND 
                     3.5 <= FILE_CARD_GIFT  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FILE_CARD_GIFT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'42' ,'01' ,'48' ,'31' ,'35' ,'40' ,
      '13' ,'28' ,'03' ,'49' ,'20' ,'16' ,'23' ,'09' ,'02' ,'18' ,'36' ,'24' ,
      '12' ,'33' ,'06' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.017950888;
      END;
    END;
  END;

********** LEAF    32  NODE   357 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_CARD_GIFT ) AND 
                     3.5 <= FILE_CARD_GIFT  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FILE_CARD_GIFT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('25' ,'37' ,'38' ,'14' ,'17' ,'11' ,'47' ,'50' ,'43' ,
      '46' ,'45' ,'30' ,'07' ,'34' ,'41' ,'15' ,'08' ,'19' ,'27' ,'26' ,'21' ,
      '51' ,'44' ,'29' ,'05' ,'39' ,'22' ,'32' ,'52' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'53' ,'42' ,'01' ,'48' ,'31' ,'35' ,'40' ,'13' ,'28' ,
        '03' ,'49' ,'20' ,'16' ,'23' ,'09' ,'02' ,'18' ,'36' ,'24' ,'12' ,
        '33' ,'06' ,'25' ,'37' ,'38' ,'14' ,'17' ,'11' ,'47' ,'50' ,'43' ,
        '46' ,'45' ,'30' ,'07' ,'34' ,'41' ,'15' ,'08' ,'19' ,'27' ,'26' ,
        '21' ,'51' ,'44' ,'29' ,'05' ,'39' ,'22' ,'32' ,'52' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0033652918;
      END;
    END;
  END;

********** LEAF    33  NODE   361 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( PEP_STAR  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'0' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'25' ,'37' ,'38' ,'48' ,'31' ,'35' ,
      '40' ,'13' ,'28' ,'14' ,'11' ,'49' ,'16' ,'30' ,'34' ,'09' ,'02' ,'15' ,
      '36' ,'12' ,'27' ,'51' ,'29' ,'05' ,'32' ,'52' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'53' ,'25' ,'37' ,'38' ,'48' ,'31' ,'35' ,'40' ,'13' ,
        '28' ,'14' ,'11' ,'49' ,'16' ,'30' ,'34' ,'09' ,'02' ,'15' ,'36' ,
        '12' ,'27' ,'51' ,'29' ,'05' ,'32' ,'52' ,'42' ,'01' ,'17' ,'47' ,
        '03' ,'50' ,'43' ,'46' ,'45' ,'20' ,'07' ,'23' ,'41' ,'18' ,'24' ,
        '08' ,'19' ,'26' ,'21' ,'44' ,'39' ,'33' ,'22' ,'06' ,'10' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.0178167;
      END;
    END;
  END;

********** LEAF    34  NODE   362 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( PEP_STAR  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'0' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('42' ,'01' ,'17' ,'47' ,'03' ,'50' ,'43' ,'46' ,'45' ,
      '20' ,'07' ,'23' ,'41' ,'18' ,'24' ,'08' ,'19' ,'26' ,'21' ,'44' ,'39' ,
      '33' ,'22' ,'06' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0047639306;
      END;
    END;
  END;

********** LEAF    35  NODE   363 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('0' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'25' ,'01' ,'38' ,'31' ,'35' ,'40' ,
      '13' ,'28' ,'17' ,'11' ,'03' ,'43' ,'46' ,'20' ,'07' ,'15' ,'24' ,'19' ,
      '21' ,'44' ,'33' ,'06' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.003534761;
      END;
    END;
  END;

********** LEAF    36  NODE   364 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('0' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('42' ,'37' ,'48' ,'14' ,'47' ,'49' ,'50' ,'45' ,'16' ,
      '30' ,'34' ,'23' ,'09' ,'02' ,'41' ,'18' ,'36' ,'08' ,'12' ,'27' ,'26' ,
      '51' ,'29' ,'05' ,'39' ,'22' ,'32' ,'52' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'53' ,'25' ,'01' ,'38' ,'31' ,'35' ,'40' ,'13' ,'28' ,
        '17' ,'11' ,'03' ,'43' ,'46' ,'20' ,'07' ,'15' ,'24' ,'19' ,'21' ,
        '44' ,'33' ,'06' ,'42' ,'37' ,'48' ,'14' ,'47' ,'49' ,'50' ,'45' ,
        '16' ,'30' ,'34' ,'23' ,'09' ,'02' ,'41' ,'18' ,'36' ,'08' ,'12' ,
        '27' ,'26' ,'51' ,'29' ,'05' ,'39' ,'22' ,'32' ,'52' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.021702235;
      END;
    END;
  END;

********** LEAF    37  NODE   368 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_AVG_GIFT ) AND 
    FILE_AVG_GIFT  <                10.07 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'25' ,'37' ,'48' ,'35' ,'40' ,'28' ,'14' ,
      '17' ,'11' ,'20' ,'16' ,'30' ,'09' ,'41' ,'36' ,'24' ,'12' ,'19' ,'26' ,
      '51' ,'33' ,'06' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.019900574;
      END;
    END;
  END;

********** LEAF    38  NODE   369 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_AVG_GIFT ) AND 
    FILE_AVG_GIFT  <                10.07 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('53' ,'42' ,'01' ,'38' ,'31' ,'13' ,'47' ,'03' ,'49' ,
      '50' ,'43' ,'46' ,'45' ,'07' ,'34' ,'23' ,'02' ,'15' ,'18' ,'08' ,'27' ,
      '21' ,'44' ,'29' ,'05' ,'39' ,'22' ,'32' ,'52' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'25' ,'37' ,'48' ,'35' ,'40' ,'28' ,'14' ,'17' ,'11' ,
        '20' ,'16' ,'30' ,'09' ,'41' ,'36' ,'24' ,'12' ,'19' ,'26' ,'51' ,
        '33' ,'06' ,'53' ,'42' ,'01' ,'38' ,'31' ,'13' ,'47' ,'03' ,'49' ,
        '50' ,'43' ,'46' ,'45' ,'07' ,'34' ,'23' ,'02' ,'15' ,'18' ,'08' ,
        '27' ,'21' ,'44' ,'29' ,'05' ,'39' ,'22' ,'32' ,'52' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.002170327;
      END;
    END;
  END;

********** LEAF    39  NODE   370 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_AVG_GIFT ) AND 
                   10.07 <= FILE_AVG_GIFT  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FILE_AVG_GIFT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'42' ,'01' ,'38' ,'31' ,'35' ,'40' ,'13' ,'28' ,
      '17' ,'03' ,'20' ,'16' ,'23' ,'15' ,'12' ,'29' ,'05' ,'33' ,'32' ,'52' )
       THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.005304668;
      END;
    END;
  END;

********** LEAF    40  NODE   371 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_AVG_GIFT ) AND 
                   10.07 <= FILE_AVG_GIFT  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FILE_AVG_GIFT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('04' ,'53' ,'25' ,'37' ,'48' ,'14' ,'11' ,'47' ,'49' ,
      '50' ,'43' ,'46' ,'45' ,'30' ,'07' ,'34' ,'09' ,'02' ,'41' ,'18' ,'36' ,
      '24' ,'08' ,'19' ,'27' ,'26' ,'21' ,'51' ,'44' ,'39' ,'22' ,'06' ,'10' )
       THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'42' ,'01' ,'38' ,'31' ,'35' ,'40' ,'13' ,'28' ,'17' ,'03' ,
        '20' ,'16' ,'23' ,'15' ,'12' ,'29' ,'05' ,'33' ,'32' ,'52' ,'04' ,
        '53' ,'25' ,'37' ,'48' ,'14' ,'11' ,'47' ,'49' ,'50' ,'43' ,'46' ,
        '45' ,'30' ,'07' ,'34' ,'09' ,'02' ,'41' ,'18' ,'36' ,'24' ,'08' ,
        '19' ,'27' ,'26' ,'21' ,'51' ,'44' ,'39' ,'22' ,'06' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0161763175;
      END;
    END;
  END;

********** LEAF    41  NODE   375 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( RECENCY_STATUS_96NK , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('A' ,'N' ,'F' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENCY_STATUS_96NK  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_5 NOTIN (
      'A' ,'N' ,'F' ,'S' ,'E' ,'L' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'42' ,'25' ,'01' ,'48' ,'13' ,'28' ,'14' ,'47' ,
      '03' ,'46' ,'07' ,'36' ,'24' ,'19' ,'26' ,'33' ,'22' ,'06' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.008412039;
      END;
    END;
  END;

********** LEAF    42  NODE   376 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( RECENCY_STATUS_96NK , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('A' ,'N' ,'F' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENCY_STATUS_96NK  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_5 NOTIN (
      'A' ,'N' ,'F' ,'S' ,'E' ,'L' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('04' ,'53' ,'37' ,'38' ,'31' ,'35' ,'40' ,'17' ,'11' ,
      '49' ,'50' ,'43' ,'45' ,'20' ,'16' ,'30' ,'34' ,'23' ,'09' ,'02' ,'41' ,
      '15' ,'18' ,'08' ,'12' ,'27' ,'21' ,'51' ,'44' ,'29' ,'05' ,'39' ,'32' ,
      '52' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'42' ,'25' ,'01' ,'48' ,'13' ,'28' ,'14' ,'47' ,'03' ,'46' ,
        '07' ,'36' ,'24' ,'19' ,'26' ,'33' ,'22' ,'06' ,'04' ,'53' ,'37' ,
        '38' ,'31' ,'35' ,'40' ,'17' ,'11' ,'49' ,'50' ,'43' ,'45' ,'20' ,
        '16' ,'30' ,'34' ,'23' ,'09' ,'02' ,'41' ,'15' ,'18' ,'08' ,'12' ,
        '27' ,'21' ,'51' ,'44' ,'29' ,'05' ,'39' ,'32' ,'52' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0111794738;
      END;
    END;
  END;

********** LEAF    43  NODE   374 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( RECENCY_STATUS_96NK , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('S' ,'E' ,'L' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.013118767;
    END;
  END;

********** LEAF    44  NODE   380 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'25' ,'31' ,'17' ,'49' ,'45' ,'30' ,'07' ,'23' ,
    '41' ,'36' ,'21' ,'51' ,'44' ,'39' ,'33' ,'32' ,'52' ,'10' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( INCOME_GROUP , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('4' ,'1' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( INCOME_GROUP  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_12 NOTIN (
        '4' ,'1' ,'2' ,'6' ,'5' ,'3' ,'7' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0165772427;
      END;
    END;
  END;

********** LEAF    45  NODE   381 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'25' ,'31' ,'17' ,'49' ,'45' ,'30' ,'07' ,'23' ,
    '41' ,'36' ,'21' ,'51' ,'44' ,'39' ,'33' ,'32' ,'52' ,'10' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( INCOME_GROUP , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('2' ,'6' ,'5' ,'3' ,'7' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0034625412;
      END;
    END;
  END;

********** LEAF    46  NODE   382 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('04' ,'53' ,'42' ,'01' ,'37' ,'38' ,'48' ,'35' ,'40' ,
    '13' ,'28' ,'14' ,'11' ,'47' ,'03' ,'50' ,'43' ,'46' ,'20' ,'16' ,'34' ,
    '09' ,'02' ,'15' ,'18' ,'24' ,'08' ,'12' ,'19' ,'27' ,'26' ,'29' ,'05' ,
    '22' ,'06' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'25' ,'31' ,'17' ,'49' ,'45' ,'30' ,'07' ,'23' ,'41' ,'36' ,'21' ,
      '51' ,'44' ,'39' ,'33' ,'32' ,'52' ,'10' ,'04' ,'53' ,'42' ,'01' ,'37' ,
      '38' ,'48' ,'35' ,'40' ,'13' ,'28' ,'14' ,'11' ,'47' ,'03' ,'50' ,'43' ,
      '46' ,'20' ,'16' ,'34' ,'09' ,'02' ,'15' ,'18' ,'24' ,'08' ,'12' ,'19' ,
      '27' ,'26' ,'29' ,'05' ,'22' ,'06' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('1' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.012680533;
      END;
    END;
  END;

********** LEAF    47  NODE   383 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('04' ,'53' ,'42' ,'01' ,'37' ,'38' ,'48' ,'35' ,'40' ,
    '13' ,'28' ,'14' ,'11' ,'47' ,'03' ,'50' ,'43' ,'46' ,'20' ,'16' ,'34' ,
    '09' ,'02' ,'15' ,'18' ,'24' ,'08' ,'12' ,'19' ,'27' ,'26' ,'29' ,'05' ,
    '22' ,'06' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'25' ,'31' ,'17' ,'49' ,'45' ,'30' ,'07' ,'23' ,'41' ,'36' ,'21' ,
      '51' ,'44' ,'39' ,'33' ,'32' ,'52' ,'10' ,'04' ,'53' ,'42' ,'01' ,'37' ,
      '38' ,'48' ,'35' ,'40' ,'13' ,'28' ,'14' ,'11' ,'47' ,'03' ,'50' ,'43' ,
      '46' ,'20' ,'16' ,'34' ,'09' ,'02' ,'15' ,'18' ,'24' ,'08' ,'12' ,'19' ,
      '27' ,'26' ,'29' ,'05' ,'22' ,'06' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('0' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( PEP_STAR  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_12 NOTIN (
        '1' ,'0' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0025950247;
      END;
    END;
  END;

********** LEAF    48  NODE   387 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'01' ,'37' ,'31' ,'35' ,'28' ,'17' ,'11' ,'47' ,
    '49' ,'50' ,'43' ,'45' ,'20' ,'16' ,'30' ,'09' ,'15' ,'36' ,'24' ,'08' ,
    '12' ,'26' ,'21' ,'51' ,'29' ,'39' ,'33' ,'06' ,'32' ,'52' ,'10' ) THEN 
        DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'01' ,'37' ,'31' ,'35' ,'28' ,'17' ,'11' ,'47' ,'49' ,'50' ,'43' ,
      '45' ,'20' ,'16' ,'30' ,'09' ,'15' ,'36' ,'24' ,'08' ,'12' ,'26' ,'21' ,
      '51' ,'29' ,'39' ,'33' ,'06' ,'32' ,'52' ,'10' ,'04' ,'53' ,'42' ,'25' ,
      '38' ,'48' ,'40' ,'13' ,'14' ,'03' ,'46' ,'07' ,'34' ,'23' ,'02' ,'41' ,
      '18' ,'19' ,'27' ,'44' ,'05' ,'22' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('1' ,'4' ,'0' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( RECENT_RESPONSE_COUNT  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_12 NOTIN (
        '1' ,'4' ,'0' ,'2' ,'3' ,'11' ,'12' ,'9' ,'7' ,'5' ,'8' ,'6' ,'10' ,
        '13' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0170315773;
      END;
    END;
  END;

********** LEAF    49  NODE   388 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'01' ,'37' ,'31' ,'35' ,'28' ,'17' ,'11' ,'47' ,
    '49' ,'50' ,'43' ,'45' ,'20' ,'16' ,'30' ,'09' ,'15' ,'36' ,'24' ,'08' ,
    '12' ,'26' ,'21' ,'51' ,'29' ,'39' ,'33' ,'06' ,'32' ,'52' ,'10' ) THEN 
        DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'01' ,'37' ,'31' ,'35' ,'28' ,'17' ,'11' ,'47' ,'49' ,'50' ,'43' ,
      '45' ,'20' ,'16' ,'30' ,'09' ,'15' ,'36' ,'24' ,'08' ,'12' ,'26' ,'21' ,
      '51' ,'29' ,'39' ,'33' ,'06' ,'32' ,'52' ,'10' ,'04' ,'53' ,'42' ,'25' ,
      '38' ,'48' ,'40' ,'13' ,'14' ,'03' ,'46' ,'07' ,'34' ,'23' ,'02' ,'41' ,
      '18' ,'19' ,'27' ,'44' ,'05' ,'22' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('2' ,'3' ,'11' ,'12' ,'9' ,'7' ,'5' ,'8' ,'6' ,'10' ,
      '13' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0003581064;
      END;
    END;
  END;

********** LEAF    50  NODE   389 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('04' ,'53' ,'42' ,'25' ,'38' ,'48' ,'40' ,'13' ,'14' ,
    '03' ,'46' ,'07' ,'34' ,'23' ,'02' ,'41' ,'18' ,'19' ,'27' ,'44' ,'05' ,
    '22' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('1' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.015417243;
      END;
    END;
  END;

********** LEAF    51  NODE   390 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('04' ,'53' ,'42' ,'25' ,'38' ,'48' ,'40' ,'13' ,'14' ,
    '03' ,'46' ,'07' ,'34' ,'23' ,'02' ,'41' ,'18' ,'19' ,'27' ,'44' ,'05' ,
    '22' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('0' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( PEP_STAR  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_12 NOTIN (
        '1' ,'0' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.000399174;
      END;
    END;
  END;

********** LEAF    52  NODE   394 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'42' ,'37' ,'38' ,'35' ,'11' ,'47' ,
    '49' ,'50' ,'43' ,'46' ,'45' ,'30' ,'07' ,'34' ,'09' ,'02' ,'08' ,'12' ,
    '21' ,'51' ,'44' ,'39' ,'33' ,'32' ,'52' ,'10' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'53' ,'42' ,'37' ,'38' ,'35' ,'11' ,'47' ,'49' ,'50' ,'43' ,
      '46' ,'45' ,'30' ,'07' ,'34' ,'09' ,'02' ,'08' ,'12' ,'21' ,'51' ,'44' ,
      '39' ,'33' ,'32' ,'52' ,'10' ,'25' ,'01' ,'48' ,'31' ,'40' ,'13' ,'28' ,
      '14' ,'17' ,'03' ,'20' ,'16' ,'23' ,'41' ,'15' ,'18' ,'36' ,'24' ,'19' ,
      '27' ,'26' ,'29' ,'05' ,'22' ,'06' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('1' ,'2' ,'4' ,'0' ,'9' ,'6' ,'10' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0131102809;
      END;
    END;
  END;

********** LEAF    53  NODE   395 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'42' ,'37' ,'38' ,'35' ,'11' ,'47' ,
    '49' ,'50' ,'43' ,'46' ,'45' ,'30' ,'07' ,'34' ,'09' ,'02' ,'08' ,'12' ,
    '21' ,'51' ,'44' ,'39' ,'33' ,'32' ,'52' ,'10' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'53' ,'42' ,'37' ,'38' ,'35' ,'11' ,'47' ,'49' ,'50' ,'43' ,
      '46' ,'45' ,'30' ,'07' ,'34' ,'09' ,'02' ,'08' ,'12' ,'21' ,'51' ,'44' ,
      '39' ,'33' ,'32' ,'52' ,'10' ,'25' ,'01' ,'48' ,'31' ,'40' ,'13' ,'28' ,
      '14' ,'17' ,'03' ,'20' ,'16' ,'23' ,'41' ,'15' ,'18' ,'36' ,'24' ,'19' ,
      '27' ,'26' ,'29' ,'05' ,'22' ,'06' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('3' ,'11' ,'12' ,'7' ,'5' ,'8' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( RECENT_RESPONSE_COUNT  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_12 NOTIN (
        '1' ,'2' ,'4' ,'0' ,'9' ,'6' ,'10' ,'3' ,'11' ,'12' ,'7' ,'5' ,'8' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.005602028;
      END;
    END;
  END;

********** LEAF    54  NODE   396 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('25' ,'01' ,'48' ,'31' ,'40' ,'13' ,'28' ,'14' ,'17' ,
    '03' ,'20' ,'16' ,'23' ,'41' ,'15' ,'18' ,'36' ,'24' ,'19' ,'27' ,'26' ,
    '29' ,'05' ,'22' ,'06' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LAST_GIFT_AMT ) AND 
      LAST_GIFT_AMT  <                 15.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LAST_GIFT_AMT  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.013335318;
      END;
    END;
  END;

********** LEAF    55  NODE   397 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('25' ,'01' ,'48' ,'31' ,'40' ,'13' ,'28' ,'14' ,'17' ,
    '03' ,'20' ,'16' ,'23' ,'41' ,'15' ,'18' ,'36' ,'24' ,'19' ,'27' ,'26' ,
    '29' ,'05' ,'22' ,'06' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LAST_GIFT_AMT ) AND 
                      15.5 <= LAST_GIFT_AMT  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0030101028;
      END;
    END;
  END;

********** LEAF    56  NODE   401 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('4' ,'3' ,'2' ,'5' ,'8' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENT_CARD_RESPONSE_COUNT  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '4' ,'3' ,'2' ,'5' ,'8' ,'0' ,'1' ,'7' ,'6' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'42' ,'01' ,'37' ,'48' ,'31' ,'35' ,
      '40' ,'28' ,'14' ,'11' ,'45' ,'20' ,'07' ,'34' ,'23' ,'09' ,'02' ,'15' ,
      '18' ,'36' ,'24' ,'12' ,'19' ,'51' ,'05' ,'33' ,'22' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'53' ,'42' ,'01' ,'37' ,'48' ,'31' ,'35' ,'40' ,'28' ,
        '14' ,'11' ,'45' ,'20' ,'07' ,'34' ,'23' ,'09' ,'02' ,'15' ,'18' ,
        '36' ,'24' ,'12' ,'19' ,'51' ,'05' ,'33' ,'22' ,'25' ,'38' ,'13' ,
        '17' ,'47' ,'03' ,'49' ,'50' ,'43' ,'46' ,'16' ,'30' ,'41' ,'08' ,
        '27' ,'26' ,'21' ,'44' ,'29' ,'39' ,'06' ,'32' ,'52' ,'10' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.016465268;
      END;
    END;
  END;

********** LEAF    57  NODE   402 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('4' ,'3' ,'2' ,'5' ,'8' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENT_CARD_RESPONSE_COUNT  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '4' ,'3' ,'2' ,'5' ,'8' ,'0' ,'1' ,'7' ,'6' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('25' ,'38' ,'13' ,'17' ,'47' ,'03' ,'49' ,'50' ,'43' ,
      '46' ,'16' ,'30' ,'41' ,'08' ,'27' ,'26' ,'21' ,'44' ,'29' ,'39' ,'06' ,
      '32' ,'52' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0047913722;
      END;
    END;
  END;

********** LEAF    58  NODE   403 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('0' ,'1' ,'7' ,'6' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'53' ,'37' ,'48' ,'14' ,'49' ,'50' ,'43' ,'45' ,
      '30' ,'23' ,'09' ,'15' ,'36' ,'24' ,'08' ,'12' ,'26' ,'21' ,'05' ,'33' ,
      '22' ,'06' ,'10' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0170419009;
      END;
    END;
  END;

********** LEAF    59  NODE   404 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('0' ,'1' ,'7' ,'6' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('04' ,'42' ,'25' ,'01' ,'38' ,'31' ,'35' ,'40' ,'13' ,
      '28' ,'17' ,'11' ,'47' ,'03' ,'46' ,'20' ,'16' ,'07' ,'34' ,'02' ,'41' ,
      '18' ,'19' ,'27' ,'51' ,'44' ,'29' ,'39' ,'32' ,'52' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'53' ,'37' ,'48' ,'14' ,'49' ,'50' ,'43' ,'45' ,'30' ,'23' ,
        '09' ,'15' ,'36' ,'24' ,'08' ,'12' ,'26' ,'21' ,'05' ,'33' ,'22' ,
        '06' ,'10' ,'04' ,'42' ,'25' ,'01' ,'38' ,'31' ,'35' ,'40' ,'13' ,
        '28' ,'17' ,'11' ,'47' ,'03' ,'46' ,'20' ,'16' ,'07' ,'34' ,'02' ,
        '41' ,'18' ,'19' ,'27' ,'51' ,'44' ,'29' ,'39' ,'32' ,'52' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.000805551;
      END;
    END;
  END;

********** LEAF    60  NODE   408 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'25' ,'01' ,'37' ,'38' ,'48' ,'40' ,
    '13' ,'28' ,'17' ,'11' ,'47' ,'03' ,'49' ,'20' ,'16' ,'34' ,'23' ,'09' ,
    '15' ,'18' ,'24' ,'26' ,'21' ,'51' ,'44' ,'39' ,'33' ,'22' ,'52' ) THEN 
        DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'53' ,'25' ,'01' ,'37' ,'38' ,'48' ,'40' ,'13' ,'28' ,'17' ,
      '11' ,'47' ,'03' ,'49' ,'20' ,'16' ,'34' ,'23' ,'09' ,'15' ,'18' ,'24' ,
      '26' ,'21' ,'51' ,'44' ,'39' ,'33' ,'22' ,'52' ,'42' ,'31' ,'35' ,'14' ,
      '50' ,'43' ,'46' ,'45' ,'30' ,'07' ,'02' ,'41' ,'36' ,'08' ,'12' ,'19' ,
      '27' ,'29' ,'05' ,'06' ,'32' ,'10' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(FILE_CARD_GIFT ) AND 
      FILE_CARD_GIFT  <                  3.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0034237854;
      END;
    END;
  END;

********** LEAF    61  NODE   409 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'25' ,'01' ,'37' ,'38' ,'48' ,'40' ,
    '13' ,'28' ,'17' ,'11' ,'47' ,'03' ,'49' ,'20' ,'16' ,'34' ,'23' ,'09' ,
    '15' ,'18' ,'24' ,'26' ,'21' ,'51' ,'44' ,'39' ,'33' ,'22' ,'52' ) THEN 
        DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'53' ,'25' ,'01' ,'37' ,'38' ,'48' ,'40' ,'13' ,'28' ,'17' ,
      '11' ,'47' ,'03' ,'49' ,'20' ,'16' ,'34' ,'23' ,'09' ,'15' ,'18' ,'24' ,
      '26' ,'21' ,'51' ,'44' ,'39' ,'33' ,'22' ,'52' ,'42' ,'31' ,'35' ,'14' ,
      '50' ,'43' ,'46' ,'45' ,'30' ,'07' ,'02' ,'41' ,'36' ,'08' ,'12' ,'19' ,
      '27' ,'29' ,'05' ,'06' ,'32' ,'10' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(FILE_CARD_GIFT ) AND 
                       3.5 <= FILE_CARD_GIFT  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( FILE_CARD_GIFT  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.011715717;
      END;
    END;
  END;

********** LEAF    62  NODE   410 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('42' ,'31' ,'35' ,'14' ,'50' ,'43' ,'46' ,'45' ,'30' ,
    '07' ,'02' ,'41' ,'36' ,'08' ,'12' ,'19' ,'27' ,'29' ,'05' ,'06' ,'32' ,
    '10' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LAST_GIFT_AMT ) AND 
      LAST_GIFT_AMT  <                 14.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.001082103;
      END;
    END;
  END;

********** LEAF    63  NODE   411 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('42' ,'31' ,'35' ,'14' ,'50' ,'43' ,'46' ,'45' ,'30' ,
    '07' ,'02' ,'41' ,'36' ,'08' ,'12' ,'19' ,'27' ,'29' ,'05' ,'06' ,'32' ,
    '10' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LAST_GIFT_AMT ) AND 
                      14.5 <= LAST_GIFT_AMT  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LAST_GIFT_AMT  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0141158976;
      END;
    END;
  END;

********** LEAF    64  NODE   415 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_AVG_GIFT ) AND 
    FILE_AVG_GIFT  <                10.07 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'42' ,'25' ,'01' ,'38' ,'48' ,'31' ,'13' ,'50' ,
      '43' ,'45' ,'16' ,'07' ,'34' ,'09' ,'02' ,'15' ,'18' ,'08' ,'12' ,'19' ,
      '21' ,'51' ,'44' ,'29' ,'05' ,'22' ,'32' ,'10' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0046891133;
      END;
    END;
  END;

********** LEAF    65  NODE   416 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_AVG_GIFT ) AND 
    FILE_AVG_GIFT  <                10.07 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('04' ,'53' ,'37' ,'35' ,'40' ,'28' ,'14' ,'17' ,'11' ,
      '47' ,'03' ,'49' ,'46' ,'20' ,'30' ,'23' ,'41' ,'36' ,'24' ,'27' ,'26' ,
      '39' ,'33' ,'06' ,'52' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'42' ,'25' ,'01' ,'38' ,'48' ,'31' ,'13' ,'50' ,'43' ,'45' ,
        '16' ,'07' ,'34' ,'09' ,'02' ,'15' ,'18' ,'08' ,'12' ,'19' ,'21' ,
        '51' ,'44' ,'29' ,'05' ,'22' ,'32' ,'10' ,'04' ,'53' ,'37' ,'35' ,
        '40' ,'28' ,'14' ,'17' ,'11' ,'47' ,'03' ,'49' ,'46' ,'20' ,'30' ,
        '23' ,'41' ,'36' ,'24' ,'27' ,'26' ,'39' ,'33' ,'06' ,'52' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.017613613;
      END;
    END;
  END;

********** LEAF    66  NODE   417 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_AVG_GIFT ) AND 
                   10.07 <= FILE_AVG_GIFT  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FILE_AVG_GIFT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'53' ,'42' ,'48' ,'28' ,'17' ,'11' ,'49' ,'45' ,
      '20' ,'16' ,'30' ,'23' ,'41' ,'18' ,'36' ,'08' ,'19' ,'27' ,'26' ,'44' ,
      '29' ,'39' ,'33' ,'06' ,'32' ,'52' ,'10' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'53' ,'42' ,'48' ,'28' ,'17' ,'11' ,'49' ,'45' ,'20' ,'16' ,
        '30' ,'23' ,'41' ,'18' ,'36' ,'08' ,'19' ,'27' ,'26' ,'44' ,'29' ,
        '39' ,'33' ,'06' ,'32' ,'52' ,'10' ,'04' ,'25' ,'01' ,'37' ,'38' ,
        '31' ,'35' ,'40' ,'13' ,'14' ,'47' ,'03' ,'50' ,'43' ,'46' ,'07' ,
        '34' ,'09' ,'02' ,'15' ,'24' ,'12' ,'21' ,'51' ,'05' ,'22' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0158227432;
      END;
    END;
  END;

********** LEAF    67  NODE   418 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_AVG_GIFT ) AND 
                   10.07 <= FILE_AVG_GIFT  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FILE_AVG_GIFT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('04' ,'25' ,'01' ,'37' ,'38' ,'31' ,'35' ,'40' ,'13' ,
      '14' ,'47' ,'03' ,'50' ,'43' ,'46' ,'07' ,'34' ,'09' ,'02' ,'15' ,'24' ,
      '12' ,'21' ,'51' ,'05' ,'22' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.003022749;
      END;
    END;
  END;

********** LEAF    68  NODE   422 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'25' ,'37' ,'31' ,'47' ,'50' ,'43' ,'45' ,'20' ,
    '30' ,'23' ,'41' ,'18' ,'27' ,'21' ,'51' ,'44' ,'29' ,'05' ,'33' ,'32' ,
    '10' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('4' ,'3' ,'2' ,'5' ,'8' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( RECENT_CARD_RESPONSE_COUNT  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_12 NOTIN (
        '4' ,'3' ,'2' ,'5' ,'8' ,'0' ,'1' ,'7' ,'6' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0013638799;
      END;
    END;
  END;

********** LEAF    69  NODE   423 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'25' ,'37' ,'31' ,'47' ,'50' ,'43' ,'45' ,'20' ,
    '30' ,'23' ,'41' ,'18' ,'27' ,'21' ,'51' ,'44' ,'29' ,'05' ,'33' ,'32' ,
    '10' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('0' ,'1' ,'7' ,'6' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0166912836;
      END;
    END;
  END;

********** LEAF    70  NODE   424 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('04' ,'53' ,'42' ,'01' ,'38' ,'48' ,'35' ,'40' ,'13' ,
    '28' ,'14' ,'17' ,'11' ,'03' ,'49' ,'46' ,'16' ,'07' ,'34' ,'09' ,'02' ,
    '15' ,'36' ,'24' ,'08' ,'12' ,'19' ,'26' ,'39' ,'22' ,'06' ,'52' ) THEN 
        DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'25' ,'37' ,'31' ,'47' ,'50' ,'43' ,'45' ,'20' ,'30' ,'23' ,'41' ,
      '18' ,'27' ,'21' ,'51' ,'44' ,'29' ,'05' ,'33' ,'32' ,'10' ,'04' ,'53' ,
      '42' ,'01' ,'38' ,'48' ,'35' ,'40' ,'13' ,'28' ,'14' ,'17' ,'11' ,'03' ,
      '49' ,'46' ,'16' ,'07' ,'34' ,'09' ,'02' ,'15' ,'36' ,'24' ,'08' ,'12' ,
      '19' ,'26' ,'39' ,'22' ,'06' ,'52' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LAST_GIFT_AMT ) AND 
      LAST_GIFT_AMT  <                 19.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LAST_GIFT_AMT  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.010705433;
      END;
    END;
  END;

********** LEAF    71  NODE   425 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('04' ,'53' ,'42' ,'01' ,'38' ,'48' ,'35' ,'40' ,'13' ,
    '28' ,'14' ,'17' ,'11' ,'03' ,'49' ,'46' ,'16' ,'07' ,'34' ,'09' ,'02' ,
    '15' ,'36' ,'24' ,'08' ,'12' ,'19' ,'26' ,'39' ,'22' ,'06' ,'52' ) THEN 
        DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'25' ,'37' ,'31' ,'47' ,'50' ,'43' ,'45' ,'20' ,'30' ,'23' ,'41' ,
      '18' ,'27' ,'21' ,'51' ,'44' ,'29' ,'05' ,'33' ,'32' ,'10' ,'04' ,'53' ,
      '42' ,'01' ,'38' ,'48' ,'35' ,'40' ,'13' ,'28' ,'14' ,'17' ,'11' ,'03' ,
      '49' ,'46' ,'16' ,'07' ,'34' ,'09' ,'02' ,'15' ,'36' ,'24' ,'08' ,'12' ,
      '19' ,'26' ,'39' ,'22' ,'06' ,'52' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LAST_GIFT_AMT ) AND 
                      19.5 <= LAST_GIFT_AMT  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0057892462;
      END;
    END;
  END;

********** LEAF    72  NODE   429 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'37' ,'40' ,'13' ,'11' ,'47' ,'49' ,'43' ,'45' ,
    '16' ,'07' ,'34' ,'23' ,'09' ,'36' ,'08' ,'27' ,'26' ,'44' ,'39' ,'33' ,
    '22' ,'06' ,'32' ,'10' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(MEDIAN_HOME_VALUE ) AND 
      MEDIAN_HOME_VALUE  <                  802 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( MEDIAN_HOME_VALUE  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0121951614;
      END;
    END;
  END;

********** LEAF    73  NODE   430 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'37' ,'40' ,'13' ,'11' ,'47' ,'49' ,'43' ,'45' ,
    '16' ,'07' ,'34' ,'23' ,'09' ,'36' ,'08' ,'27' ,'26' ,'44' ,'39' ,'33' ,
    '22' ,'06' ,'32' ,'10' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(MEDIAN_HOME_VALUE ) AND 
                       802 <= MEDIAN_HOME_VALUE  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.001072422;
      END;
    END;
  END;

********** LEAF    74  NODE   431 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('04' ,'53' ,'42' ,'25' ,'01' ,'38' ,'48' ,'31' ,'35' ,
    '28' ,'14' ,'17' ,'03' ,'50' ,'46' ,'20' ,'30' ,'02' ,'41' ,'15' ,'18' ,
    '24' ,'12' ,'19' ,'21' ,'51' ,'29' ,'05' ,'52' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'37' ,'40' ,'13' ,'11' ,'47' ,'49' ,'43' ,'45' ,'16' ,'07' ,'34' ,
      '23' ,'09' ,'36' ,'08' ,'27' ,'26' ,'44' ,'39' ,'33' ,'22' ,'06' ,'32' ,
      '10' ,'04' ,'53' ,'42' ,'25' ,'01' ,'38' ,'48' ,'31' ,'35' ,'28' ,'14' ,
      '17' ,'03' ,'50' ,'46' ,'20' ,'30' ,'02' ,'41' ,'15' ,'18' ,'24' ,'12' ,
      '19' ,'21' ,'51' ,'29' ,'05' ,'52' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LAST_GIFT_AMT ) AND 
      LAST_GIFT_AMT  <                 11.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.014968345;
      END;
    END;
  END;

********** LEAF    75  NODE   432 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('04' ,'53' ,'42' ,'25' ,'01' ,'38' ,'48' ,'31' ,'35' ,
    '28' ,'14' ,'17' ,'03' ,'50' ,'46' ,'20' ,'30' ,'02' ,'41' ,'15' ,'18' ,
    '24' ,'12' ,'19' ,'21' ,'51' ,'29' ,'05' ,'52' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'37' ,'40' ,'13' ,'11' ,'47' ,'49' ,'43' ,'45' ,'16' ,'07' ,'34' ,
      '23' ,'09' ,'36' ,'08' ,'27' ,'26' ,'44' ,'39' ,'33' ,'22' ,'06' ,'32' ,
      '10' ,'04' ,'53' ,'42' ,'25' ,'01' ,'38' ,'48' ,'31' ,'35' ,'28' ,'14' ,
      '17' ,'03' ,'50' ,'46' ,'20' ,'30' ,'02' ,'41' ,'15' ,'18' ,'24' ,'12' ,
      '19' ,'21' ,'51' ,'29' ,'05' ,'52' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LAST_GIFT_AMT ) AND 
                      11.5 <= LAST_GIFT_AMT  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LAST_GIFT_AMT  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.001491597;
      END;
    END;
  END;

********** LEAF    76  NODE   436 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( WEALTH_RATING , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('5' ,'2' ,'1' ,'3' ,'9' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( WEALTH_RATING  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '5' ,'2' ,'1' ,'3' ,'9' ,'4' ,'7' ,'6' ,'8' ,'0' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'25' ,'01' ,'38' ,'48' ,'13' ,'28' ,
      '17' ,'03' ,'46' ,'16' ,'09' ,'26' ,'44' ,'39' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.008380753;
      END;
    END;
  END;

********** LEAF    77  NODE   437 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( WEALTH_RATING , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('5' ,'2' ,'1' ,'3' ,'9' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( WEALTH_RATING  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '5' ,'2' ,'1' ,'3' ,'9' ,'4' ,'7' ,'6' ,'8' ,'0' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('42' ,'37' ,'31' ,'35' ,'40' ,'14' ,'11' ,'47' ,'49' ,
      '50' ,'43' ,'45' ,'20' ,'30' ,'07' ,'34' ,'23' ,'02' ,'41' ,'15' ,'18' ,
      '36' ,'24' ,'08' ,'12' ,'19' ,'27' ,'21' ,'51' ,'29' ,'05' ,'33' ,'22' ,
      '06' ,'32' ,'52' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'53' ,'25' ,'01' ,'38' ,'48' ,'13' ,'28' ,'17' ,'03' ,
        '46' ,'16' ,'09' ,'26' ,'44' ,'39' ,'42' ,'37' ,'31' ,'35' ,'40' ,
        '14' ,'11' ,'47' ,'49' ,'50' ,'43' ,'45' ,'20' ,'30' ,'07' ,'34' ,
        '23' ,'02' ,'41' ,'15' ,'18' ,'36' ,'24' ,'08' ,'12' ,'19' ,'27' ,
        '21' ,'51' ,'29' ,'05' ,'33' ,'22' ,'06' ,'32' ,'52' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0087719007;
      END;
    END;
  END;

********** LEAF    78  NODE   435 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( WEALTH_RATING , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('4' ,'7' ,'6' ,'8' ,'0' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.009577512;
    END;
  END;

********** LEAF    79  NODE   439 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(RECENT_AVG_GIFT_AMT ) AND 
    RECENT_AVG_GIFT_AMT  <                9.475 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.01145818;
    END;
  END;

********** LEAF    80  NODE   441 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(RECENT_AVG_GIFT_AMT ) AND 
                   9.475 <= RECENT_AVG_GIFT_AMT  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENT_AVG_GIFT_AMT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'01' ,'38' ,'48' ,'31' ,'40' ,'13' ,'28' ,
      '17' ,'11' ,'47' ,'49' ,'43' ,'16' ,'34' ,'23' ,'02' ,'36' ,'24' ,'19' ,
      '27' ,'26' ,'21' ,'05' ,'06' ,'52' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'01' ,'38' ,'48' ,'31' ,'40' ,'13' ,'28' ,'17' ,'11' ,
        '47' ,'49' ,'43' ,'16' ,'34' ,'23' ,'02' ,'36' ,'24' ,'19' ,'27' ,
        '26' ,'21' ,'05' ,'06' ,'52' ,'53' ,'42' ,'25' ,'37' ,'35' ,'14' ,
        '03' ,'50' ,'46' ,'45' ,'20' ,'30' ,'07' ,'09' ,'41' ,'15' ,'18' ,
        '08' ,'12' ,'51' ,'44' ,'29' ,'39' ,'33' ,'22' ,'32' ,'10' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.002026914;
      END;
    END;
  END;

********** LEAF    81  NODE   442 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(RECENT_AVG_GIFT_AMT ) AND 
                   9.475 <= RECENT_AVG_GIFT_AMT  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENT_AVG_GIFT_AMT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('53' ,'42' ,'25' ,'37' ,'35' ,'14' ,'03' ,'50' ,'46' ,
      '45' ,'20' ,'30' ,'07' ,'09' ,'41' ,'15' ,'18' ,'08' ,'12' ,'51' ,'44' ,
      '29' ,'39' ,'33' ,'22' ,'32' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.01107595;
      END;
    END;
  END;

********** LEAF    82  NODE   444 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(RECENT_AVG_GIFT_AMT ) AND 
    RECENT_AVG_GIFT_AMT  <                8.845 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.011656018;
    END;
  END;

********** LEAF    83  NODE   446 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(RECENT_AVG_GIFT_AMT ) AND 
                   8.845 <= RECENT_AVG_GIFT_AMT  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENT_AVG_GIFT_AMT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'42' ,'01' ,'38' ,'31' ,'35' ,'40' ,'13' ,'28' ,
      '14' ,'17' ,'11' ,'43' ,'07' ,'34' ,'24' ,'26' ,'21' ,'29' ,'52' ) THEN 
        DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.005667742;
      END;
    END;
  END;

********** LEAF    84  NODE   447 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(RECENT_AVG_GIFT_AMT ) AND 
                   8.845 <= RECENT_AVG_GIFT_AMT  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENT_AVG_GIFT_AMT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('04' ,'53' ,'25' ,'37' ,'48' ,'47' ,'03' ,'49' ,'50' ,
      '46' ,'45' ,'20' ,'16' ,'30' ,'23' ,'09' ,'02' ,'41' ,'15' ,'18' ,'36' ,
      '08' ,'12' ,'19' ,'27' ,'51' ,'44' ,'05' ,'39' ,'33' ,'22' ,'06' ,'32' ,
      '10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'42' ,'01' ,'38' ,'31' ,'35' ,'40' ,'13' ,'28' ,'14' ,'17' ,
        '11' ,'43' ,'07' ,'34' ,'24' ,'26' ,'21' ,'29' ,'52' ,'04' ,'53' ,
        '25' ,'37' ,'48' ,'47' ,'03' ,'49' ,'50' ,'46' ,'45' ,'20' ,'16' ,
        '30' ,'23' ,'09' ,'02' ,'41' ,'15' ,'18' ,'36' ,'08' ,'12' ,'19' ,
        '27' ,'51' ,'44' ,'05' ,'39' ,'33' ,'22' ,'06' ,'32' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0104797097;
      END;
    END;
  END;

********** LEAF    85  NODE   451 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(MEDIAN_HOME_VALUE ) AND 
    MEDIAN_HOME_VALUE  <               1026.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( MEDIAN_HOME_VALUE  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'25' ,'01' ,'38' ,'31' ,'35' ,'40' ,'13' ,'28' ,
      '11' ,'47' ,'50' ,'46' ,'20' ,'07' ,'34' ,'23' ,'09' ,'02' ,'36' ,'24' ,
      '27' ,'26' ,'29' ,'33' ,'06' ,'32' ,'10' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0105795572;
      END;
    END;
  END;

********** LEAF    86  NODE   452 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(MEDIAN_HOME_VALUE ) AND 
    MEDIAN_HOME_VALUE  <               1026.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( MEDIAN_HOME_VALUE  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('04' ,'53' ,'42' ,'37' ,'48' ,'14' ,'17' ,'03' ,'49' ,
      '43' ,'45' ,'16' ,'30' ,'41' ,'15' ,'18' ,'08' ,'12' ,'19' ,'21' ,'51' ,
      '44' ,'05' ,'39' ,'22' ,'52' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'25' ,'01' ,'38' ,'31' ,'35' ,'40' ,'13' ,'28' ,'11' ,'47' ,
        '50' ,'46' ,'20' ,'07' ,'34' ,'23' ,'09' ,'02' ,'36' ,'24' ,'27' ,
        '26' ,'29' ,'33' ,'06' ,'32' ,'10' ,'04' ,'53' ,'42' ,'37' ,'48' ,
        '14' ,'17' ,'03' ,'49' ,'43' ,'45' ,'16' ,'30' ,'41' ,'15' ,'18' ,
        '08' ,'12' ,'19' ,'21' ,'51' ,'44' ,'05' ,'39' ,'22' ,'52' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.000750604;
      END;
    END;
  END;

********** LEAF    87  NODE   450 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(MEDIAN_HOME_VALUE ) AND 
                  1026.5 <= MEDIAN_HOME_VALUE  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.008670773;
    END;
  END;

********** LEAF    88  NODE   454 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( CARD_PROM_12 , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('11' ,'7' ,'9' ,'4' ,'8' ,'2' ,'12' ,'1' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CARD_PROM_12  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '11' ,'7' ,'9' ,'4' ,'8' ,'2' ,'12' ,'1' ,'5' ,'6' ,'10' ,'3' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.012852737;
    END;
  END;

********** LEAF    89  NODE   456 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( CARD_PROM_12 , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('5' ,'6' ,'10' ,'3' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( WEALTH_RATING , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('5' ,'2' ,'1' ,'7' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( WEALTH_RATING  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_12 NOTIN (
        '5' ,'2' ,'1' ,'7' ,'3' ,'9' ,'4' ,'6' ,'8' ,'0' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0081630751;
      END;
    END;
  END;

********** LEAF    90  NODE   457 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( CARD_PROM_12 , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('5' ,'6' ,'10' ,'3' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( WEALTH_RATING , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('3' ,'9' ,'4' ,'6' ,'8' ,'0' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.004029855;
      END;
    END;
  END;

_ARB_F_ = 2.0 * _ARB_F_;
IF _ARB_BADF_ NE 0 THEN P_TARGET_B0  = 0.7499530693;
ELSE IF _ARB_F_ > 45.0 THEN P_TARGET_B0  = 1.0;
ELSE IF _ARB_F_ < -45.0 THEN P_TARGET_B0  = 0.0;
ELSE P_TARGET_B0  = 1.0/(1.0 + EXP( - _ARB_F_));
P_TARGET_B1  = 1.0 - P_TARGET_B0 ;
*****  CREATE Q_: POSTERIORS WITHOUT PRIORS ****;
Q_TARGET_B1  = P_TARGET_B1 ;
Q_TARGET_B0  = P_TARGET_B0 ;

*****  ADJUST POSTERIOR  PROBILITIES WITH PRIORS ****;
 _ARB_P_   = 0;
P_TARGET_B1  = P_TARGET_B1  * 0.1999624625;
 _ARB_P_ + P_TARGET_B1 ;
P_TARGET_B0  = P_TARGET_B0  * 1.2667459324;
 _ARB_P_ + P_TARGET_B0 ;
IF _ARB_P_ > 0 THEN DO;
  P_TARGET_B1  = P_TARGET_B1  / _ARB_P_;
  P_TARGET_B0  = P_TARGET_B0  / _ARB_P_;
END;

*****  I_ AND U_ VARIABLES *******************;
 DROP _ARB_I_ _ARB_IP_;
 _ARB_IP_ = -1.0;
 IF _ARB_IP_ + 1.0/32768.0 < P_TARGET_B1 THEN DO;
   _ARB_IP_ = P_TARGET_B1 ;
   _ARB_I_  = 1;
   END;
 IF _ARB_IP_ + 1.0/32768.0 < P_TARGET_B0 THEN DO;
   _ARB_IP_ = P_TARGET_B0 ;
   _ARB_I_  = 2;
   END;
 SELECT( _ARB_I_);
  WHEN( 1) DO;
    I_TARGET_B  = '1' ;
    U_TARGET_B  =  1;
     END;
  WHEN( 2) DO;
    I_TARGET_B  = '0' ;
    U_TARGET_B  =  0;
     END;
   END;

*****  RESIDUALS R_ *************;
IF  F_TARGET_B  NE '1' 
AND F_TARGET_B  NE '0'  THEN DO; 
        R_TARGET_B1  = .;
        R_TARGET_B0  = .;
 END;
 ELSE DO;
       R_TARGET_B1  =  -P_TARGET_B1 ;
       R_TARGET_B0  =  -P_TARGET_B0 ;
       SELECT( F_TARGET_B  );
          WHEN( '1'  ) R_TARGET_B1  = R_TARGET_B1  +1;
          WHEN( '0'  ) R_TARGET_B0  = R_TARGET_B0  +1;
       END;
 END;

*****  DECISION VARIABLES *******;

*** Decision Processing;
label D_TARGET_B = 'Decision: TARGET_B' ;
label EP_TARGET_B = 'Expected Profit: TARGET_B' ;
label BP_TARGET_B = 'Best Profit: TARGET_B' ;
label CP_TARGET_B = 'Computed Profit: TARGET_B' ;

length D_TARGET_B $ 1;

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
if _sum > EP_TARGET_B + 4.547474E-13 then do;
   EP_TARGET_B = _sum; _decnum = 2;
   D_TARGET_B = '0' ;
end;

*** Decision Matrix;
array BOOSTdema [2,2] _temporary_ (
/* row 1 */  14.5 0
/* row 2 */  -0.5 0
);

*** Find Index of Target Category;
drop _tarnum; select( F_TARGET_B );
   when('1' ) _tarnum = 1;
   when('0' ) _tarnum = 2;
   otherwise _tarnum = 0;
end;
if _tarnum <= 0 then goto BOOSTdeex;

*** Computed Consequence of Chosen Decision;
CP_TARGET_B = BOOSTdema [_tarnum,_decnum];

*** Best Possible Consequence of Any Decision without Cost;
array BOOSTdebe [2] _temporary_ ( 14.5 0);
BP_TARGET_B = BOOSTdebe [_tarnum];


BOOSTdeex:;

*** End Decision Processing ;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

*------------------------------------------------------------*;
*Computing Unadjusted Residual Vars: TARGET_B;
*------------------------------------------------------------*;
Label R_TARGET_B1='Residual: TARGET_B=1';
Label R_TARGET_B0='Residual: TARGET_B=0';
if
 F_TARGET_B ne '1'
and F_TARGET_B ne '0'
 then do;
R_TARGET_B1=.;
R_TARGET_B0=.;
end;
else do;
R_TARGET_B1= - Q_TARGET_B1;
R_TARGET_B0= - Q_TARGET_B0;
select(F_TARGET_B);
when('1')R_TARGET_B1= R_TARGET_B1+1;
when('0')R_TARGET_B0= R_TARGET_B0+1;
otherwise;
end;
end;
