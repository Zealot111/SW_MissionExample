/**/
diag_log ["Init.sqf"];
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
if (hasinterface) then {	{if (_x select [0,4] == "rad_") then {_x setMarkerAlphaLocal 0;};} foreach allMapMarkers;};

waituntil {!isnil "bis_fnc_init"};

[] call wmt_fnc_briefingmap;

[] execVM "briefing.sqf";

//0 spawn {sleep 1;  10 setFog [0.1, 0.02, 50]; };

[40,120] execVM "blowout\blowout.sqf";

0 execVM "anomalies\anomaly.sqf";

_bs = [] execVM "t.sqf";
_bs = [] execVM "del.sqf";



//################ MISSION SPECIFIC ##################################################


if (isServer) then {
        _pos = [8088.254395,11215.62207,71.781021];
        box1 = createVehicle ["plp_ct_FootlockerYellow", _pos, [], 0, "CAN_COLLIDE"];
        box1 setDir 341.636; box1 setPosWorld _pos;[box1,  -0.000425032, 5.79171e-005] call BIS_fnc_setPitchBank;
        box1 call compile preprocessFileLineNumbers "box1.sqf";
 
        _pos = [7250.889648,7036.677734,238.632385];
        box2 = createVehicle ["plp_ct_FootlockerYellow", _pos, [], 0, "CAN_COLLIDE"];
        box2 setDir 334.103; box2 setPosWorld _pos;[box2, -0.000649261, -0.000308266] call BIS_fnc_setPitchBank;
        box2 call compile preprocessFileLineNumbers "box2.sqf";
 
};