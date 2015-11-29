if (!isServer) exitWith {};


zlt_playerCheckDistance = 100;       // дистанция проверки домов, ящиков
zlt_pauseBetweenChecks = 7.2;       // пауза между проверками
zlt_lootSuspendTime = 120;         // через какое время после "пинга" лут удаляется и сохраняется
zlt_lootRenewTime = 900; 
zlt_lootHouseClasses =  ["house","house_f"]; // какие классы домов искать
zlt_lootBoxesClasses =  ["plp_ct_base"]; // какие классы ящиков искать
zlt_lootBoxesTemplates = [[
    "plp_ct_weathcratebigworn",
    "plp_ct_weathcratesmallgreen",
    "plp_ct_weathcratemediumgreen",
    "plp_ct_suitcasemetalsilverside",
    "plp_ct_cartonrottensmall"
],[
	"akm"
	,"akm_ammo"
	,"good"
	,"good"
	,"med"

]; // шаблоны для генерации лута

zlt_lootProbability = 0.1;

zlt_housesNoLoot = [];
zlt_boxesNoLoot = [];
zlt_housesSpecialPoints = [[],[]];
zlt_housesNoElevCheck = [];

// ------------------------------------------------------------------------------------
		
zlt_lootHouses = []; // текущие обрабатываемые дома
zlt_lootBoxes = []; // текущие обрабатываемые ящики

zlt_fnc_getTrueFloorPos = {
	params ["_posz",["_maxval",45,[0]],["_delta",0.05,[0]]];
	private ["_test","_val","_pos"];
	if ((_posz select 2) < 0) then {
		_pos = [_posz select 0, _posz select 1, 1];
	} else {
		_pos = [_posz select 0, _posz select 1, (_posz select 2) + 1];
	};
	_test = true; _val = 1;
	while {_test} do {
		_int = lineintersects [atltoasl(_pos), atltoasl([_pos select 0, _pos select 1, (_pos select 2) - (_val * _delta)])] || terrainintersect [_pos, [_pos select 0, _pos select 1, (_pos select 2) - (_val * _delta)]];
		if (_int ) then {_pos = [_pos select 0, _pos select 1, ((_pos select 2) - ((_val -1 ) * _delta)) max 0]; _test = false;	};
		_val = _val + 1;
		if (_val > _maxval) then {_test=false; _pos = [_pos select 0, _pos select 1, (_pos select 2) - 1]; _test = false;};
	};
	_pos	
};


zlt_fnc_getCargoContent = {
	params ["_box"];
	weaponCargo _box + magazinecargo _box + itemCargo _box + backpackCargo _box
};

zlt_fnc_setCargoContent = {
	params ["_box","_content",["_clear",true,[true]]];
	//diag_log ["zlt_fnc_setCargoContent",_this];
	if (_clear) then {
		clearWeaponCargoGlobal _box;
		clearMagazineCargoGlobal _box;
		clearItemCargoGlobal _box;
		clearBackpackCargoGlobal _box;
	};
	{
		if (isclass (configFile / "CfgVehicles" / _x)) then {
			_box addBackpackCargoGlobal [_x,1];
		} else {
			_box addItemCargoGlobal [_x,1];
		};
	} foreach _content;
	_box
};

zlt_fnc_randomWeighted = {
	params [["_a",[],[[]]],["_w",[],[[]]]]; 
	private ["_t","_r","_s","_i","_ret"];
	if (count _a == 1) exitWith {_a select 0};
	if (count _w in [0,1] && count _a != 0) exitWith {_a call bis_fnc_selectrandom};
	if (count _w != count _a && count _a != 0) exitWith {diag_log("zlt_fnc_randomWeighted Количество весов не сопадает количеству элементов, используем простую случайную выборку!");_a call bis_fnc_selectrandom};
	if (count _a == 0) exitWith {diag_log("zlt_fnc_randomWeighted Ошибка, 0 элементов во входном массиве!");nil};
	_t=0; {_t =_t+_x;} foreach _w;	_r= (random _t); _s=0; _i=0; 
	while {_i < count _a} do { _s = _s + (_w select _i); if (_r < _s) exitwith {_ret = _a select _i}; _i=_i+1; };
	_ret
};



zlt_fnc_generateContent = {
	params ["_contentType"];	
	private ["_res","_maxcount","_classes","_weights","_class"];
	_res = [];
	_contentType = toLower _contentType;
	switch (_contentType) do { 
		case "normal" : {
			_maxcount = [1,2,2,3,3,3,3,4,4,5] call bis_fnc_selectrandom;
			for "_i" from 0 to _maxcount-1 do {
				_classes = [
					"AGM_Bandage","AGM_Morphine","zlt_rotgut","zlt_beer","rbc_bacon","rbc_beans",
					"RBCSW_Mask_M40_OD","RBCSW_AdetectorCA1","RBCSW_AdetectorCA2","2pul_pula","str_ij_long","str_to34_long","str_ij_obr",
					"B_TacticalPack_rgr","B_TacticalPack_blk","B_TacticalPack_oli","B_Kitbag_rgr","B_Carryall_oli","B_Carryall_khk" ,
					["RH_mak","RH_8Rnd_9x18_Mak"],"RH_8Rnd_9x18_Mak",["RH_tt33","RH_8Rnd_762_tt33"],"RH_8Rnd_762_tt33"
				];
				_weights = [
					10,1, 10, 10, 15, 15,
					1,0.3,1, 5, 1, 1, 1,
					0.1,0.1,0.1,0.1,0.1,0.1,
					0.25, 0.5, 0.3, 0.6
				];
				_class = [_classes, _weights] call zlt_fnc_randomWeighted;
				if (typeName _class == typeName "") then {
					_res pushBack _class;
				} else {
					if (typeName _class == typeName []) then {
						{ _res pushBack _x; } foreach _class;
					};
				};
			};
		};
		case "good" : {
			_res pushBack "arifle_av_akm";
			_res pushBack "30Rnd_ak_762x39_mag";
			_res pushBack "30Rnd_ak_762x39_mag";
			_res pushBack "B_TacticalPack_blk";
			_res pushBack "rbc_bacon";_res pushBack "rbc_bacon"; _res pushBack "zlt_rotgut";

		};
		case "akm" : {
		  _res pushBack "arifle_av_akm";
		  _res pushBack "arifle_av_akm";

		};
		case "akm_ammo" : {
			_res pushBack "30Rnd_ak_762x39_mag";
			_res pushBack "30Rnd_ak_762x39_mag";
		};
		case "med" : {
			for "_i" from 1 to 16 do {_res pushBack "agm_Bandage";};
			for "_i" from 1 to 6 do {_res pushBack "agm_morphine";};
			for "_i" from 1 to 4 do {_res pushBack "agm_epipen";};
			for "_i" from 1 to 4 do {_res pushBack "agm_bloodbag";};
			for "_i" from 1 to 12 do {_res pushBack "zlt_radx";};
			for "_i" from 1 to 4 do {_res pushBack "zlt_radaway";};
		};
		default {  diag_log ["zlt_fnc_generateContent:No such conent",_this,diag_tickTime]; }; 
	};
	_res
};


zlt_fnc_generateLootHouse = {
	params ["_house"];
	private ["_hclass","_positions","_contentType","_result","_lastpos","_good"];
	_hclass = toLower typeof _house;
	if (_hclass in zlt_housesNoLoot || isObjectHidden _house) exitWith {nil};
	if (_hclass in (zlt_housesSpecialPoints select 0)) then {
		_positions = (zlt_housesSpecialPoints select 1) select ((zlt_housesSpecialPoints select 0) find _hclass);
	} else {
		_positions = ([_house] call BIS_fnc_buildingPositions);
	};
	if (count _positions == 0) exitWith {nil};
	_result = [[],[]]; //posNumber and generateContainerArray
	_contentType = "Normal"; 
	_lastpos = [0,0,0];
	{
		_good = true;
		if ( _lastpos distance _x < 5) then {_good = false;};
		if (_good) then {
			if (random 1 < zlt_lootProbability) then {
				_lastpos = _x;
				(_result select 0) pushBack _foreachindex;
				(_result select 1) pushback ([_contentType] call zlt_fnc_generateContent);
			};
		};
	} foreach _positions;
	_result
};


zlt_fnc_placeLootHouse = {
	params ["_house","_houselootdescr"];
	private ["_con",'_hclass','_usestdpos','_makeElevationCheck','_buildingPosString','_positions',"_rpositions"];
	_hclass = toLower typeof _house;
	if (_hclass in (zlt_housesSpecialPoints select 0)) then {
		_rpositions = (zlt_housesSpecialPoints select 1) select ((zlt_housesSpecialPoints select 0) find _hclass);
		{
			_positions pushBack (_house modelToWorld (_x));
		} foreach _rpositions;
	} else {
		_positions = ([_house] call BIS_fnc_buildingPositions);
	};
	{
		_con = ([_positions select _x, (_houselootdescr select 1) select _foreachindex, !(_hclass in zlt_housesNoElevCheck)] call zlt_fnc_spawnLoot);
		_con setvariable ["rbc_housePosNum", _x];
		_house setvariable ["rbc_houseContainers", (_house getvariable ["rbc_houseContainers",[]]) + [_con]];
	} foreach (_houselootdescr select 0);
	_house setVariable ["rbc_lootstate", "CR"];
	_house
};


zlt_fnc_spawnLoot = {
	params ["_posatl","_loot",["_elcheck",true,[true]]];
	private "_hld";
	if (_elcheck) then {
		_posatl = [_posatl] call zlt_fnc_getTrueFloorPos;
	};
	_hld = createVehicle ["GroundWeaponHolder",_posatl , [], 0, "CAN_COLLIDE"];
	_hld setposatl _posatl;
	[_hld, _loot, false] call zlt_fnc_setCargoContent;
	_hld	
};

zlt_fnc_restoreHouse = {
	params ["_house","_paramsCfg"];
	private ['_time','_oldtime','_data'];
	if ((_house getVariable ["rbc_lootstate", ""]) != "SU" ) exitwith {false};
	_time =  zlt_lootRenewTime;
	_oldtime = (_house getVariable "rbc_LootTime");
	if ( time  - _oldtime > _time) exitWith {_house setVariable ["rbc_suspendLootData",nil]; false};
	_data = _house getVariable "rbc_suspendLootData";
	[_house,_data] call zlt_fnc_placeLootHouse;
	true	
};


zlt_fnc_pingHouse = {
	params ["_house"];
	private ["_state","_restore","_data"];
	_state = _house getVariable ["rbc_lootstate", ""];
	if (_state == "NO") exitWith {};
	_restore = true;
	if (_state  == "SU") then {
		_restore = [_house] call zlt_fnc_restoreHouse;
		if (_restore) then {
			zlt_lootHouses pushBack _house;
		};
	};
	_house setVariable ["rbc_LootTime", time];
	if (_state == ""  || !_restore) then {
		_data = [_house] call zlt_fnc_generateLootHouse;
		if (!isNIl "_data") then {
			[_house,_data] call zlt_fnc_placeLootHouse;
			zlt_lootHouses pushBack _house;
		} else {
			_house setVariable ["rbc_lootstate", "NO"];
		};
	};
};



zlt_fnc_pingBox = {
	params ["_box"];
	private ['_state','_time','_maxtime','_data'];
	//zlt_boxesNoLoot = [];
	_state = _box getVariable ["rbc_lootstate", ""];
	_time = _box getVariable ["rbc_LootTime", time];
	_bclass = toLower typeof _box;
	switch (_state) do {
		case ("NO") : {
		};
		case ("CR") : {
			_box setVariable ["rbc_LootTime", time];
		};
		case ("SU") : {
			if ( time - _time > zlt_lootRenewTime) then {
				_box setVariable ["rbc_lootstate", "CR"];
				_box setVariable ["rbc_LootTime", time];
				if (tolower typeof _box in (zlt_lootBoxesTemplates select 0)) then {
					_ind = (zlt_lootBoxesTemplates select 0) find tolower typeof _box;
					_data = [(zlt_lootBoxesTemplates select 1) select _ind] call zlt_fnc_generateContent;
				} else {
					_data = ["Normal"] call zlt_fnc_generateContent;
				};
				[_box,_data] call zlt_fnc_setCargoContent;
				zlt_lootBoxes pushback _box;
			} else {
				_data = _box getVariable "rbc_suspendLootData";
				[_box,_data] call zlt_fnc_setCargoContent;
				_box setVariable ["rbc_lootstate", "CR"];
				_box setVariable ["rbc_LootTime", time];
				zlt_lootBoxes pushback _box;
			};
		};
		case ("") : {
			if !(_bclass in zlt_boxesNoLoot) then {
				_box setVariable ["rbc_lootstate", "CR"];
				_box setVariable ["rbc_LootTime", time];
				_data = ["Normal"] call zlt_fnc_generateContent;
				[_box,_data] call zlt_fnc_setCargoContent;
				zlt_lootBoxes pushback _box;
			} else {
				_box setVariable ["rbc_lootstate", "NO"];
				_box setVariable ["rbc_LootTime", time];
			};
		};
		default {
			diag_log (("zlt_fnc_pingBox:Unknown parameter _state " + _state));
		};
	};	
};


zlt_fnc_suspendBox = {
	params ["_box"];
	private ["_contaners","_data"];
	if ((_box getVariable ["rbc_lootstate", ""]) != "CR") exitwith {diag_log("zlt_fnc_suspendBox: Error, trying to suspend empty house");};
	_data = _box call zlt_fnc_getCargoContent;
	_box setVariable ["rbc_suspendLootData",_data];
	_box setVariable ["rbc_LootTime", time];
	_box setVariable ["rbc_lootstate", "SU"];
};
zlt_fnc_suspendHouse = {
	params ["_house"];
	private ["_contaners","_data"];
	_contaners = _house getvariable ["rbc_houseContainers",[]];
	if ((_house getVariable ["rbc_lootstate", ""]) != "CR") exitwith {diag_log("zlt_fnc_suspendHouse: Error, trying to suspend empty house");};
	_data = [[],[]];
	{
		if !(isnull _x) then {
			_content = [_x] call zlt_fnc_getCargoContent;
			(_data select 0) pushback (_x getvariable "rbc_housePosNum");
			(_data select 1) pushback (_content);
			deleteVehicle _x;
		};
	} forEach _contaners;
	_house setvariable ["rbc_houseContainers",[]];
	_house setVariable ["rbc_suspendLootData",_data];
	_house setVariable ["rbc_LootTime", time];
	_house setVariable ["rbc_lootstate", "SU"];
};

zlt_fnc_lootInit = {
	if (!isNil "zlt_mainSystemThread") then {terminate zlt_mainSystemThread;};
	zlt_mainSystemThread = 0 spawn {

		private ["_lootHouses","_lootBoxes","_users","_houses","_boxes"];
		sleep 3.2;
		rbc_stopLootThread = nil;
		while {isNil "rbc_stopLootThread"} do {
			_users = [[allUnits,playableUnits] select (count playableUnits > 0), {isPlayer _this && alive _this && vehicle _this == _this}] call CBA_fnc_select ;
			{
				_houses = nearestObjects [_x,zlt_lootHouseClasses, zlt_playerCheckDistance];
				{
					[_x] call zlt_fnc_pingHouse;
				} foreach _houses;
				if (count zlt_lootBoxesClasses != 0) then {
					_boxes = nearestObjects [_x,zlt_lootBoxesClasses, zlt_playerCheckDistance];
					{
						[_x] call zlt_fnc_pingBox;
					} foreach _boxes;
				};
				sleep 0.01;
			} forEach _users;
			sleep zlt_pauseBetweenChecks;
			{
				if ((_x getVariable ["rbc_LootTime", time]) + zlt_lootSuspendTime < time ) then {
					[_x] call zlt_fnc_suspendHouse;
					zlt_lootHouses=zlt_lootHouses - [_x];
				};
			} foreach zlt_lootHouses;
			{
				if ((_x getVariable ["rbc_LootTime", time]) + zlt_lootSuspendTime < time ) then {
					[_x] call zlt_fnc_suspendBox;
					zlt_lootBoxes=zlt_lootBoxes - [_x];
				};
			} foreach zlt_lootBoxes;
		};
		rbc_stopLootThread = nil;
	};
};

0 call zlt_fnc_lootInit;