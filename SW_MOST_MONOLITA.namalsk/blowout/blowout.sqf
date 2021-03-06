/*
	Author: Marksman
	Updated by Zealot
	Ejection for stalker 

	Call from init.sqf:
	[40,120,120] execvm "blowout.sqf";
	40 - number of minutes between each ejection (approx.)
 	120 - length in seconds of each ejection (approx.)
	120 - time in seconds (approx.) between first warning and blowout

*/

params [["_timeout",40,[0]],["_blowtime",120,[0]],["_timea",120,[0]]];

if (isServer) then {
	[_timeout,_blowtime] spawn {
		params [["_timeout",40,[0]],["_blowtime",120,[0]],["_timea",120,[0]]];
		while {true} do {
			sleep ( _timeout * (45 + random 30));
			diag_log ["Starting blowout on clients"];
			[[_blowtime,_timea],{[((_this select 0)*(0.75 + random 0.5)),((_this select 1)*(0.5 + random 1)) ] spawn mrk_fnc_blowout}] remoteexec ["bis_fnc_spawn"];			
		};
	};
};

if !(hasInterface) exitwith {};


mrk_fnc_checkIn = {
	private ["_res","_objs","_uniUnit"];
	_res = 0;
	if ( "45KO_u3_grey_camo_uniform" == uniform player ) exitwith { 0 };
	for "_i" from 0 to 35 do { 
		_rpos = [[(getposasl player) select 0, (getposasl player) select 1, ((getposasl player) select 2) + 100], 100, 10*_i] call bis_fnc_relPos;
		if (!lineintersects [getposasl player, _rpos,player]) then {_res = _res + 1;};
	};
	_res ;
};


mrk_fnc_Lightning = {
	params ["_NmbB","_delay","_t1"];
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
		_light setLightAmbient [0.05, 0.05, 0.1];
		_light setlightcolor [1, 1, 2];
		sleep 0.1;
		_thunder = ["thunder_1", "thunder_2"] call BIS_fnc_selectRandom;
		playSound _thunder;
		_t1 = random 0.5;
		addCamShake [5, _t1*2, 50];		
		sleep (_t1);
		deletevehicle _light;
		deletevehicle _lighting;
		sleep _delay;
	};
};


mrk_fnc_LightningsAll = {
	params ["_time"];
	private ['_starttime','_endtime','_peaktime','_coeff'];
	_starttime = time;
	_endtime = time + _time;
	
	_peaktime = 0;
	_coeff = 0;
	
	while { mrk_blw_blowout_inprogress && alive player} do {
		[1,0.01] call mrk_fnc_Lightning;
		
		if !(mrk_blw_blowout_peakended) then {
			_coeff =  ((time - _starttime) / _time) ;
			_coeff = (0.1 max _coeff) min 1.5; 
		} else {
			if (_peaktime == 0) then {_peaktime = time;};
			_coeff = 0.02 * _time / ((time - _peaktime) max 0.01);
			_coeff = (0.1 max _coeff) min 1.5;
		};
		sleep (1/_coeff)*(0.25 + random 1.5);

	};
}; //mrk_blw_blowout_inprogress = true;240 spawn mrk_fnc_LightningsAll


mrk_blw_blowout_inprogress = false;
mrk_blw_blowout_peakended = false;
mrk_fnc_blowout = {
	params [["_time",120,[1]],["_timeA",120,[1]]];
	if (!hasInterface || !alive player || mrk_blw_blowout_inprogress) exitwith {};
	mrk_blw_blowout_inprogress = true;
	mrk_blw_blowout_peakended = false;
	
	playsound "Blowouttext1"; 
	sleep _timeA;
	
	mrk_blw_StartColorEj = ppEffectCreate ["ColorCorrections", 1501];
	mrk_blw_StartColorEj ppEffectEnable true;
	mrk_blw_StartColorEj ppEffectAdjust [1,    1.5,   0,   0, 0, 0, 0,    0.2, 0.8, 0.5, 0.7,   0.1, 1, 0.7, 0];
	mrk_blw_StartColorEj ppEffectCommit 20;
	_delay = _time / 5;
	[_time] spawn mrk_fnc_LightningsAll;
	_soundEj = [] spawn { while { mrk_blw_blowout_inprogress } do { playsound "Blowoutrumble"; sleep 30; }; };
	sleep 3;
	[_delay] spawn { params ["_delay"]; sleep (5 + random 5); playsound "Blowouttext3";  sleep (2*_delay + random 5); playsound "Blowouttext2";  };
	sleep (_delay *2);
	mrk_blw_EndColorEj_1 = ppEffectCreate ["ColorCorrections", 1502];
	mrk_blw_EndColorEj_1 ppEffectEnable true;
	mrk_blw_EndColorEj_1 ppEffectAdjust [1,1,0,0, 0, 0, 0, 1.5, 0.5, 0.5, -0.5, 0.3, 0.5, 0.5, 0];
	mrk_blw_EndColorEj_1 ppEffectCommit 20;
	sleep (_delay*2);
	mrk_blw_psiColor = ppEffectCreate ["ColorCorrections", 1503];   
	mrk_blw_psiColor ppEffectEnable true;   
	mrk_blw_psiColor ppEffectAdjust [1,	1,		0,0,1,0,0,		0.9,0.8,0.7,0,		0.3,0.5,0.7,0];   
	mrk_blw_psiColor ppEffectCommit 10;
	_psiSound = [] spawn { while {mrk_blw_blowout_inprogress } do { playSound "PsyVoice"; playSound "PsyBlackout"; sleep 7;}; };
	[] spawn {zradon= true; while {mrk_blw_blowout_inprogress} do { zradon = ([false,true] select (([] call mrk_fnc_checkIn) > 2)) ; sleep 1.5; } ;zradon= false;};
	sleep _delay;
	player setfatigue 1;
	titleText ["", "BLACK OUT",2.8];
	sleep 2.8;
	if ( (player getVariable ["ZAlcohol",0]) < 0.5 ) then {
		[player, 30] call AGM_Medical_fnc_knockOut;
	};
	_Out = ([] call Mrk_fnc_CheckIn) / 36. * 2;
	player setDamage (damage player + _Out);
	mrk_blw_blowout_peakended = true;
	titleText ["", "BLACK IN",0.5];
	terminate _soundEj;
	terminate _psiSound;
	mrk_blw_psiColor ppEffectEnable false;   
	ppEffectDestroy mrk_blw_psiColor;
	mrk_blw_EndColorEj_1 ppEffectEnable false;
	ppEffectDestroy mrk_blw_EndColorEj_1;
	sleep _delay;

	mrk_blw_StartColorEj ppEffectEnable false;
	ppEffectDestroy mrk_blw_StartColorEj;
	mrk_blw_blowout_inprogress = false;


};