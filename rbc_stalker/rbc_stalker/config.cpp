class CfgPatches
{
	class rbc_stalker
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"A3_Weapons_F"};
	};
};

class CfgSounds
{
	sounds[] = {};
	#include "sounds.hpp"
};

class EventHandlers;

class CfgVehicles 
{
	class RyanZombieB_Soldier_IndepResurrect;
	class ZobieStalkerBaseNoScript : RyanZombieB_Soldier_IndepResurrect {
		fsmDanger = "";
		fsmFormation = "";
		class EventHandlers: EventHandlers
		{
			init = "";
		};
	};
	class ZobieStalkerBase_IndepResurrect : ZobieStalkerBaseNoScript {
		hiddenSelections[]=	{
			"Camo","insignia"
		};
		hiddenSelectionsTextures[]=		{
			"\FFCamoPack\Data\Uniform_camo_01.paa"
		};		
	};	
	class ZobieStalkerBase_IndepResurrect2 : ZobieStalkerBaseNoScript {
		hiddenSelections[]=	{
			"Camo","insignia"
		};
		hiddenSelectionsTextures[]=		{
			"\FFCamoPack\Data\Uniform_camo_06.paa"
		};		
	};	
	class ZombieStalkerMedium1 : ZobieStalkerBase_IndepResurrect {
		moves="CfgRyanZombiesMovesMaleSdrMedium";
	};
	class ZombieStalkerMedium2 : ZobieStalkerBase_IndepResurrect2 {
		moves="CfgRyanZombiesMovesMaleSdrMedium";
	};
	class ZombieStalkerSlow1 : ZobieStalkerBase_IndepResurrect {
		moves="CfgRyanZombiesMovesMaleSdrSlow2";
	};
	class ZombieStalkerSlow2 : ZobieStalkerBase_IndepResurrect2 {
		moves="CfgRyanZombiesMovesMaleSdrSlow2";
	};	
};


class CfgWeapons {
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
			mass = 10;
		};		
	};
	class zlt_radx: rbc_itemcore
	{
		mass = 2;
		scope = 2;
		author = "Zealot";
		displayName = "Rad-X";
		descriptionShort = "Патентованный препарат-радиопротектор. <br/> Противопоказан при беременности!";
		picture = "\rbc_stalker\pics\Chem_Rad-X.paa";
		class ItemInfo: InventoryItem_Base_F {
			mass = 2;
		};		
		
		
	};
	class zlt_radaway: rbc_itemcore
	{
		mass = 10;
		scope = 2;
		author = "Zealot";
		displayName = "Rad Away";
		descriptionShort = "Очень дефицитное импортное средство от радиации";
		picture = "\rbc_stalker\pics\Chem_RadAway.paa";
		class ItemInfo: InventoryItem_Base_F {
			mass = 10;
		};		
		
	};
	class zlt_rotgut: rbc_itemcore
	{
		mass = 10;
		scope = 2;
		author = "Zealot";
		displayName = "Самогон";
		descriptionShort = "5 лет выдержки в бочке из под мазута";
		picture = "\rbc_stalker\pics\Chem_RotGut.paa";
		class ItemInfo: InventoryItem_Base_F {
			mass = 10;
		};		
		
	};
	
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
};



