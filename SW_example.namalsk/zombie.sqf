

if !(isServer)  exitwith {};
#include "\x\cba\addons\main\script_macros_common.hpp"
#define PREFIX rbc
#define COMPONENT zmb
#define PR(x) private #x;x=


FUNC(CreateZombie) = {
	private ["_zombie","_logic","_zombieGrp","_ent"];
	_logic = _this select 0;
	_ent = _this select 1;
	_zombieGrp =  _logic getvariable [QGVAR(zombiesgroup), grpNull];
	if (isnull _zombieGrp) then {
		_zombieGrp = createGroup civilian;
		_logic setvariable [QGVAR(zombiesgroup), _zombieGrp];
		_zombieGrp setCombatMode "BLUE";
		_zombieGrp allowFleeing 0;
		_zombieGrp enableAttack false;		
	};
	_zombie=_zombieGrp createUnit [["ZombieStalkerMedium1","ZombieStalkerMedium2","ZombieStalkerSlow1","ZombieStalkerSlow2"] call bis_fnc_selectrandom,
		 getpos _logic, [], 50 , "NONE"];
	_zombie setVariable ["AGM_AllowUnconscious", false];
	[[_zombie],{(_this select 0) switchmove 'AmovPercMstpSnonWnonDnon_SaluteOut'}] remoteExecCall ["bis_fnc_spawn",_ent];
	[_zombie,_logic,false] execfsm "zombieAI.fsm";
	_zombie
};


FUNC(despawnzombies) = {
	params ["_logic"];
	private ["_zombieGrp","_civgrp"];
	_zombieGrp =  _logic getvariable [QGVAR(zombiesgroup), grpNull];
	if (isnull _zombieGrp) exitwith {};
	_civgrp = createGroup civilian;
	(units _zombieGrp) joinsilent _civgrp;
	{deletevehicle _x;} foreach units _civgrp;
	deletegroup _civgrp;
	deletegroup _zombieGrp;
	_logic setvariable [QGVAR(zombiesgroup), grpNull];
	terminate (_logic getvariable [QGVAR(spawnscript), scriptnull]);
};

FUNC(spawnzombies) = {
	params ["_logic"]; private ["_maxzombies","_totalzombies","_grp","_zmb"];
	_maxzombies = _logic getvariable [QGVAR(maxzombies),10 + random 5];
	_totalzombies = _logic getvariable [QGVAR(totalzombies),100 + random 45];
	_continue = true;
	while {_continue} do {
		_ent = _logic nearEntities ["Man", 500];
		_continue = false; 
		{
			if (isplayer _x && alive _x) exitwith {_continue = true};
		} foreach _ent;
		sleep 3;
		while  {(count units (_logic getvariable [QGVAR(zombiesgroup), grpNull])) < _maxzombies && _totalzombies > 0} do {
			[_logic,_ent] call FUNC(CreateZombie);_totalzombies=_totalzombies-1;
			sleep 0.1;
		};
		sleep 27;

		if ((count units (_logic getvariable [QGVAR(zombiesgroup), grpNull])) >0 ) then {
			_zmb = (units (_logic getvariable [QGVAR(zombiesgroup), grpNull]) ) call bis_fnc_selectrandom;
			if (alive _zmb) then {
				playsound3d [format ["ryanzombies\sounds\ryanzombiesmoan%1.ogg",[1,4] call bis_fnc_randomint], _zmb, false, getposasl _zmb, 4,1,200+random 100];
			};
		};
	
	};
	_logic call FUNC(despawnzombies);
	_logic setvariable [QGVAR(spawnscript),scriptnull];
};

FUNC(spawner) = {
	private ["_logics","_player","_lgs","_script","_i"];
	_logics = _this;
	diag_log ["zlt_fnc_spawner",_logics];
	_i = 0;
	while {true} do {
		{
			if (isplayer _x && alive _x ) then {
				_player = _x;
				{
					if (_x distance _player < 400) then {
						if (isnull(_x getvariable [QGVAR(spawnscript),scriptnull])) then {
							_script = _x spawn FUNC(spawnzombies);
							_x setvariable [QGVAR(spawnscript), _script];
						};
					};
				} foreach _logics;
			};
		} foreach allunits;
		sleep 9.; _i=_i+1;
	};
};

if (isServer) then {
	_this spawn FUNC(spawner);
};



  




