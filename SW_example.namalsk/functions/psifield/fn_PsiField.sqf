/*
	Author: Marksman

	Description:
	Activate psy-emissions on player.

	Parameter(s):
	0: _this: BOOLEAN - trigger activator.
	1: _this: NUMBER - Psi-power.
	
	Example:
	[thisTrigger,0.1] call Mrk_fnc_PsiField;
*/

_activ = _this select 0;
_power = _this select 1;
private ["_uniForm","_uniMask","_Psi"];

if !(hasInterface) exitwith {};

_resPsyMasks = ["Mask_M40","Mask_M40_OD","Mask_M50"];
_uniForm = uniform player;
_uniMask = goggles player;
_done =false;
if ( !("45KO_u3_grey_camo_uniform" == _uniForm) ) then {
	_Psi = [_activ,_power,_resPsyMasks,_uniMask] spawn { 
		params ["_activ","_power","_resPsyMasks","_uniMask"];
		private ["_psiColor","_psiBlur","_currentBlur","_currentFat","_delayblink","_selectBlinkOut","_selectBlinkIn","_PsiDamage","_resMask","_currentPsiHealth","_currentPsiStor"];
		
		_psiColor = ppEffectCreate ["ColorCorrections", 1503];   
		_psiColor ppEffectEnable true;   
		_psiColor ppEffectAdjust [1,	1,		0,0,1,0,0,		0.9,0.8,0.7,0,		0.3,0.5,0.7,0];   
		_psiColor ppEffectCommit 10;

		_currentBlur = 1;
		_currentPsiStor = 0;

		0 fadeSound 0;
		5 fadeSound 1;
		
		while { triggerActivated _activ } do { 
			_psiBlur = ppEffectCreate ["DynamicBlur", 411];
			_psiBlur ppEffectEnable true;
			_psiBlur ppEffectAdjust [_currentBlur];
			_psiBlur ppEffectCommit 10;
			
			_currentFat = getFatigue player;
			_delayblink = random 5;
			_currentPsiHealth = player getHitPointDamage "hitHead";
			_currentPsiStor = _currentPsiStor + 0.1;
			_selectBlinkOut = ["BLACK OUT","WHITE OUT"] call BIS_fnc_selectRandom;
			If ( _selectBlinkOut == "BLACK OUT" ) then { _selectBlinkIn = "BLACK IN"; } else { _selectBlinkIn = "WHITE IN"; };

			playSound "PsyVoice";
			playSound "PsyBlackout";
			sleep 14 - _delayblink; 
			titleText ["", _selectBlinkOut];
			playSound "Tinnitus";
			sleep _delayblink;
			if ( _currentPsiStor > 0.5 ) then { [player, _currentPsiStor] call AGM_Medical_fnc_knockOut; };
			titleText ["", _selectBlinkIn];
			
			player setFatigue _currentFat + _power;
			if ( _uniMask in _resPsyMasks ) then { _resMask = 0.5; } else { _resMask = 0; };
			if ( (_currentFat - _resMask) > 0 ) then { 
				_PsiDamage = _currentFat - _resMask + _currentPsiHealth;
				if ( _PsiDamage > 0 ) then { player setHitPointDamage ["hitHead", _PsiDamage]; };
			};
			
			_psiBlur ppEffectEnable false;   
			ppEffectDestroy _psiBlur; 
			_currentBlur = _currentBlur + 1;
			sleep 1;
		};
		_psiColor ppEffectEnable false;   
		ppEffectDestroy _psiColor;
	};
	while { triggerActivated _activ } do {
		if ( scriptDone _Psi ) then { _done =true; };
	};
};
_done;