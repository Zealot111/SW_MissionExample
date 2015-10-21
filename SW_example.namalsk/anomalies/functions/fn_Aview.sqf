/**/
private ["_Aname, _Apos, _Atext"];
_Aname = _this select 0;
//diag_log "Aview initializing...";
//diag_log Player;

if (isServer) then
{
//  diag_log "make it active:";
//  diag_log _Aname;
	tf_ActiveAnomalies append [_Aname];
};
if (isDedicated) exitWith {};


	//diag_log "Anomaly view function has been called.";
	
	// format["%1e",_Aname] = _this select 0;
	//_Atext = markerText _Aname;
	
	_Apos = markerPos _Aname;
	_Apos = [_Apos select 0, _Apos select 1, 0];
	switch (markerText _Aname) do
	{
		case "Electra":
		{ 
			_electra = "#particlesource" createVehicleLocal _Apos;
			_electra setParticleCircle [0, [0, 0, 0]];
			_electra setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
			_electra setParticleParams [["\A3\data_f\blesk2", 1, 0, 1], "", "SpaceObject", 1, 1, [0, 0, 0], [0, 0, 0], 0, 0, 0, 0, [0.1, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "",""];
			_electra setDropInterval 0.05;
			_light = "#lightpoint" createVehicleLocal position _electra;
      _light setLightBrightness 0.1;       
      _light setLightAmbient[1, 1, 1.5];       
      _light setLightColor[10, 10, 13];

			VAR setVariable [format["%1e",_Aname], [_electra, _light], false];
	  	if (_Apos distance (Player) < 200) then {
		    _electrasound = [_electra, _Apos] spawn {
						    // следует заменить простой say3D на createSoundSource, т.к. там есть нативный луп и можно комбинировать эффекты и звук. Правда комбинировать мы и так можем :) 
						    // но параметров все-равно считай нет (питч, волюм).
	  	    _anomaly = _this select 0;
	  	  	while {true} do {
					  	  // не очень понял что с дистанцией, по логике не должно быть слышно - ан нет. проверял на earthquake_01 с 50 метров.
 			  	  [_Anomaly, Player] say3D "electra_main";
				  	sleep 5;
				  }
			  };
	  	 VAR setVariable [format["%1s",_Aname], [_electrasound], false];
		  };
		};
		case "Gravy": 
		{
			_gravi1 = "#particlesource" createVehicleLocal _Apos;
			_gravi2 = "#particlesource" createVehicleLocal _Apos;
			_gravi3 = "#particlesource" createVehicleLocal _Apos;
			_gravi1 setParticleCircle [3, [0, 0, 0]];
			_gravi1 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
			_gravi1 setParticleParams [["\A3\data_f\cl_rock1", 1, 0, 1], "", "SpaceObject", 1, 7, [0, 0, 0], [0, 0, 0.75], 0, 10, 7.9, 0.075, [10, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", ""];
			_gravi1 setDropInterval 0.05;
			_gravi2 setParticleCircle [0, [0, 0, 0]];
			_gravi2 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
			_gravi2 setParticleParams [["\A3\data_f\cl_grass2", 1, 0, 1], "", "SpaceObject", 1, 12.5, [0, 0, 0], [0, 0, 0.75], 0, 10, 7.9, 0.075, [5, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", ""];
			_gravi2 setDropInterval 0.05;
			_gravi3 setParticleCircle [1, [0, 0, 0]];
			_gravi3 setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0.2, [0, 0, 0, 0], 0, 0];
			_gravi3 setParticleParams [["\A3\data_f\ParticleEffects\Pstone\PStone.p3d", 8, 3, 1], "", "SpaceObject", 2, 7, [0, 0, 0], [0, 0, 3], 0.5, 4, 1, 0, [1, 1, 1], [[1, 1, 1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", ""];
			_gravi3 setDropInterval 0.1;
			_light = "#lightpoint" createVehicleLocal position _gravi1;
      _light setLightBrightness 0.04;       
      _light setLightAmbient[1, 3, 1];       
      _light setLightColor[0.1, 0.5, 0.1];
			VAR setVariable [format["%1e",_Aname], [_gravi1, _gravi2, _gravi3, _light], false];
	  	if (_Apos distance (Player) < 200) then {
		    _gravisound = [_gravi1, _Apos] spawn {
  	    _anomaly = _this select 0;
  	  	while {true} do {
			  	[_Anomaly, Player] say3D "gravi_main";
			  	sleep 2;
			  }
			  };
	  	 VAR setVariable [format["%1s",_Aname], [_gravisound], false];
		  };		
		};                                                                 
		case "Jarka": 
		{
			
			
			_jarka1 = "#particlesource" createVehicleLocal _Apos;
			_jarka2 = "#particlesource" createVehicleLocal _Apos;
			_light = "#lightpoint" createVehicleLocal position _jarka1;
      _light setLightBrightness 0.04;       
      _light setLightAmbient[211, 90, 60];       
      _light setLightColor[1, 0, 0];
   			
			_jarka1 setParticleCircle [3, [0, 0, 0]];
			_jarka1 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
			_jarka1 setParticleParams [["\A3\data_f\cl_exp", 1, 0, 1], "", "Billboard", 1, 4, [0, 0, 0], [0, 0, 0.75], 0, 10, 7.9, 0.075, [1, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", ""];
//			_jarka1 setParticleParams [["A3\data_f\particleeffects\universal\Explosion_4x4", 1, 0, 1], "", "Billboard", 1, 4, [0, 0, 0], [0, 0, 0.75], 0, 10, 7.9, 0.075, [1, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", ""];
			_jarka1 setDropInterval 0.05;
			_jarka2 setParticleCircle [0, [0, 0, 0]];
			_jarka2 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
//			_jarka2 setParticleParams [["\A3\data_f\cl_fireball_02", 1, 0, 1], "", "Billboard", 1, 12.5, [0, 0, 0], [0, 0, 0.75], 0, 10, 7.9, 0.075, [1.2, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", ""];
			_jarka2 setParticleParams [["\A3\data_f\kouleSvetlo", 1, 0, 1], "", "Billboard", 1, 12.5, [0, 0, 0], [0, 0, 0.75], 0, 10, 7.9, 0.075, [1.2, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", ""];
			_jarka2 setDropInterval 0.05;
			VAR setVariable [format["%1e",_Aname], [_jarka1, _jarka2, _light], false];
	  	if (_Apos distance (Player) < 200) then {
		    _jarkasound = [_jarka1, _Apos] spawn {
  	    _anomaly = _this select 0;
  	  	while {true} do {
			  	[_Anomaly, Player] say3D "jarka_main";
			  	sleep 11;
			  }
			  };
	  	 VAR setVariable [format["%1s",_Aname], [_jarkasound], false];
		  };

		};
		case "Myas": 
		{
			_meat1 = "#particlesource" createVehicleLocal _Apos;
			_meat2 = "#particlesource" createVehicleLocal _Apos;
			_meat3 = "#particlesource" createVehicleLocal _Apos;
			_light = "#lightpoint" createVehicleLocal position _meat1;
     	_light setLightBrightness 0.02;
     	_light setLightAmbient[11, 0.5, 0.5];
     	_light setLightColor[15, 0, 0];  
     	
			_meat1 setParticleCircle [3, [0, 0, 0]];
			_meat1 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
			_meat1 setParticleParams [["\A3\data_f\Cl_fire", 16, 0, 16], "", "Billboard", 1, 4, [0, 0, 0], [0, 0, 0], 0, 10, 7.9, 0.075, [10, 2, 4], [[1, 0.3, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", ""];
			_meat1 setDropInterval 0.1;
			_meat2 setParticleCircle [2, [0, 0, 0]];
			_meat2 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
			_meat2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Meat_ca.p3d", 1, 0, 1], "", "SpaceObject", 1, 5, [0, 0, 0], [0, 0, 3], 2, 12, 7.9, 0.075, [10, 2, 4], [[1, 0.3, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", ""];
			_meat2 setDropInterval 0.1;
			_meat3 setParticleCircle [3, [0, 0, 0]];
			_meat3	setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
			_meat3 setParticleParams [["\A3\data_f\cl_grass2", 1, 0, 1], "", "SpaceObject", 1, 12.5, [0, 0, 0], [0, 0, 0], 3, 10, 7.9, 0.075, [12, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", ""];
			_meat3 setDropInterval 0.05;
			VAR setVariable [format["%1e",_Aname],[_meat1, _meat2, _meat3, _light], false];
	  	if (_Apos distance (Player) < 200) then 
	  	{
		    _myassound = [_meat1, _Apos] spawn 
		    {
		 	    _anomaly = _this select 0;
		 	  	while {true} do 
		 	  	{
				  	[_Anomaly, Player] say3D "myas_main";
				  	sleep 2;
				  }
			  };
	  	 VAR setVariable [format["%1s",_Aname], [_myassound], false];
		  };
		};
		case "Puh": 
		{
			_puch = "#particlesource" createVehicleLocal _Apos;
			_puch setParticleCircle [3, [0, 0, 0]];
			_puch setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
			_puch setParticleParams [["\A3\data_f\cl_feathers2", 1, 0, 1], "", "SpaceObject", 1, 12.5, [0, 0, 0], [0, 0, 0.75], 0, 10, 7.9, 0.075, [8, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", ""];
			_puch setDropInterval 0.1;
			_light = "#lightpoint" createVehicleLocal position _puch;
      _light setLightBrightness 0.04;       
      _light setLightAmbient[11, 11, 15];       
      _light setLightColor[1, 1, 1.5];

			VAR setVariable [format["%1e",_Aname], [_puch, _light], false];
	  	if (_Apos distance (Player) < 200) then {
		    _puhsound = [_puch, _Apos] spawn {
  	    _anomaly = _this select 0;
  	  	while {true} do {
			  	[_Anomaly, Player] say3D "puh_main";
			  	sleep 8;
			  }
			  };
	  	 VAR setVariable [format["%1s",_Aname], [_puhsound], false];
		  };

		};
	};
//diag_log "Anomaly view function has been ended.";
//diag_log "Aview ended.";

/*
еще по звукам
<13:28:14> "[[TF]Pepper] [TF]Pepper": electricityloop - электра
<13:29:17> "[[TF]Pepper] [TF]Pepper": Earthquake01 - 04 - грави
<13:30:05> "[[TF]Pepper] [TF]Pepper": fire -
<13:31:04> "[[TF]Pepper] [TF]Pepper": WoundedGuyA01 - 04 - пух
<13:32:21> "[[TF]Pepper] [TF]Pepper": Scared_Amimal1
<13:32:59> "[TF]def": для шорохов в кустах
*/
