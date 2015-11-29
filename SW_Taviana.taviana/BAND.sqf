
private ["_unit", "_tpl", "_fn_checktpl"];

_unit = _this select 0;
_tpl = toUpper (_this select 1);

if (!local _unit) exitWith {};

_fn_checktpl = {
	private ["_tpl","_unit"];
	_unit = _this select 0;
	_tpl = _this select 1;

	switch (_tpl) do {
	
case  "B2":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "LOP_U_CHR_Woodlander_01";
_unit addItemToUniform "RBCSW_AdetectorCA2";
_unit addItemToUniform "AGM_CableTie";
_unit addBackpack "rhs_sidor";
for "_i" from 1 to 4 do {_unit addItemToBackpack "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "AGM_Morphine";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "zlt_rotgut";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "zlt_beer";};
for "_i" from 1 to 5 do {_unit addItemToBackpack "8Rnd_Mag_pm";};
_unit addGoggles "G_Balaclava_blk";
_unit addItem "8Rnd_Mag_pm";
_unit addWeapon "av_makarov";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
};

case "B1":{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "LOP_U_CHR_Woodlander_01";
_unit addItemToUniform "RBCSW_AdetectorCA1";
for "_i" from 1 to 3 do {_unit addItemToUniform "AGM_CableTie";};
_unit addItemToUniform "rhs_30Rnd_545x39_AK";
_unit addBackpack "rhs_sidor";
for "_i" from 1 to 4 do {_unit addItemToBackpack "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "AGM_Morphine";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_rgd5";};
_unit addItemToBackpack "rhs_30Rnd_545x39_AK";
for "_i" from 1 to 3 do {_unit addItemToBackpack "8Rnd_Mag_pm";};
_unit addHeadgear "LOP_H_Shemag_BLK";
_unit addItem "rhs_30Rnd_545x39_AK";
_unit addItem "8Rnd_Mag_pm";
_unit addWeapon "arifle_av_aksu";
_unit addWeapon "av_makarov";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
};






		default { diag_log [ "BAND.sqf error: NO TEMPLATE " , _tpl ]; };
	};
};


[_unit, _tpl] call _fn_checktpl;
