diag_log ["Initserver.sqf"];
rbc_alreadyPlayedUIDs = [];
publicVariable "rbc_alreadyPlayedUIDs";

addMissionEventHandler ["HandleDisconnect",{
	diag_log["HandleDisconnect",_this]; 
	if (alive (_this select 0)) then {
		(_this select 0) setVariable ["rbc_disconnected",1,true];
	};
	[_this select 0] call rbc_fnc_disableAI;
	true
}]; 

if (isserver) then {
	[missionConfigFile / "LootParameters"] call rbc_fnc_lootSystemInit;
	[zmb,zmb_1,zmb_2,zmb_3,zmb_4,zmb_5,zmb_6,zmb_7,zmb_8,zmb_9,zmb_10,zmb_11,zmb_12,zmb_13,zmb_14,zmb_17,zmb_16,zmb_4_2] execVM "zombie.sqf";
};
