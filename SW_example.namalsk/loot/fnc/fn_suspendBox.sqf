#include "common.hpp"
params ["_box"];

private ["_contaners","_data"];



if ((_box getVariable ["rbc_lootstate", ""]) != "CR") exitwith {WARNING("suspendBox: Error, trying to suspend empty house");};

_data = _box call rbc_fnc_getContainerContent;

TRACE_3("Suspend",_box, getposATL _box, _data);

_box setVariable ["rbc_suspendLootData",_data];
_box setVariable ["rbc_LootTime", time];
_box setVariable ["rbc_lootstate", "SU"];
