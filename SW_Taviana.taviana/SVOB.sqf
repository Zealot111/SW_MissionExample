
private ["_unit", "_tpl", "_fn_checktpl"];

_unit = _this select 0;
_tpl = toUpper (_this select 1);

if (!local _unit) exitWith {};

_fn_checktpl = {
	private ["_tpl","_unit"];
	_unit = _this select 0;
	_tpl = _this select 1;

	switch (_tpl) do {
	
case "S2":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "AV_CombatUniform_ter15";
_unit addItemToUniform "RBCSW_AdetectorCA2";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
_unit addItemToUniform "SmokeShell";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_30Rnd_545x39_AK";};
_unit addVest "lbt_pouchless_od";
for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_mag_7x45acp_MHP";};
_unit addBackpack "rhsusf_falconii";
for "_i" from 1 to 2 do {_unit addItemToBackpack "AGM_Morphine";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "AGM_Bandage";};
_unit addItemToBackpack "zlt_radx";
_unit addItemToBackpack "rhsusf_mag_7x45acp_MHP";
_unit addHeadgear "av_shlem";
_unit addGoggles "RBCSW_Mask_M40_OD";
_unit addItem "rhs_30Rnd_545x39_AK";
_unit addItem "rhsusf_mag_7x45acp_MHP";
_unit addWeapon "arifle_av_aksu_f";
_unit addWeapon "rhsusf_weap_m1911a1";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
[_unit,"STALKER_insignia_freedom"] call bis_fnc_setUnitInsignia;
};

case "S1":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "AV_CombatUniform_ter15";
_unit addItemToUniform "RBCSW_AdetectorCA1";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_7x45acp_MHP";};
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
_unit addItemToUniform "SmokeShell";
_unit addVest "lbt_pouchless_od";
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Bandage";};
_unit addItemToVest "zlt_radx";
for "_i" from 1 to 2 do {_unit addItemToVest "zlt_beer";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
_unit addItemToVest "rhsusf_mag_7x45acp_MHP";
_unit addBackpack "rhsusf_falconii";
_unit addHeadgear "BoonieH_mdu10";
_unit addGoggles "RBCSW_Mask_M40_OD";
_unit addItem "rhs_mag_30Rnd_556x45_Mk318_Stanag";
_unit addItem "rhsusf_mag_7x45acp_MHP";
_unit addWeapon "rhs_weap_m4";
_unit addWeapon "rhsusf_weap_m1911a1";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
[_unit,"STALKER_insignia_freedom"] call bis_fnc_setUnitInsignia;
};


		default { diag_log [ "SVOB.sqf error: NO TEMPLATE " , _tpl ]; };
	};
};


[_unit, _tpl] call _fn_checktpl;
