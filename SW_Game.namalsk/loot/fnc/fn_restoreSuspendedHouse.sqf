#include "common.hpp"
params ["_house","_paramsCfg"];

private ['_time','_oldtime','_data'];

if ((_house getVariable ["rbc_lootstate", ""]) != "SU" ) exitwith {false};

_time =  getNumber (_paramsCfg / "LootSpawnParameters" /"lootRenewTime");
_oldtime = (_house getVariable "rbc_LootTime");

TRACE_4("Loottime time, getpos, house", _oldtime, time, getposatl _house, typeof _house);

if ( time  - _oldtime > _time) exitWith {_house setVariable ["rbc_suspendLootData",nil]; false};

_data = _house getVariable "rbc_suspendLootData";

[_house,_data,_paramsCfg] call rbc_fnc_placeLootInHouse;


true