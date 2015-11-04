
private ["_unit", "_tpl", "_fn_checktpl"];

_unit = _this select 0;
_tpl = toUpper (_this select 1);

if (!local _unit) exitWith {};

_fn_checktpl = {
	private ["_tpl","_unit"];
	_unit = _this select 0;
	_tpl = _this select 1;

	switch (_tpl) do {
	

case  "MON_7":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "CamoU_Surpat";
for "_i" from 1 to 4 do {_unit addItemToUniform "zlt_radx";};
_unit addItemToUniform "AGM_CableTie";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
_unit addItemToUniform "HandGrenade";
_unit addItemToUniform "rhs_30Rnd_545x39_AK";
_unit addVest "AAFVest01_EMR";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
for "_i" from 1 to 2 do {_unit addItemToVest "8Rnd_Mag_pm";};
_unit addBackpack "B_AssaultPack_rgr";
for "_i" from 1 to 2 do {_unit addItemToBackpack "AGM_Morphine";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "AGM_Bandage";};
_unit addHeadgear "av_shlem_Vityaz";
_unit addGoggles "RBCSW_Mask_M50_Monolyth";
_unit addItem "rhs_30Rnd_545x39_AK";
_unit addItem "8Rnd_Mag_pm";
_unit addWeapon "arifle_av_ak74m_h";
_unit addPrimaryWeaponItem "optic_av_pso";
_unit addWeapon "av_aps";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
[_unit,"STALKER_insignia_monolith"] call bis_fnc_setUnitInsignia;
};

case  "MON_6":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "CamoU_Surpat";
for "_i" from 1 to 4 do {_unit addItemToUniform "zlt_radx";};
_unit addItemToUniform "AGM_CableTie";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
_unit addItemToUniform "HandGrenade";
for "_i" from 1 to 2 do {_unit addItemToUniform "8Rnd_Mag_pm";};
_unit addVest "AAFVest01_EMR";
for "_i" from 1 to 6 do {_unit addItemToVest "rhs_45Rnd_545X39_AK";};
_unit addBackpack "B_AssaultPack_rgr";
for "_i" from 1 to 2 do {_unit addItemToBackpack "AGM_Morphine";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "AGM_Bandage";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_45Rnd_545X39_AK";};
_unit addHeadgear "av_shlem_Vityaz";
_unit addGoggles "RBCSW_Mask_M50_Monolyth";
_unit addItem "rhs_45Rnd_545X39_AK";
_unit addItem "8Rnd_Mag_pm";
_unit addWeapon "arifle_av_rpk74_a";
_unit addPrimaryWeaponItem "av_kobra";
_unit addPrimaryWeaponItem "av_bipod";
_unit addWeapon "av_aps";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
[_unit,"STALKER_insignia_monolith"] call bis_fnc_setUnitInsignia;
};

case  "MON_5":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "CamoU_Surpat";
for "_i" from 1 to 4 do {_unit addItemToUniform "zlt_radx";};
_unit addItemToUniform "AGM_CableTie";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
_unit addItemToUniform "HandGrenade";
_unit addVest "AAFVest01_EMR";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
for "_i" from 1 to 2 do {_unit addItemToVest "8Rnd_Mag_pm";};
_unit addBackpack "B_AssaultPack_rgr";
for "_i" from 1 to 2 do {_unit addItemToBackpack "AGM_Morphine";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "AGM_Bandage";};
_unit addHeadgear "av_shlem_Vityaz";
_unit addGoggles "RBCSW_Mask_M50_Monolyth";
_unit addItem "rhs_30Rnd_545x39_AK";
_unit addItem "8Rnd_Mag_pm";
_unit addWeapon "arifle_av_aksu";
_unit addWeapon "av_aps";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
[_unit,"STALKER_insignia_monolith"] call bis_fnc_setUnitInsignia;
};

case  "MON_4":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "CamoU_Surpat";
for "_i" from 1 to 4 do {_unit addItemToUniform "zlt_radx";};
_unit addItemToUniform "AGM_CableTie";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
_unit addItemToUniform "HandGrenade";
_unit addItemToUniform "rhs_30Rnd_545x39_AK";
_unit addVest "AAFVest01_EMR";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
_unit addItemToVest "8Rnd_Mag_pm";
_unit addBackpack "B_AssaultPack_rgr";
for "_i" from 1 to 2 do {_unit addItemToBackpack "AGM_Morphine";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "AGM_Bandage";};
_unit addHeadgear "av_shlem_Vityaz";
_unit addGoggles "RBCSW_Mask_M50_Monolyth";
_unit addItem "rhs_30Rnd_545x39_AK";
_unit addItem "8Rnd_Mag_pm";
_unit addWeapon "arifle_av_aek";
_unit addWeapon "av_aps";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
[_unit,"STALKER_insignia_monolith"] call bis_fnc_setUnitInsignia;
};

case  "MON_3":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "CamoU_Surpat";
for "_i" from 1 to 4 do {_unit addItemToUniform "zlt_radx";};
_unit addItemToUniform "AGM_CableTie";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
_unit addItemToUniform "HandGrenade";
_unit addItemToUniform "30Rnd_av_762x39_mag";
_unit addVest "AAFVest01_EMR";
for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_av_762x39_mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "8Rnd_Mag_pm";};
_unit addBackpack "B_AssaultPack_rgr";
for "_i" from 1 to 2 do {_unit addItemToBackpack "AGM_Morphine";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "AGM_Bandage";};
_unit addHeadgear "av_shlem_Vityaz";
_unit addGoggles "RBCSW_Mask_M50_Monolyth";
_unit addItem "30Rnd_av_762x39_mag";
_unit addItem "8Rnd_Mag_pm";
_unit addWeapon "arifle_av_groza";
_unit addPrimaryWeaponItem "muzzle_av_snds";
_unit addWeapon "av_aps";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
[_unit,"STALKER_insignia_monolith"] call bis_fnc_setUnitInsignia;
};

case  "MON_2":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "CamoU_Surpat";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
_unit addItemToUniform "rhs_30Rnd_545x39_AK";
_unit addVest "AAFVest01_EMR";
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
for "_i" from 1 to 6 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 4 do {_unit addItemToVest "zlt_radx";};
_unit addItemToVest "AGM_CableTie";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
for "_i" from 1 to 3 do {_unit addItemToVest "rhs_VOG25";};
_unit addHeadgear "av_shlem_Vityaz";
_unit addGoggles "RBCSW_Mask_M50_Monolyth";
_unit addItem "rhs_30Rnd_545x39_AK";
_unit addItem "rhs_VOG25";
_unit addItem "rhsusf_mag_17Rnd_9x19_JHP";
_unit addWeapon "arifle_av_aekg";
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
[_unit,"STALKER_insignia_monolith"] call bis_fnc_setUnitInsignia;
};

case  "MON_1":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "CamoU_Surpat";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
_unit addItemToUniform "rhsusf_mag_17Rnd_9x19_JHP";
_unit addVest "AV_Trzan_sur";
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
for "_i" from 1 to 6 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 4 do {_unit addItemToVest "zlt_radx";};
_unit addItemToVest "AGM_CableTie";
for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
_unit addHeadgear "av_shlem_Vityaz";
_unit addGoggles "RBCSW_Mask_M50_Monolyth";
_unit addItem "rhs_mag_30Rnd_556x45_Mk318_Stanag";
_unit addItem "rhsusf_mag_17Rnd_9x19_JHP";
_unit addWeapon "rhs_weap_m4a1_carryhandle";
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
[_unit,"STALKER_insignia_monolith"] call bis_fnc_setUnitInsignia;
};






		default { diag_log [ "DOLG.sqf error: NO TEMPLATE " , _tpl ]; };
	};
};


[_unit, _tpl] call _fn_checktpl;
