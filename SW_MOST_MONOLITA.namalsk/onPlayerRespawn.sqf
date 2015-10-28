diag_log ["OnPlayerRespawn", _this];
[] execvm "rad\geiger.sqf";


_unit = player;

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


if (hasinterface) then {
  sleep 3;
  if ( ({getplayeruid player == _x} count zltrespawnplayer) > 2 ) then {
	avbg = player ;
	 avbg setdamage 1; deletevehicle avbg;
	  [sidelogic,"Вы умерли"]  spawn wmt_fnc_endmission;
	  
  };

};
  