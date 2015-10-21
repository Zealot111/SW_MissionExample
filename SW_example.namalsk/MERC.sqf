private ["_unit", "_tpl", "_fn_checktpl"];

_unit = _this select 0;
_tpl = toUpper (_this select 1);

if (!local _unit) exitWith {};

_fn_checktpl = {
	private ["_tpl","_unit"];
	_unit = _this select 0;
	_tpl = _this select 1;

	switch (_tpl) do {
	


case "M_1":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "NatoU_Black";
_unit addItemToUniform "AGM_CableTie";
_unit addItemToUniform "HandGrenade";
for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
_unit addVest "TacVest_black";
for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
_unit addItemToVest "SmokeShellYellow";
for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_yellow";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
_unit addBackpack "PMC_AssaultPack_Blk";
for "_i" from 1 to 4 do {_unit addItemToBackpack "AGM_Morphine";};
for "_i" from 1 to 8 do {_unit addItemToBackpack "AGM_Bandage";};
_unit addHeadgear "TRYK_H_PASGT_BLK";
_unit addGoggles "Mask_M40";
_unit addItem "rhs_mag_30Rnd_556x45_Mk318_Stanag";
_unit addItem "16Rnd_9x21_Mag";
_unit addWeapon "rhs_weap_m4_grip";
_unit addWeapon "hgun_Rook40_F";
_unit addHandgunItem "muzzle_snds_L";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "TRYK_balaclava_BLACK_NV";
};

case "M_2":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "NatoU_Black";
for "_i" from 1 to 2 do {_unit addItemToUniform "AGM_CableTie";};
for "_i" from 1 to 3 do {_unit addItemToUniform "8Rnd_Mag";};
for "_i" from 1 to 4 do {_unit addItemToUniform "Chemlight_yellow";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellYellow";};
_unit addVest "TRYK_V_tacv1M_BK";
_unit addItemToVest "HandGrenade";
_unit addBackpack "B_AssaultPack_blk";
for "_i" from 1 to 2 do {_unit addItemToBackpack "AGM_Morphine";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
_unit addItem "rhs_mag_30Rnd_556x45_Mk318_Stanag";
_unit addWeapon "rhs_weap_m4a1_carryhandle";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "TRYK_balaclava_NV";
};

case "M_3":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "NatoU_Black";
for "_i" from 1 to 2 do {_unit addItemToUniform "AGM_CableTie";};
_unit addItemToUniform "rhs_mag_30Rnd_556x45_Mk318_Stanag";
for "_i" from 1 to 4 do {_unit addItemToUniform "Chemlight_yellow";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellYellow";};
_unit addItemToUniform "HandGrenade";
_unit addVest "TRYK_V_tacv1M_BK";
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
_unit addGoggles "Mask_M40";
_unit addItem "rhs_mag_30Rnd_556x45_Mk318_Stanag";
_unit addWeapon "rhs_weap_m4a1_carryhandle";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "TRYK_balaclava_BLACK_NV";
};

case "M_4":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "NatoU_Black";
_unit addItemToUniform "AGM_CableTie";
_unit addItemToUniform "Chemlight_yellow";
_unit addVest "TacVest_black";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
_unit addItemToVest "HandGrenade";
_unit addItemToVest "Chemlight_yellow";
_unit addBackpack "B_AssaultPack_blk";
for "_i" from 1 to 4 do {_unit addItemToBackpack "AGM_Morphine";};
for "_i" from 1 to 8 do {_unit addItemToBackpack "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellYellow";};
_unit addGoggles "G_Balaclava_blk";
_unit addItem "rhs_mag_30Rnd_556x45_Mk318_Stanag";
_unit addWeapon "rhs_weap_m4a1_carryhandle";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
};

case "M_5":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "NatoU_Black";
for "_i" from 1 to 2 do {_unit addItemToUniform "AGM_CableTie";};
for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_yellow";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellYellow";};
_unit addItemToUniform "8Rnd_Mag_pm";
_unit addVest "TRYK_V_tacv1M_BK";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
_unit addBackpack "B_AssaultPack_blk";
for "_i" from 1 to 4 do {_unit addItemToBackpack "AGM_Morphine";};
for "_i" from 1 to 8 do {_unit addItemToBackpack "AGM_Bandage";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "AGM_Bloodbag";};
_unit addHeadgear "H_Watchcap_blk";
_unit addItem "rhs_mag_30Rnd_556x45_Mk318_Stanag";
_unit addWeapon "rhs_weap_m4a1_carryhandle";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
};

case "M_6":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "NatoU_Black";
for "_i" from 1 to 4 do {_unit addItemToUniform "AGM_CableTie";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_yellow";};
_unit addItemToUniform "HandGrenade";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellYellow";};
_unit addVest "V_PlateCarrier1_PMC_blk";
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Morphine";};
for "_i" from 1 to 8 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 3 do {_unit addItemToVest "UK3CB_BAF_17Rnd_9mm";};
_unit addBackpack "PMC_AssaultPack_Blk";
_unit addHeadgear "TRYK_H_PASGT_BLK";
_unit addGoggles "G_Balaclava_blk";
_unit addItem "UK3CB_BAF_17Rnd_9mm";
_unit addWeapon "UK3CB_BAF_L131A1";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
};


		default { diag_log [ "MERC.sqf error: NO TEMPLATE " , _tpl ]; };
	};
};


[_unit, _tpl] call _fn_checktpl;

