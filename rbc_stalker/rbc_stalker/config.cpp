class CfgPatches
{
	class rbc_stalker
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"Weapons_F"};
	};
};

class CfgSounds
{
	sounds[] = {};
	#include "sounds.hpp"
};


class CfgWeapons {
	class ItemCore;
	class InventoryItem_Base_F;
	
	class rbc_itemcore : ItemCore {
        type = 4096;//4;
        detectRange = -1;
        simulation = "ItemMineDetector";
	};
	
	
	class rbc_adetector : rbc_itemcore {
		author = "def";
		displayname = "Детектор аномалий С-А1";
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
};


class CfgMagazines 
{
	class CA_Magazine;
	class zlt_beer: CA_Magazine
	{
		mass = 10;
		scope = 2;
		author = "Zealot";
		displayName = "Пиво Красный Медведь темное";
		descriptionShort = "Не содержит радионуклеотидов!";
		picture = "\rbc_stalker\pics\Chem_beer.paa";
	};
	class zlt_radx: CA_Magazine
	{
		mass = 2;
		scope = 2;
		author = "Zealot";
		displayName = "Rad-X";
		descriptionShort = "Патентованный препарат-радиопротектор. <br/> Противопоказан при беременности!";
		picture = "\rbc_stalker\pics\Chem_Rad-X.paa";
	};
	class zlt_radaway: CA_Magazine
	{
		mass = 10;
		scope = 2;
		author = "Zealot";
		displayName = "Rad Away";
		descriptionShort = "Очень дефицитное импортное средство от радиации";
		picture = "\rbc_stalker\pics\Chem_RadAway.paa";
	};
	class zlt_rotgut: CA_Magazine
	{
		mass = 10;
		scope = 2;
		author = "Zealot";
		displayName = "Самогон";
		descriptionShort = "5 лет выдержки в бочке из под мазута";
		picture = "\rbc_stalker\pics\Chem_RotGut.paa";
	};
};

