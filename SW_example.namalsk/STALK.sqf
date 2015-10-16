private ["_unit", "_tpl", "_fn_checktpl"];

_unit = _this select 0;
_tpl = toUpper (_this select 1);

if (!local _unit) exitWith {};

_fn_checktpl = {
	private ["_tpl","_unit"];
	_unit = _this select 0;
	_tpl = _this select 1;

	switch (_tpl) do {
	
case "S_6":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "CamoU_green";
for "_i" from 1 to 3 do {_unit addItemToUniform "8Rnd_Mag";};
_unit addItemToUniform "rhs_mag_rgd5";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_green";};
_unit addVest "AAFVest01_mdu93";
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Bandage";};
_unit addHeadgear "TRYK_H_woolhat";
_unit addItem "8Rnd_Mag";
_unit addWeapon "av_tt";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
};

case "S_5":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "CamoU_tan";
_unit addItemToUniform "rhs_mag_rgd5";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
_unit addItemToUniform "Chemlight_green";
_unit addVest "TacVest_black";
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
for "_i" from 1 to 3 do {_unit addItemToVest "8Rnd_Mag_pm";};
_unit addHeadgear "rhs_tsh4";
_unit addItem "8Rnd_Mag_pm";
_unit addWeapon "av_makarov";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
};

case "S_4":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "CamoU_green";
_unit addItemToUniform "rhs_mag_rgd5";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
for "_i" from 1 to 3 do {_unit addItemToUniform "Chemlight_green";};
_unit addVest "V_I_G_resistanceLeader_F";
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 3 do {_unit addItemToVest "8Rnd_Mag_pm";};
_unit addHeadgear "H_Booniehat_khk";
_unit addItem "8Rnd_Mag_pm";
_unit addItem "8Rnd_Mag_pm";
_unit addBackpack "B_Kitbag_rgr";
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
_unit forceAddUniform "CamoU_tan";
_unit addItemToUniform "rhs_mag_rgd5";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
for "_i" from 1 to 3 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 3 do {_unit addItemToUniform "8Rnd_Mag";};
_unit addVest "AAFVest01_Kamysh";
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
_unit addHeadgear "BoonieH_flora";
_unit addItem "8Rnd_Mag";
_unit addWeapon "av_tt";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
};

case "S_1":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "CamoU_atacs";
_unit addItemToUniform "rhs_mag_rgd5";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_green";};
_unit addVest "AAFVest01_h_green";
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_9x18_12_57N181S";};
_unit addItemToVest "Chemlight_green";
_unit addHeadgear "MNP_Boonie_Scorpion";
_unit addItem "rhs_mag_9x18_12_57N181S";
_unit addWeapon "rhs_weap_makarov_pmm";
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
_unit forceAddUniform "CamoU_tan";
for "_i" from 1 to 2 do {_unit addItemToUniform "20Rnd_9x21_Mag";};
_unit addItemToUniform "rhs_mag_rgd5";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 6 do {_unit addItemToUniform "Chemlight_green";};
_unit addVest "AAFVest01_green";
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
_unit addItemToVest "20Rnd_9x21_Mag";
_unit addHeadgear "H_Cap_oli";
_unit addItem "20Rnd_9x21_Mag";
_unit addWeapon "av_aps";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
};




		default { diag_log [ "STALK.sqf error: NO TEMPLATE " , _tpl ]; };
	};
};


[_unit, _tpl] call _fn_checktpl;