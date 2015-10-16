
_NmbB = _this select 0;
_delay = _this select 1;

if !(hasInterface) exitwith {  };

for "_i" from 1 to _NmbB do {
	
	_pos = [(getPos player select 0),(getPos player select 1),(getPos player select 2) + 100];
	_rad = [200,500,600,1000,1200] call bis_Fnc_selectrandom;
	_bolt = createvehicle ["LightningBolt",_pos,[],_rad,"can collide"];
	_boltPos = getPos _bolt;
	_bolt setposatl _boltPos;
	_bolt setdamage 1;

	_light = "#lightpoint" createvehiclelocal _boltPos;
	_light setposatl [_boltPos select 0,_boltPos select 1,(_boltPos select 2) + 100];
	_light setLightDayLight true;
	_light setLightBrightness 300;
	_light setLightAmbient [0.05, 0.05, 0.1];
	_light setlightcolor [1, 1, 2];

	sleep 0.1;
	_light setLightBrightness 0;

	_class = ["lightning1_F","lightning2_F"] call bis_Fnc_selectrandom;
	_lightning = _class createvehiclelocal [100,100,100];
	_dir = [_lightning, player] call BIS_fnc_dirTo;
	_lightning setdir _dir;
	_lightning setpos _boltPos;

	for "_i" from 0 to 4 do {
		_time = time + 0.1;
		_light setLightBrightness (100 + random 100);
		waituntil {
			time > _time
		};
	};

	deletevehicle _lightning;
	deletevehicle _light;

	0 setlightnings 0;
	sleep _delay;
};