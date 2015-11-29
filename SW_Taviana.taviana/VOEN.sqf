
private ["_unit", "_tpl", "_fn_checktpl"];

_unit = _this select 0;
_tpl = toUpper (_this select 1);

if (!local _unit) exitWith {};

_fn_checktpl = {
	private ["_tpl","_unit"];
	_unit = _this select 0;
	_tpl = _this select 1;

	switch (_tpl) do {
	

case "V7":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "rhs_uniform_flora_patchless_alt";
_unit addItemToUniform "RBCSW_AdetectorCA2";
_unit addItemToUniform "rhs_mag_rgd5";
for "_i" from 1 to 5 do {_unit addItemToUniform "rhs_10Rnd_762x54mmR_7N1";};
_unit addVest "rhs_6b13_Flora_6sh92";
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
_unit addItemToVest "zlt_radx";
_unit addItemToVest "rhs_mag_rgd5";
_unit addItemToVest "rhs_mag_nspn_red";
for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_9x18_12_57N181S";};
_unit addHeadgear "rhs_beanie_green";
_unit addGoggles "rhs_scarf";
_unit addItem "rhs_10Rnd_762x54mmR_7N1";
_unit addItem "rhs_mag_9x18_12_57N181S";
_unit addWeapon "av_svu_h";
_unit addPrimaryWeaponItem "optic_av_pso";
_unit addPrimaryWeaponItem "bipod_02_F_blk";
_unit addWeapon "rhs_weap_makarov_pmm";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
[_unit,"PATCH_AV_mvd"] call bis_fnc_setUnitInsignia;
};

case "V6":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "rhs_uniform_flora_patchless_alt";
_unit addItemToUniform "RBCSW_AdetectorCA2";
_unit addItemToUniform "rhs_mag_rgd5";
_unit addItemToUniform "rhs_45Rnd_545X39_AK";
_unit addVest "rhs_6b13_Flora_6sh92";
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
_unit addItemToVest "zlt_radx";
_unit addItemToVest "rhs_mag_rgd5";
_unit addItemToVest "rhs_mag_nspn_red";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_45Rnd_545X39_AK";};
_unit addHeadgear "av_shlem";
_unit addGoggles "rhs_scarf";
_unit addItem "rhs_45Rnd_545X39_AK";
_unit addItem "rhs_mag_9x18_12_57N181S";
_unit addWeapon "arifle_av_rpk74_a";
_unit addPrimaryWeaponItem "av_kobra";
_unit addPrimaryWeaponItem "av_bipod";
_unit addWeapon "rhs_weap_makarov_pmm";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
[_unit,"PATCH_AV_mvd"] call bis_fnc_setUnitInsignia;
};

case "V5":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "rhs_uniform_flora_patchless_alt";
_unit addItemToUniform "RBCSW_AdetectorCA2";
_unit addItemToUniform "rhs_mag_rgd5";
_unit addItemToUniform "rhs_30Rnd_545x39_AK";
_unit addVest "rhs_6b13_Flora_6sh92";
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
_unit addItemToVest "zlt_radx";
_unit addItemToVest "rhs_mag_rgd5";
_unit addItemToVest "rhs_mag_nspn_red";
for "_i" from 1 to 3 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_9x18_12_57N181S";};
_unit addHeadgear "rhs_Booniehat_flora";
_unit addGoggles "rhs_scarf";
_unit addItem "rhs_30Rnd_545x39_AK";
_unit addItem "rhs_mag_9x18_12_57N181S";
_unit addWeapon "arifle_av_ak74m_a";
_unit addPrimaryWeaponItem "av_kobra";
_unit addWeapon "rhs_weap_makarov_pmm";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
[_unit,"PATCH_AV_mvd"] call bis_fnc_setUnitInsignia;
};

case "V4":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "rhs_uniform_flora_patchless_alt";
_unit addItemToUniform "RBCSW_AdetectorCA2";
_unit addItemToUniform "rhs_mag_rgd5";
for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_9x18_12_57N181S";};
_unit addVest "rhs_6b13_Flora_6sh92";
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
_unit addItemToVest "zlt_radx";
_unit addItemToVest "rhs_mag_rgd5";
_unit addItemToVest "rhs_mag_nspn_red";
_unit addHeadgear "H_Bandanna_khk";
_unit addItem "rhs_100Rnd_762x54mmR";
_unit addItem "rhs_mag_9x18_12_57N181S";
_unit addWeapon "av_pk_base";
_unit addWeapon "rhs_weap_makarov_pmm";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
[_unit,"PATCH_AV_mvd"] call bis_fnc_setUnitInsignia;
};

case "V3":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "rhs_uniform_flora_patchless_alt";
_unit addItemToUniform "RBCSW_AdetectorCA2";
_unit addItemToUniform "rhs_mag_rgd5";
_unit addItemToUniform "rhs_30Rnd_545x39_AK";
_unit addVest "rhs_6b13_Flora_6sh92";
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
for "_i" from 1 to 2 do {_unit addItemToVest "zlt_radx";};
_unit addItemToVest "rhs_mag_rgd5";
_unit addItemToVest "rhs_mag_nspn_red";
for "_i" from 1 to 3 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_9x18_12_57N181S";};
_unit addHeadgear "rhs_beanie_green";
_unit addItem "rhs_30Rnd_545x39_AK";
_unit addItem "rhs_mag_9x18_12_57N181S";
_unit addWeapon "arifle_av_ak74m_a";
_unit addPrimaryWeaponItem "av_kobra";
_unit addWeapon "rhs_weap_makarov_pmm";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
[_unit,"PATCH_AV_mvd"] call bis_fnc_setUnitInsignia;
};

case "V2":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "rhs_uniform_flora_patchless_alt";
_unit addItemToUniform "RBCSW_AdetectorCA2";
_unit addItemToUniform "rhs_mag_rgd5";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_30Rnd_545x39_AK";};
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_VOG25";};
_unit addVest "rhs_6b13_Flora_6sh92";
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
_unit addItemToVest "zlt_radx";
_unit addItemToVest "rhs_mag_rgd5";
_unit addItemToVest "rhs_mag_nspn_red";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_9x18_12_57N181S";};
_unit addItemToVest "rhs_VOG25";
_unit addHeadgear "rhs_beanie_green";
_unit addGoggles "rhs_scarf";
_unit addItem "rhs_30Rnd_545x39_AK";
_unit addItem "rhs_VOG25";
_unit addItem "rhs_mag_9x18_12_57N181S";
_unit addWeapon "arifle_av_ak74m_gp";
_unit addPrimaryWeaponItem "av_kobra";
_unit addWeapon "rhs_weap_makarov_pmm";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
[_unit,"PATCH_AV_mvd"] call bis_fnc_setUnitInsignia;
};

case "V1":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "rhs_uniform_flora_patchless_alt";
_unit addItemToUniform "RBCSW_AdetectorCA1";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_30Rnd_545x39_AK";};
_unit addVest "rhs_6b13_crewofficer";
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
_unit addItemToVest "rhs_30Rnd_545x39_AK";
for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_9x19_17";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
_unit addItemToVest "rhs_mag_rdg2_white";
_unit addHeadgear "av_beret";
_unit addItem "rhs_30Rnd_545x39_AK";
_unit addItem "rhs_mag_9x19_17";
_unit addWeapon "arifle_av_aksu";
_unit addWeapon "rhs_weap_pya";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
[_unit,"PATCH_AV_mvd"] call bis_fnc_setUnitInsignia;
};





		default { diag_log [ "VOEN.sqf error: NO TEMPLATE " , _tpl ]; };
	};
};


[_unit, _tpl] call _fn_checktpl;

[_unit, _tpl] call _fn_checktpl;
