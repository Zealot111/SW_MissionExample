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

// контейнеры

class plp_ct_CasketLeatherRed;
class plp_ct_StalkerCasketLeatherRed : plp_ct_CasketLeatherRed {
	maximumLoad = 500000;
	
	
};

// ретекстуры

class I_Soldier_F;

class rbc_man_dolg_base: I_Soldier_F
{
	author = "Zealot";
	_generalMacro = "I_Soldier_F";
	scope = 1;
	modelsides[] = {3,2,1,0};
	displayName = "Stalker - Dolg - Base";
	nakedUniform = "U_BasicBody";
	vehicleClass = "Stalker";
	uniformClass = "rbc_U_dolg";
	hiddenSelectionsTextures[] = {"\rbc_stalker\uniform\dolg.paa"};
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
	vehicleClass = "Stalker";
	uniformClass = "rbc_U_monolit";
	hiddenSelectionsTextures[] = {"\rbc_stalker\uniform\monolit.paa"};
	hiddenSelections[] = {"Camo","insignia"};
	linkedItems[] = {"rbc_U_monolit"};
	respawnLinkedItems[] = {"rbc_U_monolit"};
};
