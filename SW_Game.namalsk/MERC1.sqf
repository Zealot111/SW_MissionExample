private ["_unit", "_tpl", "_fn_checktpl"];

_unit = _this select 0;
_tpl = toUpper (_this select 1);

if (!local _unit) exitWith {};

_fn_checktpl = {
	private ["_tpl","_unit"];
	_unit = _this select 0;
	_tpl = _this select 1;

	switch (_tpl) do {
	

case  "M_3":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "AV_CombatUniform_ter20";
for "_i" from 1 to 6 do {_unit addItemToUniform "av_Saiga12_M";};
_unit addVest "TacVest_black";
for "_i" from 1 to 6 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
for "_i" from 1 to 2 do {_unit addItemToVest "zlt_radx";};
for "_i" from 1 to 2 do {_unit addItemToVest "zlt_radaway";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
_unit addItemToVest "SmokeShell";
for "_i" from 1 to 3 do {_unit addItemToVest "av_Saiga12_M";};
_unit addHeadgear "av_shlem";
_unit addGoggles "RBCSW_Mask_M40_BL";
_unit addItem "av_Saiga12_M";
_unit addItem "30Rnd_9x21_Mag";
_unit addWeapon "av_Saiga12K";
_unit addWeapon "av_pp2000";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
[_unit,"STALKER_insignia_mercenaries"] call bis_fnc_setUnitInsignia;
};

case  "M_2":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "AV_CombatUniform_ter20";
for "_i" from 1 to 4 do {_unit addItemToUniform "20Rnd_av_9x39mm_SP5";};
_unit addVest "TacVest_black";
for "_i" from 1 to 6 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
for "_i" from 1 to 2 do {_unit addItemToVest "zlt_radx";};
for "_i" from 1 to 2 do {_unit addItemToVest "zlt_radaway";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
_unit addItemToVest "SmokeShell";
_unit addItemToVest "20Rnd_av_9x39mm_SP5";
_unit addHeadgear "av_shlem";
_unit addGoggles "RBCSW_Mask_M40_BL";
_unit addItem "20Rnd_av_9x39mm_SP5";
_unit addItem "30Rnd_9x21_Mag";
_unit addWeapon "arifle_av_asval_h";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_av_pso";
_unit addWeapon "av_pp2000";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
[_unit,"STALKER_insignia_mercenaries"] call bis_fnc_setUnitInsignia;
};

case  "M_1":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "AV_CombatUniform_ter20";
_unit addItemToUniform "zlt_radaway";
_unit addItemToUniform "RBCSW_AdetectorCA1";
for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_30Rnd_762x39mm";};
_unit addVest "TacVest_black";
for "_i" from 1 to 8 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
for "_i" from 1 to 3 do {_unit addItemToVest "zlt_radaway";};
_unit addItemToVest "zlt_radx";
for "_i" from 1 to 3 do {_unit addItemToVest "rhs_VOG25";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
_unit addItemToVest "SmokeShell";
_unit addItemToVest "rhs_30Rnd_762x39mm";
_unit addHeadgear "av_shlem";
_unit addGoggles "RBCSW_Mask_M40_BL";
_unit addItem "rhs_30Rnd_762x39mm";
_unit addItem "rhs_VOG25";
_unit addItem "30Rnd_9x21_Mag";
_unit addWeapon "arifle_av_groza_gp_A";
_unit addPrimaryWeaponItem "optic_ACO_grn";
_unit addWeapon "av_pp2000";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
[_unit,"STALKER_insignia_mercenaries"] call bis_fnc_setUnitInsignia;
};

case "TORG":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "LOP_U_ChDKZ_Fatigue_Bardak";
for "_i" from 1 to 8 do {_unit addItemToUniform "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToUniform "AGM_Morphine";};
for "_i" from 1 to 2 do {_unit addItemToUniform "zlt_radaway";};
for "_i" from 1 to 4 do {_unit addItemToUniform "zlt_radx";};
for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_9x21_Mag";};
_unit addItem "30Rnd_9x21_Mag";
_unit addWeapon "av_kedrpp";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
};


		default { diag_log [ "MERC1.sqf error: NO TEMPLATE " , _tpl ]; };
	};
};


[_unit, _tpl] call _fn_checktpl;

