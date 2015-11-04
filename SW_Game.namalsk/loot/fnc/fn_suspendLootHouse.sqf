#include "common.hpp"
params ["_house"];

private ["_contaners","_data"];

_contaners = _house getvariable ["rbc_houseContainers",[]];

if ((_house getVariable ["rbc_lootstate", ""]) != "CR") exitwith {WARNING("suspendLootHouse: Error, trying to suspend empty house");};

_data = [[],[]];

{
	if !(isnull _x) then {
		_content = [_x] call rbc_fnc_getContainerContent;
		(_data select 0) pushback (_x getvariable "rbc_housePosNum");
		(_data select 1) pushback (_content);
		deleteVehicle _x;
	
	
	};
} forEach _contaners;

_house setvariable ["rbc_houseContainers",[]];
_house setVariable ["rbc_suspendLootData",_data];
_house setVariable ["rbc_LootTime", time];
_house setVariable ["rbc_lootstate", "SU"];
