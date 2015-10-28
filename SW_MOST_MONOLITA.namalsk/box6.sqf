if !(local _this) exitwith {};
_unit = _this;


clearWeaponCargoGlobal _unit;
clearMagazineCargoGlobal _unit;
clearItemCargoGlobal _unit;
clearBackpackCargoGlobal _unit;

_unit addItemCargoGlobal ["ItemRadio",2];
_unit addBackpackcargoGlobal ["av_RPG_Pack",3];
_unit addMagazineCargoGlobal ["rhs_rpg7_PG7VL_mag",10];
_unit addItemCargoGlobal ["RBCSW_AdetectorCA1",1];


