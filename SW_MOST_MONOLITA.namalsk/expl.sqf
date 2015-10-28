0 spawn {

if (!isnil "zlt_charge_hacked") exitwith {hint "Детонаторы были повреждены!"};


playsound3d ["A3\Sounds_F\sfx\alarm_OPFOR.wss",player,false,[6887.49,5832.85,39.3213] ,20,1,500]; 
playsound3d ["A3\Sounds_F\sfx\alarm_OPFOR.wss",player,false,[5948.59,5862.59,39.2204] ,20,1,500]; 

sleep 10;

{
	if (typeof _x == "AGM_Explosives_Place_SatchelCharge") then {
		_artysup = createVehicle ["HelicopterExploSmall",getpos _x,[], 0, "can_collide"];
		_artysup setdamage 1;
	
	
	};


	sleep 0.5;
} foreach zlt_new_blocks;



};