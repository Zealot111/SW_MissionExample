/*
*/
if (isDedicated) exitWith {};


private ["_Aname, _intheCar"];
_Aname = _this select 0;
if (alive Player) then
{
//diag_log "Ahit initializing...";
//diag_log Player;

	_APlayer = Player;
	switch (markerText _Aname) do
	{
	  case "Gravy":
	  {
	    _intheCar = false;
	    if (Player != vehicle Player) then 
	    {
		    _intheCar = true;
		    _APlayer = vehicle Player;
		  }
		  else {_intheCar = false;};
	 
	   	if ((Player == _APlayer) or (vehicle Player == _APlayer)) then
	 	  {
		 	 	[_APlayer, _intheCar] spawn {
	  	  	_APlayer = _this select 0;
	  	  	_intheCar = _this select 1;
	 	  	  _APlayer say3d "gravi_hit";
					_APlayer = _this select 0;
	
					_pos = _APlayer modelToWorld [0,0,0];
					_h = _pos select 2;
					_maxh = ((_pos select 2)+2+(random(3)));
					_state=0;
					_d=0;
					_dx=0;
					_n=0.10;
					private ["_n"];
			
					while {(_h<_maxh) and (_d<50)} do 
					{
						_pos = _APlayer modelToWorld [0,0,0];
						_h = _pos select 2;
						_d=_d+0.35;
						_dx=_dx+_n;
	
						if ((_d>=15)and (_APlayer isKindOf "AIR")) then {_n=0;};
						if (_d>=25) then {_n=0;};
		
						_APlayer setPosASL [getPosASL _APlayer select 0,getPosASL _APlayer select 1,(getPosASL _APlayer select 2)+0.055];
						_APlayer setVelocity [((random 2)),((random 2)),0];
						_APlayer setDir ((getDir _APlayer)+_dx);
					
						sleep 0.01;
					};
			// if player in the car - hit car
					if (_intheCar) then { _APlayer setDamage (damage _APlayer + random(0.3)); }
					else 	{	[_APlayer, 15] call AGM_Medical_fnc_knockOut;};
	  		};
	  	};
	  };
		case "Electra":
		{ 

	   	if (Player == _APlayer) then
	   	{
				_Apos = GetPos player;
				_light = "#lightpoint" createVehicle _Apos;
				_light setposatl [_Apos select 0,(_Apos select 1) +5,(_Apos select 2) + 1];
				_light setLightDayLight true;                           
				_light setLightBrightness 10;
				_light setLightAmbient [0.05, 0.05, 0.1];
				_light setlightcolor [1, 1, 2];
				sleep 0.1;
				_light setLightBrightness 0;
				sleep (random 0.1);
				_duration = random(2);
				for "_i" from 0 to _duration do 
				{
					_time = time + 0.1;
					_light setLightBrightness (5 + random 10);
					waituntil {	time > _time };
				};
				deletevehicle _light;	   	
 	  	  _sndrnd = ["electra_hit1","electra_hit"] call BIS_fnc_selectRandom;
				if (_APlayer != vehicle _APlayer) then 
				{ 	
					(vehicle _APlayer) setDamage (damage vehicle _APlayer + random(0.3));
	 	  	  _APlayer say3d _sndrnd;
				}
				else 	
				{	
					_APlayer setVariable ["AGM_AllowUnconscious", true];				
					_APlayer setVariable ["AGM_Pain", ((_APlayer getVariable "AGM_Pain") + random(0.3)), True];
					_bodyrnd = ["HitHead","HitLeftArm","HitRightArm"] call BIS_fnc_selectRandom;
					_APlayer setHitPointDamage [_bodyrnd, (_APlayer getHitPointDamage _bodyrnd)+0.2+random(0.4)];
	 	  	  _APlayer say3d _sndrnd;
	 	  	};
	  	};
		};
		case "Puh":
		{ 
	   	if (Player == _APlayer) then
	   	{           
			// if player in the car - hit car
				if (_APlayer != vehicle _APlayer) then 
				{ 
					(vehicle _APlayer) setDamage (damage vehicle _APlayer + random(0.2));
	 	  	  _APlayer say3d "puh_hit";
				}
				else 	
				{	
					_APlayer setVariable ["AGM_AllowUnconscious", true];				
					_APlayer setVariable ["AGM_Blood", ((_APlayer getVariable "AGM_Blood") - random(0.2)), True];
					_APlayer setVariable ["AGM_isBleeding", true, True];
					_APlayer setVariable ["AGM_Pain", ((_APlayer getVariable "AGM_Pain") + random(0.1)), True];
					_bodyrnd = ["HitHead","HitLeftArm","HitRightArm"] call BIS_fnc_selectRandom;
					_APlayer setHitPointDamage [_bodyrnd, (_APlayer getHitPointDamage _bodyrnd)+random(0.4)];
	 	  	  _APlayer say3d "puh_hit";
	  	  };
	  	};
		};
		case "Jarka":
		{ 
	   	if (Player == _APlayer) then
	   	{
				if (_APlayer != vehicle _APlayer) then 
				{ 	
					(vehicle _APlayer) setDamage (damage vehicle _APlayer + random(0.3));
	 	  	  _APlayer say3d "jarka_hit";
				}
				else 	
				{	
					_APlayer setVariable ["AGM_AllowUnconscious", true];				
					_APlayer setVariable ["AGM_Blood", ((_APlayer getVariable "AGM_Blood") - random(0.1)), True];
					_APlayer setVariable ["AGM_isBleeding", false, True];
					_APlayer setVariable ["AGM_Pain", ((_APlayer getVariable "AGM_Pain") + random(0.3)), True];
					_bodyrnd = ["HitBody","HitLeftArm","HitRightArm"] call BIS_fnc_selectRandom;
					_APlayer setHitPointDamage [_bodyrnd, (_APlayer getHitPointDamage _bodyrnd)+0.2+random(0.4)];
					_bodyrnd = ["HitHead","HitLeftLeg","HitRightLeg"] call BIS_fnc_selectRandom;
					_APlayer setHitPointDamage [_bodyrnd, (_APlayer getHitPointDamage _bodyrnd)+0.2+random(0.4)];
	 	  	  _APlayer say3d "jarka_hit";
	 	  	};
	  	};
	  };
		case "Myas":
		{ 
	  	if (Player == _APlayer) then
	   	{
				if (_APlayer != vehicle _APlayer) then 
				{ 	
					(vehicle _APlayer) setDamage (damage vehicle _APlayer + random(0.3));
	 	  	  _APlayer say3d "myas_hit";
				}
				else 	
				{	
					_APlayer setVariable ["AGM_AllowUnconscious", true];				
					_APlayer setVariable ["AGM_Blood", ((_APlayer getVariable "AGM_Blood") - random(0.1)), True];
					_APlayer setVariable ["AGM_isBleeding", false, True];
					_APlayer setVariable ["AGM_Pain", ((_APlayer getVariable "AGM_Pain") + random(0.4)), True];
					_bodyrnd = ["HitBody","HitLeftLeg","HitRightLeg"] call BIS_fnc_selectRandom;
					_APlayer setHitPointDamage [_bodyrnd, (_APlayer getHitPointDamage _bodyrnd)+0.2+random(0.4)];
	 	  	  _APlayer say3d "myas_hit";
	 	  	};
			};	  		
		};	
	};
sleep 0.3;
//diag_log "Ahit ended.";
};	

		