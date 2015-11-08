#include "common.hpp"

params ["_posz",["_maxval",45,[0]],["_delta",0.05,[0]]];
private ["_test","_val","_pos"];
if ((_posz select 2) < 0) then {
	_pos = [_posz select 0, _posz select 1, 1];
} else {
	_pos = [_posz select 0, _posz select 1, (_posz select 2) + 1];
};
_test = true; _val = 1;
while {_test} do {
	_int = lineintersects [atltoasl(_pos), atltoasl([_pos select 0, _pos select 1, (_pos select 2) - (_val * _delta)])] || terrainintersect [_pos, [_pos select 0, _pos select 1, (_pos select 2) - (_val * _delta)]];
	if (_int ) then {_pos = [_pos select 0, _pos select 1, ((_pos select 2) - ((_val -1 ) * _delta)) max 0]; _test = false;	};
	_val = _val + 1;
	if (_val > _maxval) then {_test=false; _pos = [_pos select 0, _pos select 1, (_pos select 2) - 1]; _test = false;};
};
_pos