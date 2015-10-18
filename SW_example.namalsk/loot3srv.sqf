


if (!isserver) exitwith {};

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
	{ _weight = _x / _weightsTotal;	_weight = round(_weight * 100);	for "_k" from 0 to (_weight - 1) do {_weighted pushback _foreachindex; }; } foreach _weights;
	_index = _weighted call zlt_fnc_selectRandom;
	_array select _index
};

zldespawntime = 5;
zldebug = true;

zlhouses = [];
zlhousesempty = [];



zlfillhld = {
	_this addweaponcargoglobal ["Binocular",2];
};




zlcheckunit = {
	private ["_hs","_h","_hpos","_empty","_hld"];
	_hs = (getpos _this) nearObjects ["House", 100];
	if (zldebug) then { diag_log ["zlcheckunit1", count _hs];};
	{
		_h = _x;
		if (!(_h in zlhouses) && !(_h in zlhousesempty)) then {
			(getposasl _x) params ["_x1","_y1","_z1"]; zlt_rnd_seed = (floor _x1 * floor _y1 * floor _z1)/100;
			_hpos = ([_h] call BIS_fnc_buildingPositions);
			//if (zldebug) then { diag_log ["zlcheckunit", typeof _h, getpos _h, zlt_rnd_seed];};
			_hlds = [];
			_empty = true;
			{
				if ((1 call zlt_fnc_random) < 0.2) then {
					_empty = false;
					_hld = createVehicle ["WeaponHolderSimulated", _x, [], 0, "CAN_COLLIDE"];
					_hld setposatl _x;
					if (zldebug) then {_markerstr = createMarker ["xxzloot"+str(zlt_rnd_seed),getpos _hld];_markerstr setMarkerShape "ICON";_markerstr setMarkerType "mil_dot";};
					_hld call zlfillhld;
					_hlds pushback _hld;
				};
				
			} foreach _hpos;
			_h setvariable ["zlhlds", _hlds];
			if (_empty) then [{zlhousesempty pushback _h},{zlhouses pushback _h}];
		};
	} foreach _hs;
};


zltsuspend = {
	zlhouses = zlhouses - [_this];
	if (zldebug) then {};
	{
		if !(isnull _x) then {deletevehicle _x;};
	} foreach (_this getvariable ["zlhlds",[]]);
};


zlcheckhouse = {
	private ["_countnum","_ent"];
	_countnum  = _this getvariable ["zlsuspend",0];
	_ent = (getpos _this) nearEntities ["Man",300];
	{if !(isplayer _x) then {_ent=_ent-[_x];};} foreach +(_ent);
	if !(count _ent > 0) then {
		_countnum=_countnum+1;
		if (_countnum > 0) then {
			_this call zltsuspend;
		} else {
			_this setvariable ["zlsuspend",_countnum];
		};
	};
};



sleep 1;

0 spawn {
	private "_d";_d=0;
	while {true} do {
		sleep 7.2 ;
		{
			if (isplayer _x) then {(vehicle _x) call zlcheckunit};
		} foreach allunits;
		if (count zlhouses > 0) then {
			(zlhouses select (_d % (count zlhouses))) call zlcheckhouse;
		};
		_d=_d+1;
		
	};
};














