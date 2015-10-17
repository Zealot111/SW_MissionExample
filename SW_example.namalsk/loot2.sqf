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
	_res pushback (["ItemMap","ItemRadio","ItemGPS","NVGoggles","Binocular",["Mask_M40","Mask_M40_OD","Mask_M50"] call bis_fnc_selectRandom] call bis_fnc_selectRandom);
	_res;
};


zloottableCat3 = {
	private "_res";_res = [];
	// гарантировано от 2 до 6 бинтов
	
	_maxnum = [2,6] call BIS_fnc_randomInt;
	for "_i" from 1 to _maxnum do {
		_res pushback "AGM_Bandage";
	};

	// 0.5 шанс что будет 1 AGM_Morphine
	if (([1,2] call BIS_fnc_randomInt) == 1) then {
		_res pushback "AGM_Morphine";
	};

	// 0.3 шанс что будет 1 AGM_Epipen
	if (([1,2,3] call BIS_fnc_randomInt) == 1) then {
		_res pushback "AGM_Epipen";
	};
	
	// 0.25 шанс что будет 1 AGM_Bloodbag
	if (([1,2,3,4] call BIS_fnc_randomInt) == 1) then {
		_res pushback "AGM_Bloodbag";
	};
	_res;
};

//пока нет
zloottableCat4 = {

	[];
};

zlt_fnc_fillbox = {
	// вероятности по категориям
	// [1, 0.5, 1, 0]
	
    private ["_box","_index"];
    _box = _this;
	_items = [];
	
	if (([0,1] call bis_fnc_randomNum) < 1) then {_items append (0 call zloottableCat1);};
	if (([0,1] call bis_fnc_randomNum) < 0.5) then {_items append (0 call zloottableCat2);};
	if (([0,1] call bis_fnc_randomNum) < 1) then {_items append (0 call zloottableCat3);};
	if (([0,1] call bis_fnc_randomNum) < 0) then {_items append (0 call zloottableCat4);};
	diag_log ["zlt_fnc_fillbox", _items];
	clearWeaponCargoGlobal _box;
	clearMagazineCargoGlobal _box;
	clearItemCargoGlobal _box;
	clearBackpackCargoGlobal _box;
	
	{_box addItemCargoGlobal [_x,1];} foreach _items;
	
};


zlt_fnc_fillholder = {


};


{
    if (_x isKindof "rhs_mags_crate") then {
        _script = _x spawn {_this call zlt_fnc_fillbox;};
        waitUntil {scriptDone _script};


    };
} foreach zlt_new_blocks;

