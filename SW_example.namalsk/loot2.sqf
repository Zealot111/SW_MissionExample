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

if (!isServer) exitwith {"Loot2.sqf не на сервере!"};

zloottableCat1 = 
{
	private "_res";_res = [];
	_wpclass = [
	// 
	"str_aks74u","str_ak74m","str_ak74m_gp","str_aks74u_tak","str_gm94","str_rg6", "bizon2_pist","str_gurza","str_kedr","kedr_pist","str_pb","str_pmm","str_so","str_strij_pp","str_tt","str_pp_vit","str_rpk74m","str_toz194","str_mp133","str_ij_obr","str_ij_long","str_sks_old","str_svd","str_3xlin_sn","str_akm_dvtl","str_akm_l_gl","str_pechen_m","str_to34_long","str_as_val","str_vss_vinl","rhs_weap_pkm","rhs_weap_svdp","rhs_weap_M590_8RD","rhs_weap_m4a1_carryhandle","rhs_weap_m16a4_carryhandle","rhs_weap_m16a4_carryhandle_M203","rhs_weap_m249_pip_L","rhs_weap_m32", "rhsusf_weap_glock17g4", "rhsusf_weap_glock17g4","rhsusf_weap_m1911a1", "rhs_weap_pya"
	] call bis_fnc_selectRandom;

	_res pushback _wpclass;
	if (isclass (configFile >> "CfgWeapons" >> _wpclass)) then {
		//добавить от 2 до 6 магазинов
		_maxnum = [2,6] call BIS_fnc_randomInt;
			for "_i" from 1 to _maxnum do {
				_res pushback ((getArray (configFile >> "CfgWeapons" >> _wpclass >> "magazines")) call bis_fnc_selectRandom );
			};
		//вероятность 0.5 для дульной насадки
		if (([0,1] call bis_fnc_randomNum) < 0.5) then { 
			_muzzles = getArray (configFile >> "CfgWeapons" >> _wpclass >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "CompatibleItems");
			if (count _muzzles > 0 ) then {
				_muzzle = _muzzles call bis_fnc_selectRandom;
				_res pushback _muzzle;
			};
		};
	
	
		//вероятность 0.5 для случайного прицела, подходящего к оружию
		if (([0,1] call bis_fnc_randomNum) < 0.5) then { 
			_optics = getArray (configFile >> "CfgWeapons" >> _wpclass >> "WeaponSlotsInfo" >> "CowsSlot" >> "CompatibleItems");
			if (count _optics > 0) then {
				_optic = _optics call bis_fnc_selectRandom;
				_res pushback _optic;
		
			};	
		};
				
	};
	
	
	
	
	_res;
};

zloottableCat2 = {
	private "_res";_res = [];
	private "_tbl";_tbl=	[
		0.2 ,	{ _res pushback "ItemRadio";},
		0.05 ,	{ _res pushback "ItemGPS";},
		0.05 ,	{ _res pushback "NVGoggles";},
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

	diag_log ["zlt_fnc_fillbox", _items];
	clearWeaponCargoGlobal _box;
	clearMagazineCargoGlobal _box;
	clearItemCargoGlobal _box;
	clearBackpackCargoGlobal _box;
	
	{_box addItemCargoGlobal _x;} foreach (_items call BIS_fnc_consolidateArray);
	
};



{
    if (_x isKindof "rhs_mags_crate") then {
        _script = _x spawn {_this call zlt_fnc_fillbox;};
        waitUntil {scriptDone _script};


    };
} foreach zlt_new_blocks;

