/*
*/
if (isDedicated) exitWith {};
// проверить, что будет, если много игроков сгенерирует _bolt.
//diag_log "AhitElectra initializing...";
//diag_log Player;

_Apos = _this select 0;
_Apos1= _this select 1;
				 		  
_bolt = "LightningBolt" createVehicle _Apos1;
_bolt setposatl _Apos1;
_bolt setdamage 1;
_light = "#lightpoint" createVehicle _Apos1;
_light setposatl [_Apos1 select 0,_Apos1 select 1,(_Apos1 select 2) + 10];
_light setLightDayLight true;                           
_light setLightBrightness 300;
_light setLightAmbient [0.05, 0.05, 0.1];
_light setlightcolor [1, 1, 2];
sleep 0.1;
_light setLightBrightness 0;
sleep (random 0.1);

_class = ["lightning1_F","lightning2_F"] call bis_Fnc_selectrandom;
_lightning = _class createVehicle _Apos1;
                                                
_duration = random(2);
for "_i" from 0 to _duration do 
{
	_time = time + 0.1;
	_light setLightBrightness (100 + random 100);
	waituntil {
		time > _time
	};
};

deletevehicle _lightning;
deletevehicle _light;

//diag_log "AhitElectra exit...";
