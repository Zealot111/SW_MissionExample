diag_log ["Initserver.sqf"];
rbc_alreadyPlayedUIDs = [];
publicVariable "rbc_alreadyPlayedUIDs";

addMissionEventHandler ["HandleDisconnect",{
	diag_log["HandleDisconnect",_this]; 
	if (alive (_this select 0)) then {
		(_this select 0) setVariable ["rbc_disconnected",1,true];
	};
	[_this select 0] call rbc_fnc_disableAI;
	(_this select 0) addEventHandler ["Respawn", {deleteVehicle (_this select 0);}];
	true
}]; 

if (isserver) then {
	[missionConfigFile / "LootParameters"] call rbc_fnc_lootSystemInit;
	[] execVM "zombie.sqf";
};
