diag_log ["InitPlayerLocal.sqf"];

if (isNil "rbc_alreadyPlayedUIDs") then {rbc_alreadyPlayedUIDs=[];};
 
sleep 1;
if (alive player) then {
	if (getPlayerUID player in rbc_alreadyPlayedUIDs && player getVariable ["rbc_disconnected",0] != 1) then {
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