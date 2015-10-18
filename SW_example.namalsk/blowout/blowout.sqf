/*
	Author: Marksman
	Updated by Zealot
	Ejection for stalker 

	Call from init.sqf:
	[30,240] execvm "blowout.sqf";
	30 - number of minutes between each ejection
 	240 - length in seconds of each ejection

*/

params [["_timeout",30,[0]],["_blowtime",240,[0]]];

if (isServer) then {
	[_timeout,_blowtime] spawn {
		params [["_timeout",30,[0]],["_blowtime",240,[0]]];
		while {true} do {
			sleep ( _timeout * (30 + random 30));
			diag_log ["Starting blowout on clients"];
			[[_blowtime],{(_this select 0) spawn mrk_fnc_blowout}] remoteexec ["bis_fnc_spawn"];			
		};
	};
};

if !(hasInterface) exitwith {};


//lineIntersectsObjs [getposasl player, [[(getposasl player) select 0, (getposasl player) select 1, ((getposasl player) select 2) + 100], 100, random 360] call bis_fnc_relPos,objnull, objnull, false, 4]
mrk_fnc_checkIn = {
	private ["_res","_objs","_uniUnit"];
	_res = 0;
	if ( "45KO_u3_grey_camo_uniform" == uniform player ) exitwith { true };
	for "_i" from 0 to 35 do { 
		_rpos = [[(getposasl player) select 0, (getposasl player) select 1, ((getposasl player) select 2) + 100], 100, 10*_i] call bis_fnc_relPos;
		_objs = lineIntersectsObjs [getposasl player, _rpos,objnull, objnull, false, 4];
		if (count _objs == 0) then {_res = _res + 1;}
	};
	_res / 36.;
};


mrk_fnc_Lightning = {
	params ["_NmbB","_delay"];
	for "_i" from 1 to _NmbB do {
		private ["_position", "_direction", "_distance"];
		_position=position player;
		_distance=100;
		_direction=random 360;
		private ["_relativePosition","_lighting","_light","_thunder"];
		_relativePosition = [_position, _distance, _direction] call bis_fnc_relPos;
		_lighting = (["lightning_F","lightning2_F","lightning1_F"] call bis_fnc_selectRandom ) createvehiclelocal _relativePosition;
		_lighting setdir random 360;
		_lighting setpos _relativePosition;
		_light = "#lightpoint" createvehiclelocal _relativePosition;
		_light setpos _relativePosition;
		_light setLightBrightness 300;
		_light setLightDayLight true;
		_light setLightAmbient [0.5, 0.5, 1];
		_light setlightcolor [1, 1, 2];
		sleep (0.2 + random 0.1);
		_thunder = ["thunder_1", "thunder_2"] call BIS_fnc_selectRandom;
		playSound _thunder;		
		deletevehicle _light;
		deletevehicle _lighting;
		sleep _delay;
	};
};


mrk_fnc_LightningsAll = {
	params ["_time"];
	_starttime = time;
	_maxtime = time + _time;
	_coeff =  ((time - _starttime) / _time) ;
	
	while { ((time - _starttime) / _time) < 1 && alive player} do {
		[1,0.01] call mrk_fnc_Lightning;
		sleep    ( ( 0.25 / ((time - _starttime) / _time)) min 10);
	};
};


mrk_blw_blowout_inprogress = 0;
mrk_fnc_blowout = {


	if !(hasInterface) exitwith {  };
		
	if (mrk_blw_blowout_inprogress != 0) exitwith {};
	mrk_blw_blowout_inprogress = 1;

	params ["_time"];
	// зеленый оверлэй
	mrk_blw_StartColorEj = ppEffectCreate ["ColorCorrections", 1501];
	mrk_blw_StartColorEj ppEffectEnable true;
	mrk_blw_StartColorEj ppEffectAdjust [1,    1.5,   0,   0, 0, 0, 0,    0.2, 0.8, 0.5, 0.7,   0.1, 1, 0.7, 0];
	mrk_blw_StartColorEj ppEffectCommit 20;
	_delay = _time / 10;


	_soundEj = [] spawn { playsound "Blowoutbegin"; sleep 7; 	while { mrk_blw_blowout_inprogress!=0 } do { playsound "Blowoutrumble"; sleep 8; }; };

	
	sleep 8;
	[5,0.2] call mrk_fnc_Lightning;

	playsound "Blowouttext1";
	for "_i" from 1 to 6 do { sleep _delay; [5,0.2] call mrk_fnc_Lightning; };
	playsound "Blowouttext2";
	mrk_blw_blowout_inprogress = 2;

	mrk_blw_EndColorEj_1 = ppEffectCreate ["ColorCorrections", 1502];
	mrk_blw_EndColorEj_1 ppEffectEnable true;
	mrk_blw_EndColorEj_1 ppEffectAdjust [1,1,0,0, 0, 0, 0, 1.5, 0.5, 0.5, -0.5, 0.3, 0.5, 0.5, 0];
	mrk_blw_EndColorEj_1 ppEffectCommit 40;

	for "_i" from 1 to 2 do { sleep _delay; [5,0.2] call mrk_fnc_Lightning; };
	playsound "Blowouttext3";

	for "_i" from 1 to 2 do { sleep _delay; [5,0.2] call mrk_fnc_Lightning; };
	
	mrk_blw_psiColor = ppEffectCreate ["ColorCorrections", 1503];   
	mrk_blw_psiColor ppEffectEnable true;   
	mrk_blw_psiColor ppEffectAdjust [1,	1,		0,0,1,0,0,		0.9,0.8,0.7,0,		0.3,0.5,0.7,0];   
	mrk_blw_psiColor ppEffectCommit 10;
	mrk_blw_blowout_inprogress = 3;

	_psiSound = [] spawn { while { mrk_blw_blowout_inprogress!=0 } do { playSound "PsyVoice"; playSound "PsyBlackout"; sleep 7;	}; };

	[10,1] call mrk_fnc_Lightning;
	titleText ["", "BLACK OUT",2.8];
	sleep 2.8;
	[player, 30] call AGM_Medical_fnc_knockOut;
	_Out = [] call Mrk_fnc_CheckIn;

	player setDamage (damage player + _Out);
	
	titleText ["", "BLACK IN",0.5];
	terminate _soundEj;
	terminate _psiSound;
	mrk_blw_blowout_inprogress = 2;
	mrk_blw_psiColor ppEffectEnable false;   
	ppEffectDestroy mrk_blw_psiColor;
	mrk_blw_EndColorEj_1 ppEffectEnable false;
	ppEffectDestroy mrk_blw_EndColorEj_1;
	sleep _delay;
	[5,2] call mrk_fnc_Lightning;
		

	sleep _delay;
	mrk_blw_StartColorEj ppEffectEnable false;
	ppEffectDestroy mrk_blw_StartColorEj;
	mrk_blw_blowout_inprogress = 0;


};