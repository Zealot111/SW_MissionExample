
zlt_radzones = _this select 0;
zlt_maskOn = false;


if (!hasInterface) exitWith {};

sleep 1;

[] execvm "rad\goggles.sqf";

pp_radiation = ppEffectCreate ["ColorCorrections",1505];
pp_radiation ppEffectEnable false;
pp_radiation ppEffectAdjust [1,1,0.35,[0,0,0,0],[1,1,1,1],[0,0,0,0],[0,0,0,0,0,0,4]];
pp_radiation ppEffectCommit 0;


PP_radmed = ppEffectCreate ["DynamicBlur",105];
PP_radmed ppEffectEnable false;
PP_radmed ppEffectAdjust [0]; // 0-20
PP_radmed ppEffectCommit 0;



ZRadexRenew = {
	disableserialization;
	_display = uiNamespace getVariable ["Zlt_radex_display",displayNull];
	_ctrl = _display displayCtrl 918591;
	while {alive player && !isnull (uiNamespace getVariable ["Zlt_radex_display",displayNull])} do {
		_rad = player getVariable ["ZRadDoze",0.1];
		_rad = (floor(_rad*10)/10.0);
		_radt =  str (_rad) + " R";
		_ctrl ctrlSetText _radt; 
		_ctrl ctrlCommit 0;
		uisleep 0.35;
	};
};

zradmedkashelmutex = false;
zradmedkashellast = time;
zradmedkashel = {
	if (zradmedkashelmutex) exitWith {diag_log "Error zradmedkashelmutex";};
	zradmedkashellast = time;
	zradmedkashelmutex = true;
	_rad = player getVariable ["ZRadDoze",0.1];
	if (_rad < 200 ) exitwith {diag_log ["zradmedkashel","Too small RadDoze"];};

	PP_radmed ppEffectEnable true;
	PP_radmed ppEffectAdjust [1];
	PP_radmed ppEffectCommit 1;
	waituntil {sleep 0.1; ppEffectCommitted PP_radmed};
	{
		if (isPlayer _x) then {
			[ [player], { (_this select 0) say "kashel"; } ] remoteExec ["bis_fnc_spawn",_x];
		};
	} foreach ((getpos player) nearEntities ["Man",15]);
	
//	playSound "kashel";
	hint parsetext "<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'>У вас симптомы лучевой болезни!</t>";
	sleep 10.;
	if (_rad > 300) then {
		player setHitPointDamage ["HitHead", ( player getHitPointDamage "HitHead") + (random 0.2)];
		player setVariable ["AGM_Pain", ((player getVariable "AGM_Pain") + random(0.2)), True];
	};
	PP_radmed ppEffectAdjust [0];
	PP_radmed ppEffectCommit 1;
	waituntil {sleep 0.1; ppEffectCommitted PP_radmed};
	PP_radmed ppEffectEnable false;
	zradmedkashelmutex = false;
	
};


ZRadMedEffects = {
	private "_orig";
	_orig = player getVariable ["ZRadDoze",0.1];
	if (zradSecond > 0.1) then {
		if (!zlt_maskOn) then {
			_orig = _orig + (random (zradSecond + 0.1));
		};
	} else {
		if (_orig < 203.2 && _orig > 48.7) then { _orig = _orig - (random 0.1)};
		if (_orig > 306.7) then { _orig = _orig + (random 0.1)};
	};
	if (_orig > 200) then {
		_kasheltime = 180 max (300 - (_orig - 200));
		if (zradmedkashellast + _kasheltime < time ) then { 0 spawn zradmedkashel;}
	};

	if ( floor time % 12 == 0) then {
		player setVariable ["ZRadDoze",_orig, true];

	} else {
		player setVariable ["ZRadDoze",_orig];
	};
	if (_orig > 400) then { player setdammage 1; };	
	
};

ZRadGetCurrent = {
	_inzone = false;
	{if (player in list _x) exitWith {_inzone = true;};} foreach zlt_radzones;
	if (_inzone) then {z_asec=20; zradSecond = 3;} else {z_asec = 0; zradSecond = 0;};
	_inzone
};

zradeffect_hevradt = 0;
ZRadEffect = {
	if (zradeffect_hevradt + 100 < time && !isnull (uiNamespace getVariable ["Zlt_radex_display",displayNull])) then {
		playsound "hevrad"; zradeffect_hevradt = time;
	};
	while {z_asec > 0.3 && alive player} do {
		if (zlt_maskOn) then {
			pp_radiation ppEffectEnable false;
		} else {
			pp_radiation ppEffectEnable true;
		};
		if (z_asec > 0.5 && {random 1 < 0.5}) then { playSound "geigers1"; };
        if (z_asec > 1) then { sleep (1./z_asec); } else {sleep 1.2;};
	};
	pp_radiation ppEffectEnable false;
};

ZRadScrEffects = scriptnull;
ZRadScrMainCycle = scriptnull;

ZRadMainCycle = {
	while {alive player} do {
		0 call ZRadGetCurrent;
		0 call ZRadMedEffects;		
		if (z_asec > 0.3) then {
			if (isnull ZRadScrEffects) then {ZRadScrEffects = 0 spawn ZRadEffect;};
		 };
		sleep 0.75;
	};
};


ZRadScrMainCycle = 0 spawn ZRadMainCycle;

["Дозиметр (показать/убрать)", {true}, {if (isnull (uiNamespace getVariable ["Zlt_radex_display",displaynull])) then {("zltradradex" call BIS_fnc_rscLayer) cutrsc ["RscZltRadex", "PLAIN"];} else {("zltradradex" call BIS_fnc_rscLayer) cuttext ["", "PLAIN"];}}, true] call AGM_Interaction_fnc_addInteractionSelf;
