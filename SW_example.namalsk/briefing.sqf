waitUntil { player == player };


switch (side player) do 
{

case WEST: // BLUFOR briefing goes here
{
		player createDiaryRecord ["diary", ["Задача", "Удержать город Воркута в течении 2,5 часов, постараться завербовать новых бойцов в группировку"]];

};


case EAST: // OPFOR briefing goes here
{ 
		player createDiaryRecord ["diary", ["Задача",  "В течении полутора часов взять город Воркута под свой контроль, отчистить его от анархистов, завербовать новых бойцов в группировку"]];

};


case RESISTANCE: // RESISTANCE/INDEPENDENT briefing goes here
{ 
		player createDiaryRecord ["diary", ["Задачи", "Одиночки, как всегда бродят по зоне, но могут и вмешаться в конфликт Долг и Свобода на той или другой стороне"]];
};


case CIVILIAN: // CIVILIAN briefing goes here
{ 
		player createDiaryRecord ["diary", ["Задачи сторон", "Нет"]];
};
};


player createDiaryRecord ["diary", ["Вводная",  "
Город Воркута был взят под контроль группировкой Свобода, Долгу такой расклад не по нраву, так как это удобное место для стрелок с военными, а так же торговцами, бизнес под угрозой, так что вступай в долг и защити мир от заразы зоны. 
<br/> 
<br/>
[RMC] Chief

"]];

player createDiaryRecord ["Diary",["Разведданные","
<p>Группировки</p><br/>
<img image='group.jpg'>
"]];

