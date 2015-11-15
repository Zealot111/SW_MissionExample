if (!hasInterface) exitWith {};

zlt_mOriginData = [
// медицина, еда
"AGM_Bandage", "AGM_Morphine", "AGM_Epipen", "AGM_Bloodbag", "zlt_radx", "zlt_radaway", "zlt_rotgut", "zlt_beer", "rbc_bacon", "rbc_beans",
 100, 200, 300, 500, 300, 3500, 200, 100, 80, 120,
// электроника и предметы
"RBCSW_Mask_M40_OD", "RBCSW_AdetectorCA1", "RBCSW_AdetectorCA2", "NVGoggles", "ItemCompass", "ItemMap", "ItemGPS", "ItemRadio", "Binocular",
1500, 1000, 3500, 5000, 150, 100, 2500, 2200, 1450,
// вещмешки
"B_TacticalPack_rgr","B_TacticalPack_blk","B_TacticalPack_oli","B_Kitbag_rgr","B_Carryall_oli","B_Carryall_khk","rhs_sidor",
1500,1450,1500,3000,2500,1000,
//оружие пистолеты и ПП
"av_makarov","av_aps","av_tt","rhsusf_weap_m1911a1","rhsusf_weap_glock17g4","av_pp2000","av_kedr",
500,1200,800,1500,2000,2500,3000,
//магазины пистолеты и ПП
"8Rnd_Mag_pm","8Rnd_Mag","30Rnd_9x21_Mag","30_9mm","rhsusf_mag_17Rnd_9x19_JHP","20Rnd_9x21_Mag",
60,80,120,150,120,150,
//оружие ружья
"str_sks_old", "str_ij_obr","str_ij_long","str_to34_long","optic_str_puold",
1500,1000,1200,1500,1000,
//магазины ружья
"2pul_pula", "10rnd_sks_mag","5rnd_762_mos",
40, 100, 80,
//оружие автоматы
"arifle_av_aksu", "arifle_av_ak74m_a", "arifle_av_ak74m_gp", "arifle_av_aks74", "arifle_av_groza", "arifle_av_groza_gp", "rhs_weap_akm", "rhs_weap_akm_gp25", "arifle_av_asval", "arifle_av_bizon",
2500,3000,3500,3200,4500,5000,2900,3400,13000,8100,
//магазины автоматы
"rhs_30Rnd_545x39_AK","rhs_VOG25","rhs_30Rnd_762x39mm", "64Rnd_9x19_mag", "20Rnd_av_9x39mm_SP5",
200,200,250,400,350,
//пулеметы
"arifle_av_rpk74_a", "av_pk_base",
15000,25000,
// пулеметы магазины
"rhs_45Rnd_545X39_AK", "rhs_100Rnd_762x54mmR",
300,1000,
//снайперки
"av_svu_h", "srifle_av_svda_h", "arifle_av_vss",
17000,15000,20000,
//снайперки магазины и прицелы
"rhs_10Rnd_762x54mmR_7N1", "20Rnd_av_9x39mm_SP5","optic_av_pso",
400, 350,5000,
//гранаты и гранатометы
"rhs_mag_rgd5", "rhs_mag_rdg2_white","rhs_weap_rshg2",
300,150,5000,
//одежда
"rhs_beanie_green","AV_CombatUniform_ST","TacVest_black", "av_shlem", "Rys_m2_def_GP","CamoH_Atacs","AAFVest01_berezka",
100,400,600,1200,600,500,400

];



zlt_merchantdataSell = [[


],[


]];


zlt_merchantDataBuy = [[


],[


]];

zlt_currentMerchant = objNull;


zlt_playerMoney = 500;


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
		_priceind = (_sellItemsClasses find _itemclass);
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
			_crate = zlt_currentMerchant getvariable "zlt_merchantCrate";
			_items = (weaponCargo _crate + magazinecargo _crate + itemCargo _crate + backpackCargo _crate) call BIS_fnc_consolidateArray;		
			hint parseText format [zlt_merchant_msgs select MSG_STATUS, zlt_playerMoney];
			_params params ["_display"];
			_ctrlSellItemsList = _display displayCtrl 1500;
			lbClear _ctrlSellItemsList;
			{
				_itemclass = _x select 0; _number = _x select 1;
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
	disableSerialization;
	params ["_params","_option"];
	private ["_buyitemsClasses","_buyItemPrices","_ctrlBuyItemsList","_data"];

	_buyitemsClasses = (zlt_currentMerchant getVariable ["zlt_buysellfnc",[[],[]]] select 1 select 0);
	_buyItemPrices = (zlt_currentMerchant getVariable ["zlt_buysellfnc",[[],[]]] select 1 select 1);
	switch (_option) do { 
		case "INIT" : {
			hint parseText format [zlt_merchant_msgs select MSG_STATUS, zlt_playerMoney];
//			waitUntil {dialog};
			_params params ["_display"];
			// fill list
			_ctrlBuyItemsList = _display displayCtrl 1500;
			{
				([_x] call zlt_fnc_getitemConfig) params ['_type','_image','_text','_tooltip','_cfgPath'];
				_ind = _ctrlBuyItemsList lbAdd format ["%1 (%2 RUR)",_text,_buyItemPrices select _forEachIndex];
				 _ctrlBuyItemsList lbSetPicture [_ind, _image];
				 _ctrlBuyItemsList lbSetTooltip [ _ind, _tooltip];
				 _ctrlBuyItemsList lbSetData [_ind, str [_x, _type, _buyItemPrices select _forEachIndex]];
			} foreach (_buyitemsClasses);
		}; 
		case "BUYBUTTON" : {
			if (lbCurSel 1500 == -1) exitWith {};
			_data = call compile lbData [1500, lbCurSel 1500];
			diag_log ["zlt_fnc_handleBuyMerchantMenu",_data];
			_data call zlt_fnc_playerbuy;
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
	params ["_pos","_dir"];
	private ["_bot","_safez","_safez","_markerstr"];
	// place bot
	_bot = "B_soldier_F" createVehicleLocal _pos;
	_pos params ["_x","_y","_z"];
	_crate = "plp_ct_StalkerCasketLeatherRed" createVehicleLocal getpos _bot;
	_crate setposatl ( [_pos, 1, _dir ] call BIS_fnc_relPos ); 
	_crate setdir _dir;

	_safez = "ProtectionZone_Invisible_F" createVehicleLocal getposatl _bot;
	_safez setposatl getposatl _bot;
	_bot setvariable ["zlt_merchantCrate", _crate];
	_bot setvariable ["zlt_buysellfnc",[zlt_merchantdataSell,zlt_merchantDataBuy]];
	_bot allowDamage false;
	_bot setdir _dir;

	//marker
	_markerstr = createMarkerLocal ["salebotname"+str (getposatl _bot),getposatl _bot];
	_markerstr setMarkerShapeLocal "ICON";
	_markerstr setMarkerTypeLocal "mil_dot";
	_markerstr setMarkerColorLocal "ColorOrange";
	_markerstr setMarkerTextLocal "Торговец";

	removeAllWeapons _bot;
	removeAllItems _bot;
	removeAllAssignedItems _bot;
	removeUniform _bot;
	removeVest _bot;
	removeBackpack _bot;
	removeHeadgear _bot;
	removeGoggles _bot;

	_bot forceAddUniform "U_C_HunterBody_grn";
	_bot addHeadgear "H_Hat_checker";
	_bot addMagazine "rhs_30Rnd_545x39_AK";
	_bot addWeapon "arifle_av_104_2";
	_bot addPrimaryWeaponItem "optic_av_aimp_2";
	_bot setFace "WhiteHead_20";
	_bot addAction ["Купить", {zlt_currentMerchant = (_this select 0); createDialog "RscStalkerMerchantBuy"; }];
	_bot addAction ["Продать", {zlt_currentMerchant = (_this select 0); createDialog "RscStalkerMerchantSell";  }];


};


sleep 1.;
// 
{
	if (typeName _x == typeName "") then {
	      (zlt_merchantdataSell select 0) pushBack _x;
	      (zlt_merchantDataBuy select 0) pushBack _x;
	};
	if (typeName _x == typeName 0) then {
		(zlt_merchantdataSell select 1) pushBack (_x/5);
      	(zlt_merchantDataBuy select 1) pushBack _x;
	};

} foreach zlt_mOriginData;


[[6916.76,8382.28,0.0619574],158.608] call zlt_fnc_createMerchant;
[[5314.57,9245.73,0.0601425],111.897] call zlt_fnc_createMerchant;
[[7815.88,10557.1,0.673497],338.499] call zlt_fnc_createMerchant;
[[6665.04,9666,0.0891151],6.20759] call zlt_fnc_createMerchant;
[[7815.88,10557.1,0.673497],338.499] call zlt_fnc_createMerchant;
[[4345.15,4793.17,0.144421],184.574] call zlt_fnc_createMerchant;

// создание конкретных торговцев по координатам

player addEventHandler ["Killed", {
	zlt_playerMoney = 500;
}];