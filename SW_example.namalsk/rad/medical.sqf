
if (!hasInterface)  exitwith {};



zltMedAlco = {
	_alc = player getVariable ["ZAlcohol",0];
	if (_alc > 0 && floor time % 30 == 0) then {
		if (player getVariable ["AGM_isUnconscious", False]) then {
			player setVariable ["ZAlcohol", 0 max (_alc - 0.1), true];
		} else {
			player setVariable ["ZAlcohol", 0 max (_alc - 0.05), true];
		};
	};
	if (_alc >= 0.05) then {
		PP_alcohol ppEffectAdjust [_alc /2.,_alc /2.,_alc /2.,2,1,-2,-1,0.1,0.01,0.1,0.01,0.02,0.05,1,1];
		PP_alcohol ppEffectCommit 0;
		PP_alcohol ppEffectEnable true;
	} else {
		PP_alcohol ppEffectAdjust [0,0,0,2,1,-2,-1,0.1,0.01,0.1,0.01,0.02,0.05,1,1];
		PP_alcohol ppEffectCommit 0;
		PP_alcohol ppEffectEnable false;
	};

	if (_alc >= 1) then {
		[player,300] call AGM_Medical_fnc_knockOut;
		player setVariable ["ZAlcohol",0.9, true];
	};

};

zltMedDblCLickHandler = {
		_idc = ctrlIDC (_this select 0);          
	_index = _this select 1;         
	_item = lbData [_idc, _index];
	
	closeDialog 2;
	sleep 0.001;
	
	switch (_item) do {
		case "zlt_radx" : {
			player removeitem "zlt_radx";
			if (player getvariable ["radx",0] < 2) then {
				player setvariable ["radx", (player getvariable ["radx",0]) + 1 ,true];
				player setvariable ["radx_time", daytime, true];
			};
			playsound "zrad_radx";

		};
		
		case "zlt_radaway" : {
			player removeitem "zlt_radaway";
			playsound "zrad_radaway";
			_old = player getVariable ["ZRadDoze",0.1];
			player setVariable ["ZRadDoze", (_old - (40 + random 20)) max 0, true];
		
		};
		
		
		case "zlt_rotgut" : {
			player removeitem "zlt_rotgut";
			playsound "zrad_bottleup";
			_alc = player getVariable ["ZAlcohol",0];
			_alc = _alc + 0.5;
			player setVariable ["ZAlcohol",_alc, true];
	
			_old = player getVariable ["ZRadDoze",0.1];
			player setVariable ["ZRadDoze", (_old - (15 + random 10)) max 0, true];
		
		};
		
		
		case "zlt_beer" : {
			player removeitem "zlt_beer";
			playsound "zrad_soda";
			_alc = player getVariable ["ZAlcohol",0];
			_alc = _alc + 0.1;
			player setVariable ["ZAlcohol",_alc, true];
		
			_old = player getVariable ["ZRadDoze",0.1];
			player setVariable ["ZRadDoze", (_old - (10 + random 10)) max 0, true];
		
		
		};
		
		default {};
	};
};

sleep 1.;

PP_alcohol = ppEffectCreate ["WetDistortion",345];
PP_alcohol ppEffectEnable false;
PP_alcohol ppEffectAdjust [0,0,0,2,1,-2,-1,0.1,0.01,0.1,0.01,0.02,0.05,1,1];
PP_alcohol ppEffectCommit 0;

player addeventhandler ["InventoryOpened",{
	0 spawn {
		waituntil { !isnull (finddisplay 602) };     
		((findDisplay 602) displayCtrl 638) ctrlSetEventHandler ["LBDblClick", "_this spawn zltMedDblCLickHandler"];  
		((findDisplay 602) displayCtrl 633) ctrlSetEventHandler ["LBDblClick", " _this spawn zltMedDblCLickHandler"];  
		((findDisplay 602) displayCtrl 619) ctrlSetEventHandler ["LBDblClick", "_this spawn zltMedDblCLickHandler"];    
	};
}];