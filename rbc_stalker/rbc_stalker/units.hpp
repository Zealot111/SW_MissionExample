 class I_Soldier_F;

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
	hiddenSelectionsTextures[] = {"\rbc_stalker\uniform\dolg.paa", "\stalker_markers\images\DOLG.paa"};
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
	hiddenSelectionsTextures[] = {"\rbc_stalker\uniform\monolit.paa", "\stalker_markers\images\MONOLIT.paa"};
	hiddenSelections[] = {"Camo","insignia"};
	linkedItems[] = {"rbc_U_monolit"};
	respawnLinkedItems[] = {"rbc_U_monolit"};
};


class SW_Dolg_SL_F : rbc_man_dolg_base {
	scope = 2;
	side = 0;
	faction = "SW_Dolg";
	icon = "iconManLeader";
	displayName = "Dolg squad leader";
	cost = 500000;
	uniformClass = "rbc_U_dolg";
  	identityTypes[]= {"LanguageRUS","Head_Euro","Head_Asian","G_IRAN_default"};
  	faceType = "Man_A3";
  	genericNames="RussianMen";
	backpack = "";
	weapons[] = {"arifle_av_aksu","RH_mak","Binocular","Throw","Put"};
	respawnweapons[] = {"arifle_av_aksu","RH_mak","Binocular","Throw","Put"};
	magazines[] = {"SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red","30Rnd_ak_545x39_mag","30Rnd_ak_545x39_mag","30Rnd_ak_545x39_mag","RH_8Rnd_9x18_Mak","RH_8Rnd_9x18_Mak","HandGrenade","30Rnd_ak_545x39_mag","RH_8Rnd_9x18_Mak"};
	respawnmagazines[] = {"SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red","30Rnd_ak_545x39_mag","30Rnd_ak_545x39_mag","30Rnd_ak_545x39_mag","RH_8Rnd_9x18_Mak","RH_8Rnd_9x18_Mak","HandGrenade","30Rnd_ak_545x39_mag","RH_8Rnd_9x18_Mak"};
	items[] = {"RBCSW_AdetectorCA1","FirstAidKit","zlt_radx","zlt_radx","zlt_radx","zlt_radx"};
	respawnitems[] = {"RBCSW_AdetectorCA1","FirstAidKit","zlt_radx","zlt_radx","zlt_radx","zlt_radx"};
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
	items[] = {"RBCSW_AdetectorCA2","FirstAidKit","zlt_radx","zlt_radx","zlt_radx","zlt_radx"};
	respawnitems[] = {"RBCSW_AdetectorCA2","FirstAidKit","zlt_radx","zlt_radx","zlt_radx","zlt_radx"};
	linkedItems[] = {"Vest_dolg","av_shlem_chehol","RBCSW_Mask_M50_Dolg","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
	respawnlinkedItems[] = {"Vest_dolg","av_shlem_chehol","RBCSW_Mask_M50_Dolg","ItemMap","ItemCompass","ItemWatch","ItemRadio"};

};

class SW_Dolg_SoldierGrz_F : SW_Dolg_SoldierBzn_F {
	displayName = "Dolg soldier groza";
	weapons[] = {"arifle_av_groza_gp_A","hgun_Rook40_F","Throw","Put"};
	respawnweapons[] = {"arifle_av_groza_gp_A","hgun_Rook40_F","Throw","Put"};
	magazines[] = {"SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red","30Rnd_av_762x39_mag","1Rnd_HE_Grenade_shell","16Rnd_9x21_Mag","HandGrenade","HandGrenade","30Rnd_av_762x39_mag","30Rnd_av_762x39_mag","30Rnd_av_762x39_mag","1Rnd_HE_Grenade_shell","30Rnd_av_762x39_mag","16Rnd_9x21_Mag"};
	respawnmagazines[] = {"SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red","30Rnd_av_762x39_mag","1Rnd_HE_Grenade_shell","16Rnd_9x21_Mag","HandGrenade","HandGrenade","30Rnd_av_762x39_mag","30Rnd_av_762x39_mag","30Rnd_av_762x39_mag","1Rnd_HE_Grenade_shell","30Rnd_av_762x39_mag","16Rnd_9x21_Mag"};
	items[] = {"RBCSW_AdetectorCA2","FirstAidKit","zlt_radx","zlt_radx","zlt_radx","zlt_radx","zlt_beer","rbc_bacon","rbc_bacon"};
	respawnitems[] = {"RBCSW_AdetectorCA2","FirstAidKit","zlt_radx","zlt_radx","zlt_radx","zlt_radx","zlt_beer","rbc_bacon","rbc_bacon"};
	linkedItems[] = {"Vest_h_dolg","av_shlem_chehol","RBCSW_Mask_M50_Dolg","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
	respawnlinkedItems[] = {"Vest_h_dolg","av_shlem_chehol","RBCSW_Mask_M50_Dolg","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
};

class SW_Dolg_SoldierAk_F : SW_Dolg_SoldierBzn_F {
	displayName = "Dolg soldier Ak74";
	backpack = "B_FieldPack_blk";
	weapons[] = {"arifle_av_ak74m","RH_mak","Throw","Put"};
	respawnweapons[] = {"arifle_av_ak74m","RH_mak","Throw","Put"};
	magazines[] = {"SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red","RH_8Rnd_9x18_Mak","RH_8Rnd_9x18_Mak","RH_8Rnd_9x18_Mak","RH_8Rnd_9x18_Mak","30Rnd_ak_545x39_mag","30Rnd_ak_545x39_mag","30Rnd_ak_545x39_mag"};
	respawnmagazines[] = {"SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red","RH_8Rnd_9x18_Mak","RH_8Rnd_9x18_Mak","RH_8Rnd_9x18_Mak","RH_8Rnd_9x18_Mak","30Rnd_ak_545x39_mag","30Rnd_ak_545x39_mag","30Rnd_ak_545x39_mag"};
	items[] = {"RBCSW_AdetectorCA2","FirstAidKit","rbc_bacon","zlt_radx","zlt_radx"};
	respawnitems[] = {"RBCSW_AdetectorCA2","FirstAidKit","rbc_bacon","zlt_radx","zlt_radx"};
	linkedItems[] = {"Vest_dolg","min_rf_beanie_black","RBCSW_Mask_M50_Dolg","ItemMap","ItemCompass","ItemWatch"};
	respawnlinkedItems[] = {"Vest_dolg","min_rf_beanie_black","RBCSW_Mask_M50_Dolg","ItemMap","ItemCompass","ItemWatch"};	
};