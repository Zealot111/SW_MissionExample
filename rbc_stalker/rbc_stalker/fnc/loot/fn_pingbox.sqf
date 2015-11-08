#include "common.hpp"
params ["_box","_boxes","_cfg"];

private ['_state','_time','_maxtime','_data'];

_state = _box getVariable ["rbc_lootstate", ""];
_time = _box getVariable ["rbc_LootTime", time];


_maxtime = getNumber (_cfg / "LootSpawnParameters" / "lootRenewTime");
 



switch (_state) do {
	case ("NO") : {
		WARNING(("Unexpected parameter _state " + _state));
	};
	case ("CR") : {
		_box setVariable ["rbc_LootTime", time];
		TEST_MARKER(_box,"", str (floor(time)) );
	
	};
	
	case ("SU") : {
		if ( time - _time > _maxtime) then {
			//создавать заново
			_box setVariable ["rbc_lootstate", "CR"];
			_box setVariable ["rbc_LootTime", time];
			_data = [_box,_cfg] call rbc_fnc_createBoxContent;
			[_box,_data] call rbc_fnc_setcontainerContent;
			_boxes pushback _box;
			TEST_MARKER(_box,"ColorRed", str (floor(time)) );
			//создавать заново
		} else {
			//восстанавливать сохраненное
			_data = _box getVariable "rbc_suspendLootData";
			[_box,_data] call rbc_fnc_setcontainerContent;
			_box setVariable ["rbc_lootstate", "CR"];
			_box setVariable ["rbc_LootTime", time];
			TEST_MARKER(_box,"ColorBlue", str (floor(time)) );
			_boxes pushback _box;
			
		
		};
	
	
	};
	case ("") : {
		//создавать заново
		_box setVariable ["rbc_lootstate", "CR"];
		_box setVariable ["rbc_LootTime", time];
		_data = [_box,_cfg] call rbc_fnc_createBoxContent;
		[_box,_data] call rbc_fnc_setcontainerContent;
		_boxes pushback _box;
		TEST_MARKER(_box,"ColorRed", str (floor(time)) );
	
	
	};
	

	
	
	
	default {
		WARNING(("Unknown parameter _state " + _state));
	
	
	};

};