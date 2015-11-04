
private ["_unit", "_tpl", "_fn_checktpl"];

_unit = _this select 0;
_tpl = toUpper (_this select 1);

if (!local _unit) exitWith {};

_fn_checktpl = {
	private ["_tpl","_unit"];
	_unit = _this select 0;
	_tpl = _this select 1;

	switch (_tpl) do {
	

case "C2":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "rhs_chdkz_uniform_2";
_unit addItemToUniform "RBCSW_AdetectorCA1";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_30Rnd_545x39_AK";};
for "_i" from 1 to 2 do {_unit addItemToUniform "8Rnd_Mag_pm";};
_unit addItemToUniform "SmokeShell";
_unit addVest "LOP_V_Chestrig_VSR";
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
for "_i" from 1 to 4 do {_unit addItemToVest "zlt_radx";};
_unit addItemToVest "8Rnd_Mag_pm";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
_unit addBackpack "B_FieldPack_oli";
_unit addHeadgear "rhs_beanie";
_unit addGoggles "RBCSW_Mask_M40_OD";
_unit addItem "rhs_30Rnd_545x39_AK";
_unit addItem "8Rnd_Mag_pm";
_unit addWeapon "arifle_av_aksu";
_unit addWeapon "av_makarov";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
[_unit,"STALKER_insignia_clearsky"] call bis_fnc_setUnitInsignia;
};

case "C1":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "rhs_chdkz_uniform_2";
_unit addItemToUniform "RBCSW_AdetectorCA1";
_unit addItemToUniform "rhs_30Rnd_545x39_AK";
_unit addItemToUniform "8Rnd_Mag_pm";
_unit addItemToUniform "SmokeShell";
_unit addVest "LOP_V_Chestrig_VSR";
for "_i" from 1 to 2 do {_unit addItemToVest "8Rnd_Mag_pm";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
_unit addItemToVest "rhs_30Rnd_545x39_AK";
_unit addBackpack "B_FieldPack_oli";
for "_i" from 1 to 4 do {_unit addItemToBackpack "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "AGM_Morphine";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "zlt_radx";};
_unit addHeadgear "rhs_beanie";
_unit addGoggles "RBCSW_Mask_M40_OD";
_unit addItem "rhs_30Rnd_545x39_AK";
_unit addItem "8Rnd_Mag_pm";
_unit addWeapon "arifle_av_aksu";
_unit addWeapon "av_makarov";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
[_unit,"STALKER_insignia_clearsky"] call bis_fnc_setUnitInsignia;
};


		default { diag_log [ "ChN.sqf error: NO TEMPLATE " , _tpl ]; };
	};
};


[_unit, _tpl] call _fn_checktpl;
