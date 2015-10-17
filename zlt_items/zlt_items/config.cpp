class CfgPatches
{
	class zlt_items
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
	};
};
class CfgMagazines 
{
	class CA_Magazine;
	class zlt_beer: CA_Magazine
	{
		mass = 10;
		scope = 2;
		author = "Zealot";
		displayName = "Пиво Красный Медведь темное";
		descriptionShort = "Не содержит радионуклеотидов!";
		picture = "\zlt_items\pics\Chem_beer.paa";
	};
	class zlt_radx: CA_Magazine
	{
		mass = 2;
		scope = 2;
		author = "Zealot";
		displayName = "Rad-X";
		descriptionShort = "Патентованный препарат-радиопротектор. <br/> Противопоказан при беременности!";
		picture = "\zlt_items\pics\Chem_Rad-X.paa";
	};
	class zlt_radaway: CA_Magazine
	{
		mass = 10;
		scope = 2;
		author = "Zealot";
		displayName = "Rad Away";
		descriptionShort = "Очень дефицитное импортное средство от радиации";
		picture = "\zlt_items\pics\Chem_RadAway.paa";
	};
	class zlt_rotgut: CA_Magazine
	{
		mass = 10;
		scope = 2;
		author = "Zealot";
		displayName = "Самогон";
		descriptionShort = "5 лет выдержки в бочке из под мазута";
		picture = "\zlt_items\pics\Chem_RotGut.paa";
	};
};