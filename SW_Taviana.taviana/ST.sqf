
private ["_unit", "_tpl", "_fn_checktpl"];

_unit = _this select 0;
_tpl = toUpper (_this select 1);

if (!local _unit) exitWith {};

_fn_checktpl = {
	private ["_tpl","_unit"];
	_unit = _this select 0;
	_tpl = _this select 1;

	switch (_tpl) do {
	
case "ST2":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "CamoU_atacs";
_unit addItemToUniform "RBCSW_AdetectorCA2";
for "_i" from 1 to 4 do {_unit addItemToUniform "8Rnd_Mag_pm";};
_unit addItemToUniform "SmokeShell";
_unit addVest "6B3";
for "_i" from 1 to 6 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
_unit addItemToVest "zlt_radx";
_unit addHeadgear "rhs_beanie_green";
_unit addItem "8Rnd_Mag_pm";
_unit addWeapon "av_makarov";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
[_unit,"STALKER_insignia_Loners"] call bis_fnc_setUnitInsignia;
};

case "ST1":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "CamoU_atacs";
_unit addItemToUniform "RBCSW_AdetectorCA1";
for "_i" from 1 to 4 do {_unit addItemToUniform "2pul_pula";};
for "_i" from 1 to 3 do {_unit addItemToUniform "8Rnd_Mag_pm";};
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "rhs_mag_rgd5";
_unit addVest "6B3";
_unit addItemToVest "2pul_pula";
_unit addItemToVest "8Rnd_Mag_pm";
_unit addItemToVest "rhs_mag_rgd5";
_unit addBackpack "rhsusf_falconii";
for "_i" from 1 to 4 do {_unit addItemToBackpack "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "AGM_Morphine";};
_unit addItemToBackpack "zlt_radx";
_unit addHeadgear "rhs_beanie_green";
_unit addItem "2pul_pula";
_unit addItem "8Rnd_Mag_pm";
_unit addWeapon "str_ij_long";
_unit addWeapon "av_makarov";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
[_unit,"STALKER_insignia_Loners"] call bis_fnc_setUnitInsignia;
};




		default { diag_log [ "ST.sqf error: NO TEMPLATE " , _tpl ]; };
	};
};


[_unit, _tpl] call _fn_checktpl;
