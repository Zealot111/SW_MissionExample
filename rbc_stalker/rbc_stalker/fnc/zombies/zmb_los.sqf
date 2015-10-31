
params ["_a","_BaseDistance"];
private ["_units","_fn_checkLos"];

_fn_checkLos = {
	params ["_unit","_distance","_target"];
	private ["_eyepa","_eyepb","_coeff","_anim"];
	_eyepa = eyepos _unit; 
	_eyepb = eyepos _target; 
	
	if (_unit distance _target < 7.5 && abs (speed _target) > 5) exitWith {true};
	if (!([getposatl _unit, direction _unit ,180, getPosATL _target] call BIS_fnc_inAngleSector)) exitWith {false};
	if ( lineIntersects [_eyepa, _eyepb, _unit, _target] || {terrainIntersectASL [_eyepa, _eyepb]}) exitWith {false};

	_coeff = 1;
	_anim = (toLower(animationState _target)) select [4,4];
	switch (_anim) do { case ("perc") : {_coeff=_coeff*1;}; case ("pknl") : {_coeff=_coeff*0.66;}; case ("ppne") : {_coeff=_coeff*0.3;};	default {};};
	_coeff = _coeff * (1 + abs ((speed _target) / 10.)) / (1 + abs ((speed _unit) / 10.));
	if ( _unit distance _target > _coeff * _distance) exitWith {false};
	true

};
_units = _a nearEntities["Man", _BaseDistance];
_units = [_units,[_a,_fn_checkLos,_BaseDistance], {_x distanceSqr _input0},"ASCEND",{isPlayer _x && alive _x && {[_input0,_input2,_x] call _input1}}] call bis_fnc_SortBy;
if (count _units ==0) exitWith {objNull};

(_units select 0)




