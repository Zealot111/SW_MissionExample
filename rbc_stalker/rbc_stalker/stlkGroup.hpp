class SW_Stalkers {
	name = "Сталкеры";
	class Infantry 	{
		name = "Пехота";
		class SW_Stalkers_team {
			name = "Группа сталкеров";
			faction = "SW_Stalkers";
			side = 2;
			aliveCategory = "Infantry";
			class Unit0 {
				side = 2;
				vehicle = "SW_Stalker_Loner_Leader_F";
				rank = "Corporal";
				position[] = {0,0,0};
			};
			class Unit1 {
				side = 2;
				vehicle = "SW_Stalker_Loner_F";
				rank = "Private";
				position[] = {1,0,0};
			};
			class Unit2	{
				side = 2;
				vehicle = "SW_Stalker_Loner_F";
				rank = "Private";
				position[] = {2,0,0};
			};
			class Unit3	{
				side = 2;
				vehicle = "SW_Stalker_Loner_F";
				rank = "Private";
				position[] = {3,0,0};
			};
					
		};

	};			
};	
