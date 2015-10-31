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
 