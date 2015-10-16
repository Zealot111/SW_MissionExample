private ["_res","_objs","_uniUnit"];

if !(hasInterface) exitwith {};

_res = false;
_objs = lineIntersectsObjs [getposasl player, [(getposasl player) select 0, (getposasl player) select 1, ((getposasl player) select 2) + 100],objnull, objnull, false, 2];
_uniUnit = uniform player;
{
if(_x iskindof "House" ) exitwith {_res = true;};
} foreach _objs;
if ( "45KO_u3_grey_camo_uniform" == _uniUnit ) exitwith { _res = true; };
_res;
