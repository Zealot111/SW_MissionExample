/**/
diag_log ["Init.sqf"];
enableSaving [false, false];
TF_give_personal_radio_to_regular_soldier=true;
TF_give_microdagr_to_soldier=false;
tf_no_auto_long_range_radio=true;
tf_same_sw_frequencies_for_side = true;
tf_west_radio_code = "";
tf_east_radio_code = tf_west_radio_code;
tf_guer_radio_code = tf_west_radio_code;
tf_civ_radio_code = tf_west_radio_code;
tf_radio_channel_name = "TFAR Stalker";
//tf_radio_channel_name 
wmt_hl_ratio = [-1,-1,-1];
wmt_hl_sidelimits = [-1,-1,-1];
if (hasinterface) then {	{if (_x select [0,4] == "rad_") then {_x setMarkerAlphaLocal 0;};} foreach allMapMarkers;};

waituntil {!isnil "bis_fnc_init"};

[] call wmt_fnc_briefingmap;

[] execVM "briefing.sqf";

//0 spawn {sleep 1;  10 setFog [0.1, 0.02, 50]; };

[40,120] execVM "blowout\blowout.sqf";

0 execVM "anomalies\anomaly.sqf";
[] execVM "sbox.sqf";
[] execVM "t.sqf";

//################ MISSION SPECIFIC ##################################################


