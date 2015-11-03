 /*
*	Возможность указывать несколько lootpoints для домов	
 
 */
 
 class LootParameters {
	class LootSpawnParameters {
		enabled=1; 
		playerCheckDistance = 100; // 100m radius
		pauseBetweenChecks = 7.2;
		lootRenewTime = 900 ; // 900;  количество секунд до регенерации лута
		lootSuspendTime = 180 ;  //180;  количество секунд до сохранения лута
		
		lootHouseClasses[] = {"House","House_F"};
		lootBoxesClasses[] = {"rhs_mags_crate"};
		
	};

	class LootSpawnPoints {
		class Default {
			useStandardBuildingPos = 1; // использовать стандартные координаты через BuildINgPos 2 через строку, 3 - это не здание, а контейнер
			buildingPosUse[] = {};
			eachBPosLootProb = 0.2; // вероятность на каждой точке появления лута
			lootpoint = "StalkerStdLootPoint";
			scriptedLootpoint = "";
			makeElevationCheck = 1;
		};
		class DefaultBox : Default {
			useStandardBuildingPos = 3; // использовать стандартные координаты через BuildINgPos 2 через строку, 3 - это не здание, а контейнер
			eachBPosLootProb = 1;

		};

		class Land_smd_Panelak : Default {
			eachBPosLootProb = 0.2; // вероятность на каждой точке появления лута
			useStandardBuildingPos = 2; // использовать координаты заданные через buildingPosString
			buildingPosString = "[[-3.0354,-4.72949,0.135479],[-0.0793457,-1.8999,0.102789],[0.133301,2.90527,-1.19647],[-3.0354,-4.72949,2.78548],[-4.28027,3.47021,0.11058],[4.38208,-1.84814,0.0995498],[4.44897,3.65088,2.82565],[4.38208,-1.84814,2.84955],[4.44897,3.65088,0.0756497],[0.133301,2.90527,1.45353],[-5.86108,-0.0761719,0.17364],[-4.28027,3.47021,2.86058],[3.0708,-4.59717,0.15042],[-5.86108,-0.0761719,2.82364],[-0.0793457,-1.8999,2.85279],[3.0708,-4.59717,2.80042]]";

			makeElevationCheck = 0;
			
		};
		class Land_smd_Panelak2 : Default {
			eachBPosLootProb = 0.2; // вероятность на каждой точке появления лута
			useStandardBuildingPos = 2; // использовать координаты заданные через buildingPosString
			buildingPosString = "[[-4.76416,3.27881,5.6661],[-4.76416,3.27881,3.01614],[-3.14844,-4.98438,-2.43835],[-4.70752,-2.12402,5.6572],[-4.70752,-2.12402,-2.39282],[-4.76416,3.27881,0.26614],[-3.14844,-4.98438,5.6616],[-4.70752,-2.12402,0.257181],[-4.76416,3.27881,-2.38386],[-4.70752,-2.12402,3.00718],[-3.14844,-4.98438,3.01165],[2.97925,-4.85059,3.02788],[2.97925,-4.85059,0.27788],[2.97925,-4.85059,5.6779],[4.91113,3.30127,5.7016],[-2.89038,-4.62598,0.283791],[4.91113,3.30127,0.3016],[-0.812988,3.25195,-6.50904],[0.0891113,-3.75586,5.6874],[0.0891113,-3.75586,-6.51264],[5.46313,-1.77051,5.7175],[-0.307861,2.81006,-1.10904],[4.91113,3.30127,-2.44841],[0.0891113,-3.75586,3.03736],[0.0891113,-3.75586,-2.36264],[0.182129,-1.7832,-5.09179],[5.46313,-1.77051,2.96753],[-0.307861,2.81006,1.64096],[3.24585,0.879883,-6.49647],[0.0891113,-3.75586,0.287359],[-0.307861,2.81006,-3.75904],[5.46313,-1.77051,0.31753],[-0.307861,2.81006,4.29096],[5.46313,-1.77051,-2.43247],[4.91113,3.30127,2.9516],[2.97925,-4.85059,-2.37212]]";

			makeElevationCheck = 0;
			
		};		
		class Land_smd_Panelak3 : Default {
			eachBPosLootProb = 0.2; // вероятность на каждой точке появления лута
			useStandardBuildingPos = 2; // использовать координаты заданные через buildingPosString
			buildingPosString = "[[-5.12573,-0.813965,18.1272],[-5.12573,-0.813965,23.5272],[2.84692,-4.27686,9.9763],[2.84692,-4.27686,23.5262],[5.07495,-0.955078,20.81],[-0.0148926,-2.67188,20.8556],[5.07495,-0.955078,10.0101],[-3.15845,-3.70313,15.4385],[4.70483,4.55469,10.0433],[-5.12573,-0.813965,15.3772],[2.84692,-4.27686,12.7263],[5.07495,-0.955078,7.2601],[2.84692,-4.27686,15.3762],[-5.12573,-0.813965,20.7772],[-4.60083,4.17285,18.062],[-0.0148926,-2.67188,18.1056],[4.70483,4.55469,12.6933],[4.70483,4.55469,23.4933],[-0.121338,-2.91992,0.461451],[-4.60083,4.17285,15.412],[-4.60083,4.17285,4.61197],[4.70483,4.55469,20.8433],[5.07495,-0.955078,15.4101],[-4.60083,4.17285,23.462],[3.25342,2.22314,0.42347],[-3.15845,-3.70313,10.0385],[4.70483,4.55469,7.2933],[5.07495,-0.955078,4.61006],[2.84692,-4.27686,4.57625],[-4.60083,4.17285,10.012],[2.84692,-4.27686,20.7762],[5.07495,-0.955078,12.6601],[5.07495,-0.955078,18.0601],[-0.558594,3.83398,0.47361],[-4.60083,4.17285,7.262],[-3.15845,-3.70313,7.2885],[-0.0148926,-2.67188,23.5055],[-0.0148926,-2.67188,9.9556],[-4.60083,4.17285,20.812],[-3.15845,-3.70313,18.0885],[4.70483,4.55469,18.0933],[-5.12573,-0.813965,12.7272],[0.287598,4.00342,3.22481],[-5.12573,-0.813965,7.3272],[-0.0148926,-2.67188,4.55557],[-3.15845,-3.70313,12.6885],[0.287598,4.00342,5.8748],[-5.12573,-0.813965,9.9772],[5.07495,-0.955078,23.46],[0.287598,4.00342,8.6248],[0.287598,4.00342,11.3748],[0.287598,4.00342,14.0248],[4.70483,4.55469,4.64332],[0.287598,4.00342,16.6748],[-3.15845,-3.70313,23.4885],[0.287598,4.00342,19.4248],[2.84692,-4.27686,7.3263],[-4.60083,4.17285,12.662],[0.287598,4.00342,22.0748],[4.70483,4.55469,15.4433],[2.84692,-4.27686,18.1262],[-5.12573,-0.813965,4.57724],[-3.15845,-3.70313,20.8385],[-0.0148926,-2.67188,12.7056],[-0.0148926,-2.67188,7.3056],[-3.15845,-3.70313,4.63851],[-0.0148926,-2.67188,15.4556],[-0.097168,-0.656738,1.86184]]";

			makeElevationCheck = 0;
			
		};

		class land_terain_base_a : Default {
		   eachBPosLootProb = 0;
		};
		class land_terain_velke_panely : land_terain_base_a {};

		class Box_Ind_Ammoord_F : DefaultBox {}; 
		class rhs_mags_crate : DefaultBox { lootpoint = "StalkerWeaponBoxLootPoint"; };
	};	
		
		
	class BaseCategory {
		itemsProbability = 1.0; itemsCheckProbNum = 10;  items[] = {}; itemsWeights[] = {};	
		class LootItem {classNames[]={};classNamesWeights[] = {1};classType = 2;numbers[] = {1};linkedItems[] = {};linkedItemsProbabilities[] = {0.2}; };	
		class LootWeapon : LootItem {classType = 0;};
		class LootMagazine : LootItem {classType = 1;};
		class LootBackpack : LootItem {classType = 3;};
	};
	
	class VanillaCategory : BaseCategory {};
	
	class StalkerCategory : BaseCategory {
		// медицина, еда
		class AGM_Bandage : LootItem {classNames[] = {"AGM_Bandage"};numbers[] = {1,1,2,2,3,3};};
		class AGM_Morphine: LootItem {classNames[] = {"AGM_Morphine"};};
		class AGM_Epipen: LootItem {classNames[] = {"AGM_Epipen"};};
		class AGM_Bloodbag: LootItem {classNames[] = {"AGM_Bloodbag"};};
		class zlt_radx: LootItem {classNames[] = {"zlt_radx"};};
		class zlt_radaway: LootItem {classNames[] = {"zlt_radaway"};};
		class zlt_rotgut: LootItem {classNames[] = {"zlt_rotgut"};};
		class zlt_beer: LootItem {classNames[] = {"zlt_beer"};};
		
		
		// электроника и предметы 
		class RBCSW_Mask_M40_OD :LootItem {classNames[] = {"RBCSW_Mask_M40_OD"};};
		class RBCSW_Adetector :	LootItem {classNames[] = {"RBCSW_AdetectorCA1","RBCSW_AdetectorCA2"}; classNamesWeights[] = {0.1,0.9}; };
		class NightVision : LootItem {classNames[] = {"NVGoggles","rhs_pdu4"}; classNamesWeights[] = {0.7,0.3};};
		class ItemMap : LootItem {classNames[] = {"ItemCompass","ItemMap","ItemGPS"}; classNamesWeights[] = {0.5,0.1,0.01};};
		class ItemRadio : LootItem {classNames[] = {"ItemRadio"};};
		class Binocular : LootItem {classNames[] = {"Binocular"};};
		class Backpack : LootBackpack {classNames[] = {"B_TacticalPack_rgr","B_TacticalPack_blk","B_TacticalPack_oli","B_Kitbag_rgr","B_Carryall_oli","B_Carryall_khk","rhs_sidor"}; classNamesWeights[] = {};};
		
		// оружие и боеприпасы
		class AKSU : LootWeapon {classNames[] = {"arifle_av_aksu"}; linkedItems[] = {"muzzle_av_snds2","RHSMagAK74_1"}; linkedItemProbabilities[] = {0.1,0.5}; };
		class RHSMagAK74_1 : LootMagazine {classNames[] = {"rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK_green"};classNamesWeights[] = {0.20,0.025};}; 
		class AK74_DTK : LootItem {classNames[] = {"rhs_acc_dtk"};};
		class AK74 : LootWeapon {classNames[] = {"rhs_weap_ak74m_camo","rhs_weap_ak74m_plummag","rhs_weap_ak74m_desert","rhs_weap_ak74m","rhs_weap_ak74m_2mag","rhs_weap_ak74m_2mag_camo"};
			linkedItems[] = {"AK74_DTK","RHSMagAK74_1"}; linkedItemProbabilities[] = {1,0.5};};
			
		class Flares : LootWeapon {classNames[] = {"rhs_weap_rsp30_green","rhs_weap_rsp30_red","rhs_weap_rsp30_white"};};
		class Grenade : LootMagazine {classNames[] = {"rhs_mag_rgd5","rhs_mag_zarya2","rhs_mag_nspn_green","rhs_mag_rdg2_white"};classNamesWeights[] = {1,0.25,1,1};};
		class PolGrenade : LootMagazine {classNames[] = {"rhs_mag_rgd5","rhs_mag_zarya2","rhs_mag_nspn_green","rhs_mag_rdg2_white"};classNamesWeights[] = {0.12,0.25,1,1};};
		class CivGrenade : LootMagazine {classNames[] = {"rhs_mag_zarya2","rhs_mag_nspn_green","rhs_mag_rdg2_white"};classNamesWeights[] = {0.25,1,1};};
		
		class cal12_2rounds : LootMagazine {classNames[] = {"2pul_pula"}; numbers[] = {1,2,3,3,3,4,5}; };
		class cal12_w : LootWeapon {classNames[] = {"str_ij_obr","str_ij_long","str_to34_long"};  classNamesWeights[] = {1,0.5,0.5}; linkedItems[] = {"cal12_2rounds"};
			linkedItemProbabilities[] = {0.75}; };
			
		class RPG_26 : LootWeapon {classNames[] = {"rhs_weap_rpg26"};};
		
		class cal762x54R_MG : LootMagazine {classNames[] = {"rhs_100Rnd_762x54mmR","rhs_100Rnd_762x54mmR_green"};classNamesWeights[] = {0.5,0.1};}; 
		class MG_PKM : LootWeapon {classNames[] = {"rhs_weap_pkm","rhs_weap_pkp"};  classNamesWeights[] = {1,0.2}; linkedItems[] = {"cal762x54R_MG"};	linkedItemProbabilities[] = {0.25}; };
		
		class cal762x54R_SVD : LootMagazine {classNames[] = {"rhs_10Rnd_762x54mmR_7N1"}; numbers[] = {1,1,1,2,2,3};}; 
		class PSO1 : LootItem {classNames[] = {"rhs_acc_pso1m2"};};
		class SVD : LootWeapon {classNames[] = {"rhs_weap_svdp"};  classNamesWeights[] = {1,0.2}; linkedItems[] = {"PSO1","cal762x54R_SVD"};	linkedItemProbabilities[] = {0.25,0.5}; };
		
		class 8Rnd_Mag_pm : LootMagazine {classNames[] = {"8Rnd_Mag_pm"}; numbers[] = {1,2,2,2,3,3};}; 
		class APS_MAKAR : LootWeapon {classNames[] = {"av_makarov","av_aps"};  classNamesWeights[] = {1,0.05}; linkedItems[] = {"8Rnd_Mag_pm"};	linkedItemProbabilities[] = {0.9}; };
			
		class MosinAmmo : LootMagazine {classNames[] = {"5rnd_762_mos"}; numbers[] = {1,1,1,2,2,3};};
		class Mosin_Opt : LootItem {classNames[] = {"optic_str_puold"};};	
		class Mosin :  LootWeapon {classNames[] = {"str_3xlin_sn"};  linkedItems[] = {"MosinAmmo","Mosin_Opt"};	linkedItemProbabilities[] = {0.75,0.1}; };
		
		class SKSAmmo : LootMagazine {classNames[] = {"10rnd_sks_mag"}; numbers[] = {1,1,1,1,2,3};};
		class SKS :  LootWeapon {classNames[] = {"str_sks_old"};  linkedItems[] = {"SKSAmmo"};	linkedItemProbabilities[] = {0.75}; };
		
		class 8Rnd_TT : LootMagazine {classNames[] = {"8Rnd_Mag"}; numbers[] = {1,2,2,2,3,3};};
		class av_tt :  LootWeapon {classNames[] = {"av_tt"};  linkedItems[] = {"8Rnd_TT"};	linkedItemProbabilities[] = {0.9}; };

		class 30_9mm: LootMagazine {classNames[] = {"30Rnd_9x21_Mag"}; numbers[] = {1,1,1,1,2,2};};
		class av_pp2000 : LootWeapon {classNames[] = {"av_pp2000"};   linkedItems[] = {"30_9mm"};	linkedItemProbabilities[] = {0.5}; };
	
		class av_kedr : LootWeapon {classNames[] = {"av_kedr"};   linkedItems[] = {"30_9mm"};	linkedItemProbabilities[] = {0.5}; };

		
	};
	
	class StalkerMedicals : StalkerCategory {
		itemsProbability = 0.25;
		itemsCheckProbNum = 5; 
		items[] = {"AGM_Bandage","AGM_Morphine","AGM_Epipen","AGM_Bloodbag"};
		itemsWeights[] = {0.9,0.1,0.05,0.025};
	};
	class StalkerFoodDrink : StalkerCategory {
		itemsProbability = 0.4;
		itemsCheckProbNum = 3; 
		items[] = {"zlt_rotgut","zlt_beer"};
		itemsWeights[] = {0.1,0.5};
	};
	class StalkerAntiRad : StalkerCategory {
		itemsProbability = 0.67;
		itemsCheckProbNum = 2; 
		items[] = {"zlt_radx","zlt_radaway"};
		itemsWeights[] = {5,1};
	};
	class StalkerItemsAndElectronics : StalkerCategory {
		itemsProbability = 1.0;
		itemsCheckProbNum = 1; 
		items[] = {			"RBCSW_Mask_M40_OD","RBCSW_Adetector","NightVision","ItemMap","ItemRadio","Binocular","Backpack"};
		itemsWeights[] = {			5			,		5			,	1		,	15		,	5		,	2		,	3};
	};
	class StalkerCivilianWeapons : StalkerCategory {
		itemsProbability = 0.25;
		itemsCheckProbNum = 5; 
		items[] = {			"Flares", "CivGrenade", "cal12_2rounds", "cal12_w", "av_tt", "8Rnd_TT", "Mosin", "MosinAmmo", "SKS", "SKSAmmo"};
		itemsWeights[] = {		1,			1,				5,			5,			1,		1,			1,			1,		2,		2										};
	};
	class StalkerPoliceWeapons : StalkerCategory {
		itemsProbability =0.67;
		itemsCheckProbNum = 2; 
		items[] = {			"Flares", "PolGrenade", "AKSU", "AK74", "RHSMagAK74_1", "APS_MAKAR", "8Rnd_Mag_pm", "av_pp2000",  "av_kedr", "30_9mm"};
		itemsWeights[] = {		5,			10,			4,		1,			5,			20,			20,			2,		8,			10	};
	};
	
	class StalkerMilitaryWeapons : StalkerCategory {
		itemsProbability = 1;
		itemsCheckProbNum = 1; 
		items[] = {			"Flares", "Grenade", "AKSU", "AK74", "RHSMagAK74_1", "APS_MAKAR", "8Rnd_Mag_pm", "av_pp2000", "30_9mm", "MG_PKM","cal762x54R_MG","SVD","cal762x54R_SVD"};
		itemsWeights[] = {		4,			50,		60,		40,			100,		20,				20,				5,		5,			5,			5,			2,		2			};

	};
	
		
	
	class StalkerStdLootPoint {
		categoriesCheckProbNum = 8; // количество категорий, которое будет выбираться из досутпных с вероятностью (количество попыток выбрать категорию)
		categoriesProbability = 0.5; //вероятность что выберется категория 
		LootCategories[] = {	"StalkerMedicals1","StalkerFoodDrink1","StalkerAntiRad1","StalkerItemsAndElectronics1","StalkerCivilianWeapons1","StalkerPoliceWeapons1","StalkerMilitaryWeapons1"			};
		LootCategoriesWeights[] = {		5,					15,				1,					15,							10,							5,					2				};
		
		class StalkerMedicals1 : StalkerMedicals {};
		class StalkerFoodDrink1 : StalkerFoodDrink {};
		class StalkerAntiRad1 : StalkerAntiRad {};
		class StalkerItemsAndElectronics1 : StalkerItemsAndElectronics {};
		class StalkerCivilianWeapons1 : StalkerCivilianWeapons {};
		class StalkerPoliceWeapons1 : StalkerPoliceWeapons {};
		class StalkerMilitaryWeapons1 : StalkerMilitaryWeapons {};
			
	};
	
	class StalkerWeaponBoxLootPoint : StalkerStdLootPoint {
		categoriesCheckProbNum = 5; // количество категорий, которое будет выбираться из досутпных с вероятностью (количество попыток выбрать категорию)
		categoriesProbability = 0.75; //вероятность что выберется категория 
		LootCategoriesWeights[] = {		1,					1,				10,					1,							1,							10,					15				};
		
	};



	
	class TestCategory1 {
		itemsProbability = 1.0;
		itemsCheckProbNum = 10; 
		items[] = {"Bandages"};
		itemsWeights[] = {1};
	
		class Bandages {
			classNames[] = {"AGM_Bandage"};
			classNamesWeights[] = {1};
			classType = 2;
			numbers[] = {2,2};
			linkedItems[] = {};
		};
	};
	

	
	class TestLootPoint {
		categoriesCheckProbNum = 1; // количество категорий, которое будет выбираться из досутпных с вероятностью (количество попыток выбрать категорию)
		categoriesProbability = 1.0; //вероятность что выберется категория 
		LootCategories[] = {	"TestCategory2"			};
		LootCategoriesWeights[] = {	1				};

		class TestCategory2 : StalkerCategory {};
		
		
	};
	

	class LootPoint {
		categoriesCheckProbNum = 1; // количество категорий, которое будет выбираться из досутпных с вероятностью (количество попыток выбрать категорию)
		categoriesProbability = 0.1; //вероятность что выберется категория 
		
		LootCategories[] = {	"LootCat1"			};
		LootCategoriesWeights[] = {	1				};

		class LootCat1 {
				itemsCheckProbNum = 3; // количество предметов, которые будут выбираться из спика
				itemsprobability = 0.3; //вероятность что выпадет один предмет (число попыток itemcountmax)
				
				Items[] =	{		"Item1",		"Item2"			}; //предметы которые могут выпасть в данной категории
				ItemsWeights[] = {		1,				5			}; //веса предметов (для выбора случайного)
				
				class Item1 { 
					classNames[] = {"",""}; //имена классов
					classNamesWeights[] = {}; //их веса
					classType = 0;                         // тип класса (может быть Item 3, Magazine 1,Backpack 4, Weapon 0), используется для выбора соотв команды
					numbers[] = {0,1,1,4,5};    				// количество предмета за 1 раз (можно указывать последовательность чтобы изменить вероятность каждого)
					//classExistCondition = "";                   
					linkedItems[] = {""};                     // итем, который всегда встречается вместе
					linkedItemProbabilities[] = {0.2};  // вероятность нахождения связанных итемов
				};
				class Item2 {
						classNames[] = {"",""}; //имена классов
						classNamesWeights[] = {}; //их веса
						numbers[] = {0,1,1,4,5};
				};
				
			
		};
		
		
		
		
	};

};
