if !(local _this) exitwith {};
_unit = _this;


clearWeaponCargoGlobal _unit;
clearMagazineCargoGlobal _unit;
clearItemCargoGlobal _unit;
clearBackpackCargoGlobal _unit;

_unit addItemCargoGlobal  ["AAFVest01_berezka",2];
_unit addItemCargoGlobal ["ItemGPS",1];
_unit addItemCargoGlobal ["optic_av_pso",1];
_unit addMagazineCargoGlobal ["rhs_30Rnd_545x39_AK",10];

