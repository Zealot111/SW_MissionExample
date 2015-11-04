waitUntil { player == player };


switch (side player) do 
{

case WEST: // BLUFOR briefing goes here
{
		player createDiaryRecord ["diary", ["Задача", "Бандиты, Грабежи, взятие заложников, вымогательство. Свобода: Изучение зоны. Выполнение заданий ученых."]];

};


case EAST: // OPFOR briefing goes here
{ 
		player createDiaryRecord ["diary", ["Задача",  ""]];

};


case RESISTANCE: // RESISTANCE/INDEPENDENT briefing goes here
{ 
		player createDiaryRecord ["diary", ["Задачи", "Сталкеры и Чистое Небо:изучение зоны, выполнение заданий Белого. Долг: Выполнение заданий Белого. "]];
};


case CIVILIAN: // CIVILIAN briefing goes here
{ 
		player createDiaryRecord ["diary", ["Задачи сторон", "Нет"]];
};
};


player createDiaryRecord ["diary", ["Вводная",  "
Изучать зону, выполнять задачи ученых и торговцев.
<br/> 
<br/>
[RMC] Chief

"]];

player createDiaryRecord ["Diary",["Разведданные","
<p>Группировки</p><br/>
<img image='group.jpg'>
"]];