enableSaving [false, false];
TF_give_personal_radio_to_regular_soldier=true;
TF_give_microdagr_to_soldier=false;
tf_no_auto_long_range_radio=true;


waituntil {!isnil "bis_fnc_init"};

[] call wmt_fnc_briefingmap;
_bs = [] execVM "t.sqf";
[] execVM "briefing.sqf";
waituntil {scriptDone _bs};
0 execVM "loot2.sqf";
0 execVM "loot3.sqf";
0 spawn {sleep 1;  10 setFog [0.1, 0.02, 50]; };
0 execVM "anomalies\anomaly.sqf"
//с качестве параметра - список триггеров
[[trad1,trad2,trad3,trad4,trad5,trad6,trad7,trad8,trad9,trad10,trad11,trad12,trad13,trad14,trad16]] execvm "rad\geiger.sqf";

[30,240] execVM "blowout\blowout.sqf";
//################ MISSION SPECIFIC ##################################################