class CfgPatches
{
	class rbc_stalker
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"A3_Weapons_F"};
	};
};


class CfgFunctions
{
	#include "functions.hpp"
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
};


class CfgWeapons 
{
	#include "weapons.hpp"

};



