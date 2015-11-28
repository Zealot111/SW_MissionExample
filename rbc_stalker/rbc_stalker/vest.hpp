class Vest_NoCamo_Base;
class V_PlateCarrierIA2_dgtl;
class V_PlateCarrierIAGL_dgtl;
class Vest_Camo_Base;

class Vest_monolit: V_PlateCarrierIA2_dgtl
{
	author = "Zealot";
	displayname = "Stalker - Monolit Vest";
	model = "A3\Characters_F_Beta\INDEP\equip_ia_vest02";
	picture = "\A3\characters_f_Beta\Data\UI\icon_V_I_Vest_02_ca.paa";
	scope = 2;
	hiddenSelections[] = {"camo"};
	hiddenSelectionsTextures[] = {"\rbc_stalker\uniform\BArmor_monolit.paa"};
	class ItemInfo: ItemInfo
	{
		uniformModel = "\A3\Characters_F_Beta\INDEP\equip_ia_vest02.p3d";
		containerClass = "Supply120";
		mass = 60;
		armor = 80;
		passThrough = 0.7;
		hiddenSelections[] = {"camo"};
	};
};

class Vest_h_monolit: V_PlateCarrierIAGL_dgtl
{
	author = "Zealot";
	displayname = "Stalker - Monolit Heavy Vest";
	model = "A3\Characters_F_Beta\INDEP\equip_ia_ga_carrier_gl_rig";
	picture = "\A3\Characters_F_Mark\Data\UI\icon_ga_carrier_gl_rig_digi.paa";
	scope = 2;
	hiddenSelections[] = {"camo1","camo2"};
	hiddenSelectionsTextures[] = {"\rbc_stalker\uniform\BArmor_monolit.paa","\rbc_stalker\uniform\BArmor_h_monolit.paa"};
	class ItemInfo: ItemInfo
	{
		uniformModel = "\A3\Characters_F_Beta\INDEP\equip_ia_ga_carrier_gl_rig.p3d";
		containerClass = "Supply120";
		mass = 80;
		armor = 100;
		passThrough = 0.7;
		hiddenSelections[] = {"camo1","camo2"};
	};
};

class Vest_dolg: V_PlateCarrierIA2_dgtl
{
	author = "Zealot";
	displayname = "Stalker - Dolg Vest";
	model = "A3\Characters_F_Beta\INDEP\equip_ia_vest02";
	picture = "\A3\characters_f_Beta\Data\UI\icon_V_I_Vest_02_ca.paa";
	scope = 2;
	hiddenSelections[] = {"camo"};
	hiddenSelectionsTextures[] = {"\rbc_stalker\uniform\BArmor_dolg.paa"};
	class ItemInfo: ItemInfo
	{
		uniformModel = "\A3\Characters_F_Beta\INDEP\equip_ia_vest02.p3d";
		containerClass = "Supply120";
		mass = 60;
		armor = 80;
		passThrough = 0.7;
		hiddenSelections[] = {"camo"};
	};
};

class Vest_h_dolg: V_PlateCarrierIAGL_dgtl
{
	author = "Zealot";
	displayname = "Stalker - Dolg Heavy Vest";
	model = "A3\Characters_F_Beta\INDEP\equip_ia_ga_carrier_gl_rig";
	picture = "\A3\Characters_F_Mark\Data\UI\icon_ga_carrier_gl_rig_digi.paa";
	scope = 2;
	hiddenSelections[] = {"camo1","camo2"};
	hiddenSelectionsTextures[] = {"\rbc_stalker\uniform\BArmor_dolg.paa","\rbc_stalker\uniform\BArmor_h_dolg.paa"};
	class ItemInfo: ItemInfo
	{
		uniformModel = "\A3\Characters_F_Beta\INDEP\equip_ia_ga_carrier_gl_rig.p3d";
		containerClass = "Supply120";
		mass = 80;
		armor = 100;
		passThrough = 0.7;
		hiddenSelections[] = {"camo1","camo2"};
	};
};