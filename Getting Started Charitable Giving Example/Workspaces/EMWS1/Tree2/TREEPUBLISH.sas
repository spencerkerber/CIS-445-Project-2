****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH I_TARGET_B  $   12; 
LENGTH _WARN_  $    4; 

******              LABELS FOR NEW VARIABLES              ******;
LABEL _NODE_  = 'Node' ;
LABEL _LEAF_  = 'Leaf' ;
LABEL P_TARGET_B1  = 'Predicted: TARGET_B=1' ;
LABEL P_TARGET_B0  = 'Predicted: TARGET_B=0' ;
LABEL Q_TARGET_B1  = 'Unadjusted P: TARGET_B=1' ;
LABEL Q_TARGET_B0  = 'Unadjusted P: TARGET_B=0' ;
LABEL V_TARGET_B1  = 'Validated: TARGET_B=1' ;
LABEL V_TARGET_B0  = 'Validated: TARGET_B=0' ;
LABEL I_TARGET_B  = 'Into: TARGET_B' ;
LABEL U_TARGET_B  = 'Unnormalized Into: TARGET_B' ;
LABEL _WARN_  = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12; 
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */


******             ASSIGN OBSERVATION TO NODE             ******;
_ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
 %DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('3' ,'4' ) THEN DO;
  _NODE_  =                    2;
  _LEAF_  =                    1;
  P_TARGET_B1  =     0.07300054401831;
  P_TARGET_B0  =     0.92699945598168;
  Q_TARGET_B1  =     0.33283087126921;
  Q_TARGET_B0  =     0.66716912873078;
  V_TARGET_B1  =     0.07029666958131;
  V_TARGET_B0  =     0.92970333041868;
  I_TARGET_B  = '0' ;
  U_TARGET_B  =                    0;
  END;
ELSE DO;
  _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
   %DMNORMIP( _ARBFMT_12);
  IF _ARBFMT_12 IN ('1' ) THEN DO;
    _NODE_  =                    6;
    _LEAF_  =                    2;
    P_TARGET_B1  =     0.05030587345486;
    P_TARGET_B0  =     0.94969412654513;
    Q_TARGET_B1  =     0.25125292348813;
    Q_TARGET_B0  =     0.74874707651186;
    V_TARGET_B1  =     0.04964830264094;
    V_TARGET_B0  =     0.95035169735905;
    I_TARGET_B  = '0' ;
    U_TARGET_B  =                    0;
    END;
  ELSE DO;
    IF  NOT MISSING(PER_CAPITA_INCOME ) AND 
                     17477 <= PER_CAPITA_INCOME  THEN DO;
      _NODE_  =                   15;
      _LEAF_  =                    7;
      P_TARGET_B1  =     0.04725884462623;
      P_TARGET_B0  =     0.95274115537376;
      Q_TARGET_B1  =      0.2390988372093;
      Q_TARGET_B0  =     0.76090116279069;
      V_TARGET_B1  =     0.04024137145951;
      V_TARGET_B0  =     0.95975862854048;
      I_TARGET_B  = '0' ;
      U_TARGET_B  =                    0;
      END;
    ELSE DO;
      IF  NOT MISSING(FILE_AVG_GIFT ) AND 
        FILE_AVG_GIFT  <               13.615 THEN DO;
        _NODE_  =                   24;
        _LEAF_  =                    3;
        P_TARGET_B1  =      0.0361451652753;
        P_TARGET_B0  =     0.96385483472469;
        Q_TARGET_B1  =     0.19196062346185;
        Q_TARGET_B0  =     0.80803937653814;
        V_TARGET_B1  =     0.03668059246853;
        V_TARGET_B0  =     0.96331940753146;
        I_TARGET_B  = '0' ;
        U_TARGET_B  =                    0;
        END;
      ELSE DO;
        IF  NOT MISSING(NUMBER_PROM_12 ) AND 
                          13.5 <= NUMBER_PROM_12  THEN DO;
          _NODE_  =                   37;
          _LEAF_  =                    6;
          P_TARGET_B1  =     0.04899772110298;
          P_TARGET_B0  =     0.95100227889701;
          Q_TARGET_B1  =     0.24607329842931;
          Q_TARGET_B0  =     0.75392670157068;
          V_TARGET_B1  =     0.03602921311568;
          V_TARGET_B0  =     0.96397078688431;
          I_TARGET_B  = '0' ;
          U_TARGET_B  =                    0;
          END;
        ELSE DO;
          IF  NOT MISSING(PCT_ATTRIBUTE2 ) AND 
                            58.5 <= PCT_ATTRIBUTE2  THEN DO;
            _NODE_  =                   47;
            _LEAF_  =                    5;
            P_TARGET_B1  =     0.12136059263373;
            P_TARGET_B0  =     0.87863940736626;
            Q_TARGET_B1  =     0.46666666666666;
            Q_TARGET_B0  =     0.53333333333333;
            V_TARGET_B1  =     0.05942303585465;
            V_TARGET_B0  =     0.94057696414534;
            I_TARGET_B  = '0' ;
            U_TARGET_B  =                    0;
            END;
          ELSE DO;
            _NODE_  =                   46;
            _LEAF_  =                    4;
            P_TARGET_B1  =      0.0218140868437;
            P_TARGET_B0  =     0.97818591315629;
            Q_TARGET_B1  =     0.12378483473752;
            Q_TARGET_B0  =     0.87621516526247;
            V_TARGET_B1  =     0.03330189507384;
            V_TARGET_B0  =     0.96669810492615;
            I_TARGET_B  = '0' ;
            U_TARGET_B  =                    0;
            END;
          END;
        END;
      END;
    END;
  END;

*****  DECISION VARIABLES *******;

*** Decision Processing;
label D_TARGET_B = 'Decision: TARGET_B' ;
label EP_TARGET_B = 'Expected Profit: TARGET_B' ;

length D_TARGET_B $ 9;

D_TARGET_B = ' ';
EP_TARGET_B = .;

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


*** End Decision Processing ;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

