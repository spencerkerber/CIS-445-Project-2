/*----G_RECENT_RESPONSE_COUNT begin----*/
length _NORM12 $ 12;
_NORM12 = put( RECENT_RESPONSE_COUNT , BEST12. );
%DMNORMIP( _NORM12 )
drop _NORM12;
select(_NORM12);
when("0           " ) G_RECENT_RESPONSE_COUNT = 3;
when("1           " ) G_RECENT_RESPONSE_COUNT = 3;
when("2           " ) G_RECENT_RESPONSE_COUNT = 2;
when("3           " ) G_RECENT_RESPONSE_COUNT = 1;
when("4           " ) G_RECENT_RESPONSE_COUNT = 1;
when("5           " ) G_RECENT_RESPONSE_COUNT = 0;
when("6           " ) G_RECENT_RESPONSE_COUNT = 0;
when("7           " ) G_RECENT_RESPONSE_COUNT = 0;
when("8           " ) G_RECENT_RESPONSE_COUNT = 0;
when("9           " ) G_RECENT_RESPONSE_COUNT = 0;
when("10          " ) G_RECENT_RESPONSE_COUNT = 0;
when("11          " ) G_RECENT_RESPONSE_COUNT = 0;
when("12          " ) G_RECENT_RESPONSE_COUNT = 1;
when("13          " ) G_RECENT_RESPONSE_COUNT = 0;
when("14          " ) G_RECENT_RESPONSE_COUNT = 3;
otherwise substr(_WARN_, 2, 1) = 'U';
end;
label G_RECENT_RESPONSE_COUNT="Grouped Levels for RECENT_RESPONSE_COUNT";
/*----G_RECENT_RESPONSE_COUNT end----*/
