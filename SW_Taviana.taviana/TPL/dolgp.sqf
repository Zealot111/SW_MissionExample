private ["_unit","_cl"];
if (typeName _this == typeName []) then {
	_unit = _this select 0;
	_cl = _this select 1;
	_unit setvariable ["zlt_class",_cl];
} else {
	_unit = _this;
	_cl = typeOf _this;
};
//_cl = typeof _unit;
if (!local _unit) exitwith {};
switch true do {



case ( _cl == "D1"):{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "rbc_U_dolg";
_unit addItemToUniform "RBCSW_AdetectorCA2";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "SmokeShellRed";
_unit addItemToUniform "Chemlight_red";
for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_av_762x39_mag";};
_unit addItemToUniform "1Rnd_HE_Grenade_shell";
_unit addVest "Vest_h_dolg";
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
for "_i" from 1 to 4 do {_unit addItemToVest "zlt_radx";};
_unit addItemToVest "zlt_beer";
for "_i" from 1 to 2 do {_unit addItemToVest "rbc_bacon";};
for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
_unit addItemToVest "Chemlight_red";
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_av_762x39_mag";};
_unit addItemToVest "1Rnd_HE_Grenade_shell";
_unit addHeadgear "av_shlem_chehol";
_unit addGoggles "RBCSW_Mask_M50_Dolg";
_unit addItem "30Rnd_av_762x39_mag";
_unit addItem "1Rnd_HE_Grenade_shell";
_unit addItem "16Rnd_9x21_Mag";
_unit addWeapon "arifle_av_groza_gp_A";
_unit addPrimaryWeaponItem "optic_ACO_grn";
_unit addWeapon "hgun_Rook40_F";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
[_unit,"STALKER_insignia_duty"] call bis_fnc_setUnitInsignia;
};

case ( _cl == "D2"):{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "rbc_U_dolg";
_unit addItemToUniform "RBCSW_AdetectorCA2";
for "_i" from 1 to 2 do {_unit addItemToUniform "AGM_CableTie";};
for "_i" from 1 to 3 do {_unit addItemToUniform "64Rnd_9x19_mag";};
_unit addVest "Vest_dolg";
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
for "_i" from 1 to 4 do {_unit addItemToVest "zlt_radx";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 5 do {_unit addItemToVest "RH_8Rnd_9x18_Mak";};
_unit addHeadgear "av_shlem_chehol";
_unit addGoggles "RBCSW_Mask_M50_Dolg";
_unit addItem "64Rnd_9x19_mag";
_unit addItem "RH_8Rnd_9x18_Mak";
_unit addWeapon "arifle_av_bizon";
_unit addWeapon "RH_mak";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
[_unit,"STALKER_insignia_duty"] call bis_fnc_setUnitInsignia;
};

case ( _cl == "D3"):{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "rbc_U_dolg";
_unit addItemToUniform "RBCSW_AdetectorCA2";
for "_i" from 1 to 4 do {_unit addItemToUniform "RH_8Rnd_9x18_Mak";};
_unit addVest "Vest_dolg";
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
_unit addItemToVest "rbc_bacon";
for "_i" from 1 to 2 do {_unit addItemToVest "zlt_radx";};
_unit addItemToVest "RH_8Rnd_9x18_Mak";
for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_ak_545x39_mag";};
_unit addBackpack "B_FieldPack_blk";
_unit addHeadgear "min_rf_beanie_black";
_unit addGoggles "RBCSW_Mask_M50_Dolg";
_unit addItem "30Rnd_ak_545x39_mag";
_unit addItem "RH_8Rnd_9x18_Mak";
_unit addWeapon "arifle_av_ak74m";
_unit addWeapon "RH_mak";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
[_unit,"STALKER_insignia_duty"] call bis_fnc_setUnitInsignia;
};

case ( _cl == "DSL"):{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "rbc_U_dolg";
_unit addItemToUniform "RBCSW_AdetectorCA1";
for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_ak_545x39_mag";};
_unit addVest "Tarzan_ch_bron";
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
for "_i" from 1 to 4 do {_unit addItemToVest "zlt_radx";};
for "_i" from 1 to 5 do {_unit addItemToVest "RH_8Rnd_9x18_Mak";};
_unit addItemToVest "HandGrenade";
_unit addHeadgear "av_shlem_chehol";
_unit addGoggles "RBCSW_Mask_M50_DolgExtrared";
_unit addItem "30Rnd_ak_545x39_mag";
_unit addItem "RH_8Rnd_9x18_Mak";
_unit addWeapon "arifle_av_aksu";
_unit addWeapon "RH_mak";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
[_unit,"STALKER_insignia_duty"] call bis_fnc_setUnitInsignia;
};

/*                                INSERT TO HERE !!!                         */
default { diag_log [ "error: NO TEMPLATE " , __FILE__, _cl ]; };
};