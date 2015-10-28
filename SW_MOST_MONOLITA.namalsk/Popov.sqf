
private ["_unit", "_tpl", "_fn_checktpl"];

_unit = _this select 0;
_tpl = toUpper (_this select 1);

if (!local _unit) exitWith {};

_fn_checktpl = {
	private ["_tpl","_unit"];
	_unit = _this select 0;
	_tpl = _this select 1;

	switch (_tpl) do {
	
case "ST_2":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "AV_CombatUniform_kml_S";
for "_i" from 1 to 2 do {_unit addItemToUniform "zlt_radx";};
_unit addItemToUniform "zlt_rotgut";
for "_i" from 1 to 2 do {_unit addItemToUniform "8Rnd_Mag_pm";};
_unit addVest "Kora";
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
_unit addHeadgear "rhs_beanie_green";
_unit addItem "8Rnd_Mag_pm";
_unit addWeapon "av_makarov";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
};

case "ST_1":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "AV_CombatUniform_kml_S";
for "_i" from 1 to 2 do {_unit addItemToUniform "zlt_radx";};
_unit addItemToUniform "zlt_rotgut";
for "_i" from 1 to 2 do {_unit addItemToUniform "20Rnd_9x21_Mag";};
for "_i" from 1 to 6 do {_unit addItemToUniform "2pul_drob";};
_unit addVest "Kora_p_ak";
for "_i" from 1 to 6 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
_unit addHeadgear "rhs_tsh4";
_unit addItem "2pul_drob";
_unit addItem "20Rnd_9x21_Mag";
_unit addWeapon "str_ij_long";
_unit addWeapon "av_aps";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
};




		default { diag_log [ "ST.sqf error: NO TEMPLATE " , _tpl ]; };
	};
};


[_unit, _tpl] call _fn_checktpl;
