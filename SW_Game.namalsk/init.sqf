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

waituntil {!isnil "bis_fnc_init"};
if (hasinterface) then {	{if (_x select [0,4] == "rad_") then {_x setMarkerAlphaLocal 0;};} foreach allMapMarkers;};

[] call wmt_fnc_briefingmap;

[] execVM "briefing.sqf";

0 spawn {sleep 1;  10 setFog [0.1, 0.02, 50]; };

[40,120] execVM "blowout\blowout.sqf";

0 execVM "anomalies\anomaly.sqf";

_bs = [] execVM "t.sqf";
_bs = [] execVM "del.sqf";
waituntil {scriptDone _bs};
0 execVM "loot3.sqf";


//################ MISSION SPECIFIC ##################################################

if (isserver) then {
	[missionConfigFile / "LootParameters"] call rbc_fnc_lootSystemInit;
	[zmb,zmb_1,zmb_2,zmb_3,zmb_4,zmb_5,zmb_6,zmb_7,zmb_8,zmb_9,zmb_10,zmb_11,zmb_12,zmb_13,zmb_14,zmb_17,zmb_16,zmb_4_2] execVM "zombie.sqf";
};
if (hasinterface) then {
/*
	setPlayerRespawnTime 10;
	if ( ({getplayeruid player == _x} count zltrespawnplayer) > 0 ) then {
		setPlayerRespawnTime 900;
	
	}; 
	*/
//	{if (_x select [0,4] == "rad_") then {_x setMarkerAlphaLocal 1;};} foreach allMapMarkers;
	sleep 3;
	if ( ({getplayeruid player == _x} count zltrespawnplayer) > 3 ) then {
	avbg = player ;
		avbg setdamage 1; deletevehicle player;
		[sidelogic,"Вы умерли"]  spawn wmt_fnc_endmission;
		
	};
	if ( ({getplayeruid player == _x} count zltrespawnplayer) > 0 ) then {
		avbg = player;
		forceRespawn player; deletevehicle player;
	} else {

	};
};

if (isServer) then {
        _pos = [8088.254395,11215.62207,71.781021];
        box1 = createVehicle ["plp_ct_FootlockerYellow", _pos, [], 0, "CAN_COLLIDE"];
        box1 setDir 341.636; box1 setPosWorld _pos;[box1,  -0.000425032, 5.79171e-005] call BIS_fnc_setPitchBank;
        box1 call compile preprocessFileLineNumbers "box1.sqf";
 
        _pos = [7250.889648,7036.677734,238.632385];
        box2 = createVehicle ["plp_ct_FootlockerYellow", _pos, [], 0, "CAN_COLLIDE"];
        box2 setDir 334.103; box2 setPosWorld _pos;[box2, -0.000649261, -0.000308266] call BIS_fnc_setPitchBank;
        box2 call compile preprocessFileLineNumbers "box2.sqf";
 
        _pos = [6289.891113,9409.0947266,43.377712];
        box3 = createVehicle ["plp_ct_FootlockerYellow", _pos, [], 0, "CAN_COLLIDE"];
        box3 setDir 354.659; box3 setPosWorld _pos;[box3, -0.000297717, -0.000150036] call BIS_fnc_setPitchBank;
        box3 call compile preprocessFileLineNumbers "box3.sqf";
		
		 _pos = [7066.410156,5856.182617,42.153591];
        box4 = createVehicle ["plp_ct_FootlockerYellow", _pos, [], 0, "CAN_COLLIDE"];
        box4 setDir 274.462; box4 setPosWorld _pos;[box4, 9.9749e-006, 6.10385e-005] call BIS_fnc_setPitchBank;
        box4 call compile preprocessFileLineNumbers "box4.sqf";
				
		 _pos = [3962.30542,8422.0732422,157.182037];
        box5 = createVehicle ["plp_ct_FootlockerGreen", _pos, [], 0, "CAN_COLLIDE"];
        box5 setDir 329.766; box5 setPosWorld _pos;[box5, -10.9489, 0.598845] call BIS_fnc_setPitchBank;
        box5 call compile preprocessFileLineNumbers "box5.sqf";

		 _pos = [4068.428711,9204.928711,70.727028];
        box6 = createVehicle ["plp_ct_MilBoxLongOlive", _pos, [], 0, "CAN_COLLIDE"];
        box6 setDir 0.635563; box6 setPosWorld _pos;[box6, -0.00395323, 0.0483152] call BIS_fnc_setPitchBank;
        box6 call compile preprocessFileLineNumbers "box6.sqf";
					
		 _pos = [7920.978027,9082.96875,13.463724];
        box7 = createVehicle ["plp_ct_MilBoxMediumBlack", _pos, [], 0, "CAN_COLLIDE"];
        box7 setDir 0.0870466; box7 setPosWorld _pos;[box7, -2.28175, -3.98966] call BIS_fnc_setPitchBank;
        box7 call compile preprocessFileLineNumbers "box7.sqf";
		
		 _pos = [6707.449219,7480.433105,41.0414925];
        box8 = createVehicle ["plp_ct_MilBoxMediumBlack", _pos, [], 0, "CAN_COLLIDE"];
        box8 setDir 359.721; box8 setPosWorld _pos;[box8, -3.23939, -7.26696] call BIS_fnc_setPitchBank;
        box8 call compile preprocessFileLineNumbers "box8.sqf";
		
		 _pos = [5464.677734,8092.391602,113.309662];
        box9 = createVehicle ["plp_ct_MilBoxMediumBlack", _pos, [], 0, "CAN_COLLIDE"];
        box9 setDir 359.728; box9 setPosWorld _pos;[box9, 4.03312, -0.11401] call BIS_fnc_setPitchBank;
        box9 call compile preprocessFileLineNumbers "box9.sqf";				
		
		 _pos = [3609.917236,7993.771484,182.534317];
        box10 = createVehicle ["plp_ct_MilBoxMediumBlack", _pos, [], 0, "CAN_COLLIDE"];
        box10 setDir 359.59; box10 setPosWorld _pos;[box10, 5.00138, 2.97198] call BIS_fnc_setPitchBank;
        box10 call compile preprocessFileLineNumbers "box10.sqf";
		
		 _pos = [4985.324219,6608.407715,21.504442];
        box11 = createVehicle ["plp_ct_HighSecMediumRed", _pos, [], 0, "CAN_COLLIDE"];
        box11 setDir 49.6368; box11 setPosWorld _pos;[box11,  0.00650037, 0.0307669] call BIS_fnc_setPitchBank;
        box11 call compile preprocessFileLineNumbers "box11.sqf";
		
		 _pos = [4013.215088,7600.16748,69.12059];
        box12 = createVehicle ["plp_ct_FootlockerBrown", _pos, [], 0, "CAN_COLLIDE"];
        box12 setDir 39.6397; box12 setPosWorld _pos;[box12,  -0.146778, 0.014801] call BIS_fnc_setPitchBank;
        box12 call compile preprocessFileLineNumbers "box12.sqf";
		
		 _pos = [7313.390625,7941.53418,88.728012];
        box13 = createVehicle ["plp_ct_PlasticBoxRed", _pos, [], 0, "CAN_COLLIDE"];
        box13 setDir 314.68; box13 setPosWorld _pos;[box13,  0.028739, 0.0266417] call BIS_fnc_setPitchBank;
        box13 call compile preprocessFileLineNumbers "box13.sqf";
		
		 _pos = [7256.172852,7986.486816,88.343758];
        box14 = createVehicle ["plp_ct_PlasticBoxRed", _pos, [], 0, "CAN_COLLIDE"];
        box14 setDir 44.6674; box14 setPosWorld _pos;[box14, -0.0339213, 0.0335167] call BIS_fnc_setPitchBank;
        box14 call compile preprocessFileLineNumbers "box14.sqf";			
};