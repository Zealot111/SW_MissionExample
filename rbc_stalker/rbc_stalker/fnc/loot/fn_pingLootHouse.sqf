#include "common.hpp"
params ["_house","_loothouses","_paramscfg"];
private ["_state","_restore","_data"];

_state = _house getVariable ["rbc_lootstate", ""];

if (_state == "NO") exitWith {};

_restore = true;

if (_state  == "SU") then {
	_restore = [_house,_paramscfg] call rbc_fnc_restoreSuspendedHouse;
	if (_restore) then {
		_loothouses pushBack _house;
		TEST_MARKER(_house,"ColorBlue", str (floor(time)) );
	};
};

_house setVariable ["rbc_LootTime", time];
TEST_MARKER(_house,"", str (floor(time)) );

if (_state == ""  || !_restore) then {
		_data = [_house,_paramscfg] call rbc_fnc_generateLootForHouse;
		if (!isNIl "_data") then {
			[_house,_data , _paramscfg] call rbc_fnc_placeLootInHouse;
			_loothouses pushBack _house;
			TEST_MARKER(_house,"ColorRed", str (floor(time)) );
		} else {
			_house setVariable ["rbc_lootstate", "NO"];
			TEST_MARKER(_house,"ColorBlack", "" );
		};



};

