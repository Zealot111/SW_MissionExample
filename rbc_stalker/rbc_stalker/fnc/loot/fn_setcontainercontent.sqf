#include "common.hpp"
params ["_box","_content",["_clear",true,[true]]];

if (_clear) then {
	clearWeaponCargoGlobal _box;
	clearMagazineCargoGlobal _box;
	clearItemCargoGlobal _box;
	clearBackpackCargoGlobal _box;
};


{
	_box addWeaponCargoGlobal [_x,1];
} foreach (_content select 0);

{
	_box addMagazineCargoGlobal [_x,1];
} foreach (_content select 1);

{
	_box addItemCargoGlobal [_x,1];
} foreach (_content select 2);

{
	_box addBackpackCargoGlobal [_x,1];
} foreach (_content select 3);


_box
