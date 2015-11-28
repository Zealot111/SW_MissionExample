class Uniform_Base;
class UniformItem;


class rbc_U_dolg: Uniform_Base
{
	author = "Zealot";
	scope = 2;
	modelsides[] = {3,2,1,0};
	displayName = "Stalker - Dolg";
	picture = "\A3\characters_f_beta\data\ui\icon_u_ir_combatuniform_rucamo_ca.paa";
	model = "\A3\Characters_F\Common\Suitpacks\suitpack_blufor_soldier";
	class ItemInfo: UniformItem
	{
		uniformModel = "\A3\characters_F_Beta\indep\ia_soldier_01";
		uniformClass = "rbc_man_dolg_base";
		containerClass = "Supply40";
		mass = 40;
	};
};
class rbc_U_monolit: Uniform_Base
{
	author = "Zealot";
	scope = 2;
	modelsides[] = {3,2,1,0};
	displayName = "Stalker - Monolit";
	picture = "\A3\characters_f_beta\data\ui\icon_u_ir_combatuniform_rucamo_ca.paa";
	model = "\A3\Characters_F\Common\Suitpacks\suitpack_blufor_soldier";
	class ItemInfo: UniformItem
	{
		uniformModel = "\A3\characters_F_Beta\indep\ia_soldier_01";
		uniformClass = "rbc_man_monolit_base";
		containerClass = "Supply40";
		mass = 40;
	};
};



