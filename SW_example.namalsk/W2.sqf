if !(local _this) exitwith {};
_unit = _this;


clearWeaponCargoGlobal _unit;
clearMagazineCargoGlobal _unit;
clearItemCargoGlobal _unit;
clearBackpackCargoGlobal _unit;



_unit addItemCargoGlobal ["Mask_M40",2];
_unit addItemCargoGlobal ["tf_anprc152",2];
_unit addItemCargoGlobal ["AGM_Bandage",32];
_unit addItemCargoGlobal ["AGM_Morphine",12];

_unit addBackpackCargoGlobal ["B_Kitbag_rgr",6];

