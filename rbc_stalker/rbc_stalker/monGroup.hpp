class SW_Monolith {
	name = "Монолит";
	class Infantry 	{
		name = "Пехота";
		class SW_Monolit_team {
			name = "Боевая группа Монолит";
			faction = "SW_Monolit";
			side = 1;
			aliveCategory = "Infantry";
			class Unit0 {
				side = 1;
				vehicle = "SW_MON_SL_F";
				rank = "Corporal";
				position[] = {0,0,0};
			};
			class Unit1 {
				side = 1;
				vehicle = "SW_MON_soldierM4_F";
				rank = "Private";
				position[] = {1,0,0};
			};
			class Unit2	{
				side = 1;
				vehicle = "SW_MON_soldierM203_F";
				rank = "Private";
				position[] = {2,0,0};
			};
			class Unit3	{
				side = 1;
				vehicle = "SW_MON_soldierM4A1_F";
				rank = "Private";
				position[] = {3,0,0};
			};
					
		};

	};			
};	
