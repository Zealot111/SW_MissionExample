/*
ver. 3
!исправлены баги

ver. 2 
! исправлены баги
+ добавлена генерация дульных насадок и прицелов
В таблице определены 4 класса лута,
1 класс - стрелковое оружие и патроны
2 класс - карты, бинокли, ПНВ, прицелы и т.п.
3 класс - медицина
4 класс - очень редкий крутой хлам - тепловизоры, крутое оружие и т.п.
getArray (configFile >> "CfgWeapons" >> "str_rpk201" >> "WeaponSlotsInfo" >> "CowsSlot" >> "CompatibleItems")
MuzzleSlot
*/


if (hasinterface) then {
	0 spawn {
		sleep 1.;
		player addeventhandler ["InventoryOpened",{	if (typeof (_this select 1) in ["WeaponHolderSimulated","GroundWeaponHolder"]) then {	(_this select 1) setVariable ["ztouched", true, true];};false}];
	};
};


if (!isServer) exitwith {"Loot2.sqf не на сервере!"};
zldebug = true;
zlhouses = [];

zlt_fnc_random = {[16807.,0,2147483647.] params ["_a","_c","_m"];zlt_rnd_seed=( zlt_rnd_seed*_a+_c )%_m; _this*(zlt_rnd_seed/_m)};
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



zlfillhld = {
	params ["_hld","_h","_ind"];
	_cargo = _h getvariable ("zlcargo"+str(_ind));
	if (!isnil "_cargo") then {
		{_hld addItemCargoGlobal _x;} foreach _cargo;
	} else {
		private "_items"; _items = [];
		zlt_rnd_seed = zlt_rnd_seed * 65537 / 75;
		[1,0.75, {_items append (0 call zloottableCat1);}] call zlcheckcat;
		[1,0.75, {_items append (0 call zloottableCat2);}] call zlcheckcat;
		[1,0.75, {_items append (0 call zloottableCat3);}] call zlcheckcat;
		if (zldebug) then {
			diag_log ["zlfillhld", typeof _h, _ind , getpos _h, zlt_rnd_seed, (_items call BIS_fnc_consolidateArray)];
		};
		{_hld addItemCargoGlobal _x;} foreach (_items call BIS_fnc_consolidateArray);
	};
};

zlcheckunit = {
	private ["_hs","_h","_hpos","_empty","_hld","_coord","_batt"];
	_hs = (getpos _this) nearObjects ["House", 100];
	{
		_h = _x;
		if (!(_h in zlhouses) && !(_h getvariable ["zlempty",false])) then {
			(getposasl _x) params ["_x1","_y1","_z1"]; zlt_rnd_seed = (floor _x1 * floor _y1 + floor _z1);
			_hpos = ([_h] call BIS_fnc_buildingPositions);
			_hlds = [];
			_empty = true;
			{
				if ((1 call zlt_fnc_random) < 0.2) then {
					_empty = false;
					_coord = [_x select 0,_x select 1, (_x select 2)+0.1];
					/*_batt = createVehicle ["Land_Battery_F", _coord, [], 0, "CAN_COLLIDE"];
					_batt setposatl _coord;
					sleep 0.5;
					_coord = getposatl _batt;*/
					_hld = createVehicle ["GroundWeaponHolder",_coord , [], 0, "CAN_COLLIDE"]; _hld setposatl _coord;
					//deletevehicle _batt;
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
	if (zldebug) then { deletemarker ("xxzloot"+str(getpos _this)); diag_log ["Suspend", typeof _this, getpos _this]; };
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


zloottableCat1 = 
{
	private "_res";_res = [];

	// common uncommon rare veryrare legendary
	private ["_weapons","_weights","_class"];
	_weapons = ["C","U","R","V","L"];
	_weights = [100,25,10,5,1];
	_class = [_weapons,_weights] call zlt_fnc_selectRandomWeighted;
	switch (_class) do { 	
		case "C": {
				private "_tbl";_tbl=	[
					{ if ((1 call zlt_fnc_random) < 0.33) then  {_res pushback "str_ij_obr";}; for "_i" from 1 to ([1,2] call zlt_fnc_randomInt ) do {_res pushback "2pul_pula"}; },
					{ if ((1 call zlt_fnc_random) < 0.33) then  {_res pushback "str_mp133";}; for "_i" from 1 to ([1,2] call zlt_fnc_randomInt ) do {_res pushback "7pul_pula"}; },
					{ if ((1 call zlt_fnc_random) < 0.33) then  {_res pushback "str_ij_long";}; for "_i" from 1 to ([1,2] call zlt_fnc_randomInt ) do {_res pushback "2pul_pula"}; },
					{ if ((1 call zlt_fnc_random) < 0.33) then  {_res pushback "str_to34_long";}; for "_i" from 1 to ([1,2] call zlt_fnc_randomInt ) do {_res pushback "2pul_pula"}; }
				]; 0 call (_tbl call zlt_fnc_selectrandom);
		};
		case "U":{
				private "_tbl";_tbl=	[
					{ if ((1 call zlt_fnc_random) < 0.75) then  {_res pushback "str_saiga20k";}; for "_i" from 1 to ([1,3] call zlt_fnc_randomInt ) do {_res pushback "8pul_s2_pula"}; },
					{ 	if ((1 call zlt_fnc_random) < 0.75) then  {_res pushback "str_3xlin_sn";};
						if ((1 call zlt_fnc_random) < 0.25) then  {_res pushback "optic_str_puold";}; for "_i" from 1 to ([1,3] call zlt_fnc_randomInt ) do {_res pushback "5rnd_762_mos"}; },
					{ if ((1 call zlt_fnc_random) < 0.75) then  {_res pushback "str_sks_old";}; for "_i" from 1 to ([1,2] call zlt_fnc_randomInt ) do {_res pushback "10rnd_sks_mag"}; },
					{ if ((1 call zlt_fnc_random) < 0.75) then  {_res pushback "str_tt";}; for "_i" from 1 to ([1,2] call zlt_fnc_randomInt ) do {_res pushback "8rnd_tt_mag"}; },
					{ if ((1 call zlt_fnc_random) < 0.75) then  {_res pushback "str_pmm";}; for "_i" from 1 to ([1,2] call zlt_fnc_randomInt ) do {_res pushback "8Rnd_Mag_pm"}; }
				]; 0 call (_tbl call zlt_fnc_selectrandom);

		};
		case "R":{
			private "_tbl";_tbl=	[
				{ if ((1 call zlt_fnc_random) < 0.95) then  {_res pushback "kedr_pist";}; for "_i" from 1 to ([1,2] call zlt_fnc_randomInt ) do {_res pushback "20Rnd_Mag_kedr"}; },
				{ if ((1 call zlt_fnc_random) < 0.95) then  {_res pushback "str_kedr";}; for "_i" from 1 to ([1,2] call zlt_fnc_randomInt ) do {_res pushback "20Rnd_Mag_kedr"}; },
				{ if ((1 call zlt_fnc_random) < 0.95) then  {_res pushback "str_pp_vit";}; for "_i" from 1 to ([1,1] call zlt_fnc_randomInt ) do {_res pushback "30rnd_9mm_vit"}; },
				{ if ((1 call zlt_fnc_random) < 0.95) then  {_res pushback "str_aks74u";}; for "_i" from 1 to ([1,1] call zlt_fnc_randomInt ) do {_res pushback "30rnd_545_mag"}; },
				{ if ((1 call zlt_fnc_random) < 0.95) then  {_res pushback "str_as_val";_res pushback "str_2dps";}; for "_i" from 1 to ([1,3] call zlt_fnc_randomInt ) do {_res pushback "10rnd_mag_vss_sz"}; },
				{ if ((1 call zlt_fnc_random) < 0.95) then  {_res pushback "str_pb"; _res pushback "muzzle_snds_str_pb1";}; for "_i" from 1 to ([1,2] call zlt_fnc_randomInt ) do {_res pushback "8Rnd_Mag_pm"}; }
			]; 0 call (_tbl call zlt_fnc_selectrandom);
		};
		case "V":{	
			private "_tbl";_tbl=	[
				{ if ((1 call zlt_fnc_random) < 1.00) then  {_res pushback "str_ak74m";}; for "_i" from 1 to ([1,1] call zlt_fnc_randomInt ) do {_res pushback "30rnd_545_mag"}; },
				{ if ((1 call zlt_fnc_random) < 1.00) then  {_res pushback "rhs_weap_rpg26";}; }
			]; 0 call (_tbl call zlt_fnc_selectrandom);
		};
		case "L":{
			private "_tbl";_tbl=	[
				{ if ((1 call zlt_fnc_random) < 1.00) then  {_res pushback "str_ak74m"; _res pushback "optic_str_pso_kro";}; for "_i" from 1 to ([1,1] call zlt_fnc_randomInt ) do {_res pushback "30rnd_545_mag"}; }
			]; 0 call (_tbl call zlt_fnc_selectrandom);
		};
			
	};
	
	private "_tbl";_tbl=	[
		0.2 ,	{ _res pushback (["rhs_weap_rsp30_green","rhs_weap_rsp30_red","rhs_weap_rsp30_white"] call zlt_fnc_selectrandom);},
		0.2 ,	{ _res pushback (["rhs_mag_rdg2_white","rhs_mag_nspn_green","rhs_mag_zarya2"] call zlt_fnc_selectrandom);},
		0.2 ,	{ _res pushback (["rhs_mag_rgd5","rhs_mag_rdg2_white","rhs_mag_zarya2"] call zlt_fnc_selectrandom);}
	];
	
	for "_i" from 0 to (count _tbl )-1 step 2 do {
		if ((1 call zlt_fnc_random) < (_tbl select _i)) then {0 call (_tbl select (_i+1));};
	};		
	
	_res;
};

zloottableCat2 = {
	private "_res";_res = [];
	private "_tbl";_tbl=	[
		0.2 ,	{ _res pushback "ItemRadio";},
		0.05 ,	{ _res pushback "ItemGPS";},
		0.01 ,	{ _res pushback "NVGoggles";},
		0.01 ,	{ _res pushback "rhs_pdu4";},
		0.2 ,	{ _res pushback "Binocular";},
		0.1 ,	{ _res pushback (["Mask_M40","Mask_M40_OD","Mask_M50"] call zlt_fnc_selectrandom);},
		0.2 ,	{ _res pushback (["B_TacticalPack_rgr","B_TacticalPack_blk","B_TacticalPack_oli","B_Kitbag_rgr","B_Carryall_oli","B_Carryall_khk","rhs_sidor"] call zlt_fnc_selectrandom);}
	];
	for "_i" from 0 to (count _tbl )-1 step 2 do {
		if ((1 call zlt_fnc_random) < (_tbl select _i)) then {0 call (_tbl select (_i+1));};
	};	
	
	_res;
};


zloottableCat3 = {
	private "_res";_res = [];
	_maxnum = [1,2] call zlt_fnc_randomInt;
	for "_i" from 1 to _maxnum do {	_res pushback "AGM_Bandage"; };
	private "_tbl";_tbl=	[
		0.3 ,	{ _res pushback "AGM_Morphine";},
		0.1 ,	{ _res pushback "AGM_Epipen";},
		0.05 ,	{ _res pushback "AGM_Bloodbag";},
		0.3 ,	{ _res pushback "zlt_rotgut";},
		0.2 ,	{ _res pushback "zlt_radx";},
		0.025 ,	{ _res pushback "zlt_radaway";},
		0.5 ,	{ _res pushback "zlt_beer";}
	];
	for "_i" from 0 to (count _tbl )-1 step 2 do {
		if ((1 call zlt_fnc_random) < (_tbl select _i)) then {0 call (_tbl select (_i+1));};
	};
	_res;
};

//пока нет
zloottableCat4 = {

	[];
};


zlcheckcat = {
	params ["_cnt","_pr","_code"];
	private ["_res"]; _res = [];
	while {_cnt > 0} do { if ((1 call zlt_fnc_random) < _pr ) then { _res append (0 call _code); _cnt=_cnt-1;};};
};


zlt_fnc_fillbox = {
	
    private ["_box","_index"];
    _box = _this;
	_items = [];
	zlt_rnd_seed = diag_ticktime;
	
	[2,1, {_items append (0 call zloottableCat1);}] call zlcheckcat;
	[2,1 , {_items append (0 call zloottableCat2);}] call zlcheckcat;
	[2,1, {_items append (0 call zloottableCat3);}] call zlcheckcat;
	[2,1, {_items append (0 call zloottableCat4);}] call zlcheckcat;

	
	clearWeaponCargoGlobal _box;
	clearMagazineCargoGlobal _box;
	clearItemCargoGlobal _box;
	clearBackpackCargoGlobal _box;
	if (zldebug) then {
		diag_log ["zlt_fnc_fillbox", (_items call BIS_fnc_consolidateArray)];
	};
	{_box addItemCargoGlobal _x;} foreach (_items call BIS_fnc_consolidateArray);
	
};

0 spawn {
	private "_d";_d=0;
	while {true} do {
		sleep 7.2 ;
		{
			if (isplayer _x && (vehicle _x == _x)) then {(vehicle _x) call zlcheckunit};
		} foreach allunits;
		if (count zlhouses > 0) then {
			for "_i" from 1 to 5 do {
				( zlhouses call zlt_fnc_selectRandom) call zlcheckhouse;
			};
		};
		_d=_d+1;
	};
};





{
    if (_x isKindof "rhs_mags_crate") then {
        _script = _x spawn {_this call zlt_fnc_fillbox;};
        waitUntil {scriptDone _script};


    };
} foreach zlt_new_blocks;

