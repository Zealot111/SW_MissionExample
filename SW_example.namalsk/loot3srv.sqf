
if (hasinterface) then {
	0 spawn {
		sleep 1.;
		player addeventhandler ["InventoryOpened",{	if (typeof (_this select 1) in ["WeaponHolderSimulated"]) then {	(_this select 1) setVariable ["ztouched", true, true];};false}];
	};
};


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

zldebug = true;
zlhouses = [];

zlfillhld = {
	params ["_hld","_h","_ind"];
	_cargo = _h getvariable ("zlcargo"+str(_ind));
	if (!isnil "_cargo") then {
		{_hld addItemCargoGlobal _x;} foreach _cargo;
	} else {
		private "_items"; _items = [];
		[1,0.75, {_items append (0 call zloottableCat1);}] call zlcheckcat;
		[1,0.75, {_items append (0 call zloottableCat2);}] call zlcheckcat;
		[1,0.75, {_items append (0 call zloottableCat3);}] call zlcheckcat;
		{_hld addItemCargoGlobal _x;} foreach (_items call BIS_fnc_consolidateArray);
	};
};

zlcheckunit = {
	private ["_hs","_h","_hpos","_empty","_hld"];
	_hs = (getpos _this) nearObjects ["House", 100];
	{
		_h = _x;
		if (!(_h in zlhouses) && !(_h getvariable ["zlempty",false])) then {
			(getposasl _x) params ["_x1","_y1","_z1"]; zlt_rnd_seed = (floor _x1 * floor _y1 * floor _z1)/100;
			_hpos = ([_h] call BIS_fnc_buildingPositions);
			//if (zldebug) then { diag_log ["zlcheckunit", typeof _h, getpos _h, zlt_rnd_seed];};
			_hlds = [];
			_empty = true;
			{
				if ((1 call zlt_fnc_random) < 0.2) then {
					_empty = false;
					_hld = createVehicle ["WeaponHolderSimulated", _x, [], 0, "CAN_COLLIDE"];
					_hld setposatl [_x select 0,_x select 1, (_x select 2) + 0.5];
					if (zldebug) then {_markerstr = createMarker ["xxzloot"+str(getpos _h),getpos _h];_markerstr setMarkerShape "ICON";_markerstr setMarkerType "mil_dot";};
					[_hld, _h, _foreachindex] call zlfillhld;
					_hld setvariable ["zlposnum",_foreachindex];
					_hlds pushback _hld;
				};
				
			} foreach _hpos;
			_h setvariable ["zlhlds", _hlds];
			if (_empty) then [{_h setvariable ["zlempty",true];},{zlhouses pushback _h}];
		};
	} foreach _hs;
};


zltsuspend = {
	zlhouses = zlhouses - [_this];
	private "_save";_save = [];
	if (zldebug) then { deletemarker ("xxzloot"+str(getpos _this)); };
	{
		
		if !(isnull _x) then {
			if ( _x getvariable ["ztouched",false]) then {
				_posn = _x getvariable "zlposnum";
				_this setvariable ["zlcargo"+str(_posn), (magazinecargo _x +   weaponCargo _x +  itemCargo _x +  backpackCargo _x) call BIS_fnc_consolidateArray];
			};
	
			deletevehicle _x;
		};
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














