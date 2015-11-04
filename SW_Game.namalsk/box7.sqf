if !(local _this) exitwith {};
_unit = _this;


clearWeaponCargoGlobal _unit;
clearMagazineCargoGlobal _unit;
clearItemCargoGlobal _unit;
clearBackpackCargoGlobal _unit;

_unit addItemCargoGlobal ["ItemRadio",1];
_unit addWeaponCargoGlobal ["av_svu_h",1];
_unit addItemCargoGlobal ["optic_av_pso",1];
_unit addMagazineCargoGlobal ["rhs_10Rnd_762x54mmR_7N1",5];
_unit addItemCargoGlobal ["RBCSW_AdetectorCA1",1];
_unit addMagazineCargoGlobal ["rhs_30Rnd_545x39_AK",10];

