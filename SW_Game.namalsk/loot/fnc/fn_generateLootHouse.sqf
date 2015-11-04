
#include "common.hpp"


params ["_house", "_lootparamscfg"];

private ['_hclass','_usestdpos','_lootprobpos','_positions','_lastpos','_result','_good','_scriptedLootpoint','_buildingPosString','_makeElevationCheck','_lootpoint'];

_hclass = typeof _house;



_usestdpos = getNumber (_lootparamscfg / "LootSpawnPoints" / "Default" / "useStandardBuildingPos");
_lootprobpos = getNumber (_lootparamscfg / "LootSpawnPoints" / "Default" / "eachBPosLootProb");
_lootpoint = getText (_lootparamscfg / "LootSpawnPoints" / "Default" / "lootpoint");
_scriptedLootpoint = getText (_lootparamscfg / "LootSpawnPoints" / "Default" / "scriptedLootpoint");
_makeElevationCheck = getNumber (_lootparamscfg / "LootSpawnPoints" / "Default" / "makeElevationCheck");

_buildingPosUse = [];

if (isClass(_lootparamscfg / "LootSpawnPoints" / (_hclass))) then {
	_usestdpos = getNumber (_lootparamscfg / "LootSpawnPoints" / (_hclass) / "useStandardBuildingPos");
	_lootprobpos = getNumber (_lootparamscfg / "LootSpawnPoints" / (_hclass) / "eachBPosLootProb");
	_buildingPosUse = getArray (_lootparamscfg / "LootSpawnPoints" / (_hclass) / "buildingPosUse");
	_lootpoint = getText (_lootparamscfg / "LootSpawnPoints" / (_hclass) / "lootpoint");
	_scriptedLootpoint = getText (_lootparamscfg / "LootSpawnPoints" / (_hclass) / "scriptedLootpoint");
	_makeElevationCheck = getNumber (_lootparamscfg / "LootSpawnPoints" / (_hclass) / "makeElevationCheck");
	
	if (_usestdpos == 2) then {
		_buildingPosString = getText (_lootparamscfg / "LootSpawnPoints" / (_hclass) / "buildingPosString");
	};
};

if (_usestdpos == 1) then {
	_positions = ([_house] call BIS_fnc_buildingPositions);
};
if (_usestdpos == 2) then {
	_positions = ( _house call compile _buildingPosString);
};

if ((_lootpoint == "" && _scriptedLootpoint == "") || !(_usestdpos in [1,2]) || _lootprobpos == 0 || count _positions == 0 || isObjectHidden _house) exitWith {nil};
_lastpos = [0,0,0];
_result = [[],[]]; //posNumber and generateContainerArray 

TRACE_3("generateLootHouse",_usestdpos,_lootprobpos,_buildingPosUse);

{
	_good = true;
	if (count _buildingPosUse > 0 && {!(_foreachindex in _buildingPosUse)}) then {_good = false;};
	if ( _lastpos distance _x < 5) then {_good = false;};
	if (_good) then {
		if (random 1 < _lootprobpos) then {
			_lastpos = _x;
			(_result select 0) pushBack _foreachindex;
			if (_scriptedLootpoint != "") then {_lootpoint = _house call compile _scriptedLootpoint;};
			(_result select 1) pushback ([_lootparamscfg / _lootpoint] call rbc_fnc_generateContainerContent);


		};
	};

} foreach _positions;
TRACE_2("generateLootHouse",_house,_result);
_result
