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
wmt_hl_ratio = [-1,-1,-1];
wmt_hl_sidelimits = [-1,-1,-1];

waituntil {!isnil "bis_fnc_init"};

[] call wmt_fnc_briefingmap;

[] execVM "briefing.sqf";

0 spawn {sleep 1;  10 setFog [0.1, 0.02, 50]; };

[[trad1,trad2,trad3,trad4,trad5,trad6,trad7,trad8,trad9,trad10,trad11,trad12,trad13,trad14,trad16]] execvm "rad\geiger.sqf";

[40,120] execVM "blowout\blowout.sqf";

0 execVM "anomalies\anomaly.sqf";

_bs = [] execVM "t.sqf";
waituntil {scriptDone _bs};




//################ MISSION SPECIFIC ##################################################
if (isserver) then {
	[missionConfigFile / "LootParameters"] call rbc_fnc_lootSystemInit;
	[zmb,zmb_1,zmb_2,zmb_3,zmb_4,zmb_5,zmb_6,zmb_7,zmb_8,zmb_9,zmb_10,zmb_11,zmb_12,zmb_13,zmb_14] execVM "zombie.sqf";
};