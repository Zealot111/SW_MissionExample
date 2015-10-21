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

[30,240] execVM "blowout\blowout.sqf";

0 execVM "anomalies\anomaly.sqf";

_bs = [] execVM "t.sqf";
waituntil {scriptDone _bs};
0 execVM "loot3.sqf";


//################ MISSION SPECIFIC ##################################################

if (hasinterface) then {
	sleep 1;
	0 spawn {
		while {alive player} do {
			if ("rb_suitcase" in magazines player) then {
				"marker_doc" setmarkerpos (getpos player);
			};
			sleep 0.6;
		};
	};
};

if (isServer) then {
        _pos = [8070.807129,11224.441406,86.745728];
        box1 = createVehicle ["plp_ct_FootlockerYellow", _pos, [], 0, "CAN_COLLIDE"];
        box1 setDir 19.6426; box1 setPosWorld _pos;[box1,  1.49765e-005, -0.000255543] call BIS_fnc_setPitchBank;
        box1 call compile preprocessFileLineNumbers "box1.sqf";
 
        _pos = [6286.719727,11760.203125,18.9911];
        box2 = createVehicle ["plp_ct_WeathCrateBigWorn", _pos, [], 0, "CAN_COLLIDE"];
        box2 setDir 359.87; box2 setPosWorld _pos;[box2, -8.83048, -0.480143] call BIS_fnc_setPitchBank;
        box2 call compile preprocessFileLineNumbers "box2.sqf";
 
        _pos = [3979.119873,9289.958008,35.465378];
        box3 = createVehicle ["plp_ct_WeathCrateBigWorn", _pos, [], 0, "CAN_COLLIDE"];
        box3 setDir 326.03; box3 setPosWorld _pos;[box3, -29.414, -7.3344] call BIS_fnc_setPitchBank;
        box3 call compile preprocessFileLineNumbers "box3.sqf";
};