

zlt_fnc_random = {[16807,0,2147483647] params ["_a","_c","_m"];zlt_rnd_seed=( zlt_rnd_seed*_a+_c )%_m;_this*(zlt_rnd_seed/_m)};
zlt_fnc_selectrandom = {_this select floor ( (1 call zlt_fnc_random) * count (_this))};
zlt_fnc_randomint = { params ["_l","_u"]; [round _l,round _u] params ["_l","_u"];floor (((1 call zlt_fnc_random) * (1 + _u-_l)) + _l) };
zlt_fnc_randomnum = {params ["_l","_u"];[round _l,round _u] params ["_l","_u"]; ((_u - _l) call zlt_fnc_random) + _l};
zlt_fnc_selectRandomWeighted = {
	private ["_array", "_weights","_weightsTotal","_weighted","_weight","_index"];
	_array =  param [0,[],[[]]];
	_weights = +(  param [1,[],[[]]]);
	_weightsTotal = 0;
	{ _x = _x param [0,0,[0]]; _weightsTotal = _weightsTotal + _x; } foreach _weights;
	_weighted = [];
	{ _weight = _x / _weightsTotal;	_weight = round(_weight * 100);	for "_k" from 0 to (_weight - 1) do {_weighted = pushback _foreachindex; }; } foreach _weights;
	_index = _weighted call zlt_fnc_selectRandom;
	_array select _index
};

zlgen = {
	_this addItemCargoGlobal ["Binocular",3];
};

zlgenhrestore = {

};

zlt_myContainers = [];

zlt_lootScanAndPlace = {

	{
		(getposworld _x) params ["_x1","_y1","_z1"]; zlt_rnd_seed = floor _x1 * floor _y1 * floor _z1;
		if ((1 call zlt_fnc_random) < 0.3) then {
			diag_log ["buidling ",typeof _x];
			_hpos = ([_x] call BIS_fnc_buildingPositions);
			if (count _hpos > 0 ) then {
				_hpos1= _hpos call zlt_fnc_selectrandom;
				if ( count (_hpos1 nearObjects ["groundWeaponHolder",3]) == 0) then {
					_hld = createVehicle ["groundWeaponHolder", _hpos1, [], 0, "CAN_COLLIDE"];
					zlt_myContainers pushback _hld;
					_hld setposatl _hpos1;
					_markerstr = createMarkerLocal ["xxx"+str(zlt_rnd_seed),getpos _hld];_markerstr setMarkerShapeLocal "ICON";_markerstr setMarkerTypeLocal "mil_dot";
					_hld addweaponcargoglobal ["Binocular",2];
				};
			};
		};
	} foreach ( (getpos player) nearObjects ["House",100] );
};


if (!hasinterface) exitwith {};
sleep 1;
waituntil {sleep 1.2;!isnil "zlt_lootlogic"};

player addeventhandler ["InventoryOpened",{
	zlt_myContainers = zlt_myContainers - [_this select 1];
	if (typeof (_this select 1) == "GroundWeaponHolder") then {
		(_this select 1) setVariable ["ztouched", 1, true];
	};
	
}];

0 spawn {
	while {alive player} do {
		sleep 64;
		zlt_myContainersR = [];
		// despawn
		{ if (_x getvariable ["ztouched",0] == 1) then {zlt_myContainersR pushback _x;}; } foreach zlt_myContainers;
		zlt_myContainers = zlt_myContainers - zlt_myContainersR; zlt_myContainersR = [];
		
		zlt_myContainersR = [];
		{
			_users = (getpos _x) nearEntities ["Man",100];
			diag_log ["users",_users];
			if (count _users == 0) then {
				deleteVehicle _x;zlt_myContainersR pushback _x;
				(getposworld _x) params ["_x1","_y1","_z1"];
				deletemarkerlocal ("xxx"+str(floor _x1 * floor _y1 * floor _z1));
			};
		} foreach zlt_myContainers;
		zlt_myContainers = zlt_myContainers - zlt_myContainersR; zlt_myContainersR = [];
	};
};

while {alive player} do {
	call zlt_lootScanAndPlace;
	sleep 10.5;
};