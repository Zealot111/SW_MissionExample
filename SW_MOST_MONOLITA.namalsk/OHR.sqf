
private ["_unit", "_tpl", "_fn_checktpl"];

_unit = _this select 0;
_tpl = toUpper (_this select 1);

if (!local _unit) exitWith {};

_fn_checktpl = {
	private ["_tpl","_unit"];
	_unit = _this select 0;
	_tpl = _this select 1;

	switch (_tpl) do {
	
case "OHR":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "AV_CombatUniform_ST";
for "_i" from 1 to 2 do {_unit addItemToUniform "zlt_radx";};
_unit addItemToUniform "zlt_rotgut";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_30Rnd_762x39mm";};
_unit addItemToUniform "20Rnd_9x21_Mag";
_unit addVest "V94_zel";
for "_i" from 1 to 6 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
_unit addItemToVest "20Rnd_9x21_Mag";
for "_i" from 1 to 3 do {_unit addItemToVest "HandGrenade";};
_unit addBackpack "B_Kitbag_rgr";
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShell";};
_unit addHeadgear "av_shlem_zh_zv";
_unit addItem "rhs_30Rnd_762x39mm";
_unit addItem "20Rnd_9x21_Mag";
_unit addWeapon "arifle_av_bul_h";
_unit addPrimaryWeaponItem "optic_av_aimp";
_unit addWeapon "av_aps";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";
};


case "POP":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "LOP_U_CHR_Doctor_01";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";
_unit addBackpack "TF_MR3000_RHS";

};

case "B":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "LOP_U_CHR_Profiteer_01";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";
_unit addBackpack "TF_MR3000_RHS";
};



		default { diag_log [ "OHR.sqf error: NO TEMPLATE " , _tpl ]; };
	};
};


[_unit, _tpl] call _fn_checktpl;
