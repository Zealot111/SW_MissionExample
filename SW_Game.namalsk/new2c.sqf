hint "Загрузка началась...";


zlt_units = {
	private "_res"; _res = [];
	if (typeName _this == typeName "") then {_res = getArray (configfile >> "cfgPatches" >> _this >> "Units")} else {
		{_res=_res +  getArray (configfile >> "cfgPatches" >> _x >> "Units")} foreach _this;
	};
	_res;
};

zlt_filter = {
	private ["_res","_txt"]; _res = []; _code = _this select 1;
	{if (call _code) then { _res pushBack _x}; } foreach (_this select 0);
	_res
};

ZltMap = {
	private ["_res","_txt","_fr"]; _res = []; _code = _this select 1;
	{_fr = _x call _code; if (!isNil _fr) then {_res pushBack _fr;};} foreach (_this select 0);
};

// https://community.bistudio.com/wiki/Arma_3_CfgPatches_CfgVehicles

zlt_obj_list_index = 0;
zlt_obj_list_all = [
		['A3_Structures_F_Mil_Fortification','A3_Structures_F_Mil_BagBunker','A3_Structures_F_Mil_BagFence',"A3_Structures_F_Mil_Shelters"] call zlt_units
	,[["A3_Structures_F_Mil_Cargo","A3_Structures_F_Mil_Radar","A3_Structures_F_Mil_Offices","A3_Structures_F_Mil_Barracks","A3_Structures_F_Mil_Bunker","A3_Structures_F_Mil_TentHangar","A3_Structures_F_Research"] call zlt_units, { not (["ruins", _x] call bis_fnc_instring) }] call zlt_filter
	,["A3_Structures_F_Walls"] call zlt_units
	,["A3_Structures_F_Training" call zlt_units, { (["shoot_house", _x] call bis_fnc_instring) or (["obstacle", _x] call bis_fnc_instring) or (["concrete", _x] call bis_fnc_instring) }] call zlt_filter
	,["Land_Pallet_static_F","Land_Pallet_vertical_static_F","A3_Structures_F_Civ_Constructions","A3_Structures_F_EPA_Civ_Constructions","A3_Structures_F_Civ_Camping"] call zlt_units
	,(["A3_Structures_F_Items_Documents","A3_Structures_F_Items_Electronics","A3_Structures_F_Items_Cans","A3_Structures_F_Items_Gadgets","A3_Structures_F_Items_Luggage","A3_Structures_F_Items_Stationery","A3_Structures_F_Items_Tools","A3_Structures_F_Items_Valuables","A3_Structures_F_EPA_Items_Electronics","A3_Structures_F_EPA_Items_Food","A3_Structures_F_EPA_Items_Medical","A3_Structures_F_EPA_Items_Tools","A3_Structures_F_EPA_Items_Vessels","A3_Structures_F_EPC_Items_Documents","A3_Structures_F_EPC_Items_Electronics"] call zlt_units)
	,[["A3_Structures_F_Households_Addons","A3_Structures_F_Households_House_Big01",'A3_Structures_F_Households_House_Big02','A3_Structures_F_Households_House_Shop01','A3_Structures_F_Households_House_Shop02', 'A3_Structures_F_Households_House_Small01', 'A3_Structures_F_Households_House_Small02', 'A3_Structures_F_Households_House_Small03', 'A3_Structures_F_Households_Slum', 'A3_Structures_F_Households_Stone_Big', 'A3_Structures_F_Households_Stone_Shed', 'A3_Structures_F_Households_Stone_Small', 'A3_Structures_F_Households_WIP','A3_Structures_F_Ind_AirPort' ] call zlt_units,{ not (["ruins", _x] call bis_fnc_instring)  and not (["_dam_", _x] call bis_fnc_instring) and not (["_d_", _x] call bis_fnc_instring) } ] call zlt_filter
	,(["A3_Structures_F_Naval_Piers","A3_Structures_F_Naval_RowBoats"] call zlt_units)
	,["Land_Bench_F","Land_CashDesk_F","Land_HeatPump_F","Land_ChairPlastic_F","Land_ChairWood_F","Land_Icebox_F","Land_Metal_rack_F","Land_Metal_rack_Tall_F","Land_Metal_wooden_rack_F","Land_Rack_F","Land_ShelvesMetal_F","Land_ShelvesWooden_F","Land_TableDesk_F"]
	,["A3_Structures_F_EPB_Furniture","A3_Structures_F_Furniture","A3_Structures_F_Items_Vessels", "A3_Structures_F_EPA_Civ_Camping","A3_Structures_F_EPB_Items_Vessels"] call zlt_units
	,["A3_Structures_F_Civ_InfoBoards","A3_Structures_F_EPC_Civ_InfoBoards","A3_Signs_F","A3_Signs_F_AD","A3_Structures_F_EPB_Civ_Accessories","A3_Structures_F_EPC_Civ_Accessories"] call zlt_units
	,["Land_fort_rampart_EP1","Land_fort_rampart","Hedgehog","Misc_cargo_cont_small","TK_GUE_WarfareBUAVterminal_Base_EP1","TK_GUE_WarfareBArtilleryRadar_Base_EP1","TK_GUE_WarfareBAntiAirRadar_Base_EP1","Fort_Barricade","Land_fort_artillery_nest_EP1","Land_fort_artillery_nest","Hhedgehog_concrete","Hhedgehog_concreteBig","Barrack2","PowGen_Big","Land_Misc_Cargo1E_EP1","Land_BarGate2","Land_tent_east","CampEast_EP1","Land_GuardShed","Land_Antenna","Land_A_Villa_EP1","Land_Mil_Barracks_i_EP1"]
	,["A3_Structures_F_Dominants_Hospital", "A3_Structures_F_EPC_Dominants_GhostHotel"] call zlt_units
	,(["A3_Structures_F_Civ_Garbage","A3_Structures_F_EPA_Mil_Scrapyard","A3_Structures_F_Wrecks","A3_Structures_F_EPB_Civ_Garbage"] call zlt_units)+["Submarine_01_F"]
	,["Ficus_Bush_2","Ficus_Bush_1","Cane2","Cane1","Ficus_Bush_3","Oleander1","Oleander2","Oleander_White","Thistle_Thorn_Green_Bush"] + ["BluntRock_Apart", "BluntRock_Monolith","BluntRock_Spike","BluntRock_WallH","BluntRock_WallV","BluntStone1","BluntStone1_LC","BluntStone2","BluntStone2_LC","BluntStone3","BluntStone3_LC","BluntStone_Erosion"] + ["Paper_Mulberry","Ficus_1","Ficus_2","Fraxinus","Olive_1","Olive_2","Palm_1","Palm_2","Pine_1","Pine_2","Pine_3","Pine_4","Poplar_Dead","Poplar","Oak","Fallen_Branch1","Fallen_Branch2","Fallen_Branch3","Branch_Big"]
	,["CS_End01","CB_End01","CS_End02","CB_End02","CS_Long","CB_Long","CS_Short","CB_Short","CS_Entrance01","CB_Entrance01","CS_Entrance02","CB_Entrance02","CS_Intersect01","CB_Intersect01","Cover_Sharprock","Cover_Bluntstone","Cover_Sand_Inset","Cover_Dirt_Inset","Cover_Grass_Inset","CS_H45","CB_H45","CS_H90","CB_H90","CS_Intersect02","CB_Intersect02"]
	,["Land_Dam_Conc_20","Land_Dam_ConcP_20","Land_Dam_Barrier_40","land_mbg_apartments_big_04","land_mbg_brickhouse_01","land_mbg_brickhouse_02","land_mbg_brickhouse_03","mbg_apartments_big_04_EO","mbg_brickhouse_01_EO","mbg_brickhouse_02_EO","mbg_brickhouse_03_EO","Fortress1","Fortress2","Shed","ShedSmall","ShedBig","Camp","CampEast","ACamp","MASH","Land_Molo_beton","Land_Molo_drevo","Land_Molo_drevo_bs","Land_Molo_drevo_end","Land_Molo_krychle","Land_Molo_krychle2","Land_Cihlovej_dum","Land_Cihlovej_Dum_in","Land_Cihlovej_Dum_mini","Land_Deutshe_mini","Land_Dulni_bs","Land_Dum_zboreny","Land_Hospoda_mesto","Land_House_y","Land_Hut_old02","Land_Podesta_1_cube","Land_Podesta_1_cube_long","Land_Podesta_1_cornl","Land_Podesta_1_cornp","Land_Podesta_1_mid_cornl","Land_Podesta_1_mid_cornp","Land_Podesta_1_mid","Land_Podesta_1_stairs","Land_Podesta_1_stairs2","Land_Podesta_1_stairs3","Land_Podesta_1_stairs4","Land_Podesta_5","Land_Podesta_10","Land_Podesta_s5","Land_Podesta_s10","Land_Ryb_domek","Land_Stodola_old_open","Land_Army_hut3_long_int","Land_Army_hut3_long","Land_Army_hut2_int","Land_Army_hut2","Land_Army_hut_int","Land_Army_hut_storrage","Land_Bouda2_vnitrek","Land_Garaz_s_tankem","Land_Hruzdum","Land_Dum_rasovna","Land_Hlaska","Land_Panelak","Land_Sara_Domek_sedy","Land_Posed","Land_Leseni4x","Land_Leseni2x","Land_Sara_domek_zluty","Land_Watertower1","Land_Sara_zluty_statek_in","Land_Panelak2","Land_Panelak3","Land_Hotel","Land_Dum_mesto2","Land_Trafostanica_mala","Land_Dum_olezlina","Land_Dum_mesto_in","Land_Hangar_2","Land_Garaz_mala","Land_Garaz_long_open","Land_Budova2","Land_Budova3","Land_Dum_olez_istan2_maly","Land_Dum_olez_istan2","Land_Dum_olez_istan2_open2","Land_Dum_olez_istan2_open_dam","Land_Dum_olez_istan2_open2_dam","Land_Dum_olez_istan1","Land_Dum_olez_istan1_open2","Land_panelak_one_floor","Land_panelak_top_floor_rooms","Land_R_Minaret","Land_jezekbeton","Barrels","Camera1","Computer","TVStudio","M113Wreck","BlackhawkWreck","Vec03","FenceWood","FenceWoodPalet","Wire","Heli_H_civil","Heli_H_rescue","Land_water_tank","Land_ladder","Land_ladder_half","snowman","snow","SeaFox_EP1","Land_A_CraneCon","Land_Barn_W_01","Land_Barn_W_02","Land_A_Castle_Stairs_A","Land_A_Office01_ruins","Land_A_Office01","Land_A_Hospital","ladder","LadderLong","Land_A_Office02","Land_a_stationhouse","Land_Shed_Ind02","Land_Vysilac_budova","Land_vodni_vez","Land_pristresek_camo","Land_MBG_GER_HUS_1","Land_MBG_GER_HUS_2","Land_MBG_GER_HUS_3","Land_MBG_GER_HUS_4","Land_MBG_GER_RHUS_1","Land_MBG_GER_RHUS_2","Land_MBG_GER_RHUS_3","Land_MBG_GER_RHUS_4","Land_MBG_GER_RHUS_5","Land_MBG_GER_ESTATE_1","Land_MBG_GER_ESTATE_2","Land_MBG_Beach_Chair_1","Land_MBG_Beach_Chair_2","Land_MBG_Beach_Chair_3","Land_MBG_GER_SUPERMARKET_1","Land_MBG_GER_SUPERMARKET_2","Land_MBG_GER_SUPERMARKET_3","Land_MBG_GER_SUPERMARKET_4","Land_MBG_GER_PUB_1","Land_MBG_GER_PUB_2","Land_MBG_HeavyShelter","Land_MBG_ATC_Segment","Land_MBG_ATC_Tower","Land_MBG_ATC_Base","Land_A_GeneralStore_01","Land_A_Pub_01","Land_Misc_Cargo1Ao","Land_Misc_Cargo1Bo","Land_Misc_Cargo1B","Misc_Cargo1B_military","Misc_Cargo1Bo_civil","Land_Misc_Cargo1C","Land_Misc_Cargo1D","Land_Misc_Cargo1E","Land_Misc_Cargo1F","Land_Misc_Cargo1G","Land_Misc_Cargo2B","Land_Misc_Cargo2C","Land_Misc_Cargo2D","Land_Misc_Cargo2E","Land_HBarrier_large","Land_HBarrier1","Land_HBarrier3","Land_HBarrier5","Land_fort_bagfence_corner","Land_fort_bagfence_long","Land_fort_bagfence_round","Land_BagFenceCorner","Land_BagFenceEnd","Land_BagFenceLong","Land_BagFenceRound","Land_BagFenceShort","Land_fort_artillery_nest","Land_fort_rampart","Fort_RazorWire","Fort_Crate_wood","WarfareBCamp","Fort_CAmp","Land_fortified_nest_small","Fort_Nest","Land_Fort_Watchtower","Fort_Barracks_USMC","Hedgehog","Hhedgehog_concrete","Hhedgehog_concreteBig","Fort_EnvelopeSmall","Fort_EnvelopeBig","Fort_Barricade","Land_Ind_Timbers","Land_Ind_BoardsPack1","Land_Ind_BoardsPack2","Haystack","Land_seno_balik","Misc_palletsfoiled_heap","Misc_palletsfoiled","Land_A_tent","Land_tent_east","Land_GuardShed","Land_Antenna","Land_CamoNet_NATO","Land_CamoNetVar_NATO","Land_CamoNetB_NATO","Land_CamoNet_EAST","Land_CamoNetVar_EAST","Land_CamoNetB_EAST","76n6ClamShell","PowGen_Big","Land_BarGate2","Land_Barrack2","Misc_cargo_cont_small","Misc_cargo_cont_small2","Misc_cargo_cont_tiny","Misc_cargo_cont_net1","Misc_cargo_cont_net2","Misc_cargo_cont_net3","Land_obstacle_get_over","Land_obstacle_prone","Land_obstacle_run_duck","Land_WoodenRamp","Land_ConcreteRamp","Land_ConcreteBlock","Land_Dirthump01","Land_Dirthump02","Land_Dirthump03","BRDMWreck","UralWreck","BMP2Wreck","HMMWVWreck","T72Wreck","WarfareBDepot","Base_WarfareBBarracks","USMC_WarfareBBarracks","RU_WarfareBBarracks","CDF_WarfareBBarracks","Ins_WarfareBBarracks","Gue_WarfareBBarracks","Base_WarfareBContructionSite","USMC_WarfareBContructionSite","USMC_WarfareBContructionSite1","RU_WarfareBContructionSite","RU_WarfareBContructionSite1","CDF_WarfareBContructionSite","CDF_WarfareBContructionSite1","Ins_WarfareBContructionSite","USMC_WarfareBLightFactory","RU_WarfareBLightFactory","USMC_WarfareBHeavyFactory","RU_WarfareBHeavyFactory","CDF_WarfareBHeavyFactory","USMC_WarfareBAircraftFactory","RU_WarfareBAircraftFactory","USMC_WarfareBFieldhHospital","RU_WarfareBFieldhHospital","CDF_WarfareBFieldhHospital","GUE_WarfareBFieldhHospital","USMC_WarfareBAntiAirRadar","RU_WarfareBAntiAirRadar","CDF_WarfareBAntiAirRadar","INS_WarfareBAntiAirRadar","GUE_WarfareBAntiAirRadar","USMC_WarfareBArtilleryRadar","RU_WarfareBArtilleryRadar","CDF_WarfareBArtilleryRadar","Ins_WarfareBArtilleryRadar","Gue_WarfareBArtilleryRadar","USMC_WarfareBUAVterminal","RU_WarfareBUAVterminal","CDF_WarfareBUAVterminal","INS_WarfareBUAVterminal","GUE_WarfareBUAVterminal","USMC_WarfareBVehicleServicePoint","RU_WarfareBVehicleServicePoint","Base_WarfareBBarrier5x","Base_WarfareBBarrier10x","Base_WarfareBBarrier10xTall","BRDM2_HQ_Gue_unfolded","BTR90_HQ_unfolded","LAV25_HQ_unfolded","BMP2_HQ_INS_unfolded","BMP2_HQ_CDF_unfolded","WarfareBunkerSign","C130J_wreck_EP1","Land_Wreck_C130J_EP1_ruins","Land_fort_artillery_nest_EP1","Land_fort_rampart_EP1","Land_fortified_nest_big_EP1","Land_fortified_nest_small_EP1","Land_Fort_Watchtower_EP1","Hedgehog_EP1","Fort_EnvelopeSmall_EP1","Fort_EnvelopeBig_EP1","Fort_Barricade_EP1","Land_CamoNet_NATO_EP1","Land_CamoNetVar_NATO_EP1","Land_CamoNetB_NATO_EP1","Land_CamoNet_EAST_EP1","Land_CamoNetVar_EAST_EP1","Land_CamoNetB_EAST_EP1","76n6ClamShell_EP1","PowGen_Big_EP1","Land_PowGen_Big_ruins_EP1","Land_Barrack2_EP1","Misc_cargo_cont_small_EP1","AmmoCrates_NoInteractive_Large","Camp_EP1","CampEast_EP1","C130J_static_EP1","Land_ladderEP1","Land_ladder_half_EP1","Land_Dirthump01_EP1","Land_Dirthump02_EP1","Land_Dirthump03_EP1","Land_Fuel_tank_stairs_ep1","Land_Misc_Cargo1Ao_EP1","Land_Misc_Cargo1Bo_EP1","Land_Misc_Cargo1Eo_EP1","Land_Misc_Cargo1E_EP1","Land_Misc_Cargo1A_EP1","Land_Misc_Cargo1B_EP1","Land_Misc_Cargo1C_EP1","Land_Misc_Cargo1D_EP1","Land_Misc_Cargo2A_EP1","Land_Misc_Cargo2B_EP1","Land_Misc_Cargo2C_EP1","Land_Misc_Cargo2D_EP1","Land_Misc_CargoMarket1a_EP1","Land_Misc_Cargo2E_EP1","Dirtmount_EP1","US_WarfareBBarracks_Base_EP1","TK_WarfareBBarracks_Base_EP1","US_WarfareBBarracks_EP1","TK_WarfareBBarracks_EP1","US_WarfareBLightFactory_base_EP1","TK_WarfareBLightFactory_base_EP1","TK_GUE_WarfareBLightFactory_base_EP1","US_WarfareBLightFactory_EP1","TK_WarfareBLightFactory_EP1","TK_GUE_WarfareBLightFactory_EP1","US_WarfareBHeavyFactory_Base_EP1","TK_WarfareBHeavyFactory_Base_EP1","TK_GUE_WarfareBHeavyFactory_Base_EP1","US_WarfareBHeavyFactory_EP1","TK_WarfareBHeavyFactory_EP1","TK_GUE_WarfareBHeavyFactory_EP1","US_WarfareBAircraftFactory_Base_EP1","TK_WarfareBAircraftFactory_Base_EP1","TK_GUE_WarfareBAircraftFactory_Base_EP1","US_WarfareBAircraftFactory_EP1","TK_WarfareBAircraftFactory_EP1","TK_GUE_WarfareBAircraftFactory_EP1","US_WarfareBFieldhHospital_Base_EP1","TK_WarfareBFieldhHospital_Base_EP1","TK_GUE_WarfareBFieldhHospital_Base_EP1","US_WarfareBFieldhHospital_EP1","TK_WarfareBFieldhHospital_EP1","TK_GUE_WarfareBFieldhHospital_EP1","US_WarfareBAntiAirRadar_Base_EP1","TK_WarfareBAntiAirRadar_Base_EP1","TK_GUE_WarfareBAntiAirRadar_Base_EP1","US_WarfareBAntiAirRadar_EP1","TK_WarfareBAntiAirRadar_EP1","TK_GUE_WarfareBAntiAirRadar_EP1","US_WarfareBArtilleryRadar_Base_EP1","TK_WarfareBArtilleryRadar_Base_EP1","TK_GUE_WarfareBArtilleryRadar_Base_EP1","US_WarfareBArtilleryRadar_EP1","TK_WarfareBArtilleryRadar_EP1","TK_GUE_WarfareBArtilleryRadar_EP1","US_WarfareBUAVterminal_Base_EP1","TK_WarfareBUAVterminal_Base_EP1","TK_GUE_WarfareBUAVterminal_Base_EP1","US_WarfareBUAVterminal_EP1","TK_WarfareBUAVterminal_EP1","TK_GUE_WarfareBUAVterminal_EP1","US_WarfareBVehicleServicePoint_Base_EP1","TK_WarfareBVehicleServicePoint_Base_EP1","TK_GUE_WarfareBVehicleServicePoint_Base_EP1","US_WarfareBVehicleServicePoint_EP1","TK_WarfareBVehicleServicePoint_EP1","TK_GUE_WarfareBVehicleServicePoint_EP1","US_WarfareBBarrier5x_EP1","US_WarfareBBarrier10x_EP1","US_WarfareBBarrier10xTall_EP1","BRDM2_HQ_TK_GUE_unfolded_Base_EP1","BRDM2_HQ_TK_GUE_unfolded_EP1","M1130_HQ_unfolded_Base_EP1","BMP2_HQ_TK_unfolded_Base_EP1","Land_A_TVTower_Base","Land_A_TVTower_Mid","Land_A_TVTower_Top","Land_A_Minaret_Porto_EP1","Land_A_Villa_EP1","Land_Misc_Coltan_Heap_EP1","Land_mbg_observation_tower","Land_mbg_companybuilding_1","FootBridge_0_ACR","FootBridge_30_ACR","Land_Device_assembled_F","Land_Device_disassembled_F","Hotze_lavicka_1","Hotze_Place_1","Hotze_Place_2","Hotze_Place_3","Hotze_Place_4","Hotze_Place_6","Hotze_SwalkA_B1","Hotze_SwalkA_B2","Hotze_SwalkA_B3","Hotze_Panelak1","Hotze_Panelak2","Hotze_Panelak3","Land_Hotze_HBridge_A","Land_ibr_most_stred30","Land_ibr_most_bez_lamp","Land_ibr_Kamenny_most30","Land_GymBench_01_F","Land_GymRack_01_F","Land_GymRack_02_F","Land_GymRack_03_F","rhs_Flag_Russia_F"]
    ,["Land_smd_kostel2","Land_jbad_Wall_CBrk_5","Land_jbad_Misc_Cable","Park_bench2_noRoad","Park_bench1","Fridge_01_closed_F","Fridge_01_open_F","Land_Shelf_EP1","Land_Wicker_basket_EP1","OfficeTable_01_old_F","OfficeTable_01_new_F","Land_Basket_EP1","Land_Crates_EP1","Land_OfficeChair_01_F","SmallTable","Land_Boots_EP1","Land_WaterCooler_01_old_F","Land_WaterCooler_01_new_F","Land_Water_pipe_EP1","Land_Table_EP1","Land_Cabinet_EP1","Land_WoodenTable_large_F","Land_Workbench_01_F","Land_ToolTrolley_01_F","Land_ToolTrolley_02_F","Land_GasTank_02_F","Land_MobileScafolding_01_F"]
	,["A3_Structures_F_Civ_Lamps"]call zlt_units
	,["A3_Structures_F_Civ_Dead"]call zlt_units
	,["A3_Structures_F_Civ_Chapels"]call zlt_units
	,["A3_Structures_F_Civ_BellTowers"]call zlt_units
	,["A3_Structures_F_Civ_Accessories"]call zlt_units
	,["A3_Structures_F_Bridges"]call zlt_units
	,["A3_Structures_F_Civ_Market"]call zlt_units
	,["A3_Structures_F_Civ_Pavements"]call zlt_units
	,["A3_Structures_F_Dominants_Castle"]call zlt_units
	,["A3_Structures_F_Civ_PlayGround"]call zlt_units
	,["A3_Structures_F_Dominants_Lighthouse"]call zlt_units
	,["A3_Structures_F_Dominants_WIP"]call zlt_units
	,["A3_Structures_F_Ind_ConcreteMixingPlant"]call zlt_units
	,["A3_Structures_F_Ind_DieselPowerPlant"]call zlt_units
	,["A3_Structures_F_Ind_Factory"]call zlt_units
	,["A3_Structures_F_Ind_FuelStation"]call zlt_units
	,["A3_Structures_F_Ind_Pipes"]call zlt_units
	,["A3_Structures_F_Ind_PowerLines"]call zlt_units
	,["A3_Structures_F_Ind_ReservoirTank"]call zlt_units
	,["A3_Structures_F_Ind_Shed"]call zlt_units
	,["A3_Structures_F_Ind_Transmitter_Tower"]call zlt_units
	,["A3_Structures_F_Ind_Windmill"]call zlt_units
	,["A3_Structures_F_EPB_Civ_Dead"]call zlt_units

,["land_chz_janov_01","land_chz_janov_02","land_chz_janov_03","land_chz_janov_04","land_chz_cementarna_01","land_chz_cementarna_02","land_chz_cementarna_03","land_chz_cementarna_04","land_chz_lod1_chz","land_chz_lod2_chz","land_chz_stolb_s_fonaryami","land_chz_univermag_podzemi"]
,["Land_Hotze_HBridge_A","Land_Jbad_Kamenny_most30","Land_Jbad_Kamenny_most30v2","Land_Jbad_most_bez_lamp","Land_most_blok","Land_Jbad_most_stred30","land_chz_janov_most","land_chz_janov_most_stred","Land_PRAA_bridge_afconcrete_end","Land_PRAA_bridge_foot_both","Land_PRAA_bridge_foot_one","Land_PRAA_bridge_foot_none","Land_PRAA_bridge_foot_start"]
,["Camera1","Computer","Land_GymBench_01_F","Land_GymRack_01_F","Land_GymRack_02_F","Land_GymRack_03_F"]	
,["land_Objects121","land_Objects122","land_Objects123","land_Objects124","land_Objects125","land_Objects126","land_Objects127","land_Objects128","land_Objects129","land_Objects130","land_Objects131","land_Objects132","land_Objects133","land_Objects134","land_Objects135","Land_Dulni_bs","Land_Dum_zboreny","Land_afbarabizna","Land_kostel_trosky","land_Objects136","Land_HouseBlock_A1_ruins","Land_HouseBlock_A2_ruins","Land_HouseBlock_A3_ruins","Land_HouseBlock_B1_ruins","Land_HouseBlock_B3_ruins","Land_HouseBlock_B4_ruins","Land_HouseBlock_B5_ruins","Land_HouseBlock_B6_ruins","Land_HouseBlock_C1_ruins","Land_HouseBlock_C3_ruins","Land_A_Castle_Bergfrit_ruins","Land_A_Castle_Donjon_ruins","Land_A_Castle_Gate_ruins","Land_A_Castle_Stairs_A_ruins","Land_A_Castle_Wall1_20_ruins","Land_A_Castle_Wall1_20_turn_ruins","Land_A_Castle_Wall1_Corner_2_ruins","Land_A_Castle_Wall1_Corner_ruins","Land_A_Castle_Wall1_End_2_ruins","Land_A_Castle_Wall1_End_ruins","Land_A_Castle_Wall2_30_ruins","Land_A_Castle_Wall2_Corner_2_ruins","Land_A_Castle_Wall2_Corner_ruins","Land_A_Castle_Wall2_End_2_ruins","Land_A_Castle_Wall2_End_ruins","Land_A_Castle_WallS_5_D_ruins","Land_A_Castle_WallS_10_ruins","Land_A_Castle_WallS_End_ruins","Land_A_Castle_Bastion_ruins"]
,["land_vag_zbozi1","land_vag_polozeny","land_vag_masina","land_chz_janov_pumpa","Land_nadrazi_nastupiste","land_chz_sj_koleje","land_chz_koleje_sloup_3x","land_chz_koleje_sloup_4x","land_chz_janov_semafor_1","land_chz_janov_semafor_2","land_chz_janov_semafor_3","land_chz_janov_semafor_mechanic","land_chz_janov_semafor_small","land_chz_chnpp_railroad_1","land_chz_transformator","land_chz_transformator_2","land_chz_transformator_3","land_chz_train_vagon_01","land_chz_train_vagon_01_open","land_chz_train_vagon_01_open_br1","land_chz_train_vagon_02","land_chz_train_vagon_02_open","land_chz_train_vagon_02_open_br1","land_chz_train_vagon_02_open_br2","land_chz_train_vagon_02_open_krash","land_chz_train_vagon_03","land_chz_train_vagon_04","land_chz_train_vagon_05","land_chz_train_vagon_cisterna","land_chz_train_vagon_platforma","land_chz_train_vagon_suburban_01","land_chz_train_vagon_suburban_02","land_chz_train_vagon_zerno","land_chz_veh_diesel","land_chz_veh_diesel_br","land_chz_veh_elektrichka","land_chz_veh_elektrovoz","land_chz_crane"]		
,["land_chz_kontrolnibod_01","land_chz_kontrolnibod_01_budka","Land_Objekt2","Land_yupiter_plot","xRay_yupiter_ship","Land_Dam_Conc_20","Land_Dam_ConcP_20","Land_Molo_beton","Land_Molo_drevo","Land_Molo_drevo_bs","Land_Molo_drevo_end","Land_Molo_krychle","Land_Molo_krychle2","Land_Misc_Cargo1Ao","Land_Misc_Cargo1Bo","Land_Misc_Cargo1B","Misc_Cargo1B_military","Misc_Cargo1Bo_civil","Land_Misc_Cargo1C","Land_Misc_Cargo1D","Land_Misc_Cargo1E","Land_Misc_Cargo1F","Land_Misc_Cargo1G","Land_Misc_Cargo2B","Land_Misc_Cargo2C","Land_Misc_Cargo2D","Land_Misc_Cargo2E","Land_Misc_Cargo1Ao_EP1","Land_Misc_Cargo1Bo_EP1","Land_Misc_Cargo1Eo_EP1","Land_Misc_Cargo1E_EP1","Land_Misc_Cargo1A_EP1","Land_Misc_Cargo1B_EP1","Land_Misc_Cargo1C_EP1","Land_Misc_Cargo1D_EP1","Land_Misc_Cargo2A_EP1","Land_Misc_Cargo2B_EP1","Land_Misc_Cargo2C_EP1","Land_Misc_Cargo2D_EP1","Land_Misc_CargoMarket1a_EP1","Land_Misc_Cargo2E_EP1","Land_Dirthump01","Land_Dirthump02","Land_Dirthump03","Land_Misc_Coltan_Heap_EP1","land_chz_sj_jerab_01","land_chz_sj_jerab_02","land_chz_sj_jerab_03","land_chz_sj_jerab_04","land_chz_sj_pristav_01","land_chz_sj_pristav_02","land_chz_sj_pristav_03","land_chz_sj_pristav_04"]
,["land_Objects119","Land_Objekt9","land_chz_skladiste_01","obj_vagon1","xray_sarai_kletka","Land_Hut_old02","Land_Stodola_old_open","land_chz_janov_b_01","Land_Bouda2_vnitrek","Land_Hangar_2","Land_Garaz_mala","Land_Garaz_long_open","Land_Barn_W_01","land_chz_vesnice_dum13","Land_Barn_W_02","Land_Shed_Ind02","Land_seb_bouda_plech","Land_garaz","Land_kulna","Land_seb_residental"]
,["land_chz_janov_boudicka","land_chz_sklenik2","land_chz_janov_boudicka","land_chz_garage","land_chz_garaz1","land_chz_garaz4"]
,["land_seb_nasypka","military_ruin","Land_Objekt13","Land_Objekt1","Land_Objekt15","land_Objects15","land_Objects87","land_Objects91","land_seb_rozvodna","land_seb_mine_maringotka","land_Objects92","land_Objects100",	"land_Objects101","land_seb_nadrze","Land_seb_mine_main_opt","Land_seb_mine_near","Land_seb_near_fac","Land_seb_vod_vez","land_Objects102","land_Objects105","land_Objects107","Land_Tovarna1","Land_vys_antena","Land_vys_budova_p1","Land_vys_budova_p2","Land_x_nadrz","Land_x_skladiste_low_tex","Land_x_vetraci_komin","land_Objects108","land_chz_janov_b_03","land_Objects109","Land_Objekt3","Land_Objekt5","Land_Objekt16","Land_Objekt21","Land_Objekt22","Land_Objekt23","Land_Objekt24","Land_Objekt26","obj_antena","Land_Leseni4x","Land_fuelstation_w","land_chz_janov_boudicka","land_chz_autobusova_zastavka","land_chz_el_substation","Land_Leseni2x","Land_Watertower1","Land_Trafostanica_mala","Land_A_CraneCon","Land_Fuel_tank_stairs_ep1","land_vetrani","Land_seb_main_fac","Land_Nasypka","land_chz_skladoleju_01","land_chz_skladoleju_02","land_chz_skladoleju_03","land_chz_skladoleju_04","land_chz_skladoleju_05","land_chz_skladoleju_06_01","land_chz_skladoleju_06_02","land_chz_skladoleju_06_03","land_chz_skladoleju_07"]
,["Land_ladder","Land_ladder_half","Land_ladderEP1","ladder","Land_ladder_half_EP1","LadderLong","Land_A_Castle_Stairs_A","Land_WoodenRamp"]
,["Land_Garaz_s_tankem","obj_radar","Land_x_vez_tex","xray_agroprom_helihouse","CampEast","Land_Hlaska","Land_Posed","Land_Budova2","Land_Budova3","Fort_CAmp","Fort_Nest","Land_Fort_Watchtower","Land_fort_bagfence_corner","Land_fort_bagfence_long","Land_fort_bagfence_round","Land_BagFenceCorner","Land_BagFenceEnd","Land_BagFenceLong","Land_BagFenceRound","Land_BagFenceShort","Land_fort_artillery_nest","Land_fort_rampart","Fort_RazorWire","Fort_Crate_wood","Hedgehog","Hhedgehog_concrete","Hhedgehog_concreteBig","Land_A_tent","Land_tent_east","Land_GuardShed","Land_Antenna","Land_CamoNet_NATO","Land_CamoNetVar_NATO","Land_CamoNetB_NATO","Land_CamoNet_EAST","Land_CamoNetVar_EAST","Land_CamoNetB_EAST","76n6ClamShell","PowGen_Big","Land_vez","PowGen_Big_EP1","rhs_Flag_Russia_F","land_chz_vesnice_vodojem"]		
,["land_chz_potrubi_1_kompenzator","land_chz_potrubi_1_rovna","land_chz_potrubi_1_konec","land_chz_potrubi_1_prujezd","land_chz_potrubi_1_zatacka","land_chz_potrubi_1_zatacka2","land_chz_potrubi_2_kompenzator","land_chz_potrubi_2_rovna","land_chz_potrubi_2_rovna2","land_chz_potrubi_2_konec","land_chz_potrubi_2_prujezd","land_chz_potrubi_2_zatacka","land_chz_potrubi_2_zatacka2"]			
,["AmmoCrates_NoInteractive_Large","Objects5","land_Objects","land_Objects2","land_Objects11","land_Objects14","land_Objects3","land_Objects4","land_Objects5","land_Objects6","land_Objects7","land_Objects8","land_Objects9","land_Objects21","land_Objects46","land_Objects47","land_seb_panely","land_seb_spadly_stozar","land_seb_trubice_beton","land_Objects48","land_Objects49","land_Objects53","land_Objects54","land_Objects55","land_Objects56","land_Objects58","land_Objects59","land_Objects65","land_Objects67","land_Objects68","land_Objects72","land_Objects73","land_Objects74","land_Objects75","land_Objects76","Land_Objekt17","Vec03","land_seb_mine_near_bordel","sad_target","Land_Objekt18","Land_Objekt19","Land_Objekt25","ACamp","Land_jezekbeton","Barrels","Fort_Barricade","Land_Ind_Timbers","Land_Ind_BoardsPack1","Land_Ind_BoardsPack2","Haystack","Land_seno_balik","Land_PowGen_Big_ruins_EP1","land_chz_letterbox","land_chz_sushilka","land_chz_kontejner1_chz","land_chz_kontejner2_chz","land_chz_kontejner3_chz","land_chz_telefoni_budka_1","land_chz_telefoni_budka_2","land_chz_telefoni_budka_3"]
,["land_Objects24","land_Objects33","land_Objects34","land_Objects64","land_Objects86","land_Objects110","land_Objects111","land_Objects112","land_Objects114","land_Objects116","land_Objects117","land_Objects118","land_Objects120","Land_Objekt11","M113Wreck","BlackhawkWreck","BRDMWreck","UralWreck","BMP2Wreck","HMMWVWreck","T72Wreck","C130J_wreck_EP1","Land_Wreck_C130J_EP1_ruins","land_chz_avtobus","land_chz_avtobus2","land_chz_avtobus2a","land_chz_benzovoz_gaz","land_chz_benzovoz_zil","land_chz_btr","land_chz_btr_br","land_chz_btr_new","land_chz_buldozer","land_chz_gaz","land_chz_gaz66_01","land_chz_gaz66_02","land_chz_gazon","land_chz_kamaz_kabina","land_chz_kamaz_korpus","land_chz_kamaz_korpus2","land_chz_kamaz_korpus3","land_chz_kamaz_pricep","land_chz_katok_1","land_chz_katok_1_br","land_chz_molokovoz_01","land_chz_moskvich","land_chz_moskvich_2","land_chz_niva_01","land_chz_niva_02","land_chz_niva_03","land_chz_polevaya_kuhnya","land_chz_traktor_1","land_chz_traktor_2","land_chz_traktor_3","land_chz_traktor_4","land_chz_uazik_01","land_chz_uazik_01_new","land_chz_uazik_02","land_chz_uazik_02_new","land_chz_uaz_1","land_chz_zaz968_1","land_chz_zaz968_2","land_chz_zilok_1","land_chz_zilok_2","land_chz_zilok_3","land_chz_zilok_4","land_chz_zil_130_1","land_chz_zil_130_2","land_chz_zil_130_3","land_chz_zil_130_4","land_chz_zil_fire_1","land_chz_mi24_1","land_chz_mi24_1a","land_chz_mi24_2","land_chz_mi24_remont","land_chz_mi6","land_chz_mi6_dead","land_chz_mi6_dead_fire","land_chz_mi6_fire"]				
,["land_Objects35","Land_Objekt12","Land_Panelak","Land_Panelak2","Land_Panelak3","Land_Hotel","Land_A_Office02","Land_a_stationhouse","Land_A_GeneralStore_01","Hotze_Panelak1","Hotze_Panelak2","land_chz_el_substation","Hotze_Panelak3","land_chz_letterbox","land_chz_sushilka","land_chz_gastronom","land_chz_univermag","land_chz_autobusova_zastavka","land_chz_budova_01_01","land_chz_budova_01_02","land_chz_budova_01_03","land_chz_budova_01_04","land_chz_budova_01_05","land_chz_budova_02_01","land_chz_budova_02_02","land_chz_budova_03","land_chz_budova_04","land_chz_budova_05","land_chz_budova_06","land_chz_budova_07","land_chz_budova_08_01","land_chz_budova_08_02","land_chz_budova_09","land_chz_budova_10_01","land_chz_budova_10_02","land_chz_budova_11_01","land_chz_budova_11_02","land_chz_znacka_pripyat"]
,["land_chz_kinder_item_besedka","land_chz_kinder_item_elephant","land_chz_kinder_item_giraffe","land_chz_kinder_item_gorka","land_chz_kinder_item_gorka_2","land_chz_kinder_item_karusel","land_chz_kinder_item_lestnica","land_chz_kinder_item_pesochnica","land_chz_kinder_item_petuch","land_chz_kinder_item_rukochod","land_chz_kinder_item_rukohod","land_chz_kinder_item_stenka","land_chz_kinder_item_wire","land_chz_kinder_item_zamok"]	
,["Objects2","Objects3","Objects4","Objects6","Objects7","Objects8","Objects9","Objects10","Objects17","Objects18","Objects19","Objects21","Objects23","Objects27","land_Objects10","land_Objects17","land_Objects32","land_Objects18","land_Objects19","land_Objects20","land_Objects25","land_Objects26","land_Objects27","land_Objects29","land_Objects30","land_Objects62","land_Objects77","land_Objects78","land_Objects79","land_Objects80","land_Objects81","land_Objects82","land_Objects83","land_Objects84","land_Objects85","land_Objects90","land_Objects94","land_Objects95","land_Objects96","land_chz_janov_b_02","land_Objects97","land_Objects98","land_chz_vesnice_dum01","land_chz_vesnice_dum03","land_chz_vesnice_dum04","land_chz_vesnice_dum08","land_chz_vesnice_dum09","land_chz_vesnice_dum10","land_chz_vesnice_dum12","land_chz_vesnice_dum14","land_chz_vesnice_dum16","Land_sara_domek_podhradi_1","Land_water_tank","land_mbg_brickhouse_01","land_mbg_brickhouse_03","Land_Deutshe_mini","Land_Ryb_domek","Land_Dum_rasovna","Land_Sara_Domek_sedy","Land_Sara_domek_zluty","Land_Sara_zluty_statek_in","Land_Dum_mesto2"]
,["Objects","Wire","Objects11","Objects12","Objects13","land_Objects36","land_chz_letterbox","land_chz_sushilka","land_Objects37","land_Objects38","land_Objects39","land_Objects40","land_Objects41","land_Objects42","land_Objects43","land_Objects44","land_Objects45","land_Objects50","Land_statek_brana","Land_statek_brana_open","land_Objects51","Land_plot_zed_drevo1_branka","Land_plot_istan1_rovny_gate","Land_Plot_Ohrada_Pruchozi","Land_plot_zboreny","Land_zed_dira_civil","land_Objects52","land_Objects57","land_Objects60","Land_brana02nodoor","land_Objects61","land_Objects69","land_Objects93","land_Objects99","land_Objects115","Land_BarGate2","Land_plot_zed_drevo1_branka","Land_Plot_Ohrada_Pruchozi","Land_plot_zboreny","Land_zed_dira_civil","land_chz_ston_zabor_01","land_chz_ston_zabor_02","land_chz_wood_zabor_01","land_chz_wood_zabor_02","land_chz_wood_zabor_03","land_chz_wood_zabor_village_1"]
,["land_chz_wood_zabor_village_2","land_chz_wood_zabor_village_3","land_chz_wood_vysoky","land_chz_wood_vysoky_dvere","land_chz_plot_drat","land_chz_plot_drat_konec","land_chz_kontrolnibod_01_brana","land_chz_hrbitov_brana","land_chz_bortik_1_01","land_chz_bortik_1_02","land_chz_bortik_1_03","land_chz_bortik_2_01","land_chz_bortik_2_02","land_chz_bortik_2_03","land_chz_drobnost_1","land_chz_drobnost_2","land_chz_drobnost_3"]
,["Objects14","Objects15","Objects16","Objects28","Land_Objekt","Land_Objekt4","Land_Objekt8","underground_trader","xray_agroprom_house1","Land_MBG_HeavyShelter"]	
,["land_chz_table_of_names","land_chz_radiation","land_Objects31","land_Objects70","land_Objects71","land_Objects89","Atraction_koleso","snowman","land_chz_props_vishka_1","land_chz_hrob_bily_01","land_chz_hrob_bily_02","land_chz_hrob_bily_kriz","land_chz_hrob_zeleny_01","land_chz_hrob_zeleny_02","land_chz_hrob_modry_01","land_chz_hrob_modry_02","land_chz_hrob_zeleny_kriz","land_chz_chnpp_lenin"]
,["xRay_betonfloor","land_terain_velke_panely","land_terain_panely_kratke","land_terain_panely_slope","land_terain_dlazice_kratke","Land_Podesta_1_cube","Land_Podesta_1_cube_long","land_chz_namesti_01","land_chz_namesti_02","land_chz_namesti_03","land_chz_namesti_04","land_chz_namesti_05","land_chz_namesti_06","land_chz_namesti_07","land_chz_namesti_08","land_chz_namesti_09","land_chz_namesti_panely_01","land_chz_namesti_panely_02","land_chz_namesti_panely_03","land_chz_namesti_panely_04","land_chz_namesti_hlina","Land_Podesta_1_cornl","Land_Podesta_1_cornp","Land_Podesta_1_mid_cornl","Land_Podesta_1_mid_cornp","Land_Podesta_1_mid","Land_Podesta_1_stairs","Land_Podesta_1_stairs2","Land_Podesta_1_stairs3","Land_Podesta_1_stairs4","Land_Podesta_5","Land_Podesta_10","Land_Podesta_s5","Land_Podesta_s10","snow","Land_ConcreteRamp","Land_ConcreteBlock","Land_Dirthump01_EP1","Land_Dirthump02_EP1","Land_Dirthump03_EP1","Dirtmount_EP1","Heli_H_civil","Heli_H_rescue","Land_Misc_Coltan_Heap_EP1","FootBridge_0_ACR","Hotze_lavicka_1","Hotze_Place_1","Hotze_Place_2","Hotze_Place_3","Hotze_Place_4","Hotze_Place_6","Hotze_SwalkA_B1","Hotze_SwalkA_B2","Hotze_SwalkA_B3","land_tanl_entrance_n","land_tanl_entrance","land_terain_base_a"]
,["underground_1","underground_2","underground_4","Land_Objekt6"]
,["Land_A_Castle_Gate","Land_A_Castle_Wall1_20","Land_A_Castle_Wall1_20_Turn","Land_A_Castle_Wall1_Corner","Land_A_Castle_Wall1_End","Land_A_Castle_Wall1_End_2","Land_A_Castle_Wall2_30","Land_A_Castle_Wall2_Corner","Land_A_Castle_Wall2_End","Land_A_Castle_Wall2_End_2","Land_A_Castle_WallS_10","Land_A_Castle_WallS_5_D","Land_A_Castle_WallS_End","Land_A_Castle_Stairs_A","Land_A_Castle_Wall1_Corner_2","Land_A_Castle_Wall2_Corner_2","Land_A_Castle_Bergfrit","Land_A_Castle_Donjon"]	
,["Land_Jbad_bedna","Land_Jbad_cihly1","Land_Jbad_cihly2","Land_Jbad_cihly3","Land_Jbad_koz","Land_Jbad_ytong","Land_jbad_cihly4","Land_jbad_pipe_big","Land_jbad_pipe_small","Land_Jbad_AirCond_big","Land_Jbad_AirCond_small","Land_Jbad_Misc_Cable","Land_Jbad_Misc_Cable_Rugs1","Land_Jbad_Misc_Cable_V","Land_Jbad_case_d","Land_Jbad_metalcrate","Land_Jbad_ch_office_b","Land_Jbad_Kitchen_Chair_a","Land_Jbad_Lobby_Chair","Land_Jbad_Com_tower","Land_Jbad_Misc_Coil","Land_Jbad_Misc_ConcBox","Land_Jbad_Misc_ConcOutlet","Land_Jbad_Misc_ConcPipeline","Land_Jbad_Misc_IronPipes","Land_Jbad_Misc_Rubble","Land_Jbad_paletaA","Land_jbad_Misc_palletsfoiled","Land_Jbad_PC","Land_Jbad_radio_b","Land_Jbad_tv_a","Land_Jbad_vending_machine","Land_Jbad_Flower_01","Land_Jbad_Flower_02","Land_Jbad_Misc_Garb_Heap","Land_jbad_Misc_Garb_3","Land_jbad_Misc_Garb_4","Land_jbad_Misc_Garb_Square","Land_Jbad_Kamenny_most30","Land_Jbad_Kamenny_most30v2","Land_Jbad_most_bez_lamp","Land_Jbad_most_stred30","Land_jbad_Cargo1_int","Land_jbad_Cargo2_int","Land_jbad_Cargo3_int","Land_jbad_Cargo4_int","Land_jbad_Cargo5_int","Land_jbad_Cargo6_int","Land_jbad_Cargo7_int","Land_jbad_A_GeneralStore_01","Land_jbad_A_GeneralStore_01a","Land_jbad_A_GeneralStore_01_dam","Land_jbad_A_GeneralStore_01a_dam","Land_Jbad_A_GeneralStore_01_ruins","Land_Jbad_hangar_2","Land_Jbad_Ind_Coltan_Conv1_10","Land_Jbad_Ind_Coltan_Conv1_End","Land_Jbad_Ind_Coltan_Conv1_Main","Land_Jbad_Ind_Coltan_Conv2","Land_Jbad_Ind_Coltan_Hopper","Land_Jbad_Ind_Coltan_Main","Land_Jbad_Ind_Coltan_Rail","Land_Jbad_Ind_Coltan_Rail_End","Land_Jbad_Ind_Coltan_Rail_switch","Land_Jbad_Ind_Coltan_Tunnel","Land_Jbad_Misc_Coltan_Heap","Land_Jbad_Misc_Tram","Land_Jbad_Ind_Coltan_Hopper_Ruins","Land_Jbad_Ind_Coltan_Main_Ruins","Land_Jbad_Ind_Conveyer","Land_Jbad_Ind_FuelStation_Build","Land_Jbad_Ind_FuelStation_Feed","Land_Jbad_Ind_FuelStation_Shed","Land_Jbad_Ind_FuelStation_Sign","Land_Jbad_Ind_Garage01","Land_Jbad_Ind_Garage01_ruins","Land_Jbad_Ind_PowerStation","Land_Jbad_Ind_PowerStation_ruins","Land_Jbad_Ind_Shed_01","Land_Jbad_Ind_Shed_02","Land_Jbad_Ind_Shed_01_ruins","Land_Jbad_Ind_Shed_02_ruins","Land_Jbad_Mil_Barracks","Land_Jbad_Mil_ControlTower","Land_Jbad_Mil_Guardhouse","Land_Jbad_Mil_House","Land_Jbad_Mil_ControlTower_dam","Land_Jbad_Mil_House_dam","Land_Jbad_Mil_Barracks_ruins","Land_Jbad_Mil_ControlTower_ruins","Land_Jbad_Mil_Guardhouse_ruins","Land_Jbad_Mil_House_ruins","Land_jbad_t_acer2s","Land_jbad_t_AmygdalusC2s","Land_jbad_t_FicusB2s"]
,["Land_A_Office01","Land_A_Office01_ruins","Land_A_Office01_EP1","Land_A_Office01_ruins_ep1","Land_ProjectCherno_A_Hospital","Land_ProjectCherno_HouseV_3I3","Land_ProjectCherno_HouseV_1L2_i","Land_HouseV_1L2","Land_HouseV_3I3","Land_ProjectCherno_HouseV2_02_Interier","Land_ProjectCherno_HouseV2_04_Interier","Land_HouseV2_02_Interier","Land_HouseV2_04_Interier","Land_ProjectCherno_Mil_Barracks_i","Land_Mil_Barracks_Test","Land_Mil_Barracks_i"]
,["rhs_mags_crate","rhs_weapon_crate","Box_av_all_rifle"]
,["Land_MBG_Killhouse_1", "Land_MBG_Killhouse_2", "Land_MBG_Killhouse_3", "Land_MBG_Killhouse_4", "Land_MBG_Killhouse_5"]
,["DWT_USBasicBoxSmall","DWT_USBasicLaunchers","DWT_USBasicAmmo","DWT_USBasicExplosive","DWT_USBasicWeapons","DWT_Box_Pallet_Large","DWT_Box_PaperBox_Open_Full","DWT_Box_PaperBox_Closed","DWT_Box_PaperBox_Empty_Open"]
,["plp_ct_CartonDarkBig",
			"plp_ct_CartonDarkFlat",
			"plp_ct_CartonDarkMedium",
			"plp_ct_CartonDarkSmall",
			"plp_ct_CartonLightBig",
			"plp_ct_CartonLightFlat",
			"plp_ct_CartonLightMedium",
			"plp_ct_CartonLightSmall",
			"plp_ct_CartonRottenBig",
			"plp_ct_CartonRottenFlat",
			"plp_ct_CartonRottenMedium",
			"plp_ct_CartonRottenSmall",
			"plp_ct_CasketLeatherBlack",
			"plp_ct_CasketLeatherBrown",
			"plp_ct_CasketLeatherGreen",
			"plp_ct_CasketLeatherRed",
			"plp_ct_ContPlainBlack",
			"plp_ct_ContPlainBlue",
			"plp_ct_ContPlainGreen",
			"plp_ct_ContPlainOlive",
			"plp_ct_ContPlainRed",
			"plp_ct_ContPlainTan",
			"plp_ct_ContPlainYellow",
			"plp_ct_ContPlainWhite",
			"plp_ct_ContShippingBlue",
			"plp_ct_ContShippingDarkBrown",
			"plp_ct_ContShippingDarkBlue",
			"plp_ct_ContShippingDarkGrey",
			"plp_ct_ContShippingDarkRed",
			"plp_ct_ContShippingGreen",
			"plp_ct_ContShippingGrey",
			"plp_ct_ContShippingLightBlue",
			"plp_ct_ContShippingNavyBlue",
			"plp_ct_ContShippingOrange",
			"plp_ct_ContShippingRed",
			"plp_ct_ContShippingYellow",
			"plp_ct_FootlockerBrown",
			"plp_ct_FootlockerGreen",
			"plp_ct_FootlockerRed",
			"plp_ct_FootlockerYellow",
			"plp_ct_HighSecContBlack",
			"plp_ct_HighSecContBlue",
			"plp_ct_HighSecContGrey",
			"plp_ct_HighSecContRed",
			"plp_ct_HighSecContWhite",
			"plp_ct_HighSecBigBlack",
			"plp_ct_HighSecBigBlue",
			"plp_ct_HighSecBigGrey",
			"plp_ct_HighSecBigRed",
			"plp_ct_HighSecBigWhite",
			"plp_ct_HighSecMediumBlack",
			"plp_ct_HighSecMediumBlue",
			"plp_ct_HighSecMediumGrey",
			"plp_ct_HighSecMediumRed",
			"plp_ct_HighSecMediumWhite",
			"plp_ct_HighSecSmallBlack",
			"plp_ct_HighSecSmallBlue",
			"plp_ct_HighSecSmallGrey",
			"plp_ct_HighSecSmallRed",
			"plp_ct_HighSecSmallWhite",
			"plp_ct_MilBoxBigBlack",
			"plp_ct_MilBoxBigOlive",
			"plp_ct_MilBoxLongBlack",
			"plp_ct_MilBoxLongOlive",
			"plp_ct_MilBoxMediumBlack",
			"plp_ct_MilBoxMediumOlive",
			"plp_ct_MilBoxMetalBlack",
			"plp_ct_MilBoxMetalOlive",
			"plp_ct_MilBoxSmallBlack",
			"plp_ct_MilBoxSmallOlive",
			"plp_ct_PlasticBoxBlack",
			"plp_ct_PlasticBoxBlue",
			"plp_ct_PlasticBoxGrey",
			"plp_ct_PlasticBoxRed",
			"plp_ct_PlasticTrashcanBlack",
			"plp_ct_PlasticTrashcanBlue",
			"plp_ct_PlasticTrashcanRed",
			"plp_ct_PlasticTrashcanWhite",
			"plp_ct_RecycleBinBlack",
			"plp_ct_RecycleBinBlackOpenTrash",
			"plp_ct_RecycleBinBlue",
			"plp_ct_RecycleBinBlueOpenTrash",
			"plp_ct_RecycleBinGreen",
			"plp_ct_RecycleBinGreenOpenTrash",
			"plp_ct_RecycleBinYellow",
			"plp_ct_RecycleBinYellowOpenTrash",
			"plp_ct_Sack",
			"plp_ct_SuitcaseBigBlack",
			"plp_ct_SuitcaseBigBlue",
			"plp_ct_SuitcaseBigGreen",
			"plp_ct_SuitcaseBigGrey",
			"plp_ct_SuitcaseBigRed",
			"plp_ct_SuitcaseFabricBeigeSide",
			"SuitcaseFabricBlackSide",
			"SuitcaseFabricBrownSide",
			"SuitcaseFabricGreenSide",
			"SuitcaseFabricRedSide",
			"plp_ct_SuitcaseMetalBlackSide",
			"plp_ct_SuitcaseMetalSilverSide",
			"plp_ct_TrashContColGeneric",
			"plp_ct_TrashContColGenericOpen",
			"plp_ct_TrashContColGlass",
			"plp_ct_TrashContColPaper",
			"plp_ct_TrashContColPlastics",
			"plp_ct_TrashContGreyBig",
			"plp_ct_TrashContGreyMedium",
			"plp_ct_TrashContGreyMediumOpenTrash",
			"plp_ct_TrashContGreySmall",
			"plp_ct_TrashContGreySmallOpenTrash",
			"plp_ct_TravelBagBlue",
			"plp_ct_VMachineCigBlue",
			"plp_ct_VMachineCigRed",
			"plp_ct_VMachineCoffeeBlackOff",
			"plp_ct_VMachineCoffeeBlackOn",
			"plp_ct_VMachineDrinksBeigeOff",
			"plp_ct_VMachineDrinksBeigeOn",
			"plp_ct_VMachineDrinksBlackOff",
			"plp_ct_VMachineDrinksBlackOn",
			"plp_ct_VMachineGumsGreen",
			"plp_ct_VMachineGumsRed",
			"plp_ct_VMachineSnacksBeigeOff",
			"plp_ct_VMachineSnacksBeigeOn",
			"plp_ct_VMachineSnacksBlackOff",
			"plp_ct_VMachineSnacksBlackOn",
			"plp_ct_TrashcanCityMetalBrushed",
			"plp_ct_TrashcanCityPlasticGreen",
			"plp_ct_TrashcanCityPlasticOrange",
			"plp_ct_TrashCanCityPark",
			"plp_ct_TrashcanHouseBathroom",
			"plp_ct_TrashcanHouseGeneric",
			"plp_ct_TrashcanHouseGenericOpen",
			"plp_ct_TrashcanHouseSmall",
			"plp_ct_TrashcanIndPurple",
			"plp_ct_TrashcanIndRed",
			"plp_ct_WeathCrateBigBrown",
			"plp_ct_WeathCrateBigGreen",
			"plp_ct_WeathCrateBigWorn",
			"plp_ct_WeathCrateLongBrown",
			"plp_ct_WeathCrateLongGreen",
			"plp_ct_WeathCrateLongWorn",
			"plp_ct_WeathCrateMediumBrown",
			"plp_ct_WeathCrateMediumGreen",
			"plp_ct_WeathCrateMediumWorn",
			"plp_ct_WeathCrateSmallBrown",
			"plp_ct_WeathCrateSmallGreen",
			"plp_ct_WeathCrateSmallWorn",
			"plp_ct_WoodBoxLightBig",
			"plp_ct_WoodBoxLightHuge",
			"plp_ct_WoodBoxLightLong",
			"plp_ct_WoodBoxLightMedium",
			"plp_ct_WoodBoxLightSmall",
			"plp_ct_WoodBoxLightTiny",
			"plp_ct_WoodBarrelDark",
			"plp_ct_WoodBarrelLight",
			"plp_ctf_BarrelBlack",
			"plp_ctf_BarrelBlue",
			"plp_ctf_BarrelOlive",
			"plp_ctf_BarrelRusty",
			"plp_ctf_BarrelTan",
			"plp_ctf_BarrelYellow",
			"plp_ctf_CanisterBlue",
			"plp_ctf_CanisterRed",
			"plp_ctf_MetalBarrelBlue",
			"plp_ctf_MetalBarrelOlive",
			"plp_ctf_SafetyBarrelBlue",
			"plp_ctf_SafetyBarrelGreen",
			"plp_ctf_SafetyBarrelRed",
			"plp_ctf_SafetyBarrelWhite",
			"plp_ctm_BarrelBiohazard",
			"plp_ctm_BarrelBiohazardSide",
			"plp_ctm_BarrelBlack",
			"plp_ctm_BarrelBlackSide",
			"plp_ctm_BarrelBlue",
			"plp_ctm_BarrelBlueSide",
			"plp_ctm_BarrelGreen",
			"plp_ctm_BarrelGreenSide",
			"plp_ctm_BarrelOlive",
			"plp_ctm_BarrelOliveSide",
			"plp_ctm_BarrelRadioactive",
			"plp_ctm_BarrelRadioactiveSide",
			"plp_ctm_BarrelRed",
			"plp_ctm_BarrelRedSide",
			"plp_ctm_BarrelRustyA",
			"plp_ctm_BarrelRustyASide",
			"plp_ctm_BarrelRustyB",
			"plp_ctm_BarrelRustyBSide",
			"plp_ctm_BarrelTan",
			"plp_ctm_BarrelTanSide",
			"plp_ctm_BarrelYellow",
			"plp_ctm_BarrelYellowSide",
			"plp_ctm_ContPlainBlack",
			"plp_ctm_ContPlainBlue",
			"plp_ctm_ContPlainGreen",
			"plp_ctm_ContPlainOlive",
			"plp_ctm_ContPlainRed",
			"plp_ctm_ContPlainTan",
			"plp_ctm_ContPlainYellow",
			"plp_ctm_ContPlainWhite",
			"plp_ctm_ContShippingBlue",
			"plp_ctm_ContShippingBrown",
			"plp_ctm_ContShippingDarkBlue",
			"plp_ctm_ContShippingDarkGrey",
			"plp_ctm_ContShippingDarkRed",
			"plp_ctm_ContShippingGreen",
			"plp_ctm_ContShippingGrey",
			"plp_ctm_ContShippingLightBlue",
			"plp_ctm_ContShippingNavyBlue",
			"plp_ctm_ContShippingOrange",
			"plp_ctm_ContShippingRed",
			"plp_ctm_ContShippingYellow",
			"plp_ctm_HighSecContBlack",
			"plp_ctm_HighSecContBlackNoDolly",
			"plp_ctm_HighSecContBlue",
			"plp_ctm_HighSecContBlueNoDolly",
			"plp_ctm_HighSecContGrey",
			"plp_ctm_HighSecContGreyNoDolly",
			"plp_ctm_HighSecContRed",
			"plp_ctm_HighSecContRedNoDolly",
			"plp_ctm_HighSecContWhite",
			"plp_ctm_HighSecContWhiteNoDolly",
			"plp_ctm_HighSecContTrailer",
			"plp_ctm_HighSecBigBlack",
			"plp_ctm_HighSecBigBlackSide",
			"plp_ctm_HighSecBigBlue",
			"plp_ctm_HighSecBigBlueSide",
			"plp_ctm_HighSecBigGrey",
			"plp_ctm_HighSecBigGreySide",
			"plp_ctm_HighSecBigRed",
			"plp_ctm_HighSecBigRedSide",
			"plp_ctm_HighSecBigWhite",
			"plp_ctm_HighSecBigWhiteSide",
			"plp_ctm_HighSecMediumBlack",
			"plp_ctm_HighSecMediumBlackSide",
			"plp_ctm_HighSecMediumBlue",
			"plp_ctm_HighSecMediumBlueSide",
			"plp_ctm_HighSecMediumGrey",
			"plp_ctm_HighSecMediumGreySide",
			"plp_ctm_HighSecMediumRed",
			"plp_ctm_HighSecMediumRedSide",
			"plp_ctm_HighSecMediumWhite",
			"plp_ctm_HighSecMediumWhiteSide",
			"plp_ctm_HighSecSmallBlack",
			"plp_ctm_HighSecSmallBlue",
			"plp_ctm_HighSecSmallGrey",
			"plp_ctm_HighSecSmallRed",
			"plp_ctm_HighSecSmallWhite",
			"plp_ctm_MetalBarrelBlue",
			"plp_ctm_MetalBarrelBlueSide",
			"plp_ctm_MetalBarrelOlive",
			"plp_ctm_MetalBarrelOliveSide",
			"plp_ctm_MetalBarrelRed",
			"plp_ctm_MetalBarrelRedSide",
			"plp_ctm_MetalBarrelWhite",
			"plp_ctm_MetalBarrelWhiteSide",
			"plp_ctm_MetalBarrelYellow",
			"plp_ctm_MetalBarrelYellowSide",
			"plp_ctm_TrashcanCityMetalBrushed",
			"plp_ctm_TrashcanCityPark",
			"plp_ctm_TrashcanHouseBathroom",
			"plp_ctm_TrashcanHouseBathroomSide",
			"plp_ctm_TrashcanHouseGeneric",
			"plp_ctm_TrashcanHouseGenericOpen",
			"plp_ctm_TrashcanHouseGenericOpenSide",
			"plp_ctm_TrashcanHouseGenericSide",
			"plp_ctm_TrashcanHouseSmall",
			"plp_ctm_TrashcanHouseSmallSide",
			"plp_ctm_TrashcanIndPurple",
			"plp_ctm_TrashcanIndPurpleSide",
			"plp_ctm_TrashcanIndRed",
			"plp_ctm_TrashcanIndRedSide",
			"plp_ctm_TrashContGreyBig",
			"plp_ctm_TrashContGreyBigOpen",
			"plp_ctm_TrashContGreyBigSide",
			"plp_ctm_TrashContGreyMedium",
			"plp_ctm_TrashContGreyMediumOpen",
			"plp_ctm_TrashContGreyMediumSide",
			"plp_ctm_TrashContGreySmall",
			"plp_ctm_TrashContGreySmallOpen",
			"plp_ctm_TrashContGreySmallSide",
			"plp_ctm_TrashContColGeneric",
			"plp_ctm_TrashContColGenericOpen",
			"plp_ctm_TrashContColGlass",
			"plp_ctm_TrashContColGlassOpen",
			"plp_ctm_TrashContColPaper",
			"plp_ctm_TrashContColPaperOpen",
			"plp_ctm_TrashContColPlastics",
			"plp_ctm_TrashContColPlasticsOpen",
			"plp_ctm_VMachineCoffeeBlackOff",
			"plp_ctm_VMachineCoffeeBlackOn",
			"plp_ctm_VMachineCoffeeBlackSide",
			"plp_ctm_VMachineCigBlue",
			"plp_ctm_VMachineCigRed",
			"plp_ctm_VMachineDrinksBeigeOff",
			"plp_ctm_VMachineDrinksBeigeOn",
			"plp_ctm_VMachineDrinksBlackOff",
			"plp_ctm_VMachineDrinksBlackOn",
			"plp_ctm_VMachineGumsGreen",
			"plp_ctm_VMachineGumsRed",
			"plp_ctm_VMachineSnacksBeigeOff",
			"plp_ctm_VMachineSnacksBeigeOn",
			"plp_ctm_VMachineSnacksBlackOff",
			"plp_ctm_VMachineSnacksBlackOn",
			"plp_ctm_CanisterBlue",
			"plp_ctm_CanisterBlueSide",
			"plp_ctm_CanisterRed",
			"plp_ctm_CanisterRedSide",
			"plp_ctm_CanisterWhite",
			"plp_ctm_CanisterWhiteSide",
			"plp_ctm_PlasticTrashcanBlack",
			"plp_ctm_PlasticTrashcanBlackSide",
			"plp_ctm_PlasticTrashcanBlue",
			"plp_ctm_PlasticTrashcanBlueSide",
			"plp_ctm_PlasticTrashcanRed",
			"plp_ctm_PlasticTrashcanRedSide",
			"plp_ctm_PlasticTrashcanWhite",
			"plp_ctm_PlasticTrashcanWhiteSide",
			"plp_ctm_PlasticBoxBlack",
			"plp_ctm_PlasticBoxBlackOpen",
			"plp_ctm_PlasticBoxBlackOpenLow",
			"plp_ctm_PlasticBoxBlackOpenSide",
			"plp_ctm_PlasticBoxBlue",
			"plp_ctm_PlasticBoxBlueOpen",
			"plp_ctm_PlasticBoxBlueOpenLow",
			"plp_ctm_PlasticBoxBlueOpenSide",
			"plp_ctm_PlasticBoxGrey",
			"plp_ctm_PlasticBoxGreyOpen",
			"plp_ctm_PlasticBoxGreyOpenLow",
			"plp_ctm_PlasticBoxGreyOpenSide",
			"plp_ctm_PlasticBoxRed",
			"plp_ctm_PlasticBoxRedOpen",
			"plp_ctm_PlasticBoxRedOpenLow",
			"plp_ctm_PlasticBoxRedOpenSide",
			"plp_ctm_RecycleBinBlack",
			"plp_ctm_RecycleBinBlackOpenEmpty",
			"plp_ctm_RecycleBinBlackOpenTrash",
			"plp_ctm_RecycleBinBlackSide",
			"plp_ctm_RecycleBinBlue",
			"plp_ctm_RecycleBinBlueOpenEmpty",
			"plp_ctm_RecycleBinBlueOpenTrash",
			"plp_ctm_RecycleBinBlueSide",
			"plp_ctm_RecycleBinGreen",
			"plp_ctm_RecycleBinGreenOpenEmpty",
			"plp_ctm_RecycleBinGreenOpenTrash",
			"plp_ctm_RecycleBinGreenSide",
			"plp_ctm_RecycleBinYellow",
			"plp_ctm_RecycleBinYellowOpenEmpty",
			"plp_ctm_RecycleBinYellowOpenTrash",
			"plp_ctm_RecycleBinYellowSide",
			"plp_ctm_SafetyBarrelBlue",
			"plp_ctm_SafetyBarrelBlueSide",
			"plp_ctm_SafetyBarrelGreen",
			"plp_ctm_SafetyBarrelGreenSide",
			"plp_ctm_SafetyBarrelRed",
			"plp_ctm_SafetyBarrelRedSide",
			"plp_ctm_SafetyBarrelWhite",
			"plp_ctm_SafetyBarrelWhiteSide",
			"plp_ctm_TrashcanCityPlasticGreen",
			"plp_ctm_TrashcanCityPlasticOrange",
			"plp_ctm_CartonDarkBig",
			"plp_ctm_CartonDarkBigOpen",
			"plp_ctm_CartonDarkBigSide",
			"plp_ctm_CartonDarkFlat",
			"plp_ctm_CartonDarkFlatOpen",
			"plp_ctm_CartonDarkMedium",
			"plp_ctm_CartonDarkMediumOpen",
			"plp_ctm_CartonDarkMediumSide",
			"plp_ctm_CartonDarkSmall",
			"plp_ctm_CartonDarkSmallOpen",
			"plp_ctm_CartonDarkSmallSide",
			"plp_ctm_CartonHalfOpen",
			"plp_ctm_CartonHalfOpenSide",
			"plp_ctm_CartonHalfOpenRotten",
			"plp_ctm_CartonHalfOpenRottenSide",
			"plp_ctm_CartonLightBig",
			"plp_ctm_CartonLightBigOpen",
			"plp_ctm_CartonLightBigSide",
			"plp_ctm_CartonLightFlat",
			"plp_ctm_CartonLightFlatOpen",
			"plp_ctm_CartonLightMedium",
			"plp_ctm_CartonLightMediumOpen",
			"plp_ctm_CartonLightMediumSide",
			"plp_ctm_CartonLightSmall",
			"plp_ctm_CartonLightSmallOpen",
			"plp_ctm_CartonLightSmallSide",
			"plp_ctm_CartonRottenBig",
			"plp_ctm_CartonRottenBigOpen",
			"plp_ctm_CartonRottenBigSide",
			"plp_ctm_CartonRottenFlat",
			"plp_ctm_CartonRottenFlatOpen",
			"plp_ctm_CartonRottenMedium",
			"plp_ctm_CartonRottenMediumOpen",
			"plp_ctm_CartonRottenMediumSide",
			"plp_ctm_CartonRottenSmall",
			"plp_ctm_CartonRottenSmallOpen",
			"plp_ctm_CartonRottenSmallSide",
			"plp_ctm_CasketLeatherBlack",
			"plp_ctm_CasketLeatherBlackSide",
			"plp_ctm_CasketLeatherBrown",
			"plp_ctm_CasketLeatherBrownSide",
			"plp_ctm_CasketLeatherGreen",
			"plp_ctm_CasketLeatherGreenSide",
			"plp_ctm_CasketLeatherRed",
			"plp_ctm_CasketLeatherRedSide",
			"plp_ctm_FootlockerBrown",
			"plp_ctm_FootlockerBrownOpen",
			"plp_ctm_FootlockerGreen",
			"plp_ctm_FootlockerGreenOpen",
			"plp_ctm_FootlockerRed",
			"plp_ctm_FootlockerRedOpen",
			"plp_ctm_FootlockerYellow",
			"plp_ctm_FootlockerYellowOpen",
			"plp_ctm_Sack",
			"plp_ctm_SuitcaseFabricBeige",
			"plp_ctm_SuitcaseFabricBeigeSide",
			"plp_ctm_SuitcaseFabricBlack",
			"plp_ctm_SuitcaseFabricBlackSide",
			"plp_ctm_SuitcaseFabricBrown",
			"plp_ctm_SuitcaseFabricBrownSide",
			"plp_ctm_SuitcaseFabricGreen",
			"plp_ctm_SuitcaseFabricGreenSide",
			"plp_ctm_SuitcaseFabricRed",
			"plp_ctm_SuitcaseFabricRedSide",
			"plp_ctm_SuitcaseMetalBlack",
			"plp_ctm_SuitcaseMetalBlackSide",
			"plp_ctm_SuitcaseMetalSilver",
			"plp_ctm_SuitcaseMetalSilverSide",
			"plp_ctm_WoodBarrelDark",
			"plp_ctm_WoodBarrelDarkSide",
			"plp_ctm_WoodBarrelLight",
			"plp_ctm_WoodBarrelLightSide",
			"plp_ctm_WoodBoxLightBig",
			"plp_ctm_WoodBoxLightBigOpen",
			"plp_ctm_WoodBoxLightBigOpenSide",
			"plp_ctm_WoodBoxLightHuge",
			"plp_ctm_WoodBoxLightHugeOpen",
			"plp_ctm_WoodBoxLightLong",
			"plp_ctm_WoodBoxLightLongLeaned",
			"plp_ctm_WoodBoxLightLongOpen",
			"plp_ctm_WoodBoxLightMedium",
			"plp_ctm_WoodBoxLightMediumOpen",
			"plp_ctm_WoodBoxLightSmall",
			"plp_ctm_WoodBoxLightTiny",
			"plp_ctm_WoodBoxLightTinyOpen",
			"plp_ctm_WoodBoxLightTinySide",
			"plp_ctm_WeathCrateBigBrown",
			"plp_ctm_WeathCrateBigBrownLeaned",
			"plp_ctm_WeathCrateBigGreen",
			"plp_ctm_WeathCrateBigGreenLeaned",
			"plp_ctm_WeathCrateBigWorn",
			"plp_ctm_WeathCrateBigWornLeaned",
			"plp_ctm_WeathCrateLongBrown",
			"plp_ctm_WeathCrateLongBrownLeaned",
			"plp_ctm_WeathCrateLongGreen",
			"plp_ctm_WeathCrateLongGreenLeaned",
			"plp_ctm_WeathCrateLongWorn",
			"plp_ctm_WeathCrateLongWornLeaned",
			"plp_ctm_WeathCrateMediumBrown",
			"plp_ctm_WeathCrateMediumGreen",
			"plp_ctm_WeathCrateMediumWorn",
			"plp_ctm_WeathCrateSmallBrown",
			"plp_ctm_WeathCrateSmallBrownStanding",
			"plp_ctm_WeathCrateSmallGreen",
			"plp_ctm_WeathCrateSmallGreenStanding",
			"plp_ctm_WeathCrateSmallWorn",
			"plp_ctm_WeathCrateSmallWornStanding",
			"plp_cts_BarrelBiohazard",
			"plp_cts_BarrelBiohazardSide",
			"plp_cts_BarrelBlack",
			"plp_cts_BarrelBlackSide",
			"plp_cts_BarrelBlue",
			"plp_cts_BarrelBlueSide",
			"plp_cts_BarrelGreen",
			"plp_cts_BarrelGreenSide",
			"plp_cts_BarrelOlive",
			"plp_cts_BarrelOliveSide",
			"plp_cts_BarrelRadioactive",
			"plp_cts_BarrelRadioactiveSide",
			"plp_cts_BarrelRed",
			"plp_cts_BarrelRedSide",
			"plp_cts_BarrelRustyA",
			"plp_cts_BarrelRustyASide",
			"plp_cts_BarrelRustyB",
			"plp_cts_BarrelRustyBSide",
			"plp_cts_BarrelTan",
			"plp_cts_BarrelTanSide",
			"plp_cts_BarrelYellow",
			"plp_cts_BarrelYellowSide",
			"plp_cts_ContPlainBlack",
			"plp_cts_ContPlainBlue",
			"plp_cts_ContPlainGreen",
			"plp_cts_ContPlainOlive",
			"plp_cts_ContPlainRed",
			"plp_cts_ContPlainTan",
			"plp_cts_ContPlainYellow",
			"plp_cts_ContPlainWhite",
			"plp_cts_ContShippingBlue",
			"plp_cts_ContShippingBrown",
			"plp_cts_ContShippingDarkBlue",
			"plp_cts_ContShippingDarkGrey",
			"plp_cts_ContShippingDarkRed",
			"plp_cts_ContShippingGreen",
			"plp_cts_ContShippingGrey",
			"plp_cts_ContShippingLightBlue",
			"plp_cts_ContShippingNavyBlue",
			"plp_cts_ContShippingOrange",
			"plp_cts_ContShippingRed",
			"plp_cts_ContShippingYellow",
			"plp_cts_HighSecContBlack",
			"plp_cts_HighSecContBlackNoDolly",
			"plp_cts_HighSecContBlue",
			"plp_cts_HighSecContBlueNoDolly",
			"plp_cts_HighSecContGrey",
			"plp_cts_HighSecContGreyNoDolly",
			"plp_cts_HighSecContRed",
			"plp_cts_HighSecContRedNoDolly",
			"plp_cts_HighSecContWhite",
			"plp_cts_HighSecContWhiteNoDolly",
			"plp_cts_HighSecContTrailer",
			"plp_cts_HighSecBigBlack",
			"plp_cts_HighSecBigBlackSide",
			"plp_cts_HighSecBigBlue",
			"plp_cts_HighSecBigBlueSide",
			"plp_cts_HighSecBigGrey",
			"plp_cts_HighSecBigGreySide",
			"plp_cts_HighSecBigRed",
			"plp_cts_HighSecBigRedSide",
			"plp_cts_HighSecBigWhite",
			"plp_cts_HighSecBigWhiteSide",
			"plp_cts_HighSecMediumBlack",
			"plp_cts_HighSecMediumBlackSide",
			"plp_cts_HighSecMediumBlue",
			"plp_cts_HighSecMediumBlueSide",
			"plp_cts_HighSecMediumGrey",
			"plp_cts_HighSecMediumGreySide",
			"plp_cts_HighSecMediumRed",
			"plp_cts_HighSecMediumRedSide",
			"plp_cts_HighSecMediumWhite",
			"plp_cts_HighSecMediumWhiteSide",
			"plp_cts_HighSecSmallBlack",
			"plp_cts_HighSecSmallBlue",
			"plp_cts_HighSecSmallGrey",
			"plp_cts_HighSecSmallRed",
			"plp_cts_HighSecSmallWhite",
			"plp_cts_MetalBarrelBlue",
			"plp_cts_MetalBarrelBlueSide",
			"plp_cts_MetalBarrelOlive",
			"plp_cts_MetalBarrelOliveSide",
			"plp_cts_MetalBarrelRed",
			"plp_cts_MetalBarrelRedSide",
			"plp_cts_MetalBarrelWhite",
			"plp_cts_MetalBarrelWhiteSide",
			"plp_cts_MetalBarrelYellow",
			"plp_cts_MetalBarrelYellowSide",
			"plp_cts_TrashcanCityMetalBrushed",
			"plp_cts_TrashcanCityPark",
			"plp_cts_TrashcanHouseBathroom",
			"plp_cts_TrashcanHouseBathroomSide",
			"plp_cts_TrashcanHouseGeneric",
			"plp_cts_TrashcanHouseGenericOpen",
			"plp_cts_TrashcanHouseGenericOpenSide",
			"plp_cts_TrashcanHouseGenericSide",
			"plp_cts_TrashcanHouseSmall",
			"plp_cts_TrashcanHouseSmallSide",
			"plp_cts_TrashcanIndPurple",
			"plp_cts_TrashcanIndPurpleSide",
			"plp_cts_TrashcanIndRed",
			"plp_cts_TrashcanIndRedSide",
			"plp_cts_TrashContGreyBig",
			"plp_cts_TrashContGreyBigOpen",
			"plp_cts_TrashContGreyBigSide",
			"plp_cts_TrashContGreyMedium",
			"plp_cts_TrashContGreyMediumOpen",
			"plp_cts_TrashContGreyMediumSide",
			"plp_cts_TrashContGreySmall",
			"plp_cts_TrashContGreySmallOpen",
			"plp_cts_TrashContGreySmallSide",
			"plp_cts_TrashContColGeneric",
			"plp_cts_TrashContColGenericOpen",
			"plp_cts_TrashContColGlass",
			"plp_cts_TrashContColGlassOpen",
			"plp_cts_TrashContColPaper",
			"plp_cts_TrashContColPaperOpen",
			"plp_cts_TrashContColPlastics",
			"plp_cts_TrashContColPlasticsOpen",
			"plp_cts_VMachineCoffeeBlackOff",
			"plp_cts_VMachineCoffeeBlackOn",
			"plp_cts_VMachineCoffeeBlackSide",
			"plp_cts_VMachineCigBlue",
			"plp_cts_VMachineCigRed",
			"plp_cts_VMachineDrinksBeigeOff",
			"plp_cts_VMachineDrinksBeigeOn",
			"plp_cts_VMachineDrinksBlackOff",
			"plp_cts_VMachineDrinksBlackOn",
			"plp_cts_VMachineGumsGreen",
			"plp_cts_VMachineGumsRed",
			"plp_cts_VMachineSnacksBeigeOff",
			"plp_cts_VMachineSnacksBeigeOn",
			"plp_cts_VMachineSnacksBlackOff",
			"plp_cts_VMachineSnacksBlackOn",
			"plp_cts_CanisterBlue",
			"plp_cts_CanisterBlueSide",
			"plp_cts_CanisterRed",
			"plp_cts_CanisterRedSide",
			"plp_cts_CanisterWhite",
			"plp_cts_CanisterWhiteSide",
			"plp_cts_PlasticTrashcanBlack",
			"plp_cts_PlasticTrashcanBlackSide",
			"plp_cts_PlasticTrashcanBlue",
			"plp_cts_PlasticTrashcanBlueSide",
			"plp_cts_PlasticTrashcanRed",
			"plp_cts_PlasticTrashcanRedSide",
			"plp_cts_PlasticTrashcanWhite",
			"plp_cts_PlasticTrashcanWhiteSide",
			"plp_cts_PlasticBoxBlack",
			"plp_cts_PlasticBoxBlackOpen",
			"plp_cts_PlasticBoxBlackOpenLow",
			"plp_cts_PlasticBoxBlackOpenSide",
			"plp_cts_PlasticBoxBlue",
			"plp_cts_PlasticBoxBlueOpen",
			"plp_cts_PlasticBoxBlueOpenLow",
			"plp_cts_PlasticBoxBlueOpenSide",
			"plp_cts_PlasticBoxGrey",
			"plp_cts_PlasticBoxGreyOpen",
			"plp_cts_PlasticBoxGreyOpenLow",
			"plp_cts_PlasticBoxGreyOpenSide",
			"plp_cts_PlasticBoxRed",
			"plp_cts_PlasticBoxRedOpen",
			"plp_cts_PlasticBoxRedOpenLow",
			"plp_cts_PlasticBoxRedOpenSide",
			"plp_cts_RecycleBinBlack",
			"plp_cts_RecycleBinBlackOpenEmpty",
			"plp_cts_RecycleBinBlackOpenTrash",
			"plp_cts_RecycleBinBlackSide",
			"plp_cts_RecycleBinBlue",
			"plp_cts_RecycleBinBlueOpenEmpty",
			"plp_cts_RecycleBinBlueOpenTrash",
			"plp_cts_RecycleBinBlueSide",
			"plp_cts_RecycleBinGreen",
			"plp_cts_RecycleBinGreenOpenEmpty",
			"plp_cts_RecycleBinGreenOpenTrash",
			"plp_cts_RecycleBinGreenSide",
			"plp_cts_RecycleBinYellow",
			"plp_cts_RecycleBinYellowOpenEmpty",
			"plp_cts_RecycleBinYellowOpenTrash",
			"plp_cts_RecycleBinYellowSide",
			"plp_cts_SafetyBarrelBlue",
			"plp_cts_SafetyBarrelBlueSide",
			"plp_cts_SafetyBarrelGreen",
			"plp_cts_SafetyBarrelGreenSide",
			"plp_cts_SafetyBarrelRed",
			"plp_cts_SafetyBarrelRedSide",
			"plp_cts_SafetyBarrelWhite",
			"plp_cts_SafetyBarrelWhiteSide",
			"plp_cts_TrashcanCityPlasticGreen",
			"plp_cts_TrashcanCityPlasticOrange",
			"plp_cts_CartonDarkBig",
			"plp_cts_CartonDarkBigOpen",
			"plp_cts_CartonDarkBigSide",
			"plp_cts_CartonDarkFlat",
			"plp_cts_CartonDarkFlatOpen",
			"plp_cts_CartonDarkMedium",
			"plp_cts_CartonDarkMediumOpen",
			"plp_cts_CartonDarkMediumSide",
			"plp_cts_CartonDarkSmall",
			"plp_cts_CartonDarkSmallOpen",
			"plp_cts_CartonDarkSmallSide",
			"plp_cts_CartonHalfOpen",
			"plp_cts_CartonHalfOpenSide",
			"plp_cts_CartonHalfOpenRotten",
			"plp_cts_CartonHalfOpenRottenSide",
			"plp_cts_CartonLightBig",
			"plp_cts_CartonLightBigOpen",
			"plp_cts_CartonLightBigSide",
			"plp_cts_CartonLightFlat",
			"plp_cts_CartonLightFlatOpen",
			"plp_cts_CartonLightMedium",
			"plp_cts_CartonLightMediumOpen",
			"plp_cts_CartonLightMediumSide",
			"plp_cts_CartonLightSmall",
			"plp_cts_CartonLightSmallOpen",
			"plp_cts_CartonLightSmallSide",
			"plp_cts_CartonRottenBig",
			"plp_cts_CartonRottenBigOpen",
			"plp_cts_CartonRottenBigSide",
			"plp_cts_CartonRottenFlat",
			"plp_cts_CartonRottenFlatOpen",
			"plp_cts_CartonRottenMedium",
			"plp_cts_CartonRottenMediumOpen",
			"plp_cts_CartonRottenMediumSide",
			"plp_cts_CartonRottenSmall",
			"plp_cts_CartonRottenSmallOpen",
			"plp_cts_CartonRottenSmallSide",
			"plp_cts_CasketLeatherBlack",
			"plp_cts_CasketLeatherBlackSide",
			"plp_cts_CasketLeatherBrown",
			"plp_cts_CasketLeatherBrownSide",
			"plp_cts_CasketLeatherGreen",
			"plp_cts_CasketLeatherGreenSide",
			"plp_cts_CasketLeatherRed",
			"plp_cts_CasketLeatherRedSide",
			"plp_cts_FootlockerBrown",
			"plp_cts_FootlockerBrownOpen",
			"plp_cts_FootlockerGreen",
			"plp_cts_FootlockerGreenOpen",
			"plp_cts_FootlockerRed",
			"plp_cts_FootlockerRedOpen",
			"plp_cts_FootlockerYellow",
			"plp_cts_FootlockerYellowOpen",
			"plp_cts_Sack",
			"plp_cts_SuitcaseFabricBeige",
			"plp_cts_SuitcaseFabricBeigeSide",
			"plp_cts_SuitcaseFabricBlack",
			"plp_cts_SuitcaseFabricBlackSide",
			"plp_cts_SuitcaseFabricBrown",
			"plp_cts_SuitcaseFabricBrownSide",
			"plp_cts_SuitcaseFabricGreen",
			"plp_cts_SuitcaseFabricGreenSide",
			"plp_cts_SuitcaseFabricRed",
			"plp_cts_SuitcaseFabricRedSide",
			"plp_cts_SuitcaseMetalBlack",
			"plp_cts_SuitcaseMetalBlackSide",
			"plp_cts_SuitcaseMetalSilver",
			"plp_cts_SuitcaseMetalSilverSide",
			"plp_cts_WoodBarrelDark",
			"plp_cts_WoodBarrelDarkSide",
			"plp_cts_WoodBarrelLight",
			"plp_cts_WoodBarrelLightSide",
			"plp_cts_WoodBoxLightBig",
			"plp_cts_WoodBoxLightBigOpen",
			"plp_cts_WoodBoxLightBigOpenSide",
			"plp_cts_WoodBoxLightHuge",
			"plp_cts_WoodBoxLightHugeOpen",
			"plp_cts_WoodBoxLightLong",
			"plp_cts_WoodBoxLightLongLeaned",
			"plp_cts_WoodBoxLightLongOpen",
			"plp_cts_WoodBoxLightMedium",
			"plp_cts_WoodBoxLightMediumOpen",
			"plp_cts_WoodBoxLightSmall",
			"plp_cts_WoodBoxLightTiny",
			"plp_cts_WoodBoxLightTinyOpen",
			"plp_cts_WoodBoxLightTinySide",
			"plp_cts_WeathCrateBigBrown",
			"plp_cts_WeathCrateBigBrownLeaned",
			"plp_cts_WeathCrateBigGreen",
			"plp_cts_WeathCrateBigGreenLeaned",
			"plp_cts_WeathCrateBigWorn",
			"plp_cts_WeathCrateBigWornLeaned",
			"plp_cts_WeathCrateLongBrown",
			"plp_cts_WeathCrateLongBrownLeaned",
			"plp_cts_WeathCrateLongGreen",
			"plp_cts_WeathCrateLongGreenLeaned",
			"plp_cts_WeathCrateLongWorn",
			"plp_cts_WeathCrateLongWornLeaned",
			"plp_cts_WeathCrateMediumBrown",
			"plp_cts_WeathCrateMediumGreen",
			"plp_cts_WeathCrateMediumWorn",
			"plp_cts_WeathCrateSmallBrown",
			"plp_cts_WeathCrateSmallBrownStanding",
			"plp_cts_WeathCrateSmallGreen",
			"plp_cts_WeathCrateSmallGreenStanding",
			"plp_cts_WeathCrateSmallWorn",
			"plp_cts_WeathCrateSmallWornStanding",
			"plp_ctp_PalletMetal",
			"plp_ctp_PalletMetalHeapA",
			"plp_ctp_PalletMetalHeapB",
			"plp_ctp_PalletMetalLeaned",
			"plp_ctp_PalletMetalBox",
			"plp_ctp_PalletMetalBoxOpen",
			"plp_ctp_PalletMetalBoxSide",
			"plp_ctp_PalletPlasticBlue",
			"plp_ctp_PalletPlasticBlueHeapA",
			"plp_ctp_PalletPlasticBlueHeapB",
			"plp_ctp_PalletPlasticBlueLeaned",
			"plp_ctp_PalletPlasticGrey",
			"plp_ctp_PalletPlasticGreyHeapA",
			"plp_ctp_PalletPlasticGreyHeapB",
			"plp_ctp_PalletPlasticGreyLeaned",
			"plp_cts_PalletRugged",
			"plp_cts_PalletRuggedLeaned",
			"plp_ctp_PalletWoodDark",
			"plp_ctp_PalletWoodDarkHeapA",
			"plp_ctp_PalletWoodDarkHeapB",
			"plp_ctp_PalletWoodDarkHeapC",
			"plp_ctp_PalletWoodDarkHeapD",
			"plp_ctp_PalletWoodDarkLeanedA",
			"plp_ctp_PalletWoodDarkLeanedB",
			"plp_ctp_PalletWoodLight",
			"plp_ctp_PalletWoodLightHeapA",
			"plp_ctp_PalletWoodLightHeapB",
			"plp_ctp_PalletWoodLightHeapC",
			"plp_ctp_PalletWoodLightHeapD",
			"plp_ctp_PalletWoodLightLeanedA",
			"plp_ctp_PalletWoodLightLeanedB",
			"plp_ctp_PalletWoodPaintedBlue",
			"plp_ctp_PalletWoodPaintedBlueHeapA",
			"plp_ctp_PalletWoodPaintedBlueHeapB",
			"plp_ctp_PalletWoodPaintedBlueHeapC",
			"plp_ctp_PalletWoodPaintedBlueHeapD",
			"plp_ctp_PalletWoodPaintedBlueLeanedA",
			"plp_ctp_PalletWoodPaintedBlueLeanedB",
			"plp_ctm_DisplayPegWallNarrow",
			"plp_ctm_DisplayPegWallWide",
			"plp_ctm_DisplaySlatWallNarrow",
			"plp_ctm_DisplaySlatWallWide",
			"plp_ctm_DisplayHookGreySingle",
			"plp_ctm_DisplayShelfGlass",
			"plp_ctm_DisplayShelfGrey",
			"plp_ctm_DisplayShelfWhite",
			"plp_ctm_DisplayShelfHolder",
			"plp_ctm_ForkliftStcOliveA",
			"plp_ctm_ForkliftStcOliveB",
			"plp_ctm_ForkliftStcTanA",
			"plp_ctm_ForkliftStcTanB",
			"plp_ctm_ForkliftStcYellowA",
			"plp_ctm_ForkliftStcYellowB",
			"plp_ctm_HandPalletTruckOlive",
			"plp_ctm_HandPalletTruckOliveGround",
			"plp_ctm_HandPalletTruckTan",
			"plp_ctm_HandPalletTruckTanGround",
			"plp_ctm_HandPalletTruckYellow",
			"plp_ctm_PartitioningFenceGrey",
			"plp_ctm_PartitioningFenceGreyDoor",
			"plp_ctm_PartitioningFenceGreyDoorOpen",
			"plp_ctm_PartitioningFenceGreyPole",
			"plp_ctm_TrolleyBlueBig",
			"plp_ctm_TrolleyBlueBigSide",
			"plp_ctm_TrolleyBlueHand",
			"plp_ctm_TrolleyBlueHandLying",
			"plp_ctm_TrolleyBluePlatDouble",
			"plp_ctm_TrolleyBluePlatSingle",
			"plp_ctm_TrolleyGreyBig",
			"plp_ctm_TrolleyGreyBigSide",
			"plp_ctm_TrolleyGreyHand",
			"plp_ctm_TrolleyGreyHandLying",
			"plp_ctm_TrolleyGreyPlatDouble",
			"plp_ctm_TrolleyGreyPlatSingle",
			"plp_ctm_TrolleyRedBig",
			"plp_ctm_TrolleyRedBigSide",
			"plp_ctm_TrolleyRedHand",
			"plp_ctm_TrolleyRedHandLying",
			"plp_ctm_TrolleyRedPlatDouble",
			"plp_ctm_TrolleyRedPlatSingle",
			"plp_ctm_TrolleyYellowBig",
			"plp_ctm_TrolleyYellowBigSide",
			"plp_ctm_TrolleyYellowHand",
			"plp_ctm_TrolleyYellowHandLying",
			"plp_ctm_TrolleyYellowPlatDouble",
			"plp_ctm_TrolleyYellowPlatSingle",
			"plp_ctm_HandPalletTruckYellowGround",
			"plp_ctm_WarehouseLadderBlueBig",
			"plp_ctm_WarehouseLadderBlueBigLeaned",
			"plp_ctm_WarehouseLadderBlueMedium",
			"plp_ctm_WarehouseLadderBlueMediumSide",
			"plp_ctm_WarehouseLadderBlueSmall",
			"plp_ctm_WarehouseLadderBlueSmallSide",
			"plp_ctm_WarehouseLadderGreyBig",
			"plp_ctm_WarehouseLadderGreyBigLeaned",
			"plp_ctm_WarehouseLadderGreyMedium",
			"plp_ctm_WarehouseLadderGreyMediumSide",
			"plp_ctm_WarehouseLadderGreySmall",
			"plp_ctm_WarehouseLadderGreySmallSide",
			"plp_ctm_WarehouseShelvesGrey",
			"plp_ctm_WarehouseShelvesGrey_Pass",
			"plp_ctm_WarehouseShelvesGrey_Small",
			"plp_ctm_WarehouseShelvesOrange",
			"plp_ctm_WarehouseShelvesOrange_Pass",
			"plp_ctm_WarehouseShelvesOrange_Small"]
,["Land_smd_podesta_5","Land_smd_podesta_10","Land_smd_podesta_s5","Land_smd_podesta_s10","Land_smd_sara_stodola2","Land_smd_zastavka_sever","Land_smd_Panelak","Land_smd_Panelak2","Land_smd_Panelak3"]
			
			
];
zltNewObjListAllCurIndSel = []; zltNewObjListAllCurIndSel resize (count zlt_obj_list_all);

zlt_obj_list = zlt_obj_list_all select zlt_obj_list_index;
zlt_cur_class = zlt_obj_list select 0;	


zlt_new_10cmfix = ["Land_BagBunker_Large_F", "Land_BagBunker_Small_F", "Land_BagBunker_Tower_F","Land_BagFence_Corner_F", "Land_BagFence_End_F", "Land_BagFence_Long_F", "Land_BagFence_Round_F","Land_BagFence_Short_F","Land_HBarrier_1_F", "Land_HBarrier_3_F", "Land_HBarrier_5_F",  "Land_HBarrierTower_F","Land_HBarrierWall_corner_F", "Land_HBarrierWall_corridor_F", "Land_HBarrierWall4_F", "Land_HBarrierWall6_F",
"Land_CncWall1_F","Land_CncBarrierMedium4_F", "Land_CncWall4_F", "Land_Mil_WallBig_4m_F"
];

zlt_new_5cmfix = ["Land_CncShelter_F"];
zlt_new_15cmfix = ["Land_CncBarrierMedium4_F"];

// -------------------------------------------------- НОВОЕ -----------------------------------------------------------------------------------
// лок объекты + отключены повреждения
zlt_localObjectsClasses = 
	([['A3_Structures_F_Mil_Fortification','A3_Structures_F_Mil_BagBunker','A3_Structures_F_Mil_BagFence'] call zlt_units, { not (["razor", _x] call bis_fnc_instring) }] call zlt_filter)
	+(["A3_Structures_F_Civ_Garbage","A3_Structures_F_EPA_Mil_Scrapyard","A3_Structures_F_Wrecks"] call zlt_units)
	+(['A3_Structures_F_Mil_Fortification','A3_Structures_F_Mil_BagBunker','A3_Structures_F_Mil_BagFence'] call zlt_units)
	+(["A3_Structures_F_Training" call zlt_units, { (["shoot_house", _x] call bis_fnc_instring) or (["obstacle", _x] call bis_fnc_instring) or (["concrete", _x] call bis_fnc_instring) }] call zlt_filter)
	+(["A3_Structures_F_Civ_Constructions","A3_Structures_F_EPA_Civ_Constructions"] call zlt_units)
	+['Land_CncWall1_F','Land_CncWall4_F',"Land_CncShelter_F"]
	+["Hhedgehog_concreteBig","Land_Pier_small_F","Hedgehog","Hhedgehog_concrete","Land_PierLadder_F","Land_PierLadder_F","Land_fort_artillery_nest_EP1","Land_fort_rampart_EP1","Land_Bunker_F","Land_Slums02_4m"]
	,(["Rbc_praa_objects" call zlt_units, {!(["qalat", _x] call bis_fnc_instring) && !(["qfort", _x] call bis_fnc_instring) && !(["cone", _x] call bis_fnc_instring)}] call zlt_filter)
;

// лок. объекты + отключены повр., выключена симуляция
zlt_disableSimClasses = 
	(["A3_Structures_F_Civ_Camping" call zlt_units, { not (["toilet", _x] call bis_fnc_instring) }] call zlt_filter)
	+(["A3_Structures_F_Items_Documents","A3_Structures_F_Items_Electronics","A3_Structures_F_Items_Cans","A3_Structures_F_Items_Gadgets","A3_Structures_F_Items_Luggage","A3_Structures_F_Items_Stationery","A3_Structures_F_Items_Tools","A3_Structures_F_Items_Valuables","A3_Structures_F_EPA_Items_Electronics","A3_Structures_F_EPA_Items_Food","A3_Structures_F_EPA_Items_Medical","A3_Structures_F_EPA_Items_Tools","A3_Structures_F_EPA_Items_Vessels","A3_Structures_F_EPC_Items_Documents","A3_Structures_F_EPC_Items_Electronics"] call zlt_units)
	+(["A3_Structures_F_EPB_Furniture","A3_Structures_F_Furniture","A3_Structures_F_Items_Vessels", "A3_Structures_F_EPA_Civ_Camping","A3_Structures_F_EPB_Items_Vessels"] call zlt_units)
	-["Land_MetalBarrel_empty_F","MetalBarrel_burning_F"]
	+["Land_Pallet_F", "Land_Pallet_vertical_F","Land_Obstacle_Ramp_F"]

	
;

// нужны маркера для объекта
zlt_objectsWithMarkers = 
	("A3_Structures_F_Mil_BagBunker" call zlt_units) + ["Land_CncWall4_F","Land_CncWall4_F","Land_HBarrierBig_F", "Land_HBarrier_Big_F", "Land_HBarrierTower_F",
"Land_HBarrierWall_corner_F", "Land_HBarrierWall_corridor_F", "Land_HBarrierWall4_F", "Land_HBarrierWall6_F", "House_F","House","Land_MIL_WiredFence_F","Land_MIL_WallBig_4m"]
;

// игнорировать этот тип объекта
zlt_objectsIgnorePlacement = [
"Helper_Base_F"
];


zlt_new_specialFixObjs = ["Land_Pallet_F","Land_HBarrierBig_F", "Land_HBarrier_Big_F"];

// Local, disablesim, left/right, up/down, forw/backw fix
zlt_new_specialFixObjsData = [[ 0.72, 0, 0.61],[0.5,0.5,0.5],[0.5,0.5,0.5]];


#define DIK_UP 				200
#define DIK_DOWN 			208
#define DIK_LEFT 			203
#define DIK_RIGHT 			205
#define DIK_HOME 			199
#define DIK_END				207
#define DIK_INSERT          0xD2    /* Insert on arrow keypad */
#define DIK_PGUP            0xC9    /* PgUp on arrow keypad */
#define DIK_PGDN            0xD1    /* PgDn on arrow keypad */
#define DIK_END             0xCF    /* End on arrow keypad */
#define DIK_HOME            0xC7    /* Home on arrow keypad */
#define DIK_DELETE          0xD3    /* Delete on arrow keypad */
#define DIK_DIVIDE          0xB5
#define DIK_NUM8			0x48
#define DIK_NUM2			0x50

#define DIK_1               0x02
#define DIK_2               0x03
#define DIK_3               0x04
#define DIK_4               0x05
#define DIK_5               0x06
#define DIK_6               0x07
#define DIK_7               0x08
#define DIK_8               0x09
#define DIK_9               0x0A
#define DIK_0               0x0B

#define DIK_X               0x2D
#define DIK_C               0x2E
#define DIK_V               0x2F


#define DIK_W               0x11
#define DIK_S				0x1F
#define DIK_A				0x1E
#define DIK_D				0x20
#define DIK_Q				0x10
#define DIK_Z				0x2C

#define DIK_F1              0x3B
#define DIK_F2              0x3C
#define DIK_F3              0x3D
#define DIK_F4              0x3E
#define DIK_F5              0x3F
#define DIK_F6              0x40
#define DIK_F7              0x41
#define DIK_F8              0x42
#define DIK_F9              0x43
#define DIK_F10             0x44

#define DIK_1               0x02
#define DIK_2               0x03
#define DIK_3               0x04
#define DIK_4               0x05
#define DIK_5               0x06
#define DIK_6               0x07
#define DIK_7               0x08
#define DIK_8               0x09
#define DIK_9               0x0A
#define DIK_0               0x0B


#define DIK_RSHIFT          0x36
#define DIK_MULTIPLY        0x37    /* * on numeric keypad */
#define DIK_LSHIFT          0x2A
#define DIK_LCONTROL        0x1D
#define DIK_RCONTROL        0x9D
#define DIK_LMENU           0x38    /* left Alt */
#define DIK_RMENU           0xB8    /* right Alt */
#define DIK_RALT            DIK_RMENU           /* right Alt */
#define DIK_LALT            DIK_LMENU
#define DIK_SPACE           0x39
#define DIK_MULTIPLY        0x37    /* * on numeric keypad */
#define DIK_NUMPADSTAR      DIK_MULTIPLY 
#define DIK_SUBTRACT        0x4A    /* - on numeric keypad */
#define DIK_SPACE           0x39
#define DIK_ADD             0x4E    /* + on numeric keypad */

#define PR(x) private ['x']; x
#define PARAM(X,Y,Z) private ['X']; X=[_this, Y, Z] call BIS_fnc_param;



#define P_LOCAL_OBJ 0
#define P_SIM_DISABLE 1
#define P_DAMAGE_DISABLE 2
#define P_HAS_MARKER 3
#define P_IGNORE_PLACEMENT 4

zlt_objGetStdParams = {
	private ["_class","_islocal","_simdisable","_damdisable","_hasmarker","_ignoreplacement"];
	_class = _this;
	_islocal = false; _simdisable = false; _damdisable = false; _hasmarker = false; _ignoreplacement = false;	

	if ( [_class,zlt_localObjectsClasses] call zlt_fnc_cycleKindOf ) then {_islocal = true; _damdisable = true;};
	if ( [_class,zlt_disableSimClasses] call zlt_fnc_cycleKindOf ) then {_islocal = true; _damdisable = true; _simdisable = true; };
	if ( [_class,zlt_objectsWithMarkers] call zlt_fnc_cycleKindOf ) then { _hasmarker = true; };
	if ( [_class,zlt_objectsIgnorePlacement] call zlt_fnc_cycleKindOf ) then {_ignoreplacement = true; };	
	[_islocal, _simdisable, _damdisable, _hasmarker,  _ignoreplacement ]	
};

//ASLToATL ASLtoATL

zlt_createcam = {
	PARAM(_campos, 0,  asltoatl eyePos player)
	zlt_cameraMode = true;
	zlt_camera =  "camera" camCreate _campos;
	zlt_camera cameraEffect ["internal","top"];
	zlt_camera setDir (getDir player);
	zlt_camera camCommitPrepared 0;
	showcinemaborder false;
	
	zlt_cam_handler = [] spawn {
		while {zlt_cameraMode} do {
			_coeff = 1;
			_pos = screentoworld [0.5,0.5];
			_intersectCam = getposasl zlt_camera;
			_intersectTarget = [_pos select 0,_pos select 1,getterrainheightasl _pos];
			_objects = lineIntersectswith [ _intersectCam, _intersectTarget, objnull, objnull, true	];
			_object = objnull;
			if (count _objects > 0) then {
				_object = _objects select (count _objects - 1);
				zlt_cameraTarget = _object;
			};
			
			sleep 0.1;
			_campos = getPosAsl zlt_camera;
			if (zlt_camerakeys select DIK_LSHIFT || zlt_camerakeys select DIK_RSHIFT) then {_coeff = 0.1;};
			if (zlt_camerakeys select DIK_LCONTROL || zlt_camerakeys select DIK_RCONTROL) then {_coeff = 10;};
			if (zlt_camerakeys select DIK_W) then {_campos = [0,1,0,_coeff, _campos] call zlt_movecam;};
			if (zlt_camerakeys select DIK_S) then { _campos=[0,-1,0,_coeff, _campos] call zlt_movecam;};
			if (zlt_camerakeys select DIK_A) then { _campos=[-1,1,0,_coeff, _campos] call zlt_movecam;};
			if (zlt_camerakeys select DIK_D) then { _campos=[1,1,0,_coeff, _campos] call zlt_movecam;};
			if (zlt_camerakeys select DIK_Q) then { _campos=[0,0,1,_coeff, _campos] call zlt_movecam;};
			if (zlt_camerakeys select DIK_Z) then { _campos=[0,0,-1,_coeff, _campos] call zlt_movecam;};			
			if (surfaceIsWater _campos) then {
				zlt_camera camSetPos _campos; } else {
				zlt_camera camSetPos ( ASLtoATL _campos);
			};

			zlt_camera camCommit 0.3;
			comment "13";

		};
	};
};

zlt_removecam = {
	player cameraEffect ["terminate","back"];
	camDestroy zlt_camera;
	zlt_cameraMode = false;
	terminate zlt_cam_handler;
};

zlt_movecam = {
	//diag_log ["zlt_movecam",_this];
	PR(_dx) = _this select 0; PR(_dy) = _this select 1; PR(_dz) = _this select 2; PR(_dl) = _this select 3;
	//PR(_pos) = getPosAsl zlt_camera;
	_pos = _this select 4;
	PR(_dir) = (direction zlt_camera) + _dx *90.0;
	PR(_newcampos) = [ (_pos select 0) + ((sin _dir) * _dl * _dy), (_pos select 1) + ((cos _dir) * _dl * _dy), (_pos select 2) + _dz * _dl ];
	_newcampos set [2,(_newcampos select 2) max (getterrainheightasl _newcampos)];
	//zlt_camera camSetPos (ASLtoATL _newcampos);
	//diag_log ["zlt_movecam",_newcampos];
	_newcampos

};

zlt_rotatecam = {
	if (isNil "zlt_camDir") then {zlt_camDir=0;};
	PR(_dx) = _this select 1;
	PR(_dy) = _this select 2;
	zlt_lastCamPos = [0,_dx,_dy];
	zlt_camDir= (zlt_camDir - _dy*1) max -89 min 89;
	zlt_camera setDir (getDir zlt_camera + _dx*1);
	[ zlt_camera, zlt_camDir, 0 ] call bis_fnc_setpitchbank;
	zlt_camera camCommitPrepared 0;
};


/*
 *
 *
 *  РИСОВАНИЕ РАМОК
 *
 */
zlt_drawBox = {
	PR(_obj) = _this select 0;
	PR(_color) = _this select 1;
	_bl = _this select 2;

	if (isNil "_obj") exitWith{};
	if (_obj in _bl) exitWith {};
	if (isNull _obj) exitWith {};

	PR(_boxBot) = (boundingboxreal _obj) select 0;
	PR(_boxTop) = (boundingboxreal _obj) select 1;

	PR(_xB) = _boxBot select 0;	PR(_xT) = _boxTop select 0;
	PR(_yB) = _boxBot select 1;	PR(_yT) = _boxTop select 1;
	PR(_zB) = _boxBot select 2;	PR(_zT) = _boxTop select 2;

	drawLine3D [ _obj modeltoworld [_xB, _yB, _zB], _obj modeltoworld [_xT, _yB, _zB], _color];
	drawLine3D [ _obj modeltoworld [_xB, _yT, _zB], _obj modeltoworld [_xT, _yT, _zB], _color];
	drawLine3D [ _obj modeltoworld [_xB, _yB, _zB], _obj modeltoworld [_xB, _yT, _zB], _color];
	drawLine3D [ _obj modeltoworld [_xT, _yB, _zB], _obj modeltoworld [_xT, _yT, _zB], _color];

	drawLine3D [ _obj modeltoworld [_xB, _yB, _zT], _obj modeltoworld [_xT, _yB, _zT], _color];
	drawLine3D [ _obj modeltoworld [_xB, _yT, _zT], _obj modeltoworld [_xT, _yT, _zT], _color];
	drawLine3D [ _obj modeltoworld [_xB, _yB, _zT], _obj modeltoworld [_xB, _yT, _zT], _color];
	drawLine3D [ _obj modeltoworld [_xT, _yB, _zT], _obj modeltoworld [_xT, _yT, _zT], _color];

	drawLine3D [ _obj modeltoworld [_xB, _yB, _zB], _obj modeltoworld [_xB, _yB, _zT], _color];
	drawLine3D [ _obj modeltoworld [_xB, _yT, _zB], _obj modeltoworld [_xB, _yT, _zT], _color];
	drawLine3D [ _obj modeltoworld [_xT, _yB, _zB], _obj modeltoworld [_xT, _yB, _zT], _color];
	drawLine3D [ _obj modeltoworld [_xT, _yT, _zB], _obj modeltoworld [_xT, _yT, _zT], _color];
	
	_bl pushback _obj;
};

// выделять - красный - текущий блок
// синий - центр текущей композиции, зеленый - доп. эл-ты текущей композиции


zlt_fnc_help = {


	_help_data = [["F1","Справка"],["F3","Режим камеры"],["F4","Режим нормали к земле"],["F5","ATL/ASL режим"],["F6","Микро-режим"],["F7","Режим автоселекции новых блоков"],["Ctrl+Ins","Установить новый объект здесь и сделать его текущим"],
	["Ctrl+PgUp,PgDn","Переключение страниц библиотеки объектов"],["Ctrl+Home","Выравнивание текущего объекта по вертикали и ландшафту"],["Home","Выравнивание текущего объекта по вертикали"],
	["End","Сохрание позиций построенных объектов в буфер обмена"],["Delete","Удаление текущего объекта"],["/(цифр.)","Делает объект текущим"],["Ctrl+/(цифр.)","Выбрать объект и сделать текущим"],
	["*(цифр.)","Выбрать ближайший объект"],["-(цифр.)","Выбрать класс выбранного объекта"],["+(цифр.)","Переместить камеру на выбранный объект"],["Up Down Left Right","Пермещение текущего объекта"],
	["Ctrl+Up,Down,Left,Right","Вращение текущего объекта и пермещение его по вертикали"],["PgUp,PgDn","Выбор объекта на текущей странице библиотеки объектов"],
	["Alt+Up,Down,Left,Right","Наклон текущего объекта(может вызвать баги)"],["Shift+клавиши перемещения объекта","Выполнение действия с меньшим шагом"],["Ins","Установить объект рядом с текущим(ждет нажатия клавиши Up,Dn,Left, Right)"],
	["Space","Выделить объект под курсором"],["Ctrl+Space","Снять выделение с группы"],["Alt+Space","Добавить в выделение текущий объект"],["Alt+Del","Удалить объект под курсором"],["Ald+End","Сохранить удаленные"]
	];
	_help_txt2="<t size='0.5' color='#ffff00' align='left'>";
	{_help_txt2 =_help_txt2 + format["<t color='#ff0000'>%1</t> - %2<br/>", (_help_data select _foreachindex)select 0,(_help_data select _foreachindex)select 1];} foreach _help_data;
	_help_txt2=_help_txt2+"</t>";
	[ _help_txt2, 0,0,5,0,0,331] spawn bis_fnc_dynamicText;
};


zlt_onEachFrame = {
	_bl = [];
	// подсветка текущей
	[zlt_newlb, [1,0,0,1],_bl] call zlt_drawBox;

	if (!zlt_cameraMode && !isNull cursorTarget) then {
		[cursorTarget, [1,1,0,1],_bl] call zlt_drawBox;
	};
	if (zlt_cameraMode && !isNull zlt_cameraTarget) then {
		[zlt_cameraTarget, [1,1,0,1],_bl] call zlt_drawBox;
	};
	{ [_x, [1,1,1,1],_bl] call zlt_drawBox; } foreach zltNewCurSel;

};



zlt_new_fnc_gendelbld = {
	_br = toString [13, 10];
	_txt = _br;
	//		_x getvariable ["zlt_new_del_dist", 10];		

	_txt = _txt+'if ( isnil "zlt_new_delbld") then {zlt_new_delbld=[];};'+_br;
	_txt = _txt + 'if (true) then {' + _br;
	{
		_txt = _txt + format ["  _bld = (( nearestObjects [%1,['%2'],%3]) select 0); _bld hideObject true; _bld allowdamage false; _bld setVariable ['zlt_new_del_dist',%3];", (_x modelToWorld [0,0,0]) call KK_fnc_positionToString ,typeof _x,_x getvariable ["zlt_new_del_dist", 5]] + "zlt_new_delbld pushback _bld;" +_br;
	} foreach zlt_new_delbld;
	_txt = _txt + '};' + _br;
	copyToClipboard _txt;
};

zlt_fnc_getallcode = {
	private ["_br","_listobj","_txt","_global","_stdparm","_local","_ignore","_simdisable","_listobj2","_hasmarker"];
	_br = toString [13, 10];
	_listobj = +(_this);


	_listobj2 = +(_listobj);
	_listobj = [];
	{
		_stdparm = (_x call zlt_objGetStdParams);
		_ignore = _stdparm select P_IGNORE_PLACEMENT;
		if ( !_ignore ) then {
			_listobj pushBack _x;
		};
	} foreach _listobj2;
	_listobj2 = nil;

	
	_txt = "//Generated using generator by [STELS]Zealot"+_br+'if (isnil "zlt_new_blocks") then {zlt_new_blocks = [];};'+_br;
	_txt = _txt + "zlt_fnc_boundingbox = " + str(zlt_fnc_boundingbox) +";"+ _br;
	_txt = _txt + "if(not isDedicated) then {" + _br;

	{
		_stdparm = (_x call zlt_objGetStdParams);
		_hasmarker = ( _stdparm select P_HAS_MARKER );
		if ( _hasmarker ) then {
			_txt = _txt +"    "+format["[%1,%2,%3] call zlt_fnc_boundingbox;",str(boundingBoxReal _x),direction _x, position _x]+_br;
		};
	} foreach _listobj;
	
	_txt = _txt + "};" + _br;

	
//	_txt = _txt + "waituntil {time > 0};" + _br;
	_txt = _txt + "if (isserver) then {" + _br;

	{
		_stdparm = (_x call zlt_objGetStdParams);
		_local = ( _stdparm select P_LOCAL_OBJ );
		_simdisable = ( _stdparm select P_SIM_DISABLE );
		if (!_local) then {
			_txt = _txt + "  _script = [] spawn {";
			_txt = _txt + ([_x, _local, _simdisable] call zlt_fnc_getcode);
			_txt = _txt + "}; waitUntil {scriptDone _script};" + _br;
		};
	} foreach _listobj;
	
	_txt = _txt + "};" + _br;
	_txt = _txt + "if (isdedicated) exitwith {};" + _br;

	
//	_txt = _txt + "waituntil {time > 0};" + _br;
	{
		_stdparm = (_x call zlt_objGetStdParams);
		_local = ( _stdparm select P_LOCAL_OBJ );
		_simdisable = ( _stdparm select P_SIM_DISABLE );
		if not (!_local) then {
			_txt = _txt + ([_x, _local, _simdisable] call zlt_fnc_getcode) + _br;
		};
	} foreach _listobj;
	
	_txt;
};

zlt_fnc_getcode = {		
	_obj = _this select 0;
	_local = _this select 1;
	_simdisable = _this select 2;

	_objType = typeOf _obj;
	_spawnType = "CAN_COLLIDE";
	_pitchBank = _obj call BIS_fnc_getPitchBank;
	_obj setvectorup [0,0,1];
	_posATL = getPosATL _obj;
	_posASL = getPosASL _obj;
	_posWorld = (getPosWorld _obj) call KK_fnc_positionToString;
	_dir = getDir _obj;
	_pitch = _pitchBank select 0;
	_bank = _pitchBank select 1;
	[_obj, _pitch, _bank] call BIS_fnc_setPitchBank;
	_br = toString [13, 10];
	_copiedTxt = "";
	private ["_txt1","_txt2"];
	_txt1 = ""; _txt2 = "";
	if (not _local) then {
		_txt1 = format ["  _pos = %1; zlt_newlb = createVehicle [""%2"", _pos, [], 0, ""%3""];", _posWorld, _objType, _spawnType];
		_txt2 = format ["zlt_newlb setDir %1; zlt_newlb setPosWorld _pos;[zlt_newlb, %2, %3] call BIS_fnc_setPitchBank;zlt_new_blocks pushback zlt_newlb;", _dir, _pitch, _bank];

	} else {
		_txt1 = format ["_pos = %1; zlt_newlb = ""%2"" createVehiclelocal _pos; ", _posWorld, _objType];
		_txt2 = format ["zlt_newlb setDir %1; zlt_newlb setPosWorld _pos; [zlt_newlb, %2, %3] call BIS_fnc_setPitchBank; zlt_new_blocks pushback zlt_newlb; zlt_newlb allowdamage false;", _dir,  _pitch, _bank];
	};
	_copiedTxt = _copiedTxt + _txt1;
	if ( _simdisable ) then {
		_copiedTxt = _copiedTxt + "zlt_newlb enableSimulation false;";
	};
	_copiedTxt = _copiedTxt + _txt2;
	_decl = _obj getVariable ["zlt_new_decl",[]];
	if (count (_decl) != 0 ) then {
		_copiedTxt=_copiedTxt+'if(not isDedicated)then{zlt_newlb setVariable ["zlt_new_decl",' + str(_decl) + '];};';
	};
	
	if (_obj getvariable ["zlt_cb", false]) then {
		_copiedTxt=_copiedTxt+'zlt_newlb setVariable ["zlt_cb",true];';
	};
	_copiedTxt = _copiedTxt; // + _br;
	_copiedTxt;
};



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//["Land_BagBunker_Tower_F","Land_BagFence_Long_F",[2.69531,-1.67871,-0.911802],"Land_BagFence_Long_F",[2.63086,1.33398,-0.911802]]

zlt_fnc_boundingbox = { private ["_dir","_pos","_color","_alpha","_bbox","_b1","_b2","_bbx","_bby","_marker"]; if(!hasInterface)exitWith{}; _bbox = [_this, 0] call BIS_fnc_param; _dir = [_this, 1] call BIS_fnc_param; _pos = [_this, 2] call BIS_fnc_param; _color = [_this, 3, "ColorBrown"] call BIS_fnc_param; _alpha = [_this, 4, 1.0] call BIS_fnc_param; if (isnil "zlt_bb_id") then { zlt_bb_id = 0; };	_b1 = _bbox select 0; _b2 = _bbox select 1;	_bbx = (abs(_b1 select 0) + abs(_b2 select 0)); _bby= (abs(_b1 select 1) + abs(_b2 select 1)); _marker = createmarkerlocal [ format [ "WMT_BundingBoxMarker_%1",zlt_bb_id ], _pos ]; zlt_bb_id = zlt_bb_id + 1;	_marker setmarkerdir _dir; _marker setmarkershapelocal "rectangle";	_marker setmarkersizelocal 	[_bbx/2,_bby/2]; _marker setmarkercolor	_color;	_marker setmarkeralphalocal _alpha;	_marker setMarkerBrushLocal "SolidFull"; _marker };

zlt_fnc_cycleKindOf = {
	_ret = false;
	{
		if ( (_this select 0) isKindOf _x ) exitWith {_ret = true; };
	} foreach (_this select 1);
	_ret
};


//////////////////////////////////////////////

zlt_fnc_modeindication = {
	private ["_n","_b","_txt"];
	_txt = "";
	
	if (!isNil "zltNewAutoSelect" && {zltNewAutoSelect}) then {
		_txt = _txt + "<t color='#ff0000'> АВТО </t>";
	} else {
		_txt = _txt + "<t color='#ffaa00'> --------</t>";
	};
	if (!zlt_new_vectorup) then {
		_txt = _txt + "<t color='#ff0000'> НОРМ</t>";
	} else {
		_txt = _txt + "<t color='#ffaa00'> ВЕРТ</t>";
	};
	
	if (zlt_new_asl) then {
		_txt = _txt + "<t color='#ffaa00'> ASL</t>";
	} else {
		_txt = _txt + "<t color='#ff0000'> ATL</t>";
	};
	
	if (!zlt_new_micro) then {
		_txt = _txt + "<t color='#ffaa00'> --------</t>";
	} else {
		_txt = _txt + "<t color='#ff0000'> MICRO</t>";
	};


	_txt = _txt + "<br/>";
	if (count zltNewCurSel !=0 ) then {
		_txt = _txt + format["Выбрано %1 блоков",count zltNewCurSel]  + "<br/>";
	};
	
	// покажем текущий блок
	if (!isNil "zlt_newlb" && {!isnull zlt_newlb}) then {
		// previous
		_ci = zlt_new_blocks find zlt_newlb;
		
		if (_ci < (count zlt_new_blocks -1)) then {
			_n = _ci + 1;
			_b = zlt_new_blocks select _n;
		     if !(_b in zltNewCurSel) then {		
				_txt = _txt + "   " + str(_n) + " "+ typeOf _b + "<br/>";
			}else {
				_txt = _txt + "   <t color='#00001A'>" + str(_n) + " "+ typeOf _b + "</t><br/>";
			};
		} else { _txt=_txt + "         ------------<br/>"; };		
		
		
		if (_ci != -1) then {
				_n = _ci;
				_b = zlt_new_blocks select _n;
			     if !(_b in zltNewCurSel) then {
					_txt = _txt + " > " + str(_n) + " "+ typeOf _b + "<br/>";
				} else {
					_txt = _txt + " ><t color='#00001A'> " + str(_n) + " "+ typeOf _b + "</t><br/>";
				};
		} else { _txt=_txt + "         ------------<br/>"; };
		
		if (_ci > 0) then {
			_n = (_ci - 1);
			_b = zlt_new_blocks select _n;
		     if !(_b in zltNewCurSel) then {		
				_txt = _txt + "   " + str(_n) + " "+ typeOf _b + "<br/>";
			}else {
				_txt = _txt + "   <t color='#00001A'>" + str(_n) + " "+ typeOf _b + "</t><br/>";
			};

		} else { _txt=_txt + "         ------------<br/>"; };
		

	};


	_classTxt = "";
	if (isClass (configFile >> "CfgVehicles" >> zlt_cur_class)) then {
		_classTxt = getText (configFile >> "CfgVehicles" >> zlt_cur_class >> "displayName");

	};

	if (not isNil "zlt_cur_class") then {
		_txt=_txt+"<br/>КЛАСС: "+zlt_cur_class +"<br/>"+"НАЗВАНИЕ: "+ _classTxt + "<br/>";

	};

	//diag_log [_txt];
	// конец показа текущего блока
	[ format["<t size='0.4' align='left' color='#ffff00'>%1</t>",_txt], safezonex,safezoney+0.1,1,0,0,335] spawn bis_fnc_dynamicText;
};

zlt_fnc_notify = {
	 [ format["<t size='0.75' color='#ffff00'>%1</t>",_this], 0,1,5,0,0,331] spawn bis_fnc_dynamicText;
};

zlt_fnc_notifyhint = {
	private ["_item","_list","_txt","_k","_n"];
	disableSerialization;
	_item = _this select 0;
	_list = _this select 1;
	_k = (_list find _item) max 0;
	//diag_log ['zlt_fnc_notifyhint',_k,_item,_list];
	if (((uiNamespace getVariable "zlt_new_objects_lb") lbText _k) == _item) then {
		
	} else {
		lbClear (uiNamespace getVariable "zlt_new_objects_lb");

		{
			(uiNamespace getVariable "zlt_new_objects_lb") lbAdd _x;
		} foreach _list;

	};
	(uiNamespace getVariable "zlt_new_objects_lb") lbSetCurSel _k;
	(uiNamespace getVariable "zlt_new_objects_lb") ctrlShow true;
	(uiNamespace getVariable "zlt_new_objects_lb") ctrlCommit 0;
	terminate zlt_new_objects_lb_cb;
	zlt_new_objects_lb_cb = [] spawn {
		uiSleep 10;
		(uiNamespace getVariable "zlt_new_objects_lb") ctrlShow false;
		(uiNamespace getVariable "zlt_new_objects_lb") ctrlCommit 0;
	};
};

ZltNewSaveGroupToClipboard = {
	private ["_mainobj","_group","_delete","_pos","_res","_first"];
	_group = _this select 0;
	_delete = _this select 1;
	if (!zlt_cameraMode) then {_pos = screentoworld [0.5,0.5];} else {_pos = getposworld zlt_camera};
	_mainobj= "Sign_Sphere10cm_F" createVehicle _pos; [_mainobj,0,0] call bis_fnc_setPitchBank;
	_mainobj setdir 0;
	if (zlt_cameraMode) then {_mainobj setdir direction zlt_camera};
	_mainobj setPosWorld _pos;
	_res = "[";
	_first = true;
	{ if (!_first) then{_res=_res+","};_res=_res+"["; _res=_res+"'"+(typeOf _x)+"'"; _res=_res+","+ ( (getDir _mainobj - getDir _x) call KK_fnc_floatToString );_res=_res+","+((_mainobj worldToModel (getPosATL _x)) call KK_fnc_positionToString);_res=_res+"]"; _first=false; } foreach _group;
	_res=_res+"]";
	if (_delete) then { {zlt_new_blocks = zlt_new_blocks - [_x]} foreach _group; if (zlt_newlb in _group)then{zlt_newlb=objNull;};{deleteVehicle _x;} foreach _group;_group=[];};
	deleteVehicle _mainobj;
	copyToClipboard _res;
	_res
};

ZltNewLoadGroupFromClipboard = {
	private ["_mainobj","_objects","_obj","_pos","_data"];
	if (!zlt_cameraMode) then {_pos = screentoworld [0.5,0.5];} else {_pos = getposworld zlt_camera};
	_mainobj= "Sign_Sphere10cm_F" createVehicle _pos;
	_mainobj setdir 0;
	if (zlt_cameraMode) then {_mainobj setdir direction zlt_camera};
	_mainobj setPosWorld _pos; [_mainobj,0,0] call bis_fnc_setPitchBank;
	_data = call compile copyFromClipboard;
	_objects = [];
	{
		_obj = (_x select 0) createVehicle [0,0,0];
		_obj setDir (getdir _mainobj + (_x select 1));
		_obj setPosATL (_mainobj modeltoworld (_x select 2));
		diag_log ["Place", _obj, getposWorld _obj, getposWorld _mainobj];
		_objects pushback _obj;
	} foreach _data;
	zlt_new_blocks = zlt_new_blocks + _objects;
	zlt_newlb=(_objects select 0);
	deleteVehicle _mainobj;
	_objects
};


ZltNewSaveGroupParam = {
	private ["_mainobj","_group","_pblb","_pbx"];
	_mainobj=_this select 0;
	_group=_this select 1;

	{
		_x setvariable ["ZltPosDiff",_mainobj worldToModel (getPosATL _x)];
		_x setvariable ["ZltDirDiff",getdir _x - getdir _mainobj];
		/*
		_pblb=_mainobj call bis_fnc_getPitchBank; _pbx=_x call bis_fnc_getPitchBank;
		_x setvariable ["ZltPitchBankDiff",[(_pbx select 0) - (_pblb select 0)  ,(_pbx select 1)-(_pblb select 1)]];
		_x setvariable ["ZltVectorDirDiff", (vectorDir _mainobj) vectordiff (vectorDir _x) ];
		_x setvariable ["ZltVectorUpDiff", (vectorUp _mainobj) vectordiff (vectorUp _x) ];*/
	} foreach _group;
};

ZltNewUseGroupParam = {
	private ["_mainobj","_group","_pblb","_pbx"];
	_mainobj=_this select 0;
	_group=_this select 1;
	_group = _group - [_mainobj];
	_vectors = nil;
	{
		_x setDir (getdir _mainobj + (_x getvariable "ZltDirDiff"));
		_x setPosATL (_mainobj modeltoworld (_x getvariable "ZltPosDiff"));
		if (!_vectors) then {
	   		_pblb=_mainobj call bis_fnc_getPitchBank; _pbdiff = _x getvariable "ZltPitchBankDiff";
			[_x,(_pblb select 0) + (_pbdiff select 0), (_pblb select 1)+(_pbdiff select 1)] call bis_fnc_setPitchBank;
		} else {
			_x setVectorDirAndUp [(vectorDir _mainobj) vectorAdd (_x getvariable "ZltVectorDirDiff"), (vectorUp _mainobj) vectoradd ( _x getvariable "ZltVectorUpDiff") ];
		};
	} foreach _group;
};


zlt_new_moveblock = {
	// "UP", "RIGHT", "ROLLZ", "FARER", "PITCH", "BANK"
	// VALUE - Значение на сколько
	private ["_class", "_pos", "_dir", "_pitch", "_bank","_obj"];
	_mode = _this select 0;
	_val = _this select 1;
	PARAM(_fASL, 2, zlt_new_asl)
	
	if ( isnil "zlt_newlb" or {isNull zlt_newlb} ) exitwith {};
	//для текущего выделения
	[zlt_newlb, zltNewCurSel] call ZltNewSaveGroupParam;

	//конец обработки текущего выделения


	_obj = zlt_newlb;
	//получить координаты
	_dir = getdir _obj;
	_pitchBank = _obj call BIS_fnc_getPitchBank; _pitch = _pitchBank select 0; 	_bank = _pitchBank select 1;
	if (_pitch !=0 or _bank != 0) then {
		_obj setvectorup [0,0,1];
	};
	if (_fASL) then {
		_pos = getPosASL _obj;
	} else {
		_pos = getPosATL _obj;
	};
	_dir = getDir _obj;
	_obj setdir 0;
	_pdir = 0;
	
	if (zlt_cameraMode) then {
		_pdir = direction zlt_camera;
	} else {
		_pdir = getdir player;
	};

	if (!_fASL) then {
		switch (_mode) do {
			case ("UP") : { _obj setposatl [_pos select 0, _pos select 1, (_pos select 2) + _val]; };
			case ("RIGHT") : { _obj setposatl [(_pos select 0) + (sin (_pdir + 90) * _val ), (_pos select 1) + (cos (_pdir + 90)* _val ), (_pos select 2)]; };
			case ("LEFT") : { _obj setposatl [(_pos select 0) + (sin (_pdir - 90) * _val ), (_pos select 1) + (cos (_pdir - 90)* _val ), (_pos select 2)]; };
			case ("FARER") : { _obj setposatl [(_pos select 0) + (sin _pdir * _val ), (_pos select 1) + (cos _pdir * _val ), (_pos select 2)]; };
			case ("ROLLZ") : { _dir = _dir + _val; };
			case ("PITCHUP") : { _pitch = _pitch + _val; };
			case ("BANKUP") : { _bank = _bank + _val; };
			
		};
	} else {
		switch (_mode) do {
			case ("UP") : { _obj setposasl [_pos select 0, _pos select 1, (_pos select 2) + _val]; };
			case ("RIGHT") : { _obj setposasl [(_pos select 0) + (sin (_pdir + 90) * _val ), (_pos select 1) + (cos (_pdir + 90)* _val ), (_pos select 2)]; };
			case ("LEFT") : { _obj setposasl [(_pos select 0) + (sin (_pdir - 90) * _val ), (_pos select 1) + (cos (_pdir - 90)* _val ), (_pos select 2)]; };
			case ("FARER") : { _obj setposasl [(_pos select 0) + (sin _pdir * _val ), (_pos select 1) + (cos _pdir * _val ), (_pos select 2)]; };
			case ("ROLLZ") : { _dir = _dir + _val; };
			case ("PITCHUP") : { _pitch = _pitch + _val; };
			case ("BANKUP") : { _bank = _bank + _val; };
			
		};
	};
	_obj setdir _dir;
	if (_pitch !=0 or _bank != 0) then {	
		diag_log ["SET",_obj,_pitch,_bank];
		[_obj, _pitch, _bank] call BIS_fnc_setPitchBank;
	};

	[zlt_newlb, zltNewCurSel] call ZltNewUseGroupParam;
	//конец обработки текущего выделения
};


zlt_new_mouseMoving = {

	if (zlt_cameraMode) then {
		_this call zlt_rotatecam;
		
	};
	//diag_log ["M",_x,_y];

};

zlt_new_keyup = {
	private ["_key","_dir"];
	_ret = false;
	if (count _this > 1) then
	{
		_key  = _this select 1;
		zlt_camerakeys set [_key,false];
		_shift = _this select 2;
		_ctrl = _this select 3;
		_alt  = _this select 4;
		_ret = true;
	};
	_ret;
};


ZltNewGetCameraTarget = { if (zlt_cameraMode) then {zlt_cameraTarget} else {cursortarget}; };

	
zlt_new_keydown =
{
	private ["_key","_dir"];
	_ret = false;
	if (count _this > 1) then
	{
		_key  = _this select 1;
		zlt_camerakeys set [_key,true];
		
		_shift = _this select 2;
		_ctrl = _this select 3;
		_alt  = _this select 4;
		//player globalchat format ["%1 - %2",_key,_this];
		_ret = true;
		_pos = getposatl zlt_newlb;
		_dir = getdir zlt_newlb;
		
		
		_coeff = 0.3;
		_angle = 5;
	
		if (_shift) then {_coeff = 0.1; _angle = 1;};
		if (zlt_new_micro) then {
			_coeff = 0.05; _angle = 1;
			if (_shift) then {_coeff = 0.01; _angle = 0.2;};
		};

//		diag_log ["new2 kh",_this];
		
		switch (true) do
		{
			// КАМЕРА
			
			case (!zlt_cameraMode && _key == DIK_F3) : { [] spawn zlt_createcam; };
			case (zlt_cameraMode && _key == DIK_F3) : { [] spawn zlt_removecam; };
	
			case (_key == DIK_UP && _ctrl && !_alt && !zlt_new_is_plc_mode) : {   ["UP", _coeff] call zlt_new_moveblock;  };
			case (_key == DIK_DOWN && _ctrl && !_alt && !zlt_new_is_plc_mode) : {   ["UP", -_coeff] call zlt_new_moveblock;  };
			case (_key == DIK_LEFT && _ctrl && !_alt) : {   ["ROLLZ", -_angle] call zlt_new_moveblock;  };
			case (_key == DIK_RIGHT && _ctrl && !_alt) : {   ["ROLLZ", _angle] call zlt_new_moveblock;  };
			case (_key == DIK_UP && _alt && !_ctrl) : {   ["PITCHUP", -_angle] call zlt_new_moveblock;  };
			
			case (_key == DIK_DOWN && _alt && !_ctrl) : {   ["PITCHUP", _angle] call zlt_new_moveblock;  };
			
			case (_key == DIK_LEFT && _alt && !_ctrl) : {   ["BANKUP", _angle] call zlt_new_moveblock;  };
			
			case (_key == DIK_RIGHT && _alt && !_ctrl) : {   ["BANKUP", -_angle] call zlt_new_moveblock;  };


			//вверх
			case (_key == DIK_UP && !zlt_new_is_plc_mode ) : {["FARER", _coeff] call zlt_new_moveblock;};
			//вниз
			case (_key == DIK_DOWN && !zlt_new_is_plc_mode ) : {["FARER", -_coeff] call zlt_new_moveblock;};
			//влево
			case (_key == DIK_LEFT && !zlt_new_is_plc_mode ) : {["LEFT", _coeff] call zlt_new_moveblock;};
			//вправо
			case (_key == DIK_RIGHT && !zlt_new_is_plc_mode ) : {["RIGHT", _coeff] call zlt_new_moveblock;};
			
			// вставить
			case (_key == DIK_INSERT && _ctrl) : {[_ctrl] call zlt_new_block};

			case (_key == DIK_INSERT) : {
				// режим установки 
				zlt_new_is_plc_mode = true;
				// handle колбека выключения режима установки 
				zlt_new_plc_mode_cb = [] spawn {
					sleep 5;
					zlt_new_is_plc_mode = false;
					hint "Установка отменена!";
				};

				hint "Режим установки";
			};
			//ctrl up down
			case (zlt_new_is_plc_mode && _key == DIK_UP && _ctrl && !_alt) :  { terminate zlt_new_plc_mode_cb;zlt_new_is_plc_mode=false; [false,"UP"] call zlt_new_block; hint "Установка";};
			case (zlt_new_is_plc_mode && _key == DIK_DOWN && _ctrl && !_alt) :  { terminate zlt_new_plc_mode_cb;zlt_new_is_plc_mode=false; [false,"DOWN"] call zlt_new_block; hint "Установка";};
			//up down
			case (zlt_new_is_plc_mode && _key == DIK_DOWN && !_ctrl && !_alt) :  { terminate zlt_new_plc_mode_cb;zlt_new_is_plc_mode=false; [_ctrl,"BACK"] call zlt_new_block; hint "Установка";};
			case (zlt_new_is_plc_mode && _key == DIK_UP && !_ctrl && !_alt) :  { terminate zlt_new_plc_mode_cb;zlt_new_is_plc_mode=false; [_ctrl,"FRONT"] call zlt_new_block; hint "Установка";};
			//left right
			case (zlt_new_is_plc_mode && _key == DIK_LEFT && !_ctrl && !_alt) :  { terminate zlt_new_plc_mode_cb;zlt_new_is_plc_mode=false; [_ctrl,"LEFT"] call zlt_new_block; hint "Установка";};
			case (zlt_new_is_plc_mode && _key == DIK_RIGHT && !_ctrl && !_alt) :  { terminate zlt_new_plc_mode_cb;zlt_new_is_plc_mode=false; [_ctrl,"RIGHT"] call zlt_new_block; hint "Установка";};


			//
			
			// PD + ctrl
			case (_key == DIK_PGDN and _ctrl ) : {
				private "_oi";
				if (zlt_obj_list_index < ( count (zlt_obj_list_all) - 1 ) ) then { zlt_obj_list_index = zlt_obj_list_index +1 ;}; 
				zlt_obj_list = zlt_obj_list_all select zlt_obj_list_index; 
				_oi = zltNewObjListAllCurIndSel select zlt_obj_list_index;
				if !(isNil "_oi") then {zlt_cur_class = zlt_obj_list select _oi;} else {
				zlt_cur_class = zlt_obj_list select 0; };
				[zlt_cur_class, zlt_obj_list] call zlt_fnc_notifyhint; 
			};
			// PU + ctrl
			case (_key == DIK_PGUP and _ctrl ) : {  
				private "_oi";
				if (zlt_obj_list_index > 0 ) then { zlt_obj_list_index = zlt_obj_list_index -1 ;}; 
				zlt_obj_list = zlt_obj_list_all select zlt_obj_list_index; 
				_oi = zltNewObjListAllCurIndSel select zlt_obj_list_index;
				if !(isNil "_oi") then {zlt_cur_class = zlt_obj_list select _oi;} else {
				zlt_cur_class = zlt_obj_list select 0; };
				[zlt_cur_class, zlt_obj_list] call zlt_fnc_notifyhint; 
			};
			
			
			
			// PD
			case (_key == DIK_PGDN ) : {_ind =  (zlt_obj_list find zlt_cur_class ) max 0; _ind = _ind + (if (_shift) then {10} else {1} ); if (_ind > (count (zlt_obj_list) -1)) then {_ind = count (zlt_obj_list) -1 ;}; zlt_cur_class = zlt_obj_list select _ind; [zlt_cur_class, zlt_obj_list] call zlt_fnc_notifyhint; zltNewObjListAllCurIndSel set [zlt_obj_list_index,_ind]; };
			//PU
			case (_key == DIK_PGUP ) : {_ind =  (zlt_obj_list find zlt_cur_class ) max 0; _ind = _ind - (if (_shift) then {10} else {1} ); if (_ind < 0) then {_ind = 0 ;}; zlt_cur_class = zlt_obj_list select _ind; [zlt_cur_class, zlt_obj_list] call zlt_fnc_notifyhint; };
			
			//end
			
			case (_key == DIK_END && _alt && !_ctrl) : { [] call zlt_new_fnc_gendelbld ; "Сохронил удаление!" call zlt_fnc_notify; };
			
			case (_key == DIK_END && !_ctrl) : { zlt_new_blocks call zlt_save_comp ; "Сохронил!" call zlt_fnc_notify; };
            
            case (_key == DIK_END && _ctrl) : { 
                zlt_disableSimClasses2 = zlt_disableSimClasses;
                zlt_disableSimClasses = [];
                zlt_localObjectsClasses2= zlt_localObjectsClasses;
                zlt_localObjectsClasses = [];
                zlt_new_blocks call zlt_save_comp ; "Сохронил глобально!" call zlt_fnc_notify; 
                zlt_disableSimClasses = zlt_disableSimClasses2;
                zlt_disableSimClasses2 = nil;
                zlt_localObjectsClasses= zlt_localObjectsClasses2;
                zlt_localObjectsClasses2=nil;
            };


			case (_key == DIK_DELETE && _alt) : {
				if (isnil "zlt_new_delbld") then {
					zlt_new_delbld = [];
				};
				private "_obj";_obj = call ZltNewGetCameraTarget;
				if (isnull _obj || typeOf _obj == "") then {
					"Невозможно удалить этот объект!" call zlt_fnc_notify;
				} else {
					private ["_dist","_found"];
					_dist = 5;
					_maxdist = 100;
					_found = false;
					while {!_found && _dist < _maxdist} do {
						_objs = nearestObjects [(_obj) modelToWorld [0,0,0],[typeof _obj],_dist];
						if (count _objs > 0 && {(_objs select 0) == _obj}) exitwith {_found = true;};
						_dist = _dist + 1;
					};
					if (_found) then {
						zlt_new_delbld pushBack _obj;
						_obj setvariable ["zlt_new_del_dist", _dist];
						(( nearestObjects [_obj modelToWorld [0,0,0],[typeof _obj],_dist]) select 0) hideObjectGlobal true;						
					} else {
						"Невозможно удалить этот объект!" call zlt_fnc_notify;
					};
				};
			};
			
			//delete
			case (_key == DIK_DELETE) : {
				_oldid = zlt_new_blocks find zlt_newlb;
				zlt_new_blocks = zlt_new_blocks - [zlt_newlb];
				if (zlt_newlb in zltNewCurSel) then {zltNewCurSel=zltNewCurSel-[zlt_newlb];};
				deletevehicle zlt_newlb;
				zlt_newlb = if (count zlt_new_blocks == 0 )then {objNull} else {if(_oldid > 0) then{ zlt_new_blocks select (_oldid - 1)} else {zlt_new_blocks select 0}};

				"Удалено!" call zlt_fnc_notify;
			};
			
			// home 
			case (_key == DIK_HOME) : {
				if (!_ctrl) then {
					[zlt_newlb, zltNewCurSel] call ZltNewSaveGroupParam;
					zlt_newlb setposatl [ getposatl zlt_newlb select 0,  getposatl zlt_newlb select 1, 0]; 
					[zlt_newlb, zltNewCurSel] call ZltNewUseGroupParam;
				}else {
					if ( (!zlt_new_vectorup && !_alt) || (zlt_new_vectorup && _alt) ) then {
						[zlt_newlb, zltNewCurSel] call ZltNewSaveGroupParam;
						zlt_newlb setvectorup ( surfaceNormal (getpos zlt_newlb) );
						[zlt_newlb, zltNewCurSel] call ZltNewUseGroupParam;
						"Нормаль" call zlt_fnc_notify;
						//zlt_new_vectorup = false;
					} else {
						[zlt_newlb, zltNewCurSel] call ZltNewSaveGroupParam;
						[zlt_newlb, 0,0] call bis_fnc_setpitchbank;
						[zlt_newlb, zltNewCurSel] call ZltNewUseGroupParam;
						//zlt_new_vectorup = true;
						"Вертикаль" call zlt_fnc_notify;
					};
				};
			};

			case (_key == DIK_F1) : {
				[] call zlt_fnc_help;
			};
			
			case (_key == DIK_F4) : {
				if (zlt_new_vectorup) then {zlt_new_vectorup = false; "Режим нормали" call zlt_fnc_notify;} 
				else { zlt_new_vectorup = true; "Режим вертикали" call zlt_fnc_notify;};
			};
			case (_key == DIK_F5) : {
				if (zlt_new_asl) then {zlt_new_asl = false; "Режим ATL" call zlt_fnc_notify;} 
				else { zlt_new_asl = true; "Режим ASL" call zlt_fnc_notify;};
			};
			case (_key == DIK_F6) : {
				if (zlt_new_micro) then {zlt_new_micro = false; "Микрорежим выключен" call zlt_fnc_notify;} 
				else { zlt_new_micro = true; "Микрорежим" call zlt_fnc_notify;};
			};			

/*			case (_key == DIK_F7) : {
				if (isNil "zltNewAutoSelect") then {zltNewAutoSelect=false;};
				if (zltNewAutoSelect) then {zltNewAutoSelect = false; "Режим автовыбора выключен" call zlt_fnc_notify;} 
				else { zltNewAutoSelect = true; "Режим автовыбора" call zlt_fnc_notify;};
			};			*/




			case (_ctrl && _key >= 0x02 && _key <= 0x0B ) : { zltNewCurrentFastObjects set [_key-0x02,zlt_cur_class]; profilenamespace setvariable ["zltNewCurrentFastObjects",zltNewCurrentFastObjects];        };
			case (!_ctrl && _key >= 0x02 && _key <= 0x0B ) : {private "_co"; _co = zltNewCurrentFastObjects select (_key-0x02); if !(isNil "_co") then {zlt_cur_class=_co;}else{"Быстрая клавиша не назначена" call zlt_fnc_notify};};
			case (_ctrl && _key==DIK_C) : {
				[zltNewCurSel, false] call ZltNewSaveGroupToClipboard;
				"Скопировано в буфер" call zlt_fnc_notify;
			};
			case (_ctrl && _key==DIK_V) : {
				zltNewCurSel=0 call ZltNewLoadGroupFromClipboard;
				"Вставлено из буфера" call zlt_fnc_notify;
			};
			case (_ctrl && _key==DIK_X) : {
				[zltNewCurSel, true] call ZltNewSaveGroupToClipboard;
				zltNewCurSel=[];
				"Вырезано из буфера" call zlt_fnc_notify;
			};

			case (_alt && !_ctrl && _key == DIK_SPACE) : {if (zlt_newlb in zltNewCurSel) then {zltNewCurSel = zltNewCurSel-[zlt_newlb]; "Удалено" call zlt_fnc_notify} else {zltNewCurSel pushBack zlt_newlb; "Добавлено" call zlt_fnc_notify;};};
			case (!_alt && _ctrl && _key == DIK_SPACE) : {zltNewCurSel=[]; "Выделение снято" call zlt_fnc_notify};
    		case (!_alt && !_ctrl && _key == DIK_SPACE) : {
				private "_target";
				_target = 0 call ZltNewGetCameraTarget;
				if !(isnull _target) then {
					if (_target in zlt_new_blocks) then {
						if !(_target in zltNewCurSel) then {
							zltNewCurSel pushBack _target; "Добавлено в выделение" call zlt_fnc_notify; } else {zltNewCurSel = zltNewCurSel - [_target]; "Убрано из выделения" call zlt_fnc_notify;};
					} else {"Блок нельзя выделить - он поставлен не нами" call zlt_fnc_notify;};
				} else {"Блок не выбран" call zlt_fnc_notify;};
			};

			// "/"
			case (_key == DIK_DIVIDE and _ctrl) : {
				[] call zlt_select_block; if (not (zlt_newlb in zlt_new_blocks) and not (isnull zlt_newlb)) then {zlt_new_blocks = zlt_new_blocks + [zlt_newlb];}; 
			};
			case (_key == DIK_DIVIDE and not _ctrl) : {
				[] call zlt_select_block; 
			};

			case (_key == DIK_NUMPADSTAR) : {
				call zlt_force_selBlock;
			};

			case (_key == DIK_SUBTRACT) : {
				if (!isnull cursorTarget && cursorTarget != "") then {
					//zlt_cur_class = typeof zlt_newlb;
					zlt_cur_class = typeof cursorTarget;
				};

			};
			case (_key == DIK_ADD) : {
				if (zlt_cameraMode) then {zlt_camera camSetPos (getpos zlt_newlb); zlt_camera camCommit 0;};
			};
			
			// NUM 8
			case (_key == DIK_NUM8 ) : {_ind =  (zlt_new_blocks find zlt_newlb ) max 0; _ind = _ind + 1; if (_ind > (count (zlt_new_blocks) -1)) then {_ind = count (zlt_new_blocks) -1 ;}; zlt_newlb = zlt_new_blocks select _ind; ("Selected: "+ str [zlt_newlb, typeof zlt_newlb]) call zlt_fnc_notify;};
			// NUM 2
			case (_key == DIK_NUM2 ) : {_ind =  (zlt_new_blocks find zlt_newlb ) max 0; _ind = _ind - 1; if (_ind < 0) then {_ind = 0 ;}; zlt_newlb = zlt_new_blocks select _ind; ("Selected: "+ str [zlt_newlb, typeof zlt_newlb]) call zlt_fnc_notify; };

			
			default {_ret = false;};
		};
	};
	_ret;
};

zlt_exportPos = {
	PR(_pos) = [];
	{
		if ( [_x,["Helper_Base_F"]] call zlt_fnc_cycleKindOf ) then {
			_pos pushBack (getpos _x);
		};
	} foreach zlt_new_blocks;
	diag_log ["zlt_exportPos",_pos];
	copyToClipboard str (_pos);
};

	
// 	[-1.56135,-0.255241,-0.458448],[1.56135,0.255241,0.458448]]
zlt_new_block = {
	comment "v.1";
	_class = zlt_cur_class;

	if (!isClass (configFile >> "CfgVehicles" >> zlt_cur_class)) exitWith { "Такого класса нет в данной сборке!" call zlt_fnc_notify};

	_ctrl = [_this,0,false ] call bis_fnc_param;
	_placemode = [_this, 1, "UP"] call bis_fnc_param;
	PARAM(_fASL,2,zlt_new_asl)
	PR(_pos1)=[0,0,0];
	
	_new = createVehicle [_class, [0,0,0], [], 0, "CAN_COLLIDE"];

	//_new = if (_class in zlt_new_globalobjs) then { createVehicle [_class, [0,0,0], [], 0, "CAN_COLLIDE"]; } else { _class createVehiclelocal [0,0,0]; };
	if ( (_new call zlt_objGetStdParams) select P_SIM_DISABLE ) then {
		_new enableSimulation false;
	};
	
	if (!zlt_cameraMode) then {
		_pos1 = player modeltoworld [0, ((boundingboxreal _new select 1 select 0) max (boundingboxreal _new select 1 select 1) ) +1 ,0];
	} else {
		_pos1 = zlt_camera modeltoworld [0, ((boundingboxreal _new select 1 select 0) max (boundingboxreal _new select 1 select 1) ) +1 ,0];
	//	_pos1 = screentoworld [0.5,0.5];
	};
	if (_fASL) then {
		_pos1 = ATLtoASL _pos1;
	};
	
	if (not _ctrl and not isNull zlt_newlb) then {
		_olddir = getdir zlt_newlb;
		_new setdir _olddir;
		_oldpos = [0,0,0];
		if (_fASL) then {
			_oldpos = getposasl zlt_newlb; 
		} else {
			_oldpos = getposatl zlt_newlb; 
		};
		_bboxold = boundingboxreal zlt_newlb;
		_bboxnew = boundingboxreal _new;
		
		_lng = 0;
		_cangle = 90;

		_specialFix = 0;
		if (_class in zlt_new_specialFixObjs) then {
			_ind2 = zlt_new_specialFixObjs find _class;
			_data = zlt_new_specialFixObjsData select _ind2;

			switch (_placemode) do {
				case ("RIGHT") : { _specialFix = _data select 0; };
				case ("LEFT") : { _specialFix = _data select 0; };
				case ("UP") : { _specialFix = _data select 1; };
				case ("DOWN") : { _specialFix = _data select 1; };
				case ("FRONT") : { _specialFix = _data select 2; };
				case ("BACK") : { _specialFix = _data select 2; };
			};

		};

		
		switch (_placemode) do {
			case ("RIGHT") : { _lng = abs(_bboxold select 1 select 0 ) + abs (_bboxnew select 0 select 0) - _specialFix; _cangle = 90;};
			case ("LEFT") : { _lng = abs(_bboxold select 1 select 0 ) + abs (_bboxnew select 0 select 0) - _specialFix; _cangle = 270;};
			case ("UP") : { _lng = abs(_bboxold select 1 select 2 ) + abs (_bboxnew select 0 select 2) - _specialFix; _cangle = 0;};
			case ("DOWN") : { _lng = abs(_bboxold select 1 select 2 ) + abs (_bboxnew select 0 select 2) - _specialFix; _cangle = 0;};
			case ("FRONT") : { _lng = abs(_bboxold select 1 select 1 ) + abs (_bboxnew select 0 select 1) - _specialFix; _cangle = 0;};
			case ("BACK") : { _lng = abs(_bboxold select 1 select 1 ) + abs (_bboxnew select 0 select 1) - _specialFix; _cangle = 180;};
		};
		
		
		switch true do {
			case (_class in  zlt_new_15cmfix) : {_lng = _lng - 0.15;};
			case (_class in  zlt_new_5cmfix) : {_lng = _lng - 0.05;};
			case (_class in  zlt_new_10cmfix) : {_lng = _lng - 0.1;};
		};
		
		if not (_placemode in ["UP","DOWN"]) then {
			_pos1 = [_oldpos, _lng , (_olddir + _cangle)] call BIS_fnc_relPos;
		} else {
			if (_placemode == "UP") then {
				_pos1 = [_oldpos select 0, _oldpos select 1, (_oldpos select 2 ) + _lng];
			} else {
				_pos1 = [_oldpos select 0, _oldpos select 1, (_oldpos select 2 ) - _lng];
			};
		
		};
		diag_log format ["NEW BLOCK %1 %2 _olddir=%3 _bboxold=%4 _bboxnew=%5 _lng=%6 _oldpos=%7 _pos1=%8", zlt_newlb, _new, _olddir, _bboxold, _bboxnew, _lng, _oldpos,_pos1  ];
		((typeof _new) + " блок установлен!") call zlt_fnc_notify;
	};
	//diag_log ["C",_pos1];
	
	if (_fASL) then {
		_new setposasl _pos1;
	} else {
		_new setposatl _pos1;
	};
	if (!zlt_new_vectorup) then {
		_new setvectorup ( surfaceNormal (getpos _new) );
	} else {
		_new setVectorUp [0,0,1];
	};
	
	PR(_closestBlocks) = [zlt_new_blocks,[_new],{_input0 distanceSqr _x},"ASCEND"] call BIS_fnc_sortBy;	
	if ((count zlt_new_blocks > 0) and {(_closestBlocks select 0) distance _new < 0.05} ) then {
		"Ошибка, слишком близко к другому блоку!" call zlt_fnc_notify;
		deleteVehicle _new;
	} else {
		zlt_newlb = _new;
		zlt_new_blocks = zlt_new_blocks + [zlt_newlb];
		if (!isNil "zltNewAutoSelect" && {zltNewAutoSelect}) then {if !(_new in zltNewCurSel) then {zltNewCurSel pushBack _new};};
	};

};

zlt_save_comp = {
	_objs = _this ;
	_text = (_objs call zlt_fnc_getallcode);
	copytoclipboard _text;
};

zlt_force_selBlock = {
	PR(_closestBlocks)=[];
	PR(_pos)=[];
	if (zlt_cameraMode) then {
		_pos = getPos zlt_camera;
	} else {
		_pos = getpos player;
	};
	_closestBlocks = [zlt_new_blocks,[_pos],{_input0 distanceSqr _x},"ASCEND"] call BIS_fnc_sortBy;	
	zlt_newlb = _closestBlocks select 0;
};


zlt_select_block = {
	if (zlt_cameraMode) then {
		if not (isNull zlt_cameraTarget ) then {
			zlt_newlb = zlt_cameraTarget;
		};
	} else {
		if not (isNull cursortarget) then {
			zlt_newlb = cursortarget;
		};
	};
};


zlt_placepos = {
	PR(_pos1)=[0,0,0];
	_new = createVehicle ["Sign_Arrow_Direction_F", [0,0,0], [], 0, "CAN_COLLIDE"];
	if (!zlt_cameraMode) then {
		_pos1 = player modeltoworld [0, ((boundingboxreal _new select 1 select 0) max (boundingboxreal _new select 1 select 1) ) +1 ,0];
	} else {
		//_pos1 = zlt_camera modeltoworld [0, ((boundingboxreal _new select 1 select 0) max (boundingboxreal _new select 1 select 1) ) +1 ,0];
		_pos1 = screentoworld [0.5,0.5];
	};
	_new setposatl _pos1;
	//zlt_positions pushBack _new;
	zlt_new_blocks pushBack _new;
	zlt_newlb = _new;
};

/*
KK_fnc_floatToString = {
    private "_arr";
    _arr = toArray str (_this % 1);
    _arr set [0, 'x'];
    _arr = _arr - ['x'];
    toString (toArray str (_this - _this % 1) + _arr)
};

KK_fnc_positionToString = {
    { _this = if (_forEachIndex == 0 and _forEachIndex != 2) then [
        {_x call KK_fnc_floatToString},
        {if (_forEachIndex ==1) then [{_this + "," + (_x call KK_fnc_floatToString)},{_this + "," + (str _x)}]}];
    } forEach +_this;
    "["+_this+"]"
};
*/

KK_fnc_positionToString = {
    private "_fnc";
    _fnc = {
        if (_this < 0) then {
            str ceil _this + (str (_this - ceil _this) select [2])
        } else {
            str floor _this + (str (_this - floor _this) select [1])
        };
    };
    format [
        "[%1,%2,%3]",
        _this select 0 call _fnc,
        _this select 1 call _fnc,
        _this select 2 call _fnc
    ]
};


/*
KK_fnc_floatToString = {
    private ["_num","_rem"];
    _num = str _this + ".";
    _rem = str (_this % 1);
    (_num select [0, _num find "."]) + (_rem select [_rem find "."])
};

KK_fnc_positionToString = {
    private ["_f2s","_num","_rem"];
    _f2s = {
        _num = str _this + ".";
        _rem = str (_this % 1);
        (_num select [0, _num find "."]) + (_rem select [_rem find "."])
    };
    format [
        "[%1,%2,%3]",
        _this select 0 call _f2s,
        _this select 1 call _f2s,
        _this select 2 call _f2s
    ]
};
*/


zlt_fnc_initUI = {
	disableSerialization;
	uiNamespace setVariable ["zlt_new_objects_lb", findDisplay 46 ctrlCreate ["RscListBox", -1]];
	(uiNamespace getVariable "zlt_new_objects_lb") ctrlSetPosition [safeZoneX,safezoneY+0.5,0.3,0.5];
	(uiNamespace getVariable "zlt_new_objects_lb") ctrlSetFade 0.25;
	(uiNamespace getVariable "zlt_new_objects_lb") ctrlSetFontHeight 0.03;
	(uiNamespace getVariable "zlt_new_objects_lb") ctrlCommit 0;
	
	zlt_new_objects_lb_cb = [] spawn {
		uiSleep 5;
		(uiNamespace getVariable "zlt_new_objects_lb") ctrlShow false;
		(uiNamespace getVariable "zlt_new_objects_lb") ctrlCommit 0;
	};
};



// zlt_new_blocks
zlt_fnc_ZeusSync = {
	if ( count allCurators == 0 ) exitWith {};
	private ['_curator','_curObjs'];
	_curator = allCurators select 0;
	_curObjs = curatorEditableObjects _curator;
	{
		if !(_x in zlt_new_blocks) then {zlt_new_blocks pushBack _x};
	} foreach (_curObjs);
	{
		if !(_x in _curObjs) then { _curator addCuratorEditableObjects [[_x],false]; };
	} foreach zlt_new_blocks;
};



if (isNil "zlt_eh_keydown") then {

	waitUntil { (!isNull (findDisplay 46) || !(alive player))}; 
	zlt_backDisplayCheck = [] spawn {
		while {true} do {
			[] spawn zlt_fnc_ZeusSync;
			zlt_eh_keydown = (findDisplay 46) displayAddEventHandler ["KeyDown", "_aaa=(_this call zlt_new_keydown)"];	
			zlt_eh_keyup = (findDisplay 46) displayAddEventHandler ["KeyUp", "_ccc=(_this call zlt_new_keyup)"];	
			zlt_eh_mouse = (findDisplay 46) displayAddEventHandler ["MouseMoving", "_bbb=(_this call zlt_new_mouseMoving)"];	
			waitUntil { !isNull(findDisplay 312) }; // сработает после запуска Zeus
			[] spawn zlt_fnc_ZeusSync;
			waitUntil { isNull(findDisplay 312) };
			[] spawn zlt_fnc_ZeusSync;
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", zlt_eh_keydown];
			(findDisplay 46) displayRemoveEventHandler ["KeyUp", zlt_eh_keyup];
			(findDisplay 46) displayRemoveEventHandler ["MouseMoving", zlt_eh_mouse];			
		};
	};

/*
	(findDisplay 46) displayRemoveAllEventHandlers "KeyDown";
	(findDisplay 46) displayRemoveAllEventHandlers "KeyUp"; */
	

	// ВИДЖЕТ СПИСКА
	call zlt_fnc_initUI;

	zlt_cur_class = zlt_obj_list select 0;	
	if (isnil "zlt_new_blocks") then { zlt_new_blocks = [];};
	zlt_newlb = objNull;
	zlt_new_vectorup = true;
	zlt_new_asl = true;
	zlt_new_micro = false;

	zltNewCurSel=[]; //текущее выделение через пробел


	zltNewCurrentFastObjects=[]; zltNewCurrentFastObjects resize 10;
	zltNewCurrentFastObjects=profilenamespace getvariable ["zltNewCurrentFastObjects",zltNewCurrentFastObjects];
	
	// камера
	zlt_cameraMode = false;
	zlt_camerakeys = [];
	_DIKcodes = true call bis_fnc_keyCode;
	_DIKlast = _DIKcodes select (count _DIKcodes - 1);
	for "_k" from 0 to (_DIKlast - 1) do {
		zlt_camerakeys set [_k,false];
	};

	zlt_cameraTarget = objNull;

	// режим установки 
	zlt_new_is_plc_mode = false;
	// handle колбека выключения режима установки 
	zlt_new_plc_mode_cb = nil;

	addMissionEventHandler ["Draw3D", "call zlt_onEachFrame"];
	
	[] spawn {
		while {true} do {
			sleep 0.1;
			call zlt_fnc_modeindication;
		};
	};

};

hint "Загрузка завершена";

 