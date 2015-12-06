class ItemInfo;
class ItemCore;
class InventoryItem_Base_F;

class rbc_itemcore : ItemCore {
    type = 0;//4;
    detectRange = -1;
    simulation = "ItemMineDetector";
	class Armory
	{
		disabled = 0;
	};
	
};


class zlt_beer: rbc_itemcore
{
	scope = 2;
	author = "Zealot";
	displayName = "Пиво Красный Медведь темное";
	descriptionShort = "Не содержит радионуклеотидов!";
	picture = "\rbc_stalker\pics\Chem_beer.paa";
	class ItemInfo: InventoryItem_Base_F {
		mass = 5;
	};		
};
class zlt_radx: rbc_itemcore
{
	mass = 2;
	scope = 2;
	author = "Zealot";
	displayName = "Rad-X";
	descriptionShort = "Патентованный препарат-радиопротектор. Противопоказан при беременности!";
	picture = "\rbc_stalker\pics\Chem_Rad-X.paa";
	class ItemInfo: InventoryItem_Base_F {
		mass = 1;
	};		
	
	
};
class zlt_radaway: rbc_itemcore
{
	mass = 5;
	scope = 2;
	author = "Zealot";
	displayName = "Rad Away";
	descriptionShort = "Очень дефицитное импортное средство от радиации";
	picture = "\rbc_stalker\pics\Chem_RadAway.paa";
	class ItemInfo: InventoryItem_Base_F {
		mass = 5;
	};		
	
};
class zlt_rotgut: rbc_itemcore
{
	mass = 5;
	scope = 2;
	author = "Zealot";
	displayName = "Самогон";
	descriptionShort = "5 лет выдержки в бочке из под мазута";
	picture = "\rbc_stalker\pics\Chem_RotGut.paa";
	class ItemInfo: InventoryItem_Base_F {
		mass = 5;
	};		
};

class rbc_bacon: rbc_itemcore
{
	mass = 5;
	scope = 2;
	author = "zealot";
	displayName = "Тактический бекон";
	descriptionShort = "Для настоящих солдат";
	picture = "\rbc_stalker\pics\TacticalBacon.paa";
	model = "\A3\structures_f\Items\Food\TacticalBacon_F";
	class ItemInfo: InventoryItem_Base_F {
		mass = 5;
	};		
};
class rbc_beans: rbc_itemcore
{
	mass = 5;
	scope = 2;
	author = "zealot";
	displayName = "Консервированные бобы";
	descriptionShort = "Лучший друг туриста";
	picture = "\rbc_stalker\pics\BakedBeans.paa";
	model = "\A3\structures_f_epa\Items\Food\BakedBeans_F";
	class ItemInfo: InventoryItem_Base_F {
		mass = 5;
	};		
};

// Униформа










/*	
class rbc_adetector : rbc_itemcore {
	author = "def";
	displayname = "Детектор аномалий";
	descriptionshort = "Собран кустарным способом";
	model = "\A3\weapons_f\items\gps.p3d";
	picture = "\rbc_stalker\pics\rbc_adetector.paa";
	scope = 2;
	type = 0;
	class ItemInfo: InventoryItem_Base_F {
		mass = 2;
	};		
};
class rbc_adetector_small : rbc_itemcore {
	author = "def";
	displayname = "Детектор аномалий С-А2";
	descriptionshort = "Простейшая версия детектора аномалий";
	model = "\A3\weapons_f\items\gps.p3d";
	picture = "\rbc_stalker\pics\rbc_adetector_small.paa";
	scope = 2;
	type = 0;
	class ItemInfo: InventoryItem_Base_F {
		mass = 1;
	};		
};
*/
