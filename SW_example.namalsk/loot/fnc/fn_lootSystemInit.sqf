#include "common.hpp"
params ["_cfg"];

if (isNil "rbc_mainThreadScript") then {rbc_mainThreadScript = scriptNull;};

// read config parameters


if (getNumber (_cfg / "LootSpawnParameters" / "enabled") == 0) exitwith {WARNING( "Warning Loot system disabled!");};
if (!isnull rbc_mainThreadScript) exitWith {WARNING("Main thread already started!");};

rbc_mainThreadScript = _cfg spawn {
	params ["_cfg"];
	private ["_playerCheckDistance","_pauseBetweenChecks","_users","_houses","_lootHouses","_lootSuspendTime","_lootBoxesClasses","_boxes","_lootBoxes"];
	_playerCheckDistance = getNumber (_cfg / "LootSpawnParameters" / "playerCheckDistance");
	_pauseBetweenChecks = getNumber (_cfg / "LootSpawnParameters" / "pauseBetweenChecks");
	_lootSuspendTime =  getNumber (_cfg / "LootSpawnParameters" / "lootSuspendTime");
	_lootHouseClasses =  getArray (_cfg / "LootSpawnParameters" / "lootHouseClasses");
	_lootBoxesClasses =  getArray (_cfg / "LootSpawnParameters" / "lootBoxesClasses");
	
	
	
	_lootHouses = [];
	_lootBoxes = [];
	sleep 3.2;
	LOG("Loot thread Started");
	while {isNil "rbc_stopLootThread"} do {
		
		_users = [[allUnits,playableUnits] select (count playableUnits > 0), {isPlayer _this && alive _this && vehicle _this == _this}] call CBA_fnc_select ;
		{
		
			_houses = nearestObjects [_x,_lootHouseClasses, _playerCheckDistance];
			TRACE_2('PING ',diag_frameno, _houses);
			{
				[_x, _lootHouses, _cfg ] call rbc_fnc_pingLootHouse;
				TRACE_3('PING ',diag_frameno, _x);
				
			} foreach _houses;
			

			if (count _lootBoxesClasses != 0) then {
				_boxes = nearestObjects [_x,_lootBoxesClasses, _playerCheckDistance];
				TRACE_2('PING ',diag_frameno, _boxes);
				{
					[_x, _lootBoxes, _cfg ] call rbc_fnc_pingBox;
					TRACE_3('PING ',diag_frameno, _x);
				} foreach _boxes;
			};
			sleep 0.01;
		
		} forEach _users;
		
	
		sleep _pauseBetweenChecks;
		{
			if ((_x getVariable ["rbc_LootTime", time]) + _lootSuspendTime < time ) then {
				[_x] call rbc_fnc_suspendLootHouse;
				TEST_MARKER(_x,"ColorGreen", str (FLOOR10(time)) );
				_lootHouses=_lootHouses - [_x];
			};
		} foreach _lootHouses;
		{
			if ((_x getVariable ["rbc_LootTime", time]) + _lootSuspendTime < time ) then {
				[_x] call rbc_fnc_suspendBox;
				TEST_MARKER(_x,"ColorGreen", str (FLOOR10(time)) );
				_lootBoxes=_lootBoxes - [_x];
			};
		} foreach _lootBoxes;
		
		 
	};
	LOG( "Loot Thread stopped!");
	rbc_stopLootThread = nil;
};