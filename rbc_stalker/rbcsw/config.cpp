#define _ARMA_
// thanx for 3d model etc to Hidden Identity Pack V2 authors

//Class rbc_stalker_wars_gasmasks : config.bin{
class CfgPatches
{
	class rbc_stalker_wars_gasmasks
	{
		units[] = {};
		weapons[] = {"RBCSW_AdetectorCA1","RBCSW_AdetectorCA2"};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Weapons_F","rbc_stalker"};
	};
};
class RscTitles
{	
	#include "adetector\titles.hpp"
};

class CfgGlasses
{
	class None;
	class RBCSW_Mask_M50: None
	{
		displayname = "M50 Gas Mask";
	};
	class RBCSW_Mask_M50_Dolg: RBCSW_Mask_M50
	{
		displayname = "M50 Gas Mask - Dolg";
		model = "\rbcsw\dolg\M50_DOLG.p3d";
		picture = "\rbcsw\dolg\UI\tempUI.paa";
		identityTypes[] = {"NoGlasses",0,"G_NATO_default",0,"G_NATO_casual",0,"G_NATO_pilot",0,"G_NATO_recon",0,"G_NATO_SF",0,"G_NATO_sniper",0,"G_NATO_diver",0,"G_IRAN_default",0,"G_IRAN_diver",0,"G_GUERIL_default",0,"G_HAF_default",0,"G_CIVIL_female",0,"G_CIVIL_male",0};
	};
	class RBCSW_Mask_M50_DolgExtrared: RBCSW_Mask_M50
	{
		displayname = "M50 Gas Mask - Dolg Red";
		model = "\rbcsw\dlgr\M50_DOLGRED.p3d";
		picture = "\rbcsw\dlgr\UI\tempUI.paa";
		identityTypes[] = {"NoGlasses",0,"G_NATO_default",0,"G_NATO_casual",0,"G_NATO_pilot",0,"G_NATO_recon",0,"G_NATO_SF",0,"G_NATO_sniper",0,"G_NATO_diver",0,"G_IRAN_default",0,"G_IRAN_diver",0,"G_GUERIL_default",0,"G_HAF_default",0,"G_CIVIL_female",0,"G_CIVIL_male",0};
	};
	class RBCSW_Mask_M50_Monolyth: RBCSW_Mask_M50
	{
		displayname = "M50 Gas Mask - Monolyth";
		model = "\rbcsw\mnlt\M50_MONOLYTH.p3d";
		picture = "\rbcsw\mnlt\UI\tempUI.paa";
		identityTypes[] = {"NoGlasses",0,"G_NATO_default",0,"G_NATO_casual",0,"G_NATO_pilot",0,"G_NATO_recon",0,"G_NATO_SF",0,"G_NATO_sniper",0,"G_NATO_diver",0,"G_IRAN_default",0,"G_IRAN_diver",0,"G_GUERIL_default",0,"G_HAF_default",0,"G_CIVIL_female",0,"G_CIVIL_male",0};
	};
	class RBCSW_Mask_M50_Main: RBCSW_Mask_M50
	{
		displayname = "M50 Gas Mask - MAIN";
		model = "\rbcsw\mask\M50_GM.p3d";
		picture = "\rbcsw\mask\UI\tempUI.paa";
		identityTypes[] = {"NoGlasses",0,"G_NATO_default",0,"G_NATO_casual",0,"G_NATO_pilot",0,"G_NATO_recon",0,"G_NATO_SF",0,"G_NATO_sniper",0,"G_NATO_diver",0,"G_IRAN_default",0,"G_IRAN_diver",0,"G_GUERIL_default",0,"G_HAF_default",0,"G_CIVIL_female",0,"G_CIVIL_male",0};
	};
};
class cfgWeapons
{
/*	class ItemCore;
	class InventoryItem_Base_F;
	
	class rbc_itemcore : ItemCore {
        type = 4096;//4;
        detectRange = -1;
        simulation = "ItemMineDetector";
	};
*/
	class InventoryItem_Base_F;
	class rbc_itemcore;
	class RBCSW_AdetectorCA1: rbc_itemcore
	{
		author = "def";
		scope = 2;
		displayName = "Детектор аномалий С-А1";
		picture = "\rbcsw\adetector\UI\rbc_adetector_ca1.paa";
		model = "\rbcsw\ADetector\ca1.p3d";
		descriptionshort = "Изготовлен кустарным способом";
		class ItemInfo: InventoryItem_Base_F {
			mass = 2;
		};		
	};
	class RBCSW_AdetectorCA2: rbc_itemcore
	{
		author = "def";
//		_generalMacro = "ItemGPS";
		scope = 2;
		displayName = "Детектор аномалий С-А2";
//		descriptionUse = "use desc";
//		simulation = "ItemGPS";
		picture = "\rbcsw\adetector\UI\rbc_adetector_ca2.paa";
		model = "\rbcsw\ADetector\ca2.p3d";
		descriptionshort = "Собран по инструкции из интернета";
		class ItemInfo: InventoryItem_Base_F {
			mass = 2;
		};		
	};
};
//};
