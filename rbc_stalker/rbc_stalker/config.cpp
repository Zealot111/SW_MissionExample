class CfgPatches
{
	class rbc_stalker
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"A3_Weapons_F","plp_containers"};
	};
};



class CfgSounds
{
	sounds[] = {};
	#include "sounds.hpp"
};

class EventHandlers;

class CfgVehicles 
{
	#include "vehicles.hpp"
	#include "units.hpp"
};


class CfgWeapons 
{
	#include "weapons.hpp"
	#include "uniform.hpp"
	#include "vest.hpp"

};



class CfgFactionClasses {
	class SW_Stalkers {
		displayName = "Свободные сталкеры";
		priority = 1;
		side = 2;
		icon = "\STALKER_Patches\data\loners.paa";
	};		
	class SW_Dolg {
		displayName = "Долг";
		priority = 1;
		side = 0;
		icon = "\STALKER_Patches\data\duty.paa";
	};	
	class SW_Monolit {
		displayName = "Монолит";
		priority = 1;
		side = 1;
		icon = "\STALKER_Patches\data\monolith.paa";
	};	
};


class CfgGroups {
	class East {
		#include "dolgGroup.hpp"
	};
	class West {
		#include "monGroup.hpp"
	};
};