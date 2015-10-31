/*

0 spawn {_zombie = createAgent   [["ZombieStalkerMedium1","ZombieStalkerMedium2","ZombieStalkerSlow1","ZombieStalkerSlow2"] call bis_fnc_selectrandom,     getpos player, [], 10 , "NONE"];    _zombie setVariable ["BIS_fnc_animalBehaviour_disable", true]; _zombie setVariable ["AGM_AllowUnconscious", false]; [_zombie,player,true] execfsm "zombieAI2.fsm"; aa = _zombie;}


*/

if !(isServer)  exitwith {};


rbc_zmb_maxzombies = 100;
rbc_zmb_aliveZombies = 0;

rbc_zmb_defaultMaxZombies = 10;
rbc_zmb_defaultTotalZombies = 20;


rbc_zmb_fnc_CreateZombie = {
	_logic = _this select 0;
	[_logic] execfsm "zombieAI3.fsm";
};


rbc_zmb_fnc_despawnzombies = {
	params ["_logic"];
	private ["_zombieGrp","_civgrp"];
	_zombieGrp =  (_logic getvariable ["rbc_zmb_zombies",[]]);
	{deletevehicle _x;} foreach _zombieGrp;
	_logic setvariable ["rbc_zmb_zombies",[]];
};

rbc_zmb_fnc_spawnzombies = {
	params ["_logic"]; private ["_maxzombies","_totalzombies","_grp","_zmb"];
	_maxzombies = _logic getvariable ["maxzombies",rbc_zmb_defaultMaxZombies];
	if (isnil {_logic getVariable "totalzombiesNow"}) then {
		_logic setvariable ["totalzombiesNow", (_logic getvariable ["totalzombies",rbc_zmb_defaultTotalZombies ]) ]; 
	 };
	_continue = true;
	while {_continue} do {
		_ent = _logic nearEntities ["Man", 400];
		_continue = false; 
		{
			if (isplayer _x && alive _x) exitwith {_continue = true};
		} foreach _ent;
		sleep 3;
		while  {(count (_logic getvariable ["rbc_zmb_zombies",[]])) < _maxzombies && (_logic getvariable ["totalzombiesNow",0 ]) > 0 && rbc_zmb_aliveZombies < rbc_zmb_maxzombies} do {
			[_logic,_ent] call rbc_zmb_fnc_CreateZombie;
			(_logic setvariable ["totalzombiesNow",(_logic getvariable ["totalzombiesNow",0 ]) - 1 ]);
			(_logic setvariable ["lastzombietime", time]);
			sleep 0.1;
		};
		if ((_logic getvariable ["totalzombiesNow",0 ]) < 1 && (time - 600) > (_logic getvariable ["lastzombietime", time]) ) then {
			_logic setvariable ["totalzombiesNow", (_logic getvariable ["totalzombies",rbc_zmb_defaultTotalZombies ]) ]; 
		};
		sleep 27;
	};
	_logic call rbc_zmb_fnc_despawnzombies;
	_logic setvariable ["rbc_zmb_spawnscript",scriptnull];
};

rbc_zmb_fnc_spawner = {
	private ["_logics","_player","_lgs","_script","_i"];
	_logics = _this;
	diag_log ["zlt_fnc_spawner",_logics];
	_i = 0;
	while {true} do {
		{
			if (isplayer _x && alive _x ) then {
				_player = _x;
				{
					if (_x distance _player < 300) then {
						if (isnull(_x getvariable ["rbc_zmb_spawnscript",scriptnull])) then {
							_script = _x spawn rbc_zmb_fnc_spawnzombies;
							_x setvariable ["rbc_zmb_spawnscript", _script];
						};
					};
				} foreach _logics;
			};
		} foreach allunits;
		sleep 9.; _i=_i+1;
	};
};

if (isServer) then {
	_this spawn rbc_zmb_fnc_spawner;
};



  




