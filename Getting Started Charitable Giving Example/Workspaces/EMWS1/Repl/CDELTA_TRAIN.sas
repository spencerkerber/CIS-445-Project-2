if NAME="DONOR_GENDER" then ROLE="REJECTED";
else
if NAME="REP_DONOR_GENDER" then do;
ROLE="INPUT";
LEVEL="NOMINAL";
end;
else
if NAME="SES" then ROLE="REJECTED";
else
if NAME="REP_SES" then do;
ROLE="INPUT";
LEVEL="NOMINAL";
end;
else
if NAME="URBANICITY" then ROLE="REJECTED";
else
if NAME="REP_URBANICITY" then do;
ROLE="INPUT";
LEVEL="NOMINAL";
end;
