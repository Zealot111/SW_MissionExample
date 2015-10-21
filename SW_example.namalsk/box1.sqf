if !(local _this) exitwith {};
_unit = _this;


clearWeaponCargoGlobal _unit;
clearMagazineCargoGlobal _unit;
clearItemCargoGlobal _unit;
clearBackpackCargoGlobal _unit;

_unit addWeaponCargoGlobal ["str_aks74u",5];
_unit addWeaponCargoGlobal ["str_akm",5];
_unit addWeaponCargoGlobal ["str_ak74m",5];
_unit addWeaponCargoGlobal ["str_as_val",5];
_unit addWeaponCargoGlobal ["str_saiga20k",5];
_unit addWeaponCargoGlobal ["str_sks_old",5];

_unit addMagazineCargoGlobal ["30rnd_545_mag",40];
_unit addMagazineCargoGlobal ["30rnd_762_mag",40];
_unit addMagazineCargoGlobal ["10rnd_mag_vss_sz",40];
_unit addMagazineCargoGlobal ["10rnd_mag_vss_sz",40];
_unit addMagazineCargoGlobal ["8pul_s2_pula",100];
_unit addMagazineCargoGlobal ["10rnd_sks_mag",50];

_unit addItemCargoGlobal ["ItemRadio",8];
_unit addItemCargoGlobal ["NVGoggles",8];
_unit addItemCargoGlobal ["ItemGPS",8];
_unit addItemCargoGlobal ["Mask_M40",8];
_unit addItemCargoGlobal ["AGM_Bandage",32];
_unit addItemCargoGlobal ["AGM_Morphine",20];
_unit addItemCargoGlobal ["AGM_Bloodbag",10];
_unit addItemCargoGlobal ["zlt_rotgut",5];
_unit addItemCargoGlobal ["zlt_beer",5];
_unit addItemCargoGlobal ["zlt_radx",10];
_unit addItemCargoGlobal ["zlt_radaway",10];


_unit addBackpackcargoGlobal ["B_Kitbag_rgr",4];
_unit addBackpackcargoGlobal ["rhs_sidor",4]



