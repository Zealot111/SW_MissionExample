#include "common.hpp"
params ["_house","_houselootdescr","_lootparamscfg"];
private ["_con",'_hclass','_usestdpos','_makeElevationCheck','_buildingPosString','_positions'];

_hclass = typeof _house;

_usestdpos = getNumber (_lootparamscfg / "LootSpawnPoints" / "Default" / "useStandardBuildingPos");
_makeElevationCheck = getNumber (_lootparamscfg / "LootSpawnPoints" / "Default" / "makeElevationCheck");



if (isClass(_lootparamscfg / "LootSpawnPoints" / (_hclass))) then {
		
		_usestdpos = getNumber (_lootparamscfg / "LootSpawnPoints" / (_hclass) / "useStandardBuildingPos");
		_makeElevationCheck = getNumber (_lootparamscfg / "LootSpawnPoints" / (_hclass) / "makeElevationCheck");
		if (_usestdpos == 2) then {
			_buildingPosString = getText (_lootparamscfg / "LootSpawnPoints" / (_hclass) / "buildingPosString");
		};
};
	
_positions = [];	
if (_usestdpos == 1) then {
	_positions = ([_house] call BIS_fnc_buildingPositions);
};
if (_usestdpos == 2) then {
	_rpositions = ( call compile _buildingPosString);

	{
		_positions pushBack (_house modelToWorld (_x));
	} foreach _rpositions;

};


{
	_con = ([_positions select _x, (_houselootdescr select 1) select _foreachindex, _makeElevationCheck == 1] call rbc_fnc_spawnlootinplace);
	_con setvariable ["rbc_housePosNum", _x];
	_house setvariable ["rbc_houseContainers", (_house getvariable ["rbc_houseContainers",[]]) + [_con]];
} foreach (_houselootdescr select 0);




_house setVariable ["rbc_lootstate", "CR"];

_house

