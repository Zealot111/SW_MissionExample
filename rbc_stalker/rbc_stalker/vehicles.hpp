class RyanZombieB_Soldier_IndepResurrect;
class ZobieStalkerBaseNoScript : RyanZombieB_Soldier_IndepResurrect {
	fsmDanger = "";
	fsmFormation = "";
	vehicleClass = "Men";
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
		"\FFCamoPack\Data\Uniform_camo_01.paa", "\stalker_markers\images\STALKLER.paa"
	};		
};	
class ZobieStalkerBase_IndepResurrect2 : ZobieStalkerBaseNoScript {
	hiddenSelections[]=	{
		"Camo","insignia"
	};
	hiddenSelectionsTextures[]=		{
		"\FFCamoPack\Data\Uniform_camo_06.paa", "\stalker_markers\images\STALKLER.paa"
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

class plp_ct_FootlockerBrown;
class plp_ct_FootlockerStalkerBrown : plp_ct_FootlockerBrown {
	maximumLoad = 500000;
};

// ретекстуры

