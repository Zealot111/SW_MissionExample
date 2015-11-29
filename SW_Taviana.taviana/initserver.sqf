diag_log ["Initserver.sqf"];
rbc_alreadyPlayedUIDs = [];
publicVariable "rbc_alreadyPlayedUIDs";

addMissionEventHandler ["HandleDisconnect",{
	diag_log["HandleDisconnect",_this]; 
	if (alive (_this select 0)) then {
//		(_this select 0) setVariable ["rbc_disconnected",1,true];
		deleteVehicle (_this select 0);
	};

	//[_this select 0] call rbc_fnc_disableAI;
//	(_this select 0) addEventHandler ["Respawn", {deleteVehicle (_this select 0);}];
	false
}]; 

if (isserver) then {
	[] execVM "loot4.sqf";
	[] execVM "zombie.sqf";
};
