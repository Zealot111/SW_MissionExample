if !(local _this) exitwith {};
_unit = _this;


clearWeaponCargoGlobal _unit;
clearMagazineCargoGlobal _unit;
clearItemCargoGlobal _unit;
clearBackpackCargoGlobal _unit;

_unit addItemCargoGlobal ["zlt_radaway",10];
_unit addMagazineCargoGlobal ["rhs_30Rnd_545x39_AK",4];

