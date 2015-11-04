//#define DEBUG_MODE_FULL 
#include "common.hpp"
/*
aa = [missionConfigFile / "LootParameters" / "StalkerStdLootPoint"] call rbc_fnc_generateContainerContent


missionConfigFile / "LootParameters" / "TestLootPoint" / "TestCategory2"
*/

params ["_lootpointcfg"];

private ["_categoriesCheckProbNum","_categoriesProbability","_lootCategories","_lootCategoriesWeights","_fnc_processItem"];
private ["_res","_rnd","_cat","_itemsCheckProbNum","_itemsprobability","_items","_itemsweights","_rnd2","_item"];

 //private "_lootpointcfg";_lootpointcfg = missionConfigFile / "LootParameters" / _lootpoint;

 _categoriesCheckProbNum = getNumber ( _lootpointcfg / "categoriesCheckProbNum");
 _categoriesProbability = getNumber (_lootpointcfg / "categoriesProbability");
 _lootCategories = getArray (_lootpointcfg / "LootCategories");
 _lootCategoriesWeights = getArray (_lootpointcfg / "LootCategoriesWeights");

 TRACE_4("BEGIN",_categoriesCheckProbNum,_categoriesProbability,_lootCategories,_lootCategoriesWeights);
 
 _fnc_processItem = {
	params ["_cfg","_item","_arr"];
	private ["_classNames","_classNamesWeights","_classType","_class","_numbers","_num","_linkedItems","_linkedItemProbabilities"];
	TRACE_2("", _cfg, _item);
	if !(isclass ( _cfg / _item)) exitwith {
		 WARNING( format ["Отсутствует Item: %1 в %2",_item, _cfg]);
		 _arr
	};
	
	_classNames = getArray ( _cfg / _item / "classNames");
	_classNamesWeights = getArray ( _cfg / _item / "classNamesWeights");
	_classType = getNumber ( _cfg / _item / "classType");
	_numbers = getArray ( _cfg / _item / "numbers");
	_num = _numbers call bis_fnc_selectrandom;
	TRACE_7("", _cfg, _item, _classNames, _classNamesWeights, _classType, _numbers, _num );
	for "_k" from 1 to _num do {
		_class = [_classNames,_classNamesWeights] call rbc_fnc_selectRandomWeighted;
		(_arr select _classType) pushback _class;
		TRACE_2('CLS',_class, _arr);
	};
	_linkedItems = getArray (_cfg / _item / "linkedItems");
	_linkedItemProbabilities = getArray (_cfg / _item / "linkedItemProbabilities");
	{
		 if (_linkedItemProbabilities isEqualTo []) then {
			[_cfg, _x, _arr] call _fnc_processItem;
		} else {
			if (random 1 < (_linkedItemProbabilities select _foreachindex)) then {
				[_cfg, _x, _arr] call _fnc_processItem;
			};
		};
	} foreach _linkedItems;
	_arr
};
 
 
 _res = [[],[],[],[]];
 
 for "_i" from 1 to _categoriesCheckProbNum do {
	if (random 1 < _categoriesProbability ) then {
		_cat = [_lootCategories,_lootCategoriesWeights] call rbc_fnc_selectRandomWeighted;
		TRACE_2("CAT",_cat,isclass (_lootpointcfg / _cat));
		if (isclass (_lootpointcfg / _cat)) then {
			_itemsCheckProbNum = getNumber (_lootpointcfg / _cat / "itemsCheckProbNum");
			_itemsprobability = getNumber (_lootpointcfg / _cat / "itemsprobability");
			_items = getArray (_lootpointcfg / _cat / "Items");
			_itemsweights = getArray (_lootpointcfg / _cat / "ItemsWeights");
			TRACE_4("ITM",_itemsCheckProbNum,_itemsprobability,_items,_itemsweights);
			for "_j" from 1 to _itemsCheckProbNum do {
				if (random 1 < _itemsprobability) then {
					_item = [_items,_itemsweights] call rbc_fnc_selectRandomWeighted;
					if (isclass (_lootpointcfg / _cat / _item)) then {
						[_lootpointcfg / _cat, _item,_res] call _fnc_processItem;
					} else {
						WARNING( format ["Отсутствует Item: %1 в Cat:%2 в %3",_item, _cat, _lootpointcfg]);
					};
				};
			};
		} else {
			WARNING( format ["Отсутствует Category: %1 в %2",_cat, _lootpointcfg]);
		};
	};
};
						
_res