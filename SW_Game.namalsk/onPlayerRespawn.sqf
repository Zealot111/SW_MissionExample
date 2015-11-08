diag_log ["OnPlayerRespawn", _this];
[] execvm "rad\geiger.sqf";

//[<newUnit>,<oldUnit>,<respawn>,<respawnDelay>]
waituntil {!isnull player && {alive player}}

_unit = _this select 0;

if ({getplayeruid player == _x} count rbc_alreadyPlayedUIDs > 0) then {
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
};

  