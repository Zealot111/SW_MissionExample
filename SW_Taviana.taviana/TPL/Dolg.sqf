private ["_unit","_cl"];
if (typeName _this == typeName []) then {
	_unit = _this select 0;
	_cl = _this select 1;
	_unit setvariable ["zlt_class",_cl];
} else {
	_unit = _this;
	_cl = typeOf _this;
};
//_cl = typeof _unit;
if (!local _unit) exitwith {};
switch true do {


case ( _cl == "LDOLG"):{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "rbc_U_dolg";
_unit addItemToUniform "RBCSW_AdetectorCA1";
for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_ak_545x39_mag";};
_unit addVest "Tarzan_ch_bron";
for "_i" from 1 to 4 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
for "_i" from 1 to 4 do {_unit addItemToVest "zlt_radx";};
for "_i" from 1 to 5 do {_unit addItemToVest "RH_8Rnd_9x18_Mak";};
_unit addItemToVest "HandGrenade";
_unit addHeadgear "av_shlem_chehol";
_unit addItem "30Rnd_ak_545x39_mag";
_unit addItem "RH_8Rnd_9x18_Mak";
_unit addWeapon "arifle_av_aksu";
_unit addWeapon "RH_mak";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
[_unit,"STALKER_insignia_duty"] call bis_fnc_setUnitInsignia;
};



case ( _cl == "DOLG"):{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "rbc_U_dolg";
for "_i" from 1 to 2 do {_unit addItemToUniform "AGM_Bandage";};
_unit addItemToUniform "AGM_Morphine";
for "_i" from 1 to 4 do {_unit addItemToUniform "RH_8Rnd_9x18_Mak";};
_unit addVest "Vest_dolg";
_unit addItemToVest "RH_8Rnd_9x18_Mak";
_unit addHeadgear "min_rf_beanie_black";
_unit addItem "RH_8Rnd_9x18_Mak";
_unit addWeapon "RH_mak";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
[_unit,"STALKER_insignia_duty"] call bis_fnc_setUnitInsignia;
};

/*                                INSERT TO HERE !!!                         */
default { diag_log [ "error: NO TEMPLATE " , __FILE__, _cl ]; };
};