//#define DEBUG_MODE_FULL 
#include "common.hpp"
params [["_a",[],[[]]],["_w",[],[[]]]]; 
private ["_t","_r","_s","_i","_ret"];
TRACE_2("",_a,_w);
if (count _a == 1) exitWith {_a select 0};
if (count _w in [0,1] && count _a != 0) exitWith {_a call bis_fnc_selectrandom};
if (count _w != count _a && count _a != 0) exitWith {WARNING("Количество весов не сопадает количеству элементов, используем простую случайную выборку!");_a call bis_fnc_selectrandom};
if (count _a == 0) exitWith {WARNING("Ошибка, 0 элементов во входном массиве!");nil};

_t=0; {_t =_t+_x;} foreach _w;	_r= (random _t); _s=0; _i=0; 
while {_i < count _a} do { _s = _s + (_w select _i); if (_r < _s) exitwith {_ret = _a select _i}; _i=_i+1; };
TRACE_1("",_ret);
_ret
