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
			_Apos = markerPos _Aname;
			_Apos = [_Apos select 0, _Apos select 1, 0];
			_APlayerpos = getPos _APlayer;
			[[_APlayer, _APlayerPos],"anomaly_fnc_AhitElectra",true,false] call BIS_fnc_MP;
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
					_APlayer setHitPointDamage ["HitHead",(_APlayer getHitPointDamage "HitHead")+random(0.2)];
					_APlayer setHitPointDamage ["HitLeftArm", (_APlayer getHitPointDamage "HitLeftArm")+random(0.2)];
	     		_APlayer setHitPointDamage ["HitRightArm", (_APlayer getHitPointDamage "HitRightArm")+random(0.2)];
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
					_APlayer setHitPointDamage ["HitLeftArm", (_APlayer getHitPointDamage "HitLeftArm")+random(0.3)];
					_APlayer setHitPointDamage ["HitRightArm", (_APlayer getHitPointDamage "HitRightArm")+random(0.3)];
					_APlayer setHitPointDamage ["HitLeftLeg", (_APlayer getHitPointDamage "HitLeftLeg")+random(0.2)];
					_APlayer setHitPointDamage ["HitRightLeg", (_APlayer getHitPointDamage "HitRightLeg")+random(0.2)];
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
					_APlayer setHitPointDamage ["HitBody", (_APlayer getHitPointDamage "HitBody")+random(0.3)];
					_APlayer setHitPointDamage ["HitLeftLeg", (_APlayer getHitPointDamage "HitLeftLeg")+random(0.1)];
					_APlayer setHitPointDamage ["HitRightLeg", (_APlayer getHitPointDamage "HitRightLeg")+random(0.1)];
	 	  	  _APlayer say3d "myas_hit";
	 	  	};
			};	  		
		};	
	};
//diag_log "Ahit ended.";
};	

		