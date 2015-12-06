#define dup2(a) a, a
#define dup3(a) a, a, a
#define dup4(a) a, a, a, a
#define dup5(a) a, a, a, a, a
#define dup7(a) a, a, a, a, a, a, a
#define dup9(a) a, a, a, a, a, a, a, a, a
#define dup10(a) a, a, a, a, a, a, a, a, a, a
#define dup12(a) a, a, a, a, a, a, a, a, a, a, a, a

class Camo_atacs;
class I_Soldier_F;
class SW_Stalker_Loner_Base_F: Camo_atacs
{
	author = "Zealot";
	_generalMacro = "I_Soldier_F";
	vehicleClass = "Men";
	icon = "iconMan";	
	scope = 1;
	modelsides[] = {3,2,1,0};
	displayName = "Stalker - Loner - Base";
	nakedUniform = "U_BasicBody";
	hiddenSelectionsTextures[] = { "\STALKER_Patches\data\loners.paa"};
	hiddenSelections[] = {"insignia"};
	identityTypes[]= {"LanguageRUS","Head_Euro","Head_asian","G_IRaN_default"};
	faceType = "Man_a3";
  	genericNames="RussianMen";

};

class SW_Stalker_Hobo_F : SW_Stalker_Loner_Base_F {
	scope = 2;
	scopeCurator = 2;
	side = 2;
	faction = "SW_Stalkers";
	displayName = "Stalker Hobo";
	cost = 50000;
	uniformClass = "CamoU_atacs";
	backpack = "";		
	weapons[] = {"Throw","Put"};
	respawnweapons[] = {"str_ij_long","Throw","Put"};
	magazines[] = {};
	respawnmagazines[] = {};
	items[] = {"FirstAidKit"};
	respawnitems[] = {"FirstAidKit"};
	linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
	respawnlinkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};	

};

class SW_Stalker_HoboWthShotgun_F : SW_Stalker_Hobo_F {
	displayName = "Stalker Hobo with shotgun";
	weapons[] = {"str_ij_long","Throw","Put"};
	respawnweapons[] = {"str_ij_long","Throw","Put"};
	magazines[] = {dup12("2pul_pula")};
	respawnmagazines[] = {dup12("2pul_pula")};
	items[] = {"RBCSW_AdetectorCA2","FirstAidKit",dup3("zlt_radx"), dup2("rbc_bacon")};
	respawnitems[] = {"RBCSW_AdetectorCA2","FirstAidKit",dup3("zlt_radx"), dup2("rbc_bacon")};
	linkedItems[] = {"rhs_beanie_green","6B3","ItemMap","ItemCompass","ItemWatch"};
	respawnlinkedItems[] = {"rhs_beanie_green","6B3","ItemMap","ItemCompass","ItemWatch"};	
	
	
};

class SW_Stalker_Loner_F : SW_Stalker_HoboWthShotgun_F {
	displayName = "Stalker Loner";
	cost = 80000;
	weapons[] = {"str_ij_long","Throw","Put"};
	respawnweapons[] = {"str_ij_long","Throw","Put"};
	magazines[] = {dup12("2pul_pula")};
	respawnmagazines[] = {dup12("2pul_pula")};
	items[] = {"RBCSW_AdetectorCA2","FirstAidKit",dup3("zlt_radx"), dup2("rbc_bacon")};
	respawnitems[] = {"RBCSW_AdetectorCA2","FirstAidKit",dup3("zlt_radx"), dup2("rbc_bacon")};
	linkedItems[] = {"rhs_beanie_green","6B3","ItemMap","ItemCompass","ItemWatch"};
	respawnlinkedItems[] = {"rhs_beanie_green","6B3","ItemMap","ItemCompass","ItemWatch"};	
	
};

class SW_Stalker_Loner_Leader_F : SW_Stalker_Loner_F {
	displayName = "Stalker Leader";
	icon = "iconManLeader";
	cost = 100000;
	weapons[] = {"RH_mak","str_ij_long","Throw","Put"};
	respawnweapons[] = {"RH_mak","str_ij_long","Throw","Put"};
	magazines[] = {dup12("2pul_pula"), dup5("RH_8Rnd_9x18_Mak")};
	respawnmagazines[] = {dup12("2pul_pula"), dup4("RH_8Rnd_9x18_Mak")};
	items[] = {"RBCSW_AdetectorCA1","FirstAidKit",dup3("zlt_radx"), dup2("rbc_bacon")};
	respawnitems[] = {"RBCSW_AdetectorCA1","FirstAidKit",dup3("zlt_radx"), dup2("rbc_bacon")};
	linkedItems[] = {"rhs_beanie_green","6B3","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
	respawnlinkedItems[] = {"rhs_beanie_green","6B3","ItemMap","ItemCompass","ItemWatch","ItemRadio"};	
	
};

class rbc_man_dolg_base: I_Soldier_F
{
	author = "Zealot";
	_generalMacro = "I_Soldier_F";
	scope = 1;
	modelsides[] = {3,2,1,0};
	displayName = "Stalker - Dolg - Base";
	nakedUniform = "U_BasicBody";
	vehicleClass = "Men";
	uniformClass = "rbc_U_dolg";
	hiddenSelectionsTextures[] = {"\rbc_stalker\uniform\dolg.paa", "\STALKER_Patches\data\duty.paa"};
	hiddenSelections[] = {"Camo","insignia"};
	linkedItems[] = {"rbc_U_dolg"};
	respawnLinkedItems[] = {"rbc_U_dolg"};
};

class rbc_man_monolit_base: I_Soldier_F
{
	author = "Zealot";
	_generalMacro = "I_Soldier_F";
	scope = 1;
	modelsides[] = {3,2,1,0};
	displayName = "Stalker - Monolit - Base";
	nakedUniform = "U_BasicBody";
	vehicleClass = "Men";
	uniformClass = "rbc_U_monolit";
	hiddenSelectionsTextures[] = {"\rbc_stalker\uniform\monolit.paa", "\STALKER_Patches\data\monolith.paa"};
	hiddenSelections[] = {"Camo","insignia"};
	linkedItems[] = {"rbc_U_monolit"};
	respawnLinkedItems[] = {"rbc_U_monolit"};
};


class SW_MON_SL_F : rbc_man_monolit_base {
	scope = 2;
	scopeCurator = 2;
	side = 1;
	faction = "SW_Monolit";
	icon = "iconManLeader";
	displayName = "Monolith squad leader";
	cost = 500000;
	uniformClass = "rbc_U_monolit";
  	identityTypes[]= {"LanguageRUS","Head_Euro","Head_asian","G_IRaN_default"};
	hiddenSelectionsTextures[] = {"\STALKER_Patches\data\monolith.paa"};
	hiddenSelections[] = {"insignia"};
  	faceType = "Man_a3";
  	genericNames="RussianMen";
	backpack = "";	
	weapons[] = {"RH_m4","RH_p226","Binocular","Throw","Put"};
	respawnweapons[] = {"RH_m4","RH_p226","Binocular","Throw","Put"};
	magazines[] = { dup4("RH_30Rnd_556x45_M855A1"), dup3("RH_15Rnd_9x19_SIG")};
	respawnmagazines[] = { dup4("RH_30Rnd_556x45_M855A1"), dup3("RH_15Rnd_9x19_SIG")};
	items[] = {"RBCSW_AdetectorCA1","FirstAidKit", dup3("zlt_radx")};
	respawnitems[] = {"RBCSW_AdetectorCA1","FirstAidKit", dup3("zlt_radx")};
	linkedItems[] = {"Vest_monolit","av_shlem_Vityaz2","RBCSW_Mask_M50_Monolyth","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
	respawnlinkedItems[] = {"Vest_monolit","av_shlem_Vityaz2","RBCSW_Mask_M50_Monolyth","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
	
};

class SW_MON_soldierM4_F : SW_MON_SL_F {
	icon = "iconMan";
	displayName = "Monolith soldier M4";
	cost = 100000;
	backpack = "";	
	weapons[] = {"RH_m4","RH_p226","Binocular","Throw","Put"};
	respawnweapons[] = {"RH_m4","RH_p226","Binocular","Throw","Put"};
	magazines[] = { dup4("RH_30Rnd_556x45_M855A1"), dup3("RH_15Rnd_9x19_SIG")};
	respawnmagazines[] = { dup4("RH_30Rnd_556x45_M855A1"), dup3("RH_15Rnd_9x19_SIG")};
	items[] = {"RBCSW_AdetectorCA1","FirstAidKit", dup3("zlt_radx"), dup2("rbc_bacon")};
	respawnitems[] = {"RBCSW_AdetectorCA1","FirstAidKit", dup3("zlt_radx"), dup2("rbc_bacon")};
	linkedItems[] = {"Vest_monolit","av_shlem_Vityaz2","RBCSW_Mask_M50_Monolyth","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
	respawnlinkedItems[] = {"Vest_monolit","av_shlem_Vityaz2","RBCSW_Mask_M50_Monolyth","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
};

class SW_MON_soldierM203_F : SW_MON_soldierM4_F {
	displayName = "Monolith soldier M203";
	backpack = "";	
	weapons[] = {"RH_m4_m203_wdl","RH_p226","Throw","Put"};
	respawnweapons[] = {"RH_m4_m203_wdl","RH_p226","Throw","Put"};
	magazines[] = { dup4("RH_30Rnd_556x45_M855A1"), dup3("RH_15Rnd_9x19_SIG"), dup3("1Rnd_HE_Grenade_shell")};
	respawnmagazines[] = { dup4("RH_30Rnd_556x45_M855A1"), dup3("RH_15Rnd_9x19_SIG"), dup3("1Rnd_HE_Grenade_shell")};
	items[] = {"RBCSW_AdetectorCA1","FirstAidKit", dup3("zlt_radx"), dup2("rbc_bacon")};
	respawnitems[] = {"RBCSW_AdetectorCA1","FirstAidKit", dup3("zlt_radx"), dup2("rbc_bacon")};
	linkedItems[] = {"Vest_monolit","av_shlem_Vityaz2","RBCSW_Mask_M50_Monolyth","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
	respawnlinkedItems[] = {"Vest_monolit","av_shlem_Vityaz2","RBCSW_Mask_M50_Monolyth","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
};

class SW_MON_soldierM4A1_F : SW_MON_soldierM4_F {
	displayName = "Monolith soldier M4A1";
	backpack = "B_Kitbag_rgr";	
	weapons[] = {"RH_m4a1_ris_wdl","RH_p226","Throw","Put"};
	respawnweapons[] = {"RH_m4a1_ris_wdl","RH_p226","Throw","Put"};
	magazines[] = { dup4("RH_30Rnd_556x45_M855A1"), dup3("RH_15Rnd_9x19_SIG")};
	respawnmagazines[] = { dup4("RH_30Rnd_556x45_M855A1"), dup3("RH_15Rnd_9x19_SIG")};
	items[] = {"RBCSW_AdetectorCA1","FirstAidKit", dup3("zlt_radx"), dup2("rbc_bacon")};
	respawnitems[] = {"RBCSW_AdetectorCA1","FirstAidKit", dup3("zlt_radx"), dup2("rbc_bacon")};
	linkedItems[] = {"Vest_monolit","min_rf_bandana_olive","RBCSW_Mask_M50_Monolyth","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
	respawnlinkedItems[] = {"Vest_monolit","min_rf_bandana_olive","RBCSW_Mask_M50_Monolyth","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
};


class SW_Dolg_SL_F : rbc_man_dolg_base {
	scope = 2;
	scopeCurator = 2;
	side = 0;
	faction = "SW_Dolg";
	icon = "iconManLeader";
	displayName = "Dolg squad leader";
	cost = 500000;
	uniformClass = "rbc_U_dolg";
  	identityTypes[]= {"LanguageRUS","Head_Euro","Head_asian","G_IRaN_default"};
  	faceType = "Man_a3";
  	genericNames="RussianMen";
	hiddenSelectionsTextures[] = {"\STALKER_Patches\data\duty.paa"};
	hiddenSelections[] = {"insignia"};	
	backpack = "";
	weapons[] = {"arifle_av_aksu","RH_mak","Binocular","Throw","Put"};
	respawnweapons[] = {"arifle_av_aksu","RH_mak","Binocular","Throw","Put"};
	magazines[] = {"SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red","30Rnd_ak_545x39_mag","30Rnd_ak_545x39_mag","30Rnd_ak_545x39_mag","RH_8Rnd_9x18_Mak","RH_8Rnd_9x18_Mak","HandGrenade","30Rnd_ak_545x39_mag","RH_8Rnd_9x18_Mak"};
	respawnmagazines[] = {"SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red","30Rnd_ak_545x39_mag","30Rnd_ak_545x39_mag","30Rnd_ak_545x39_mag","RH_8Rnd_9x18_Mak","RH_8Rnd_9x18_Mak","HandGrenade","30Rnd_ak_545x39_mag","RH_8Rnd_9x18_Mak"};
	items[] = {"RBCSW_adetectorCa1","FirstaidKit","zlt_radx","zlt_radx","zlt_radx","zlt_radx"};
	respawnitems[] = {"RBCSW_adetectorCa1","FirstaidKit","zlt_radx","zlt_radx","zlt_radx","zlt_radx"};
	linkedItems[] = {"Tarzan_ch_bron","av_shlem_chehol","RBCSW_Mask_M50_DolgExtrared","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
	respawnlinkedItems[] = {"Tarzan_ch_bron","av_shlem_chehol","RBCSW_Mask_M50_DolgExtrared","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
};

class SW_Dolg_SoldierBzn_F : SW_Dolg_SL_F {
	icon = "iconMan";
	displayName = "Dolg soldier Bizon";
	cost = 100000;
	weapons[] = {"arifle_av_bizon","RH_mak","Throw","Put"};
	respawnweapons[] = {"arifle_av_bizon","RH_mak","Throw","Put"};
	magazines[] = {"SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red","64Rnd_9x19_mag","64Rnd_9x19_mag","HandGrenade","HandGrenade","RH_8Rnd_9x18_Mak","RH_8Rnd_9x18_Mak","RH_8Rnd_9x18_Mak","64Rnd_9x19_mag"};
	respawnmagazines[] = {"SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red","64Rnd_9x19_mag","64Rnd_9x19_mag","HandGrenade","HandGrenade","RH_8Rnd_9x18_Mak","RH_8Rnd_9x18_Mak","RH_8Rnd_9x18_Mak","64Rnd_9x19_mag"};
	items[] = {"RBCSW_adetectorCa2","FirstaidKit","zlt_radx","zlt_radx","zlt_radx","zlt_radx"};
	respawnitems[] = {"RBCSW_adetectorCa2","FirstaidKit","zlt_radx","zlt_radx","zlt_radx","zlt_radx"};
	linkedItems[] = {"Vest_dolg","av_shlem_chehol","RBCSW_Mask_M50_Dolg","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
	respawnlinkedItems[] = {"Vest_dolg","av_shlem_chehol","RBCSW_Mask_M50_Dolg","ItemMap","ItemCompass","ItemWatch","ItemRadio"};

};

class SW_Dolg_SoldierGrz_F : SW_Dolg_SoldierBzn_F {
	displayName = "Dolg soldier groza";
	weapons[] = {"arifle_av_groza_gp_a","hgun_Rook40_F","Throw","Put"};
	respawnweapons[] = {"arifle_av_groza_gp_a","hgun_Rook40_F","Throw","Put"};
	magazines[] = {"SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red","30Rnd_av_762x39_mag","1Rnd_HE_Grenade_shell","16Rnd_9x21_Mag","HandGrenade","HandGrenade","30Rnd_av_762x39_mag","30Rnd_av_762x39_mag","30Rnd_av_762x39_mag","1Rnd_HE_Grenade_shell","30Rnd_av_762x39_mag","16Rnd_9x21_Mag"};
	respawnmagazines[] = {"SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red","30Rnd_av_762x39_mag","1Rnd_HE_Grenade_shell","16Rnd_9x21_Mag","HandGrenade","HandGrenade","30Rnd_av_762x39_mag","30Rnd_av_762x39_mag","30Rnd_av_762x39_mag","1Rnd_HE_Grenade_shell","30Rnd_av_762x39_mag","16Rnd_9x21_Mag"};
	items[] = {"RBCSW_adetectorCa2","FirstaidKit","zlt_radx","zlt_radx","zlt_radx","zlt_radx","zlt_beer","rbc_bacon","rbc_bacon"};
	respawnitems[] = {"RBCSW_adetectorCa2","FirstaidKit","zlt_radx","zlt_radx","zlt_radx","zlt_radx","zlt_beer","rbc_bacon","rbc_bacon"};
	linkedItems[] = {"Vest_h_dolg","av_shlem_chehol","RBCSW_Mask_M50_Dolg","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
	respawnlinkedItems[] = {"Vest_h_dolg","av_shlem_chehol","RBCSW_Mask_M50_Dolg","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
};

class SW_Dolg_Soldierak_F : SW_Dolg_SoldierBzn_F {
	displayName = "Dolg soldier ak74";
	backpack = "B_FieldPack_blk";
	weapons[] = {"arifle_av_ak74m","RH_mak","Throw","Put"};
	respawnweapons[] = {"arifle_av_ak74m","RH_mak","Throw","Put"};
	magazines[] = {"SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red","RH_8Rnd_9x18_Mak","RH_8Rnd_9x18_Mak","RH_8Rnd_9x18_Mak","RH_8Rnd_9x18_Mak","30Rnd_ak_545x39_mag","30Rnd_ak_545x39_mag","30Rnd_ak_545x39_mag"};
	respawnmagazines[] = {"SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red","RH_8Rnd_9x18_Mak","RH_8Rnd_9x18_Mak","RH_8Rnd_9x18_Mak","RH_8Rnd_9x18_Mak","30Rnd_ak_545x39_mag","30Rnd_ak_545x39_mag","30Rnd_ak_545x39_mag"};
	items[] = {"RBCSW_adetectorCa2","FirstaidKit","rbc_bacon","zlt_radx","zlt_radx"};
	respawnitems[] = {"RBCSW_adetectorCa2","FirstaidKit","rbc_bacon","zlt_radx","zlt_radx"};
	linkedItems[] = {"Vest_dolg","min_rf_beanie_black","RBCSW_Mask_M50_Dolg","ItemMap","ItemCompass","ItemWatch"};
	respawnlinkedItems[] = {"Vest_dolg","min_rf_beanie_black","RBCSW_Mask_M50_Dolg","ItemMap","ItemCompass","ItemWatch"};	
};