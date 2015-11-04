
private ["_unit", "_tpl", "_fn_checktpl"];

_unit = _this select 0;
_tpl = toUpper (_this select 1);

if (!local _unit) exitWith {};

_fn_checktpl = {
	private ["_tpl","_unit"];
	_unit = _this select 0;
	_tpl = _this select 1;

	switch (_tpl) do {
	

case "D2":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "CamoU_Black";
_unit addItemToUniform "AGM_CableTie";
_unit addItemToUniform "RBCSW_AdetectorCA2";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
_unit addItemToUniform "20Rnd_9x21_Mag";
_unit addVest "AAFVest01_black";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
for "_i" from 1 to 3 do {_unit addItemToVest "20Rnd_9x21_Mag";};
_unit addBackpack "B_AssaultPack_blk";
for "_i" from 1 to 4 do {_unit addItemToBackpack "zlt_radx";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "AGM_Morphine";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "AGM_Bandage";};
_unit addHeadgear "av_shlem_chehol";
_unit addGoggles "RBCSW_Mask_M50_Dolg";
_unit addItem "rhs_30Rnd_545x39_AK";
_unit addItem "20Rnd_9x21_Mag";
_unit addWeapon "arifle_av_aksu";
_unit addWeapon "av_aps";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
[_unit,"STALKER_insignia_duty"] call bis_fnc_setUnitInsignia;
};

case "D":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "CamoU_Black";
_unit addItemToUniform "AGM_CableTie";
_unit addItemToUniform "RBCSW_AdetectorCA1";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
_unit addVest "AV_Trzan_ch";
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
for "_i" from 1 to 6 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 4 do {_unit addItemToVest "zlt_radx";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
for "_i" from 1 to 4 do {_unit addItemToVest "20Rnd_9x21_Mag";};
_unit addHeadgear "H_Beret_blk";
_unit addGoggles "RBCSW_Mask_M50_Dolg";
_unit addItem "rhs_30Rnd_545x39_AK";
_unit addItem "20Rnd_9x21_Mag";
_unit addWeapon "arifle_av_aksu";
_unit addWeapon "av_aps";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
[_unit,"STALKER_insignia_duty"] call bis_fnc_setUnitInsignia;
};






		default { diag_log [ "DOLG.sqf error: NO TEMPLATE " , _tpl ]; };
	};
};


[_unit, _tpl] call _fn_checktpl;
