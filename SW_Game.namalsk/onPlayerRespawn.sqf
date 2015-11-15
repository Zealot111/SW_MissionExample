diag_log ["OnPlayerRespawn", _this, player, (_this select 0) == player, player getvariable ["rbc_is_vip",false], player getvariable ["rbc_vip",[]] ];


//[<newUnit>,<oldUnit>,<respawn>,<respawnDelay>]
waituntil {!isnull player && {alive player}};
//[this, "TORG"] call compile preprocessFileLineNumbers "MERC1.sqf";

sleep 0.1;

if (!(player getvariable ["rbc_is_vip",false])) then {
	_unit = _this select 0;
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
    for "_i" from 1 to 5 do {_unit addItemToVest "AGM_Bandage";};
    for "_i" from 1 to 1 do {_unit addItemToVest "AGM_Morphine";};
    _unit addHeadgear "rhs_beanie_green";
    _unit addItem "8Rnd_Mag_pm";
    _unit addWeapon "av_makarov";
    _unit linkItem "ItemWatch";
} else {
	private ["_file","_tpl","_data","_unit"];
	_unit = _this select 0;
	_data = player getvariable ["rbc_vip",[]];
   _file =  _data select 1;
   _tpl = _data select 0;
   _place = _data select 2;

   [_unit,_tpl] call compile preprocessFileLineNumbers _file;
   _unit setposatl _place;

   /*
     [this, "TORG"] call compile preprocessFileLineNumbers "MERC1.sqf";
     this setvariable ["rbc_is_vip",true];
     this setvariable ["rbc_vip",["TORG","MERC1.sqf",getposatl this]];

     [this, "P"] call compile preprocessFileLineNumbers "MERC2.sqf";
     this setvariable ["rbc_is_vip",true];
     this setvariable ["rbc_vip",["P","MERC2.sqf",getposatl this]];



   */


};




  