private ["_unit", "_tpl", "_fn_checktpl"];

_unit = _this select 0;
_tpl = toUpper (_this select 1);

if (!local _unit) exitWith {};

_fn_checktpl = {
	private ["_tpl","_unit"];
	_unit = _this select 0;
	_tpl = _this select 1;

	switch (_tpl) do {
	
case "S_1":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "TRYK_U_pad_hood_odBK";
_unit addItemToUniform "8rnd_tt_mag";
_unit addVest "Kora";
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Bandage";};
_unit addHeadgear "H_Bandanna_sgg";
_unit addItem "8rnd_tt_mag";
_unit addWeapon "str_tt";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
};

case "S_2":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "TRYK_U_pad_hood_odBK";
_unit addItemToUniform "8rnd_tt_mag";
_unit addVest "Kora";
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Bandage";};
_unit addHeadgear "rhs_beanie_green";
_unit addItem "8rnd_tt_mag";
_unit addWeapon "str_tt";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
};

case "S_3":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "TRYK_U_pad_hood_odBK";
_unit addItemToUniform "8rnd_tt_mag";
_unit addVest "Kora";
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Bandage";};
_unit addHeadgear "rhs_beanie";
_unit addItem "8rnd_tt_mag";
_unit addWeapon "str_tt";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
};


		default { diag_log [ "ST.sqf error: NO TEMPLATE " , _tpl ]; };
	};
};


[_unit, _tpl] call _fn_checktpl;