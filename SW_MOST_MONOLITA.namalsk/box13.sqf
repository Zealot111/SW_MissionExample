if !(local _this) exitwith {};
_unit = _this;


clearWeaponCargoGlobal _unit;
clearMagazineCargoGlobal _unit;
clearItemCargoGlobal _unit;
clearBackpackCargoGlobal _unit;

_unit addItemCargoGlobal ["AGM_Bandage",20];
_unit addItemCargoGlobal ["AGM_Morphine",5];
_unit addItemCargoGlobal ["AGM_Bloodbag",15];

