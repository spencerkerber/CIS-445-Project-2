*------------------------------------------------------------*
 Node = 2
*------------------------------------------------------------*
if FREQUENCY_STATUS_97NK IS ONE OF: 3, 4
then 
 Tree Node Identifier   = 2
 Number of Observations = 3024.067307
 Predicted: TARGET_B=1 = 0.07
 Predicted: TARGET_B=0 = 0.93
 
*------------------------------------------------------------*
 Node = 6
*------------------------------------------------------------*
if PEP_STAR IS ONE OF: 1
AND FREQUENCY_STATUS_97NK IS ONE OF: 1, 2 or MISSING
then 
 Tree Node Identifier   = 6
 Number of Observations = 2989.1494063
 Predicted: TARGET_B=1 = 0.05
 Predicted: TARGET_B=0 = 0.95
 
*------------------------------------------------------------*
 Node = 15
*------------------------------------------------------------*
if PER_CAPITA_INCOME >= 17477
AND PEP_STAR IS ONE OF: 0 or MISSING
AND FREQUENCY_STATUS_97NK IS ONE OF: 1, 2 or MISSING
then 
 Tree Node Identifier   = 15
 Number of Observations = 1392.0706414
 Predicted: TARGET_B=1 = 0.05
 Predicted: TARGET_B=0 = 0.95
 
*------------------------------------------------------------*
 Node = 24
*------------------------------------------------------------*
if PER_CAPITA_INCOME < 17477 or MISSING
AND PEP_STAR IS ONE OF: 0 or MISSING
AND FREQUENCY_STATUS_97NK IS ONE OF: 1, 2 or MISSING
AND FILE_AVG_GIFT < 13.615
then 
 Tree Node Identifier   = 24
 Number of Observations = 1294.5359596
 Predicted: TARGET_B=1 = 0.04
 Predicted: TARGET_B=0 = 0.96
 
*------------------------------------------------------------*
 Node = 37
*------------------------------------------------------------*
if PER_CAPITA_INCOME < 17477 or MISSING
AND PEP_STAR IS ONE OF: 0 or MISSING
AND NUMBER_PROM_12 >= 13.5
AND FREQUENCY_STATUS_97NK IS ONE OF: 1, 2 or MISSING
AND FILE_AVG_GIFT >= 13.615 or MISSING
then 
 Tree Node Identifier   = 37
 Number of Observations = 191.80965
 Predicted: TARGET_B=1 = 0.05
 Predicted: TARGET_B=0 = 0.95
 
*------------------------------------------------------------*
 Node = 46
*------------------------------------------------------------*
if PER_CAPITA_INCOME < 17477 or MISSING
AND PEP_STAR IS ONE OF: 0 or MISSING
AND PCT_ATTRIBUTE2 < 58.5 or MISSING
AND NUMBER_PROM_12 < 13.5 or MISSING
AND FREQUENCY_STATUS_97NK IS ONE OF: 1, 2 or MISSING
AND FILE_AVG_GIFT >= 13.615 or MISSING
then 
 Tree Node Identifier   = 46
 Number of Observations = 1750.833331
 Predicted: TARGET_B=1 = 0.02
 Predicted: TARGET_B=0 = 0.98
 
*------------------------------------------------------------*
 Node = 47
*------------------------------------------------------------*
if PER_CAPITA_INCOME < 17477 or MISSING
AND PEP_STAR IS ONE OF: 0 or MISSING
AND PCT_ATTRIBUTE2 >= 58.5
AND NUMBER_PROM_12 < 13.5 or MISSING
AND FREQUENCY_STATUS_97NK IS ONE OF: 1, 2 or MISSING
AND FILE_AVG_GIFT >= 13.615 or MISSING
then 
 Tree Node Identifier   = 47
 Number of Observations = 11.533704697
 Predicted: TARGET_B=1 = 0.12
 Predicted: TARGET_B=0 = 0.88
 
