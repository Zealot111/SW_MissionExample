#include "common.hpp"
params ["_box", "_lootparamscfg"];

TRACE_3('',_box, getposatl _box, _lootparamscfg);

private ['_hclass','_usestdpos','_lootpoint','_lootprobpos','_positions','_lastpos','_result','_good','_scriptedLootpoint','_buildingPosString','_eachBPosLootProb'];

_hclass = typeof _box;

_usestdpos = getNumber (_lootparamscfg / "LootSpawnPoints" / "DefaultBox" / "useStandardBuildingPos");
_lootpoint = getText (_lootparamscfg / "LootSpawnPoints" / "DefaultBox" / "lootpoint");
_scriptedLootpoint = getText (_lootparamscfg / "LootSpawnPoints" / "DefaultBox" / "scriptedLootpoint");
_eachBPosLootProb = gettext (_lootparamscfg / "LootSpawnPoints" / "DefaultBox" / "eachBPosLootProb");

if (isClass(_lootparamscfg / "LootSpawnPoints" / (_hclass))) then {
	_usestdpos = getNumber (_lootparamscfg / "LootSpawnPoints" / (_hclass) / "useStandardBuildingPos");
	_lootprobpos = getNumber (_lootparamscfg / "LootSpawnPoints" / (_hclass) / "eachBPosLootProb");
	_lootpoint = getText (_lootparamscfg / "LootSpawnPoints" / (_hclass) / "lootpoint");
	_scriptedLootpoint = getText (_lootparamscfg / "LootSpawnPoints" / (_hclass) / "scriptedLootpoint");
	_eachBPosLootProb = getNumber (_lootparamscfg / "LootSpawnPoints" / (_hclass) / "eachBPosLootProb");
};

TRACE_5('',_hclass,_usestdpos,_lootpoint,_scriptedLootpoint,_eachBPosLootProb);

if (_usestdpos != 3 ) exitwith {WARNING("Ошибка, некорректные параметры!");[[],[],[],[]]};

if (_scriptedLootpoint != "") then {
	_lootpoint = _box call compile _scriptedLootpoint;
};

_lootpoint = _cfg / _lootpoint;

_result = [[],[],[],[]];

TRACE_2('',_lootpoint,_eachBPosLootProb);
if (random 1 < _eachBPosLootProb) then {
	_result = [_lootpoint] call rbc_fnc_generateContainerContent;
};


_result