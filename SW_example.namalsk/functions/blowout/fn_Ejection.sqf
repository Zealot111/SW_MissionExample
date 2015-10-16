/*
	Author: Marksman

	Description:
	Create ejection on map.

	Parameter(s):
	0: _this: NUMBER(second) - time before the ejection.
	
	Example:
	[240] call Mrk_fnc_Ejection;
*/

if !(hasInterface) exitwith {  };
[_this select 0] spawn {
	params ["_time"];
	_StartColorEj = ppEffectCreate ["ColorCorrections", 1501];
	_StartColorEj ppEffectEnable true;
	_StartColorEj ppEffectAdjust [1,    1.5,   0,   0, 0, 0, 0,    0.2, 0.8, 0.5, 0.7,   0.1, 1, 0.7, 0];
	_StartColorEj ppEffectCommit 20;
	_currentBlur = 1;
	_delay = _time / 5;
	
	
	_soundEj = [] spawn { 
		playsound "Blowoutbegin"; sleep 7;
		while { true } do { playsound "Blowoutrumble"; sleep 8; }; 
	};
	sleep 8;
	[10,0.2] call Mrk_fnc_LightingBolt;
	sleep _delay;
	[10,0.2] call Mrk_fnc_LightingBolt;
	sleep _delay;
	[10,0.2] call Mrk_fnc_LightingBolt;
	sleep _delay;
	[10,0.2] call Mrk_fnc_LightingBolt;
	[_delay,_soundEj] spawn {
		params ["_delay","_soundEj"];
		private "_psiColor";
		
		_EndColorEj_1 = ppEffectCreate ["ColorCorrections", 1502];
		_EndColorEj_1 ppEffectEnable true;
		_EndColorEj_1 ppEffectAdjust [
			1,    
			1,    
			0,   
			0, 0, 0, 0,    
			1.5, 0.5, 0.5, -0.5,    
			0.3, 0.5, 0.5, 0
		];
		_EndColorEj_1 ppEffectCommit 40;
		[10,0.5] call Mrk_fnc_LightingBolt;
		sleep _delay;
		[10,0.5] call Mrk_fnc_LightingBolt;
		sleep _delay;
		
		_psiColor = ppEffectCreate ["ColorCorrections", 1503];   
		_psiColor ppEffectEnable true;   
		_psiColor ppEffectAdjust [1,	1,		0,0,1,0,0,		0.9,0.8,0.7,0,		0.3,0.5,0.7,0];   
		_psiColor ppEffectCommit 10;
		0 fadeSound 0;
		5 fadeSound 1;
		_psiSound = [] spawn {
			while { true } do {
				playSound "PsyVoice";
				playSound "PsyBlackout";
				sleep 7;
			};
		};
		
		[10,1] call Mrk_fnc_LightingBolt;
		titleText ["", "BLACK OUT",2.8];
		sleep 2.8;
		[player, 30] call AGM_Medical_fnc_knockOut;
		_Out = [] call Mrk_fnc_CheckIn;
		if ( !_Out ) then { player setDamage 1; } else { hint "Вы пережили выброс!" };
		titleText ["", "BLACK IN",0.5];
		terminate _soundEj;
		terminate _psiSound;
		_psiColor ppEffectEnable false;   
		ppEffectDestroy _psiColor;
		_EndColorEj_1 ppEffectEnable false;
		ppEffectDestroy _EndColorEj_1;
		sleep _delay;
		[10,2] call Mrk_fnc_LightingBolt;
		
	};
	sleep _time;
	_StartColorEj ppEffectEnable false;
	ppEffectDestroy _StartColorEj;
};