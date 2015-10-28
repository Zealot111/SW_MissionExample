if !(local _this) exitwith {};
_unit = _this;


clearWeaponCargoGlobal _unit;
clearMagazineCargoGlobal _unit;
clearItemCargoGlobal _unit;
clearBackpackCargoGlobal _unit;

_unit addItemCargoGlobal ["ItemRadio",3];
_unit addItemCargoGlobal ["RBCSW_AdetectorCA1",5];
_unit addMagazineCargoGlobal ["rhs_30Rnd_545x39_AK",3];
_unit addItemCargoGlobal ["RBCSW_Mask_M50_Main",4];
_unit addBackpackcargoGlobal ["B_Kitbag_rgr",10];