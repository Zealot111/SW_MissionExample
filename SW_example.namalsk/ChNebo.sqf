private ["_unit", "_tpl", "_fn_checktpl"];

_unit = _this select 0;
_tpl = toUpper (_this select 1);

if (!local _unit) exitWith {};

_fn_checktpl = {
	private ["_tpl","_unit"];
	_unit = _this select 0;
	_tpl = _this select 1;

	switch (_tpl) do {
	
case "C_1":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "TRYK_U_pad_hood_odBK";
for "_i" from 1 to 2 do {_unit addItemToUniform "AGM_CableTie";};
for "_i" from 1 to 3 do {_unit addItemToUniform "8Rnd_Mag";};
_unit addItemToUniform "rhs_mag_rgd5";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_green";};
_unit addVest "TRYK_V_Sheriff_BA_T3";
_unit addBackpack "rhs_sidor";
for "_i" from 1 to 8 do {_unit addItemToBackpack "AGM_Bandage";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "AGM_Morphine";};
_unit addHeadgear "rhs_beanie";
_unit addGoggles "Mask_M40_OD";
_unit addItem "8Rnd_Mag";
_unit addWeapon "av_tt";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
};

case "C_2":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "TRYK_U_pad_hood_odBK";
for "_i" from 1 to 2 do {_unit addItemToUniform "AGM_CableTie";};
_unit addItemToUniform "rhs_mag_rgd5";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 3 do {_unit addItemToUniform "8Rnd_Mag_pm";};
_unit addVest "TRYK_V_Sheriff_BA_TB";
_unit addBackpack "rhs_sidor";
for "_i" from 1 to 8 do {_unit addItemToBackpack "AGM_Bandage";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "AGM_Morphine";};
_unit addHeadgear "rhs_beanie";
_unit addGoggles "Mask_M40_OD";
_unit addItem "8Rnd_Mag_pm";
_unit addWeapon "av_makarov";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
};

case "C_3":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "TRYK_U_pad_hood_odBK";
for "_i" from 1 to 2 do {_unit addItemToUniform "AGM_CableTie";};
for "_i" from 1 to 3 do {_unit addItemToUniform "8Rnd_Mag_pm";};
_unit addItemToUniform "rhs_mag_rgd5";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
_unit addVest "TRYK_V_Sheriff_BA_T2";
_unit addBackpack "rhs_sidor";
for "_i" from 1 to 8 do {_unit addItemToBackpack "AGM_Bandage";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "AGM_Morphine";};
_unit addHeadgear "rhs_beanie";
_unit addGoggles "Mask_M40_OD";
_unit addItem "8Rnd_Mag_pm";
_unit addWeapon "av_makarov";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
};

case "C_4":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "TRYK_U_pad_hood_odBK";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
_unit addVest "TRYK_V_Sheriff_BA_T3";
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_CableTie";};
for "_i" from 1 to 2 do {_unit addItemToVest "8Rnd_Mag";};
_unit addBackpack "rhs_sidor";
for "_i" from 1 to 8 do {_unit addItemToBackpack "AGM_Bandage";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "AGM_Morphine";};
_unit addHeadgear "rhs_beanie";
_unit addGoggles "Mask_M40_OD";
_unit addItem "8Rnd_Mag";
_unit addWeapon "av_tt";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
};

case "C_5":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "TRYK_U_pad_hood_odBK";
_unit addItemToUniform "AGM_CableTie";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_9x18_12_57N181S";};
_unit addItemToUniform "rhs_mag_rgd5";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
_unit addVest "TRYK_V_Sheriff_BA_T2";
for "_i" from 1 to 8 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Morphine";};
_unit addItemToVest "rhs_mag_9x18_12_57N181S";
_unit addBackpack "rhs_sidor";
_unit addHeadgear "rhs_beanie";
_unit addItem "rhs_mag_9x18_12_57N181S";
_unit addWeapon "rhs_weap_makarov_pmm";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
};





		default { diag_log [ "ChNebo.sqf error: NO TEMPLATE " , _tpl ]; };
	};
};


[_unit, _tpl] call _fn_checktpl;