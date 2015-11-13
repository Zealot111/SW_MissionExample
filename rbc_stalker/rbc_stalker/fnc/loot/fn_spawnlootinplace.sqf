 #include "common.hpp"
 params ["_posatl","_loot",["_elcheck",true,[true]]];
 
private "_hld";
if (_elcheck) then {
	_posatl = [_posatl] call rbc_fnc_checkfloorpos;
};
_hld = createVehicle ["GroundWeaponHolder",_posatl , [], 0, "CAN_COLLIDE"];
_hld setVariable ["rbc_lootsystem",true];
_hld setposatl _posatl;
[_hld, _loot, false] call rbc_fnc_setContainerContent;
 
_hld