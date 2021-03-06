*;
* IMPUTE VARIABLE: INCOME_GROUP;
*;
label IMP_INCOME_GROUP = 'Imputed INCOME_GROUP';
IMP_INCOME_GROUP = INCOME_GROUP;
if missing(IMP_INCOME_GROUP) then do;
****************************************************************;
****** DECISION TREE SCORING CODE ******;
****************************************************************;
****** LENGTHS OF NEW CHARACTER VARIABLES ******;
LENGTH I_INCOME_GROUP $ 12;
LENGTH _WARN_ $ 4;
****** LABELS FOR NEW VARIABLES ******;
LABEL P_INCOME_GROUP2 = 'Predicted: INCOME_GROUP=2';
LABEL P_INCOME_GROUP6 = 'Predicted: INCOME_GROUP=6';
LABEL P_INCOME_GROUP5 = 'Predicted: INCOME_GROUP=5';
LABEL P_INCOME_GROUP4 = 'Predicted: INCOME_GROUP=4';
LABEL P_INCOME_GROUP3 = 'Predicted: INCOME_GROUP=3';
LABEL P_INCOME_GROUP1 = 'Predicted: INCOME_GROUP=1';
LABEL P_INCOME_GROUP7 = 'Predicted: INCOME_GROUP=7';
LABEL Q_INCOME_GROUP2 = 'Unadjusted P: INCOME_GROUP=2';
LABEL Q_INCOME_GROUP6 = 'Unadjusted P: INCOME_GROUP=6';
LABEL Q_INCOME_GROUP5 = 'Unadjusted P: INCOME_GROUP=5';
LABEL Q_INCOME_GROUP4 = 'Unadjusted P: INCOME_GROUP=4';
LABEL Q_INCOME_GROUP3 = 'Unadjusted P: INCOME_GROUP=3';
LABEL Q_INCOME_GROUP1 = 'Unadjusted P: INCOME_GROUP=1';
LABEL Q_INCOME_GROUP7 = 'Unadjusted P: INCOME_GROUP=7';
LABEL I_INCOME_GROUP = 'Into: INCOME_GROUP';
LABEL U_INCOME_GROUP = 'Unnormalized Into: INCOME_GROUP';
LABEL _WARN_ = 'Warnings';
****** TEMPORARY VARIABLES FOR FORMATTED VALUES ******;
LENGTH _ARBFMT_12 $ 12;
DROP _ARBFMT_12;
_ARBFMT_12 = ' ';
/* Initialize to avoid warning. */
LENGTH _ARBFMT_2 $ 2;
DROP _ARBFMT_2;
_ARBFMT_2 = ' ';
/* Initialize to avoid warning. */
LENGTH _ARBFMT_3 $ 3;
DROP _ARBFMT_3;
_ARBFMT_3 = ' ';
/* Initialize to avoid warning. */
LENGTH _ARBFMT_1 $ 1;
DROP _ARBFMT_1;
_ARBFMT_1 = ' ';
/* Initialize to avoid warning. */
LENGTH _ARBFMT_4 $ 4;
DROP _ARBFMT_4;
_ARBFMT_4 = ' ';
/* Initialize to avoid warning. */
****** ASSIGN OBSERVATION TO NODE ******;
DROP _BRANCH_;
_BRANCH_ = -1;
IF NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) AND
MEDIAN_HOUSEHOLD_INCOME < 432.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) AND
432.5 <= MEDIAN_HOUSEHOLD_INCOME THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
_ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
%DMNORMIP( _ARBFMT_2);
IF _ARBFMT_2 IN ('.' ,'04' ,'49' ,'50' ,'45' ,'20' ,'16' ,'30' ,'07' ,
'23' ,'25' ,'01' ,'09' ,'41' ,'15' ,'18' ,'36' ,'48' ,'08' ,'19' ,'27' ,
'46' ,'40' ,'26' ,'28' ,'21' ,'51' ,'34' ,'42' ,'44' ,'29' ,'05' ,'17' ,
'43' ,'39' ,'11' ,'31' ,'33' ,'38' ,'47' ,'53' ,'22' ,'06' ,'32' ,'03' ,
'52' ,'37' ,'10' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_2 IN ('02' ,'24' ,'12' ,'35' ,'13' ,'14' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
IF PER_CAPITA_INCOME < 19185.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 19185.5 <= PER_CAPITA_INCOME THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
_ARBFMT_3 = PUT( HOME_OWNER , $3.);
%DMNORMIP( _ARBFMT_3);
IF _ARBFMT_3 IN ('H' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_3 IN ('U' ) THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(FILE_AVG_GIFT ) THEN DO;
IF 2.7 <= FILE_AVG_GIFT THEN DO;
_BRANCH_ = 1;
END;
ELSE IF FILE_AVG_GIFT < 2.7 THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_AVG_GIFT_AMT ) THEN DO;
IF 2.7 <= LIFETIME_AVG_GIFT_AMT THEN DO;
_BRANCH_ = 1;
END;
ELSE IF LIFETIME_AVG_GIFT_AMT < 2.7 THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_INCOME_GROUP2 = 0.10574018126888;
P_INCOME_GROUP6 = 0.13897280966767;
P_INCOME_GROUP5 = 0.29003021148036;
P_INCOME_GROUP4 = 0.16012084592145;
P_INCOME_GROUP3 = 0.07552870090634;
P_INCOME_GROUP1 = 0.13293051359516;
P_INCOME_GROUP7 = 0.09667673716012;
Q_INCOME_GROUP2 = 0.10574018126888;
Q_INCOME_GROUP6 = 0.13897280966767;
Q_INCOME_GROUP5 = 0.29003021148036;
Q_INCOME_GROUP4 = 0.16012084592145;
Q_INCOME_GROUP3 = 0.07552870090634;
Q_INCOME_GROUP1 = 0.13293051359516;
Q_INCOME_GROUP7 = 0.09667673716012;
I_INCOME_GROUP = '5';
U_INCOME_GROUP = 5;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) AND
MEDIAN_HOUSEHOLD_INCOME < 531.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) AND
531.5 <= MEDIAN_HOUSEHOLD_INCOME THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
IF PER_CAPITA_INCOME < 20802 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 20802 <= PER_CAPITA_INCOME THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
IF MEDIAN_HOME_VALUE < 1183 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 1183 <= MEDIAN_HOME_VALUE THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
_ARBFMT_4 = PUT( REP_SES , $4.);
%DMNORMIP( _ARBFMT_4);
IF _ARBFMT_4 IN ('1' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_4 IN ('2' ,'3' ) THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
_ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
%DMNORMIP( _ARBFMT_2);
IF _ARBFMT_2 IN ('23' ,'01' ,'02' ,'24' ,'12' ,'35' ,'13' ,'14' ,
'34' ,'11' ,'03' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_2 IN ('18' ,'27' ,'40' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(PCT_ATTRIBUTE2 ) THEN DO;
IF 8.5 <= PCT_ATTRIBUTE2 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF PCT_ATTRIBUTE2 < 8.5 THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_INCOME_GROUP2 = 0.1;
P_INCOME_GROUP6 = 0.21666666666666;
P_INCOME_GROUP5 = 0.28333333333333;
P_INCOME_GROUP4 = 0.11666666666666;
P_INCOME_GROUP3 = 0.08333333333333;
P_INCOME_GROUP1 = 0.01666666666666;
P_INCOME_GROUP7 = 0.18333333333333;
Q_INCOME_GROUP2 = 0.1;
Q_INCOME_GROUP6 = 0.21666666666666;
Q_INCOME_GROUP5 = 0.28333333333333;
Q_INCOME_GROUP4 = 0.11666666666666;
Q_INCOME_GROUP3 = 0.08333333333333;
Q_INCOME_GROUP1 = 0.01666666666666;
Q_INCOME_GROUP7 = 0.18333333333333;
I_INCOME_GROUP = '5';
U_INCOME_GROUP = 5;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(MEDIAN_HOME_VALUE ) AND
MEDIAN_HOME_VALUE < 2637.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(MEDIAN_HOME_VALUE ) AND
2637.5 <= MEDIAN_HOME_VALUE THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
_ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
%DMNORMIP( _ARBFMT_2);
IF _ARBFMT_2 IN ('24' ,'12' ,'35' ,'14' ,'34' ,'11' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_2 IN ('23' ,'01' ,'02' ,'13' ,'03' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
IF PER_CAPITA_INCOME < 33325 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 33325 <= PER_CAPITA_INCOME THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_INCOME_GROUP2 = 0;
P_INCOME_GROUP6 = 0.47037037037037;
P_INCOME_GROUP5 = 0.13333333333333;
P_INCOME_GROUP4 = 0.06666666666666;
P_INCOME_GROUP3 = 0.01481481481481;
P_INCOME_GROUP1 = 0.01111111111111;
P_INCOME_GROUP7 = 0.3037037037037;
Q_INCOME_GROUP2 = 0;
Q_INCOME_GROUP6 = 0.47037037037037;
Q_INCOME_GROUP5 = 0.13333333333333;
Q_INCOME_GROUP4 = 0.06666666666666;
Q_INCOME_GROUP3 = 0.01481481481481;
Q_INCOME_GROUP1 = 0.01111111111111;
Q_INCOME_GROUP7 = 0.3037037037037;
I_INCOME_GROUP = '6';
U_INCOME_GROUP = 6;
END;
ELSE DO;
P_INCOME_GROUP2 = 0.00921658986175;
P_INCOME_GROUP6 = 0.19585253456221;
P_INCOME_GROUP5 = 0.22811059907834;
P_INCOME_GROUP4 = 0.08294930875576;
P_INCOME_GROUP3 = 0.02764976958525;
P_INCOME_GROUP1 = 0.00691244239631;
P_INCOME_GROUP7 = 0.44930875576036;
Q_INCOME_GROUP2 = 0.00921658986175;
Q_INCOME_GROUP6 = 0.19585253456221;
Q_INCOME_GROUP5 = 0.22811059907834;
Q_INCOME_GROUP4 = 0.08294930875576;
Q_INCOME_GROUP3 = 0.02764976958525;
Q_INCOME_GROUP1 = 0.00691244239631;
Q_INCOME_GROUP7 = 0.44930875576036;
I_INCOME_GROUP = '7';
U_INCOME_GROUP = 7;
END;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(MEDIAN_HOME_VALUE ) AND
MEDIAN_HOME_VALUE < 1117.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(MEDIAN_HOME_VALUE ) AND
1117.5 <= MEDIAN_HOME_VALUE THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
IF PER_CAPITA_INCOME < 18546 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 18546 <= PER_CAPITA_INCOME THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(PCT_OWNER_OCCUPIED ) THEN DO;
IF 84.5 <= PCT_OWNER_OCCUPIED THEN DO;
_BRANCH_ = 1;
END;
ELSE IF PCT_OWNER_OCCUPIED < 84.5 THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(DONOR_AGE ) AND
DONOR_AGE < 73.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(DONOR_AGE ) AND
73.5 <= DONOR_AGE THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(NUMBER_PROM_12 ) THEN DO;
IF NUMBER_PROM_12 < 30.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 30.5 <= NUMBER_PROM_12 THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(MOR_HIT_RATE ) THEN DO;
IF MOR_HIT_RATE < 41.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 41.5 <= MOR_HIT_RATE THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_INCOME_GROUP2 = 0.21875;
P_INCOME_GROUP6 = 0.125;
P_INCOME_GROUP5 = 0.171875;
P_INCOME_GROUP4 = 0.21875;
P_INCOME_GROUP3 = 0.140625;
P_INCOME_GROUP1 = 0.0625;
P_INCOME_GROUP7 = 0.0625;
Q_INCOME_GROUP2 = 0.21875;
Q_INCOME_GROUP6 = 0.125;
Q_INCOME_GROUP5 = 0.171875;
Q_INCOME_GROUP4 = 0.21875;
Q_INCOME_GROUP3 = 0.140625;
Q_INCOME_GROUP1 = 0.0625;
Q_INCOME_GROUP7 = 0.0625;
I_INCOME_GROUP = '2';
U_INCOME_GROUP = 2;
END;
ELSE DO;
IF NOT MISSING(PCT_ATTRIBUTE4 ) AND
61 <= PCT_ATTRIBUTE4 THEN DO;
P_INCOME_GROUP2 = 0.5;
P_INCOME_GROUP6 = 0;
P_INCOME_GROUP5 = 0.33333333333333;
P_INCOME_GROUP4 = 0;
P_INCOME_GROUP3 = 0;
P_INCOME_GROUP1 = 0.16666666666666;
P_INCOME_GROUP7 = 0;
Q_INCOME_GROUP2 = 0.5;
Q_INCOME_GROUP6 = 0;
Q_INCOME_GROUP5 = 0.33333333333333;
Q_INCOME_GROUP4 = 0;
Q_INCOME_GROUP3 = 0;
Q_INCOME_GROUP1 = 0.16666666666666;
Q_INCOME_GROUP7 = 0;
I_INCOME_GROUP = '2';
U_INCOME_GROUP = 2;
END;
ELSE DO;
P_INCOME_GROUP2 = 0.0258064516129;
P_INCOME_GROUP6 = 0.17419354838709;
P_INCOME_GROUP5 = 0.36129032258064;
P_INCOME_GROUP4 = 0.2258064516129;
P_INCOME_GROUP3 = 0.06774193548387;
P_INCOME_GROUP1 = 0.01290322580645;
P_INCOME_GROUP7 = 0.13225806451612;
Q_INCOME_GROUP2 = 0.0258064516129;
Q_INCOME_GROUP6 = 0.17419354838709;
Q_INCOME_GROUP5 = 0.36129032258064;
Q_INCOME_GROUP4 = 0.2258064516129;
Q_INCOME_GROUP3 = 0.06774193548387;
Q_INCOME_GROUP1 = 0.01290322580645;
Q_INCOME_GROUP7 = 0.13225806451612;
I_INCOME_GROUP = '5';
U_INCOME_GROUP = 5;
END;
END;
END;
ELSE DO;
_BRANCH_ = -1;
_ARBFMT_12 = PUT( WEALTH_RATING , BEST12.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('4' ,'5' ,'7' ,'6' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_12 IN ('9' ,'8' ) THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
IF PER_CAPITA_INCOME < 22944.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 22944.5 <= PER_CAPITA_INCOME THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
IF 1404 <= MEDIAN_HOME_VALUE THEN DO;
_BRANCH_ = 1;
END;
ELSE IF MEDIAN_HOME_VALUE < 1404 THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_INCOME_GROUP2 = 0.04790419161676;
P_INCOME_GROUP6 = 0.14371257485029;
P_INCOME_GROUP5 = 0.17365269461077;
P_INCOME_GROUP4 = 0.1377245508982;
P_INCOME_GROUP3 = 0.05389221556886;
P_INCOME_GROUP1 = 0.01796407185628;
P_INCOME_GROUP7 = 0.4251497005988;
Q_INCOME_GROUP2 = 0.04790419161676;
Q_INCOME_GROUP6 = 0.14371257485029;
Q_INCOME_GROUP5 = 0.17365269461077;
Q_INCOME_GROUP4 = 0.1377245508982;
Q_INCOME_GROUP3 = 0.05389221556886;
Q_INCOME_GROUP1 = 0.01796407185628;
Q_INCOME_GROUP7 = 0.4251497005988;
I_INCOME_GROUP = '7';
U_INCOME_GROUP = 7;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) AND
MEDIAN_HOUSEHOLD_INCOME < 504.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) AND
504.5 <= MEDIAN_HOUSEHOLD_INCOME THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_CARD_PROM ) THEN DO;
IF 4.5 <= LIFETIME_CARD_PROM THEN DO;
_BRANCH_ = 1;
END;
ELSE IF LIFETIME_CARD_PROM < 4.5 THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_RANGE ) THEN DO;
IF LIFETIME_GIFT_RANGE < 41 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 41 <= LIFETIME_GIFT_RANGE THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_INCOME_GROUP2 = 0.03846153846153;
P_INCOME_GROUP6 = 0.26923076923076;
P_INCOME_GROUP5 = 0.07692307692307;
P_INCOME_GROUP4 = 0.07692307692307;
P_INCOME_GROUP3 = 0.09615384615384;
P_INCOME_GROUP1 = 0;
P_INCOME_GROUP7 = 0.44230769230769;
Q_INCOME_GROUP2 = 0.03846153846153;
Q_INCOME_GROUP6 = 0.26923076923076;
Q_INCOME_GROUP5 = 0.07692307692307;
Q_INCOME_GROUP4 = 0.07692307692307;
Q_INCOME_GROUP3 = 0.09615384615384;
Q_INCOME_GROUP1 = 0;
Q_INCOME_GROUP7 = 0.44230769230769;
I_INCOME_GROUP = '7';
U_INCOME_GROUP = 7;
END;
ELSE DO;
P_INCOME_GROUP2 = 0.04395604395604;
P_INCOME_GROUP6 = 0.34065934065934;
P_INCOME_GROUP5 = 0.21978021978021;
P_INCOME_GROUP4 = 0.19780219780219;
P_INCOME_GROUP3 = 0.08791208791208;
P_INCOME_GROUP1 = 0.01648351648351;
P_INCOME_GROUP7 = 0.09340659340659;
Q_INCOME_GROUP2 = 0.04395604395604;
Q_INCOME_GROUP6 = 0.34065934065934;
Q_INCOME_GROUP5 = 0.21978021978021;
Q_INCOME_GROUP4 = 0.19780219780219;
Q_INCOME_GROUP3 = 0.08791208791208;
Q_INCOME_GROUP1 = 0.01648351648351;
Q_INCOME_GROUP7 = 0.09340659340659;
I_INCOME_GROUP = '6';
U_INCOME_GROUP = 6;
END;
END;
END;
END;
END;
END;
ELSE DO;
_BRANCH_ = -1;
_ARBFMT_3 = PUT( HOME_OWNER , $3.);
%DMNORMIP( _ARBFMT_3);
IF _ARBFMT_3 IN ('H' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_3 IN ('U' ) THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(OVERLAY_SOURCE ) THEN DO;
_ARBFMT_1 = PUT( OVERLAY_SOURCE , $1.);
%DMNORMIP( _ARBFMT_1);
IF _ARBFMT_1 IN ('P' ,'B' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_1 IN ('M' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
_ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
%DMNORMIP( _ARBFMT_2);
IF _ARBFMT_2 IN ('.' ,'04' ,'49' ,'50' ,'20' ,'16' ,'30' ,'07' ,'23' ,
'25' ,'09' ,'02' ,'41' ,'15' ,'18' ,'36' ,'48' ,'24' ,'08' ,'12' ,'35' ,
'19' ,'27' ,'46' ,'40' ,'13' ,'26' ,'28' ,'21' ,'14' ,'34' ,'42' ,'44' ,
'29' ,'05' ,'17' ,'43' ,'39' ,'11' ,'31' ,'33' ,'38' ,'22' ,'06' ,'32' ,
'03' ,'52' ,'37' ,'10' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_2 IN ('45' ,'01' ,'51' ,'47' ,'53' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) AND
MEDIAN_HOUSEHOLD_INCOME < 215.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) AND
215.5 <= MEDIAN_HOUSEHOLD_INCOME THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
IF PER_CAPITA_INCOME < 10196.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 10196.5 <= PER_CAPITA_INCOME THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
_ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
%DMNORMIP( _ARBFMT_2);
IF _ARBFMT_2 IN ('04' ,'50' ,'30' ,'09' ,'41' ,'48' ,'51' ,'31' ,
'33' ,'53' ,'32' ,'52' ,'10' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_2 IN ('.' ,'49' ,'45' ,'20' ,'16' ,'07' ,'23' ,'25' ,
'01' ,'02' ,'15' ,'18' ,'36' ,'24' ,'08' ,'12' ,'35' ,'19' ,'27' ,
'46' ,'40' ,'13' ,'26' ,'28' ,'21' ,'14' ,'34' ,'42' ,'44' ,'29' ,
'05' ,'17' ,'43' ,'39' ,'11' ,'38' ,'47' ,'22' ,'06' ,'03' ,'37' )
THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
P_INCOME_GROUP2 = 0.29721362229102;
P_INCOME_GROUP6 = 0.01083591331269;
P_INCOME_GROUP5 = 0.05882352941176;
P_INCOME_GROUP4 = 0.07430340557275;
P_INCOME_GROUP3 = 0.10990712074303;
P_INCOME_GROUP1 = 0.41331269349845;
P_INCOME_GROUP7 = 0.03560371517027;
Q_INCOME_GROUP2 = 0.29721362229102;
Q_INCOME_GROUP6 = 0.01083591331269;
Q_INCOME_GROUP5 = 0.05882352941176;
Q_INCOME_GROUP4 = 0.07430340557275;
Q_INCOME_GROUP3 = 0.10990712074303;
Q_INCOME_GROUP1 = 0.41331269349845;
Q_INCOME_GROUP7 = 0.03560371517027;
I_INCOME_GROUP = '1';
U_INCOME_GROUP = 1;
END;
ELSE DO;
_BRANCH_ = -1;
_ARBFMT_4 = PUT( REP_SES , $4.);
%DMNORMIP( _ARBFMT_4);
IF _ARBFMT_4 IN ('2' ,'3' ,'4' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_4 IN ('1' ) THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
_ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
%DMNORMIP( _ARBFMT_2);
IF _ARBFMT_2 IN ('04' ,'49' ,'50' ,'45' ,'20' ,'16' ,'30' ,'07' ,
'25' ,'09' ,'41' ,'18' ,'36' ,'48' ,'08' ,'19' ,'27' ,'46' ,'40' ,
'26' ,'28' ,'21' ,'51' ,'44' ,'29' ,'05' ,'17' ,'43' ,'39' ,'31' ,
'38' ,'47' ,'53' ,'06' ,'37' ,'10' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_2 IN ('23' ,'01' ,'02' ,'15' ,'24' ,'12' ,'35' ,
'13' ,'14' ,'34' ,'42' ,'11' ,'22' ,'03' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
IF PER_CAPITA_INCOME < 17643 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 17643 <= PER_CAPITA_INCOME THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(MONTHS_SINCE_ORIGIN ) AND
MONTHS_SINCE_ORIGIN < 71 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(MONTHS_SINCE_ORIGIN ) AND
71 <= MONTHS_SINCE_ORIGIN THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(MONTHS_SINCE_FIRST_GIFT ) THEN DO;
IF MONTHS_SINCE_FIRST_GIFT < 65 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 65 <= MONTHS_SINCE_FIRST_GIFT THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_PROM ) THEN DO;
IF LIFETIME_PROM < 45.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 45.5 <= LIFETIME_PROM THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_INCOME_GROUP2 = 0.28030303030303;
P_INCOME_GROUP6 = 0.04545454545454;
P_INCOME_GROUP5 = 0.21212121212121;
P_INCOME_GROUP4 = 0.18181818181818;
P_INCOME_GROUP3 = 0.07575757575757;
P_INCOME_GROUP1 = 0.16666666666666;
P_INCOME_GROUP7 = 0.03787878787878;
Q_INCOME_GROUP2 = 0.28030303030303;
Q_INCOME_GROUP6 = 0.04545454545454;
Q_INCOME_GROUP5 = 0.21212121212121;
Q_INCOME_GROUP4 = 0.18181818181818;
Q_INCOME_GROUP3 = 0.07575757575757;
Q_INCOME_GROUP1 = 0.16666666666666;
Q_INCOME_GROUP7 = 0.03787878787878;
I_INCOME_GROUP = '2';
U_INCOME_GROUP = 2;
END;
ELSE DO;
P_INCOME_GROUP2 = 0.10344827586206;
P_INCOME_GROUP6 = 0.13793103448275;
P_INCOME_GROUP5 = 0.26206896551724;
P_INCOME_GROUP4 = 0.14482758620689;
P_INCOME_GROUP3 = 0.18620689655172;
P_INCOME_GROUP1 = 0.10344827586206;
P_INCOME_GROUP7 = 0.06206896551724;
Q_INCOME_GROUP2 = 0.10344827586206;
Q_INCOME_GROUP6 = 0.13793103448275;
Q_INCOME_GROUP5 = 0.26206896551724;
Q_INCOME_GROUP4 = 0.14482758620689;
Q_INCOME_GROUP3 = 0.18620689655172;
Q_INCOME_GROUP1 = 0.10344827586206;
Q_INCOME_GROUP7 = 0.06206896551724;
I_INCOME_GROUP = '5';
U_INCOME_GROUP = 5;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(DONOR_AGE ) AND
DONOR_AGE < 70.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(DONOR_AGE ) AND
70.5 <= DONOR_AGE THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_PROM ) THEN DO;
IF LIFETIME_PROM < 70.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 70.5 <= LIFETIME_PROM THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(IN_HOUSE ) THEN DO;
_ARBFMT_12 = PUT( IN_HOUSE , BEST12.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('0' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_12 IN ('1' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(RECENT_RESPONSE_PROP ) AND
RECENT_RESPONSE_PROP < 0.049 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(RECENT_RESPONSE_PROP ) AND
0.049 <= RECENT_RESPONSE_PROP THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_AVG_GIFT_AMT ) THEN DO;
IF RECENT_AVG_GIFT_AMT < 1.6 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 1.6 <= RECENT_AVG_GIFT_AMT THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(LAST_GIFT_AMT ) THEN DO;
IF LAST_GIFT_AMT < 1.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 1.5 <= LAST_GIFT_AMT THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
P_INCOME_GROUP2 = 0.23076923076923;
P_INCOME_GROUP6 = 0;
P_INCOME_GROUP5 = 0;
P_INCOME_GROUP4 = 0;
P_INCOME_GROUP3 = 0.07692307692307;
P_INCOME_GROUP1 = 0.53846153846153;
P_INCOME_GROUP7 = 0.15384615384615;
Q_INCOME_GROUP2 = 0.23076923076923;
Q_INCOME_GROUP6 = 0;
Q_INCOME_GROUP5 = 0;
Q_INCOME_GROUP4 = 0;
Q_INCOME_GROUP3 = 0.07692307692307;
Q_INCOME_GROUP1 = 0.53846153846153;
Q_INCOME_GROUP7 = 0.15384615384615;
I_INCOME_GROUP = '1';
U_INCOME_GROUP = 1;
END;
ELSE DO;
P_INCOME_GROUP2 = 0.35313531353135;
P_INCOME_GROUP6 = 0.03300330033003;
P_INCOME_GROUP5 = 0.1056105610561;
P_INCOME_GROUP4 = 0.07590759075907;
P_INCOME_GROUP3 = 0.08580858085808;
P_INCOME_GROUP1 = 0.34323432343234;
P_INCOME_GROUP7 = 0.003300330033;
Q_INCOME_GROUP2 = 0.35313531353135;
Q_INCOME_GROUP6 = 0.03300330033003;
Q_INCOME_GROUP5 = 0.1056105610561;
Q_INCOME_GROUP4 = 0.07590759075907;
Q_INCOME_GROUP3 = 0.08580858085808;
Q_INCOME_GROUP1 = 0.34323432343234;
Q_INCOME_GROUP7 = 0.003300330033;
I_INCOME_GROUP = '2';
U_INCOME_GROUP = 2;
END;
END;
ELSE DO;
P_INCOME_GROUP2 = 0.29548229548229;
P_INCOME_GROUP6 = 0.04029304029304;
P_INCOME_GROUP5 = 0.12942612942612;
P_INCOME_GROUP4 = 0.14407814407814;
P_INCOME_GROUP3 = 0.16483516483516;
P_INCOME_GROUP1 = 0.19169719169719;
P_INCOME_GROUP7 = 0.03418803418803;
Q_INCOME_GROUP2 = 0.29548229548229;
Q_INCOME_GROUP6 = 0.04029304029304;
Q_INCOME_GROUP5 = 0.12942612942612;
Q_INCOME_GROUP4 = 0.14407814407814;
Q_INCOME_GROUP3 = 0.16483516483516;
Q_INCOME_GROUP1 = 0.19169719169719;
Q_INCOME_GROUP7 = 0.03418803418803;
I_INCOME_GROUP = '2';
U_INCOME_GROUP = 2;
END;
END;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(DONOR_AGE ) AND
DONOR_AGE < 66.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(DONOR_AGE ) AND
66.5 <= DONOR_AGE THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
_ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
%DMNORMIP( _ARBFMT_2);
IF _ARBFMT_2 IN ('.' ,'04' ,'49' ,'50' ,'45' ,'20' ,'16' ,'30' ,'07' ,
'25' ,'01' ,'09' ,'02' ,'41' ,'15' ,'18' ,'36' ,'24' ,'08' ,'12' ,
'35' ,'19' ,'27' ,'46' ,'40' ,'21' ,'14' ,'51' ,'34' ,'42' ,'44' ,
'05' ,'17' ,'43' ,'39' ,'11' ,'31' ,'38' ,'47' ,'53' ,'22' ,'06' ,
'32' ,'03' ,'52' ,'10' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_2 IN ('23' ,'48' ,'13' ,'26' ,'28' ,'29' ,'33' ,'37' )
THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_PROM ) THEN DO;
IF LIFETIME_PROM < 73.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 73.5 <= LIFETIME_PROM THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
_ARBFMT_4 = PUT( REP_SES , $4.);
%DMNORMIP( _ARBFMT_4);
IF _ARBFMT_4 IN ('2' ,'3' ,'4' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_4 IN ('1' ) THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
_ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
%DMNORMIP( _ARBFMT_2);
IF _ARBFMT_2 IN ('04' ,'49' ,'50' ,'45' ,'20' ,'16' ,'30' ,'07' ,
'25' ,'09' ,'41' ,'18' ,'36' ,'48' ,'08' ,'19' ,'27' ,'46' ,'40' ,
'26' ,'28' ,'21' ,'51' ,'44' ,'29' ,'05' ,'17' ,'43' ,'39' ,'31' ,
'33' ,'38' ,'47' ,'53' ,'06' ,'32' ,'52' ,'37' ,'10' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_2 IN ('23' ,'01' ,'02' ,'15' ,'24' ,'12' ,'35' ,
'13' ,'34' ,'42' ,'11' ,'22' ,'03' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
IF PER_CAPITA_INCOME < 17330.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 17330.5 <= PER_CAPITA_INCOME THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_INCOME_GROUP2 = 0.15845070422535;
P_INCOME_GROUP6 = 0.08802816901408;
P_INCOME_GROUP5 = 0.21830985915492;
P_INCOME_GROUP4 = 0.21478873239436;
P_INCOME_GROUP3 = 0.09507042253521;
P_INCOME_GROUP1 = 0.10211267605633;
P_INCOME_GROUP7 = 0.12323943661971;
Q_INCOME_GROUP2 = 0.15845070422535;
Q_INCOME_GROUP6 = 0.08802816901408;
Q_INCOME_GROUP5 = 0.21830985915492;
Q_INCOME_GROUP4 = 0.21478873239436;
Q_INCOME_GROUP3 = 0.09507042253521;
Q_INCOME_GROUP1 = 0.10211267605633;
Q_INCOME_GROUP7 = 0.12323943661971;
I_INCOME_GROUP = '5';
U_INCOME_GROUP = 5;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) AND
MEDIAN_HOUSEHOLD_INCOME < 246.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) AND
246.5 <= MEDIAN_HOUSEHOLD_INCOME THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
_ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
%DMNORMIP( _ARBFMT_2);
IF _ARBFMT_2 IN ('50' ,'45' ,'30' ,'25' ,'09' ,'41' ,'36' ,'48' ,
'51' ,'43' ,'31' ,'33' ,'47' ,'53' ,'32' ,'52' ,'37' ,'10' ) THEN
DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_2 IN ('.' ,'04' ,'49' ,'20' ,'16' ,'07' ,'18' ,
'08' ,'19' ,'27' ,'46' ,'40' ,'26' ,'28' ,'21' ,'44' ,'29' ,'05' ,
'17' ,'39' ,'38' ,'06' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
IF PER_CAPITA_INCOME < 11131.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 11131.5 <= PER_CAPITA_INCOME THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
IF NOT MISSING(MOR_HIT_RATE ) AND
35 <= MOR_HIT_RATE THEN DO;
P_INCOME_GROUP2 = 0.22222222222222;
P_INCOME_GROUP6 = 0;
P_INCOME_GROUP5 = 0;
P_INCOME_GROUP4 = 0.33333333333333;
P_INCOME_GROUP3 = 0;
P_INCOME_GROUP1 = 0.11111111111111;
P_INCOME_GROUP7 = 0.33333333333333;
Q_INCOME_GROUP2 = 0.22222222222222;
Q_INCOME_GROUP6 = 0;
Q_INCOME_GROUP5 = 0;
Q_INCOME_GROUP4 = 0.33333333333333;
Q_INCOME_GROUP3 = 0;
Q_INCOME_GROUP1 = 0.11111111111111;
Q_INCOME_GROUP7 = 0.33333333333333;
I_INCOME_GROUP = '4';
U_INCOME_GROUP = 4;
END;
ELSE DO;
P_INCOME_GROUP2 = 0.40227703984819;
P_INCOME_GROUP6 = 0.05313092979127;
P_INCOME_GROUP5 = 0.10436432637571;
P_INCOME_GROUP4 = 0.12903225806451;
P_INCOME_GROUP3 = 0.09487666034155;
P_INCOME_GROUP1 = 0.19734345351043;
P_INCOME_GROUP7 = 0.01897533206831;
Q_INCOME_GROUP2 = 0.40227703984819;
Q_INCOME_GROUP6 = 0.05313092979127;
Q_INCOME_GROUP5 = 0.10436432637571;
Q_INCOME_GROUP4 = 0.12903225806451;
Q_INCOME_GROUP3 = 0.09487666034155;
Q_INCOME_GROUP1 = 0.19734345351043;
Q_INCOME_GROUP7 = 0.01897533206831;
I_INCOME_GROUP = '2';
U_INCOME_GROUP = 2;
END;
END;
ELSE DO;
IF NOT MISSING(RECENT_STAR_STATUS ) AND
14.5 <= RECENT_STAR_STATUS THEN DO;
P_INCOME_GROUP2 = 0.2;
P_INCOME_GROUP6 = 0;
P_INCOME_GROUP5 = 0.2;
P_INCOME_GROUP4 = 0.2;
P_INCOME_GROUP3 = 0;
P_INCOME_GROUP1 = 0;
P_INCOME_GROUP7 = 0.4;
Q_INCOME_GROUP2 = 0.2;
Q_INCOME_GROUP6 = 0;
Q_INCOME_GROUP5 = 0.2;
Q_INCOME_GROUP4 = 0.2;
Q_INCOME_GROUP3 = 0;
Q_INCOME_GROUP1 = 0;
Q_INCOME_GROUP7 = 0.4;
I_INCOME_GROUP = '7';
U_INCOME_GROUP = 7;
END;
ELSE DO;
P_INCOME_GROUP2 = 0.25784447476125;
P_INCOME_GROUP6 = 0.06412005457025;
P_INCOME_GROUP5 = 0.19099590723055;
P_INCOME_GROUP4 = 0.19645293315143;
P_INCOME_GROUP3 = 0.15552523874488;
P_INCOME_GROUP1 = 0.11869031377899;
P_INCOME_GROUP7 = 0.01637107776261;
Q_INCOME_GROUP2 = 0.25784447476125;
Q_INCOME_GROUP6 = 0.06412005457025;
Q_INCOME_GROUP5 = 0.19099590723055;
Q_INCOME_GROUP4 = 0.19645293315143;
Q_INCOME_GROUP3 = 0.15552523874488;
Q_INCOME_GROUP1 = 0.11869031377899;
Q_INCOME_GROUP7 = 0.01637107776261;
I_INCOME_GROUP = '2';
U_INCOME_GROUP = 2;
END;
END;
END;
END;
ELSE DO;
_BRANCH_ = -1;
_ARBFMT_4 = PUT( REP_SES , $4.);
%DMNORMIP( _ARBFMT_4);
IF _ARBFMT_4 IN ('2' ,'3' ,'4' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_4 IN ('1' ) THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
_ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
%DMNORMIP( _ARBFMT_2);
IF _ARBFMT_2 IN ('04' ,'49' ,'50' ,'45' ,'20' ,'16' ,'30' ,'07' ,
'25' ,'09' ,'41' ,'18' ,'36' ,'48' ,'08' ,'19' ,'27' ,'46' ,'40' ,
'26' ,'28' ,'21' ,'51' ,'44' ,'29' ,'05' ,'17' ,'43' ,'39' ,'31' ,
'33' ,'38' ,'47' ,'53' ,'06' ,'32' ,'52' ,'37' ,'10' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_2 IN ('23' ,'01' ,'02' ,'15' ,'24' ,'12' ,'35' ,
'13' ,'14' ,'34' ,'42' ,'11' ,'22' ,'03' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
IF PER_CAPITA_INCOME < 17172.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 17172.5 <= PER_CAPITA_INCOME THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_INCOME_GROUP2 = 0.04496788008565;
P_INCOME_GROUP6 = 0.15203426124197;
P_INCOME_GROUP5 = 0.38115631691648;
P_INCOME_GROUP4 = 0.15631691648822;
P_INCOME_GROUP3 = 0.05995717344753;
P_INCOME_GROUP1 = 0.02141327623126;
P_INCOME_GROUP7 = 0.18415417558886;
Q_INCOME_GROUP2 = 0.04496788008565;
Q_INCOME_GROUP6 = 0.15203426124197;
Q_INCOME_GROUP5 = 0.38115631691648;
Q_INCOME_GROUP4 = 0.15631691648822;
Q_INCOME_GROUP3 = 0.05995717344753;
Q_INCOME_GROUP1 = 0.02141327623126;
Q_INCOME_GROUP7 = 0.18415417558886;
I_INCOME_GROUP = '5';
U_INCOME_GROUP = 5;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(PER_CAPITA_INCOME ) AND
PER_CAPITA_INCOME < 10272 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(PER_CAPITA_INCOME ) AND
10272 <= PER_CAPITA_INCOME THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
IF MEDIAN_HOUSEHOLD_INCOME < 214.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 214.5 <= MEDIAN_HOUSEHOLD_INCOME THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
_ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
%DMNORMIP( _ARBFMT_2);
IF _ARBFMT_2 IN ('50' ,'45' ,'30' ,'41' ,'51' ,'43' ,'31' ,'47' ,
'53' ,'32' ,'52' ,'10' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_2 IN ('.' ,'04' ,'49' ,'20' ,'16' ,'07' ,'25' ,
'09' ,'18' ,'36' ,'48' ,'08' ,'19' ,'27' ,'46' ,'40' ,'26' ,'28' ,
'21' ,'44' ,'29' ,'05' ,'17' ,'39' ,'33' ,'38' ,'06' ,'37' ) THEN
DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(MOR_HIT_RATE ) AND
MOR_HIT_RATE < 16 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(MOR_HIT_RATE ) AND
16 <= MOR_HIT_RATE THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(FILE_AVG_GIFT ) THEN DO;
IF FILE_AVG_GIFT < 47.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 47.5 <= FILE_AVG_GIFT THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_AVG_GIFT_AMT ) THEN DO;
IF LIFETIME_AVG_GIFT_AMT < 47.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 47.5 <= LIFETIME_AVG_GIFT_AMT THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_INCOME_GROUP2 = 0.20689655172413;
P_INCOME_GROUP6 = 0;
P_INCOME_GROUP5 = 0.10344827586206;
P_INCOME_GROUP4 = 0.06896551724137;
P_INCOME_GROUP3 = 0.20689655172413;
P_INCOME_GROUP1 = 0.41379310344827;
P_INCOME_GROUP7 = 0;
Q_INCOME_GROUP2 = 0.20689655172413;
Q_INCOME_GROUP6 = 0;
Q_INCOME_GROUP5 = 0.10344827586206;
Q_INCOME_GROUP4 = 0.06896551724137;
Q_INCOME_GROUP3 = 0.20689655172413;
Q_INCOME_GROUP1 = 0.41379310344827;
Q_INCOME_GROUP7 = 0;
I_INCOME_GROUP = '1';
U_INCOME_GROUP = 1;
END;
ELSE DO;
P_INCOME_GROUP2 = 0.1782334384858;
P_INCOME_GROUP6 = 0.0583596214511;
P_INCOME_GROUP5 = 0.20504731861198;
P_INCOME_GROUP4 = 0.2192429022082;
P_INCOME_GROUP3 = 0.17981072555205;
P_INCOME_GROUP1 = 0.09779179810725;
P_INCOME_GROUP7 = 0.06151419558359;
Q_INCOME_GROUP2 = 0.1782334384858;
Q_INCOME_GROUP6 = 0.0583596214511;
Q_INCOME_GROUP5 = 0.20504731861198;
Q_INCOME_GROUP4 = 0.2192429022082;
Q_INCOME_GROUP3 = 0.17981072555205;
Q_INCOME_GROUP1 = 0.09779179810725;
Q_INCOME_GROUP7 = 0.06151419558359;
I_INCOME_GROUP = '4';
U_INCOME_GROUP = 4;
END;
END;
ELSE DO;
P_INCOME_GROUP2 = 0.12755102040816;
P_INCOME_GROUP6 = 0.09566326530612;
P_INCOME_GROUP5 = 0.29400510204081;
P_INCOME_GROUP4 = 0.2563775510204;
P_INCOME_GROUP3 = 0.12181122448979;
P_INCOME_GROUP1 = 0.03188775510204;
P_INCOME_GROUP7 = 0.07270408163265;
Q_INCOME_GROUP2 = 0.12755102040816;
Q_INCOME_GROUP6 = 0.09566326530612;
Q_INCOME_GROUP5 = 0.29400510204081;
Q_INCOME_GROUP4 = 0.2563775510204;
Q_INCOME_GROUP3 = 0.12181122448979;
Q_INCOME_GROUP1 = 0.03188775510204;
Q_INCOME_GROUP7 = 0.07270408163265;
I_INCOME_GROUP = '5';
U_INCOME_GROUP = 5;
END;
END;
END;
END;
END;
****************************************************************;
****** END OF DECISION TREE SCORING CODE ******;
****************************************************************;
*;
* ASSIGN VALUE TO: INCOME_GROUP;
*;
length _format200 $200;
drop _format200;
_format200 = strip(I_INCOME_GROUP);
if _format200="7" then IMP_INCOME_GROUP = 7;
else
if _format200="6" then IMP_INCOME_GROUP = 6;
else
if _format200="5" then IMP_INCOME_GROUP = 5;
else
if _format200="4" then IMP_INCOME_GROUP = 4;
else
if _format200="3" then IMP_INCOME_GROUP = 3;
else
if _format200="2" then IMP_INCOME_GROUP = 2;
else
if _format200="1" then IMP_INCOME_GROUP = 1;
END;
