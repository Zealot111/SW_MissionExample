﻿diag_log ["InitPlayerLocal.sqf"];

if (isNil "rbc_alreadyPlayedUIDs") then {rbc_alreadyPlayedUIDs=[];};

[] execvm "rad\geiger.sqf";

[] execvm "merchant.sqf";
 
sleep 1;
if (alive player) then {
	if (getPlayerUID player in rbc_alreadyPlayedUIDs && (player getVariable ["rbc_disconnected",0] != 1) && !(player getvariable ["rbc_is_vip",false] )) then {
		diag_log ["initplayerlocal.sqf, player second enter to game"];
		// move to far place
		player setposasl [100,100,100];
		player setdamage 1;
		hideBody player;
		{ deleteVehicle _x } foreach ( nearestObjects [ player,["groundWeaponHolder","simulatedWeaponHolder"],20]); 
	};
	if !(getPlayerUID player in rbc_alreadyPlayedUIDs) then {
		(10 * (45 + random 30)) spawn {
			sleep _this;
			rbc_alreadyPlayedUIDs pushBack getPlayerUID player;
			publicVariable "rbc_alreadyPlayedUIDs";
			diag_log ["Inserting player uid to ",rbc_alreadyPlayedUIDs];
			
		}; 
	};
	if (player getVariable ["rbc_disconnected",0] != 0) then {
		player setVariable ["rbc_disconnected",0,true];
	};
	
};
setviewdistance 500;
if (player getVariable ["rbc_is_vip",false]) then {
        _pos = [8088.254395,11215.62207,71.781021];
        box1 = "plp_ct_FootlockerYellow" createVehicleLocal _pos;
        box1 setDir 341.636; box1 setPosWorld _pos;[box1,  -0.000425032, 5.79171e-005] call BIS_fnc_setPitchBank;
        box1 call compile preprocessFileLineNumbers "box1.sqf";
 
        _pos = [7250.889648,7036.677734,238.632385];
        box2 = "plp_ct_FootlockerYellow" createVehicleLocal _pos;
        box2 setDir 334.103; box2 setPosWorld _pos;[box2, -0.000649261, -0.000308266] call BIS_fnc_setPitchBank;
        box2 call compile preprocessFileLineNumbers "box2.sqf";
 
};