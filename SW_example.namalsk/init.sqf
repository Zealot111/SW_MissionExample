/**/
enableSaving [false, false];
TF_give_personal_radio_to_regular_soldier=true;
TF_give_microdagr_to_soldier=false;
tf_no_auto_long_range_radio=true;
tf_west_radio_code = "";
tf_east_radio_code = tf_west_radio_code;
tf_guer_radio_code = tf_west_radio_code;
tf_civ_radio_code = tf_west_radio_code;
//tf_radio_channel_name 

waituntil {!isnil "bis_fnc_init"};

[] call wmt_fnc_briefingmap;

[] execVM "briefing.sqf";

0 spawn {sleep 1;  10 setFog [0.1, 0.02, 50]; };

[[trad1,trad2,trad3,trad4,trad5,trad6,trad7,trad8,trad9,trad10,trad11,trad12,trad13,trad14,trad16]] execvm "rad\geiger.sqf";

[30,240] execVM "blowout\blowout.sqf";

_bs = [] execVM "t.sqf";
waituntil {scriptDone _bs};
0 execVM "loot3.sqf";

0 execVM "anomalies\anomaly.sqf";

//################ MISSION SPECIFIC ##################################################