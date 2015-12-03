if (!hasInterface) exitWith {};

// параметры торговца

// allowedToBuy classes, itemGroups

// Шеуь
/*
[[["AGM_Bandage","AGM_Morphine","AGM_Epipen","AGM_Bloodbag","zlt_radx","zlt_radaway","zlt_rotgut","zlt_beer","rbc_bacon","rbc_beans"],[80,200,300,500,300,3500,200,100,120,80]],[["AGM_Bandage","AGM_Morphine","AGM_Epipen","AGM_Bloodbag","zlt_radx","zlt_radaway","zlt_rotgut","zlt_beer","rbc_bacon","rbc_beans"],[16,40,60,100,60,700,40,20,24,16]]]

[[["AGM_BANDAGE","AGM_MORPHINE","AGM_EPIPEN","AGM_BLOODBAG","ZLT_RADX","ZLT_RADAWAY","ZLT_ROTGUT","ZLT_BEER","RBC_BACON","RBC_BEANS"],[80,200,300,500,300,3500,400,200,240,160]],[["AGM_BANDAGE","AGM_MORPHINE","AGM_EPIPEN","AGM_BLOODBAG","ZLT_RADX","ZLT_RADAWAY","ZLT_ROTGUT","ZLT_BEER","RBC_BACON","RBC_BEANS"],[16,40,60,100,150,1750,40,20,24,16]]]

[[["AGM_BANDAGE","AGM_MORPHINE"],[800,2000]],[["ZLT_ROTGUT","ZLT_BEER","RBC_BACON","RBC_BEANS","AGM_BANDAGE","AGM_MORPHINE","AGM_EPIPEN","AGM_BLOODBAG"],[40,20,24,16,16,40,150,250]]]

*/


zlt_currentMerchant = objNull;
zlt_playerMoney = 5000;
player addEventHandler ["Killed", {zlt_playerMoney = 5000;}];


zlt_mItemsData = [
	"AGM_Bandage", 			80,				"MED_B",			
	"AGM_Morphine",			200,			"MED_B",
	"AGM_Epipen",			300,			"MED_A",
	"AGM_Bloodbag",			500,			"MED_A",
	"zlt_radx",				300,			"RAD",
	"zlt_radaway",			3500,			"RAD",
	"zlt_rotgut",			200,			"FOOD",
	"zlt_beer",				100,			"FOOD",
	"rbc_bacon",			120,			"FOOD",
	"rbc_beans",			80,				"FOOD"
];

zlt_mGroupsData = [
	"MED_B",		"Базовые медикаменты",
	"MED_A",		"Дополнительные медикаменты",
	"RAD",			"Противорадиационные препараты",
	"FOOD",			"Еда и напитки",
	"Misc",			"Разное"
];


// id, имя, предметы для покупки, предметы для продажи, 
zlt_mTraderIdentity = [
	["STD", ["Торговец","Торговец","U_C_HunterBody_grn","H_Hat_checker","WhiteHead_20",""], ["All",1], ["aLL",0.2]],
	["I2", ["Лавка Ивана","Иван Иванович","Униформа", "Шапка", "Очки", "Лицо", "Значек"], ["All",1, "Food", 2, "RAD"], ["aLL",0.2, "RAD", 0.5, "FOOD" ]],
	["I3", ["Лавка Ивана","Иван Иванович","Униформа", "Шапка", "Очки", "Лицо", "Значек"], ["MED_B",10], ["FOOD",0.2,"MED_B","MED_A", 0.5]]
];


private ["_fnc_checkUserData","_fnc_prepareUserData"];
	
_fnc_checkUserData = {

	if ((count zlt_mItemsData % 3) != 0) exitWith {diag_log ["Error:_fnc_checkUserData:Incorrect zlt_mItemsData "];};
	{
		if ((_foreachIndex) % 3 == 0) then {
			if !([zlt_mItemsData select _foreachIndex, zlt_mItemsData select (_foreachIndex+1), zlt_mItemsData select (_foreachIndex+2)] isEqualTypeArray ["",0,""]) exitWith {
				diag_log ["Error:_fnc_checkUserData:Incorrect zlt_mItemsData"];
			};
		};
	} foreach zlt_mItemsData;

	if ((count zlt_mGroupsData % 2) != 0) exitWith {diag_log ["Error:_fnc_checkUserData:Incorrect zlt_mGroupsData "];};

};

_fnc_prepareUserData = {
	private "_arrStrToUpper";
	_arrStrToUpper = { { if (_x isEqualType "") then { _this set [_foreachIndex, toUpper _x];}; } foreach _this;_this};
	zlt_mItemsData call _arrStrToUpper;
	{
		if (_foreachIndex % 2 == 0) then {
			zlt_mGroupsData set [_foreachIndex, toUpper _x];
		};
	} foreach zlt_mGroupsData;
	private "_temp"; _temp = [];
	{
		_x params ["_a","_b","_c","_d"];
		_a= toUpper _a; _c call _arrStrToUpper; _d call _arrStrToUpper;
		_temp pushback [_a,_b,_c,_d];
	} foreach zlt_mTraderIdentity;
	zlt_mTraderIdentity = _temp;
};

zlt_fnc_mGetGroupName = {
	params ["_gr"]; 
	private "_ind"; _ind = zlt_mGroupsData find toUpper _gr ;
	if (_ind == -1) exitWith {diag_log ["zlt_fnc_mGetGroupName:Error:NoSuchItem",_this];nil};
	(zlt_mGroupsData select _ind + 1)
};

zlt_fnc_mGetItemGroup = {
	params ["_item"];
	private "_ind"; _ind = zlt_mItemsData find toUpper _item ;
	if (_ind == -1) exitWith {diag_log ["zlt_fnc_mGetItemGroup:Error:NoSuchItem",_this];nil};
	(zlt_mItemsData select _ind + 2)
};

zlt_fnc_mItemIsInGroup = {
	params ["_item", "_group"];
	[toUpper _item, toUpper _group] params ["_item","_group"];
	if (_group == "ALL") exitWith {true};
	private "_ind"; _ind = zlt_mItemsData find _item ;
	if (_ind == -1) exitWith {diag_log ["zlt_fnc_mItemIsInGroup:Error:NoSuchItem",_this];nil};
	(zlt_mItemsData select _ind + 2) == _group
};

zlt_fnc_getItemsPrices = {
	params ["_trID"];
	_fnc_getClassesPrices = {
		params ["_class", "_factor"];_class = toUpper _class; private ["_res","_ind"];_res=[];
		//diag_log ["_fnc_getClassesPrices",_this];
		switch (true) do {
			case (_class == "ALL") : {
				{
					if (_foreachIndex % 3 == 0 ) then {
						_res pushBack (zlt_mItemsData select _foreachIndex );
						_res pushBack ((zlt_mItemsData select _foreachIndex +1) * _factor );
					};
				} foreach zlt_mItemsData;
			};		
			case (_class in zlt_mGroupsData) : {
				{
					if (_class isEqualTo _x ) then {
						_res pushBack (zlt_mItemsData select _foreachIndex -2 ); 
						_res pushBack ((zlt_mItemsData select _foreachIndex -1) * _factor );
					};
				} foreach zlt_mItemsData;
			};
			default {
				_ind = zlt_mItemsData find _class;
				if (_ind != -1) then {
					_res pushBack (zlt_mItemsData select _ind); _res pushBack ((zlt_mItemsData select _ind +1 ) * _factor);
				} else {diag_log ["_fnc_getClassesPrices error:IncorrectClass",_this, _class];};
			};
		};
		//diag_log ["_fnc_getClassesPrices", _res];
		_res
	};
	private ["_buyItemsRes","_sellItemsRes","_priceFactor","_prices","_ind"];
	_trID = toUpper _trID;
	_buyItemsRes = [[],[]], _sellItemsRes = [[],[]];
	{
		if (_x select 0 == _trID) exitWith {_trID = _x;};
	} foreach zlt_mTraderIdentity;
	if (_trID isEqualType "") exitWith {diag_log ["zlt_fnc_getItemsPrices:NoSuchTraderID", _this];};
	_trID params ["_id","_name","_buyItems","_sellItems"];
	// buyItems
	{
		if (_x isEqualType "") then {
			_priceFactor = 1;
			if ((count _buyItems-1) >= _foreachIndex + 1 && { _buyItems select _foreachIndex + 1 isEqualType 0}) then {
				_priceFactor = _buyItems select _foreachIndex + 1;
			};
			_prices = [_x, _priceFactor] call _fnc_getClassesPrices;
			{	
				if (_x isEqualType "") then {
					_ind = (_buyItemsRes select 0) find _x;
					if (_ind == -1) then {
						(_buyItemsRes select 0) pushBack _x;
						(_buyItemsRes select 1) pushback (_prices select _foreachIndex + 1);
					} else {
						(_buyItemsRes select 1) set [_ind, _prices select _foreachIndex + 1 ];
					};
				};
			} foreach _prices;
		};
	} foreach _buyItems;
	{
		if (_x isEqualType "") then {
			_priceFactor = 0.2;
			if ((count _sellItems-1) >= _foreachIndex + 1 && { _sellItems select _foreachIndex + 1 isEqualType 0}) then {
				_priceFactor = _sellItems select _foreachIndex + 1;
			};
			_prices = [_x, _priceFactor] call _fnc_getClassesPrices;
			{	
				if (_x isEqualType "" ) then {
					_ind = (_sellItemsRes select 0) find _x;
					if (_ind == -1) then {
						(_sellItemsRes select 0) pushBack _x;
						(_sellItemsRes select 1) pushback (_prices select _foreachIndex + 1);
					} else {
						(_sellItemsRes select 1) set [_ind, _prices select _foreachIndex + 1 ];
					};
				};
			} foreach _prices;
		};
	} foreach _sellItems;
	diag_log ["zlt_fnc_getItemsPrices", _this, _trID, [_buyItemsRes, _sellItemsRes]];
	[_sellItemsRes, _buyItemsRes]

};


zlt_mOriginData = [
// медицина, еда
"AGM_Bandage", "AGM_Morphine", "AGM_Epipen", "AGM_Bloodbag", "zlt_radx", "zlt_radaway", "zlt_rotgut", "zlt_beer", "rbc_bacon", "rbc_beans",
 80, 			200,			 300, 			500,			 300,	 3500, 			200,			 100,		 120, 		80,
// электроника и предметы
"RBCSW_Mask_M40_OD", "RBCSW_AdetectorCA2", "RBCSW_AdetectorCA1", "NVGoggles", "ItemCompass", "ItemMap", "ItemGPS", "ItemRadio", "Binocular",
500,					 1000,				 3500, 					5000,		 150,			 350, 		2500,	 2200,		 1450,
// вещмешки
"B_TacticalPack_rgr","B_TacticalPack_blk","B_TacticalPack_oli","B_Kitbag_rgr","B_Carryall_oli","B_Carryall_khk",
1500,					1450,				1500,				3000,			2500,			2500,		
//одежда
"AV_Ghillie_W","AV_CombatUniform_ter20","AV_CombatUniform_DES","AV_CombatUniform_ter14","AV_CombatUniform_ST","AV_CombatUniform_kml_S","AV_CombatUniform_SF","AV_Uniform_STRU_2","CamoU_green","CamoU_UrbKamysh",
6000,      600, 610,700,650,                                    200,                                          570,                                     780,                               1200,                    400,                               
//шапки и каски
"rhs_beanie_green","av_shlem","av_shlem_chehol2","av_pako","H_Bandanna_khk","H_Bandanna_gry","H_Bandanna_camo","H_Bandanna_cbr","H_Beret_blk","H_Cap_blk","H_ShemagOpen_khk","H_ShemagOpen_tan","H_Shemag_olive","H_Booniehat_oli","H_Booniehat_khk","CamoH_Green","CamoH_Black","min_rf_bandana_olive","min_rf_beanie_black","G_Balaclava_blk",
100,                             2000,              2100,                           100,            50,                            50,                            50,                              50,                           100,                     90,                  95,                              95,                                   95,                          110,                             110,                            400,                   410,                     65,                                        80,                                       30, 
//броники и разгрузки
"6B3","6B5","AAFVest01_l_green","AAFVest01_h_green","TacVest_black","V94_ch2","Tarzan_w_bron","Tarzan_ch_bron","V94_zel2",
500,   600,     2500,                         3000,                               2200,                       2400,           3500,                      3550,                      2500,

"RH_mak","av_aps","RH_tt33","RH_m9","RH_deagle","RH_cz75","RH_g17","RH_usp","RH_m1911","RH_p226",
500,			1200,	600,	1100,				2000,	1200, 1250, 1500,1000,				
//магазины пистолеты 
"RH_8Rnd_9x18_Mak","20Rnd_9x21_Mag","RH_8Rnd_762_tt33","RH_15Rnd_9x19_M9","RH_7Rnd_50_AE","RH_16Rnd_9x19_CZ","RH_12Rnd_45cal_usp","RH_7Rnd_45cal_m1911","RH_15Rnd_9x19_SIG","RH_suppr9",
60,				80,			50,			150,		120,					150, 120, 110, 100,100,200,
//оружие ПП
"av_pp2000","av_kedrpp","RH_vz61","RH_tec9","RH_muzi",
2500, 2300, 2100, 3000, 2800,
//магазины ПП
"RH_20Rnd_32cal_vz61","RH_32Rnd_9x19_tec","30Rnd_9x21_Mag","RH_30Rnd_9x19_UZI","muzzle_snds_L",
100, 90,120,100,250,
//оружие ружья
"str_sks_old", "str_ij_obr","str_ij_long","str_to34_long",
1500,			1000,			1200,		1500,			
//магазины ружья
"2pul_pula", "10rnd_sks_mag","5rnd_762_mos",
40,				 100,			 80,
//оружие автоматы
"arifle_av_aksu", "arifle_av_ak74_1", "arifle_av_ak74g", "arifle_av_aks74", "arifle_av_akm", "arifle_akm_gp", "arifle_av_akms","arifle_akms_gp", "arifle_av_groza", "arifle_av_groza_gp","arifle_av_aek","arifle_av_aekg","arifle_av_asval","av_Saiga12K","RH_M16A2","arifle_av_bizon","RH_sbr9","RH_M16A2gl","RH_hk416s_des","RH_M4A1_ris","RH_M4A1_ris_M203",
2500,			              	3000,			                 	3200,				           	2800,		                	2500,			            	2700,			        	2600,			            	2800,			            	8000,			        	8200,                                    7200,                     7400,                        12000,                       6000,                   4200,            5000,                          3200,          4400,                 6200,                    7100,                   7300 ,   
//магазины автоматы
"30Rnd_ak_545x39_mag","1Rnd_HE_Grenade_shell","30Rnd_ak_762x39_mag", "64Rnd_9x19_mag", "20Rnd_av_9x39mm_SP5","av_Saiga12_M","30Rnd_9x21_Mag","30Rnd_556x45_Stanag","av_kobra","optic_av_aimp","RH_compm4s","RH_ta01nsn","muzzle_av_snds","RH_spr_mbs",
200,					                 200,		                             	250,		                            	400,			            	350,                                 120,                       120,                          80,                                       250,            280,                        400,                  1200,                  350,                         380,
//пулеметы
"arifle_av_rpk74_a", "av_pk_base",
15000,25000,
// пулеметы магазины
"45Rnd_ak_545x39_mag", "200Rnd_av_762x39_mag",
300,1000,
//снайперки
"av_svu_h", "srifle_av_svda_h", "arifle_av_vss","RH_Mk11",
17000,15000,20000,22000,
//снайперки магазины и прицелы
"10Rnd_av_762x39_svd", "20Rnd_av_9x39mm_SP5","optic_av_pso","RH_ta31rmr","muzzle_av_snds",
400, 350,3800, 3600,500


];






#define MSG_MAIN 0
#define MSG_STATUS 1

zlt_merchant_msgs = [
"<t color='#aaa0a0' size='1.2' shadow='1' shadowColor='#000000' align='center'>%1</t>",
"<t color='#aaa0a0' size='1.35' shadow='1' shadowColor='#000000' align='center'>У вас <t color='#aaaa00'>%1</t> RUR</t>"

];








// reutrns [type, image, text]
zlt_fnc_getitemConfig = {
	params ["_name"];
	private ['_type','_image','_text','_tooltip','_cfgPath'];
	_type = "";
	_image = "";
	_text = "";
	_tooltip = "";
	_cfgPath = "";
	switch (true) do {
		case (isClass (configFile / "CfgWeapons" / _name)) : {
			_type = "item"; 
			_cfgPath = "CfgWeapons";
		};
		case (isClass (configFile / "CfgMagazines" / _name)) : {
			_type = "mag"; 
			_cfgPath = "CfgMagazines";
		};
		case (isclass (configFile / "CfgVehicles" / _name)) : {
			_type = "backpack"; 
			_cfgPath = "CfgVehicles";
		};
		case (isclass (configFile / "CfgGlasses" / _name)) : {
			_type = "glasses"; 
			_cfgPath = "CfgGlasses";
		};
		default {diag_log ["zlt_fnc_getitemConfig:Error:Unknownclass",_name];};
	};
	_image = getText (configFile / _cfgPath / _name / "picture") ;
	_text = getText (configFile / _cfgPath / _name / "displayName") ;
	_tooltip = getText (configFile / _cfgPath / _name / "descriptionShort");
	diag_log ["zlt_fnc_getitemConfig",_this, _type, _image, _text, _tooltip, _cfgPath] ;
	[_type, _image, _text, _tooltip, _cfgPath]
};

zlt_fnc_sellAll = {
	private ["_crate","_sellItemsClasses","_sellItemPrices","_items","_price","_priceind"];
	_crate = zlt_currentMerchant getvariable "zlt_merchantCrate";
	_sellItemsClasses = (zlt_currentMerchant getVariable ["zlt_buysellfnc",[[],[]]] select 0 select 0);
	_sellItemPrices = (zlt_currentMerchant getVariable ["zlt_buysellfnc",[[],[]]] select 0 select 1);	
	_items = (weaponCargo _crate + magazinecargo _crate + itemCargo _crate + backpackCargo _crate);
	{
		_price = 50;
		_priceind = (_sellItemsClasses find (toUpper _x));
		if (_priceind != -1) then {_price = _sellItemPrices select (_priceind);};
		zlt_playerMoney = zlt_playerMoney + _price;
	} foreach _items;
	clearItemCargo _crate;clearWeaponCargo _crate;clearMagazineCargo _crate; clearBackpackCargo _crate;
	hint parsetext format [zlt_merchant_msgs select MSG_STATUS, zlt_playerMoney ];
};


zlt_fnc_handleSellMerchantMenu = {
	disableSerialization;
	params ["_params","_option"];
	private ["_sellItemsClasses","_sellItemPrices","_crate","_data","_items","_ctrlSellItemsList","_ind","_price","_priceind","_itemclass","_number"];

	switch (_option) do { 
		case "INIT" : {
			_sellItemsClasses = (zlt_currentMerchant getVariable ["zlt_buysellfnc",[[],[]]] select 0 select 0);
			_sellItemPrices = (zlt_currentMerchant getVariable ["zlt_buysellfnc",[[],[]]] select 0 select 1);
			diag_log ["zlt_fnc_handleSellMerchantMenu", _sellItemsClasses, _sellItemPrices];
			_crate = zlt_currentMerchant getvariable "zlt_merchantCrate";
			_items = (weaponCargo _crate + magazinecargo _crate + itemCargo _crate + backpackCargo _crate) call BIS_fnc_consolidateArray;		
			hint parseText format [zlt_merchant_msgs select MSG_STATUS, zlt_playerMoney];
			_params params ["_display"];
			_ctrlSellItemsList = _display displayCtrl 1500;
			lbClear _ctrlSellItemsList;
			{
				_itemclass = toUpper(_x select 0); _number = _x select 1;
				_priceind = (_sellItemsClasses find _itemclass);
				_price = 50;
				if (_priceind != -1) then {
					_price = _sellItemPrices select (_priceind);
				};
				([_itemclass] call zlt_fnc_getitemConfig) params ['_type','_image','_text','_tooltip','_cfgPath'];
				_ind = _ctrlSellItemsList lbAdd format ["%1 x%3 (%2 RUR)",_text,_price, _number];
				 _ctrlSellItemsList lbSetPicture [_ind, _image];
				 _ctrlSellItemsList lbSetTooltip [ _ind, _tooltip];
				 _ctrlSellItemsList lbSetData [_ind, str [_itemclass, _type, _price]];
			} foreach (_items);
		}; 
		case "SELLBUTTON" : {
			closeDialog 1;
			[] call zlt_fnc_sellAll;

		}; 
		case "SELLDBLCLICK" : {

		};

		default {  diag_log ["Error, wrong zlt_fnc_handleBuyMerchantMenu option",_this]; }; 
	};





};


zlt_fnc_playerbuy = {
	params ["_class","_type","_price"];
	private ["_crate"];

	//checkmoney
	if (zlt_playerMoney < _price) exitWith {
		hint parseText format [zlt_merchant_msgs select MSG_MAIN,"У вас недостаточно денег для покупки!"];
	};

	zlt_playerMoney = zlt_playerMoney - _price;
	_crate = zlt_currentMerchant getvariable "zlt_merchantCrate";

	switch (_type) do { 
		case "mag" : {
			_crate addMagazineCargo [_class,1];
		}; 
		case "weapon" :  {
			_crate addWeaponCargo [_class,1];
		};
		case "backpack" : {
			_crate addBackpackCargo [_class,1];
		};
		default { _crate addItemCargo [_class,1]; }; 
	};
	hint parsetext format [zlt_merchant_msgs select MSG_STATUS, zlt_playerMoney ];

};


zlt_fnc_handleBuyMerchantMenu = {
	//disableSerialization;
	params ["_params","_option"];
	diag_log ["zlt_fnc_handleBuyMerchantMenu",_this];
	private ["_buyitemsClasses","_buyItemPrices","_ctrlBuyItemsList","_data","_ctrlComboGroups","_fnc_fillList"];
	
	_fnc_fillList = {
		params ["_iclasses", "_iprices", "_group"];private ["_ind"];
		_group = toUpper _group ;
		lbClear 1500;
		{
			if ( [_x, _group] call zlt_fnc_mItemIsInGroup) then {
				([_x] call zlt_fnc_getitemConfig) params ['_type','_image','_text','_tooltip','_cfgPath'];
				_ind = lbAdd [1500,format ["%1 (%2 RUR)",_text,_iprices select _forEachIndex]];
				 lbSetPicture [1500,_ind, _image];
				 lbSetTooltip [1500, _ind, _tooltip];
				 lbSetData [1500,_ind, str [_x, _type, _iprices select _forEachIndex]];
			};
		} foreach _iclasses
	};
	_fnc_fillCombo = {
		params ["_items"];private ["_ind","_gr","_grname","_added"];
		_ind = lbAdd [2100,format ["%1","Все"]];
		lbSetData [2100,_ind, "ALL"];
		lbSetCurSel [2100, 0];
		_added = [];
		{
			_gr = [_x] call zlt_fnc_mGetItemGroup;
			if !(_gr in _added) then {
				_grname = [_gr] call zlt_fnc_mGetGroupName;
				_added pushBack _gr;
				_ind =  lbAdd [2100,format ["%1",_grname]];
				lbSetData [2100, _ind, _gr];
			};
		} foreach _items;
	};

	_buyitemsClasses = (zlt_currentMerchant getVariable ["zlt_buysellfnc",[[],[]]] select 1 select 0);
	_buyItemPrices = (zlt_currentMerchant getVariable ["zlt_buysellfnc",[[],[]]] select 1 select 1);
	switch (_option) do { 
		case "INIT" : {
			hint parseText format [zlt_merchant_msgs select MSG_STATUS, zlt_playerMoney];
			waitUntil {dialog};
			[_buyitemsClasses, _buyItemPrices, "All"] call _fnc_fillList;
			[_buyitemsClasses ] call _fnc_fillCombo;
		}; 
		case "BUYBUTTON" : {
			if (lbCurSel 1500 == -1) exitWith {};
			_data = call compile lbData [1500, lbCurSel 1500];
			diag_log ["zlt_fnc_handleBuyMerchantMenu",_data];
			_data call zlt_fnc_playerbuy;
		}; 
		case "COMBO" : {
			[ _buyitemsClasses, _buyItemPrices, lbData [2100,(_this select 0) select 1]] call _fnc_fillList;
		};
		case "BUYDBLCLICK" : {
			_params params ["_ctrl","_ind"];
			if (lbCurSel 1500 == -1) exitWith {};
			_data = call compile lbData [1500, lbCurSel 1500];
			diag_log ["zlt_fnc_handleBuyMerchantMenu",_data];
			_data call zlt_fnc_playerbuy;
		};

		default {  diag_log ["Error, wrong zlt_fnc_handleBuyMerchantMenu option",_this]; }; 
	};


};




zlt_fnc_createMerchant = {
	params ["_pos","_dir", "_id"];
	private ["_bot","_safez","_safez","_markerstr","_chair","_indID","_iddata"];
	// place bot
	_id = toUpper _id;
	_bot = "B_soldier_F" createVehicleLocal _pos;
	_bot setposatl _pos;
	_pos params ["_x","_y","_z"];
	
	_crate = "plp_ct_FootlockerStalkerBrown" createVehicleLocal getpos _bot;
	_crate setposatl ( [_pos, 1, _dir ] call BIS_fnc_relPos ); 
	_crate setdir _dir;
	
	_chair = "Land_ChairWood_F" createVehicleLocal getpos _bot;
	_chair setPosATL _pos;
	_chair enableSimulation false;
	_chair setDir _dir+180;
	_bot switchMove "Crew";

	_safez = "ProtectionZone_Invisible_F" createVehicleLocal getposatl _bot;
	_safez setposatl getposatl _bot;
	_bot setvariable ["zlt_merchantCrate", _crate];
	//_bot setvariable ["zlt_buysellfnc",[zlt_merchantdataSell,zlt_merchantDataBuy]];
	_bot setVariable ["zlt_mIdentity", _id];
	_indID = 0;
	{
		if (_x select 0 == _id) exitWith {_indID=_foreachIndex;};
	} foreach zlt_mTraderIdentity;
	_iddata = zlt_mTraderIdentity select _indID select 1;
	// ["Лавка Ивана","Иван Иванович","Униформа", "Шапка", "Очки", "Лицо", "Значек"]
	// ["Торговец","Торговец","U_C_HunterBody_grn","H_Hat_checker","WhiteHead_20",""];
	_iddata params ["_marker", "_name", "_uniform","_head","_gogles","_face","_insign"];
	
	
	_bot allowDamage false;
	_bot setdir _dir;
	_bot setvariable ["PlayerName",_name];
	_bot enableSimulation false;

	//marker
	_markerstr = createMarkerLocal ["salebotname"+str (getposatl _bot),getposatl _bot];
	_markerstr setMarkerShapeLocal "ICON";
	_markerstr setMarkerTypeLocal "mil_dot";
	_markerstr setMarkerColorLocal "ColorOrange";
	_markerstr setMarkerTextLocal _marker;

	removeAllWeapons _bot;
	removeAllItems _bot;
	removeAllAssignedItems _bot;
	removeUniform _bot;
	removeVest _bot;
	removeBackpack _bot;
	removeHeadgear _bot;
	removeGoggles _bot;
	if (_uniform != "") then {_bot forceAddUniform _uniform;};
	if (_head != "") then { _bot addHeadgear _head;};
	if (_face != "") then {_bot setFace _face;};
	if (_insign != "") then {[_bot,_insign] call BIS_fnc_setUnitInsignia;};
	_bot addAction ["Купить", {zlt_currentMerchant = (_this select 0); createDialog "RscStalkerMerchantBuy"; zlt_currentMerchant setvariable ["zlt_buysellfnc",[zlt_currentMerchant getvariable "zlt_mIdentity"] call zlt_fnc_getItemsPrices]; }];
	_bot addAction ["Продать", {zlt_currentMerchant = (_this select 0); createDialog "RscStalkerMerchantSell";  zlt_currentMerchant setvariable ["zlt_buysellfnc",[zlt_currentMerchant getvariable "zlt_mIdentity"] call zlt_fnc_getItemsPrices]; }];
};

call _fnc_checkUserData;
call _fnc_prepareUserData;

/*
sleep 1.;
// 


[[13089.6,12897.2,0.00143814],200.904] call zlt_fnc_createMerchant; //возле белого
[[11305.8,17802.6,0.00149727],282.135] call zlt_fnc_createMerchant; //на севере
[[15146.9,7885.03,0.323502],122.21] call zlt_fnc_createMerchant; // на юге
[[16449.6,14340.4,0.485538],86.6077] call zlt_fnc_createMerchant; //долг
[[7814.91,9130.27,0.359283],296.324] call zlt_fnc_createMerchant; //монолит

// создание конкретных торговцев по координатам

*/