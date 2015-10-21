private ["_unit", "_tpl", "_fn_checktpl"];

_unit = _this select 0;
_tpl = toUpper (_this select 1);

if (!local _unit) exitWith {};

_fn_checktpl = {
	private ["_tpl","_unit"];
	_unit = _this select 0;
	_tpl = _this select 1;

	switch (_tpl) do {
	

case  "CN_1":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "CamoU_UrbKamysh";
for "_i" from 1 to 2 do {_unit addItemToUniform "AGM_Bandage";};
_unit addItemToUniform "AGM_Morphine";
for "_i" from 1 to 2 do {_unit addItemToUniform "17Rnd_9x19_Mag";};
for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
_unit addVest "AAFVest01_black";
for "_i" from 1 to 5 do {_unit addItemToVest "30rnd_545_mag";};
_unit addItemToVest "17Rnd_9x19_Mag";
_unit addBackpack "B_FieldPack_oucamo";
_unit addItemToBackpack "AGM_Morphine";
for "_i" from 1 to 4 do {_unit addItemToBackpack "AGM_Bandage";};
_unit addHeadgear "BoonieH_UrbKamysh";
_unit addGoggles "Mask_M40_OD";
_unit addItem "30rnd_545_mag";
_unit addItem "17Rnd_9x19_Mag";
_unit addWeapon "str_ak74m";
_unit addWeapon "str_so";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
};


case  "CN_2":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "CamoU_UrbKamysh";
for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
_unit addVest "AAFVest01_urbKamysh";
for "_i" from 1 to 3 do {_unit addItemToVest "17Rnd_9x19_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_100Rnd_762x54mmR";};
_unit addBackpack "B_FieldPack_oucamo";
for "_i" from 1 to 2 do {_unit addItemToBackpack "AGM_Morphine";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "AGM_Bandage";};
_unit addItemToBackpack "AGM_Bloodbag";
_unit addItemToBackpack "rhs_100Rnd_762x54mmR";
_unit addHeadgear "ZSH_1_kam";
_unit addGoggles "Mask_M40";
_unit addItem "rhs_100Rnd_762x54mmR";
_unit addItem "17Rnd_9x19_Mag";
_unit addWeapon "rhs_weap_pkm";
_unit addWeapon "str_so";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
};

case  "CN_3":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "CamoU_UrbKamysh";
for "_i" from 1 to 2 do {_unit addItemToUniform "AGM_Bandage";};
_unit addItemToUniform "AGM_Morphine";
_unit addItemToUniform "17Rnd_9x19_Mag";
for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
_unit addVest "TacVest_black";
_unit addItemToVest "AGM_Morphine";
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "17Rnd_9x19_Mag";};
for "_i" from 1 to 9 do {_unit addItemToVest "30rnd_545_mag";};
_unit addHeadgear "rhs_beanie";
_unit addGoggles "Mask_M40";
_unit addItem "30rnd_545_mag";
_unit addItem "17Rnd_9x19_Mag";
_unit addWeapon "str_aks74u";
_unit addWeapon "str_so";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
};


		default { diag_log [ "ST.sqf error: NO TEMPLATE " , _tpl ]; };
	};
};


[_unit, _tpl] call _fn_checktpl;
