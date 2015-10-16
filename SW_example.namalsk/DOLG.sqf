private ["_unit", "_tpl", "_fn_checktpl"];

_unit = _this select 0;
_tpl = toUpper (_this select 1);

if (!local _unit) exitWith {};

_fn_checktpl = {
	private ["_tpl","_unit"];
	_unit = _this select 0;
	_tpl = _this select 1;

	switch (_tpl) do {
	
case "DOLG_6":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "45KO_u3_black_uniform";
for "_i" from 1 to 2 do {_unit addItemToUniform "AGM_Bandage";};
_unit addItemToUniform "AGM_Morphine";
_unit addItemToUniform "rhs_mag_rgd5";
_unit addItemToUniform "Chemlight_red";
for "_i" from 1 to 3 do {_unit addItemToUniform "20Rnd_9x21_Mag";};
_unit addVest "TRYK_V_tacv1M_BK";
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Bandage";};
_unit addItemToVest "AGM_Morphine";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_black";};
for "_i" from 1 to 3 do {_unit addItemToVest "Chemlight_red";};
_unit addHeadgear "Altyn_ch_ochki";
_unit addItem "20Rnd_9x21_Mag";
_unit addWeapon "av_aps";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
};

case "DOLG_5":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "45KO_u3_black_uniform";
for "_i" from 1 to 2 do {_unit addItemToUniform "AGM_Bandage";};
_unit addItemToUniform "AGM_Morphine";
_unit addItemToUniform "rhs_mag_rgd5";
for "_i" from 1 to 4 do {_unit addItemToUniform "Chemlight_red";};
for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
_unit addVest "TRYK_V_tacv1M_BK";
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Bandage";};
_unit addItemToVest "AGM_Morphine";
_unit addItemToVest "16Rnd_9x21_Mag";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_black";};
_unit addHeadgear "Altyn_ch_ochki";
_unit addItem "16Rnd_9x21_Mag";
_unit addWeapon "hgun_Rook40_F";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
};

case "DOLG_4":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "45KO_u3_black_uniform";
_unit addItemToUniform "rhs_mag_rgd5";
for "_i" from 1 to 3 do {_unit addItemToUniform "Chemlight_red";};
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_black";};
_unit addVest "TRYK_V_tacv1M_BK";
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
_unit addItemToVest "rhs_mag_rdg2_black";
_unit addHeadgear "Altyn_ch_ch";
_unit addItem "16Rnd_9x21_Mag";
_unit addWeapon "hgun_Rook40_F";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
};

case "DOLG_3":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "45KO_u3_black_uniform";
for "_i" from 1 to 2 do {_unit addItemToUniform "AGM_Bandage";};
_unit addItemToUniform "AGM_Morphine";
for "_i" from 1 to 3 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
_unit addItemToUniform "rhs_mag_rgd5";
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
_unit addVest "TRYK_V_tacv1M_BK";
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Bandage";};
_unit addItemToVest "AGM_Morphine";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_black";};
_unit addHeadgear "Altyn_ch_ch";
_unit addItem "16Rnd_9x21_Mag";
_unit addWeapon "hgun_Rook40_F";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
};

case "DOLG_2":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "45KO_u3_black_uniform";
for "_i" from 1 to 2 do {_unit addItemToUniform "AGM_Bandage";};
_unit addItemToUniform "AGM_Morphine";
_unit addItemToUniform "rhs_mag_rgd5";
for "_i" from 1 to 6 do {_unit addItemToUniform "Chemlight_red";};
_unit addItemToUniform "rhs_mag_rdg2_black";
_unit addVest "TRYK_V_tacv1M_BK";
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Bandage";};
_unit addItemToVest "AGM_Morphine";
for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
_unit addItemToVest "rhs_mag_rdg2_black";
_unit addHeadgear "Altyn_ch_ochki";
_unit addItem "16Rnd_9x21_Mag";
_unit addWeapon "hgun_Rook40_F";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
};

case "DOLG_1":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "45KO_u3_black_uniform";
for "_i" from 1 to 2 do {_unit addItemToUniform "AGM_Bandage";};
_unit addItemToUniform "AGM_Morphine";
_unit addItemToUniform "rhs_mag_rgd5";
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
_unit addVest "TRYK_V_tacv1M_BK";
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Bandage";};
_unit addItemToVest "AGM_Morphine";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_black";};
for "_i" from 1 to 4 do {_unit addItemToVest "Chemlight_red";};
for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
_unit addHeadgear "Altyn_ch_ch";
_unit addItem "16Rnd_9x21_Mag";
_unit addWeapon "hgun_Rook40_F";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
};






		default { diag_log [ "DOLG.sqf error: NO TEMPLATE " , _tpl ]; };
	};
};


[_unit, _tpl] call _fn_checktpl;