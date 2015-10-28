waitUntil { player == player };


switch (side player) do 
{

case WEST: // BLUFOR briefing goes here
{
		player createDiaryRecord ["diary", ["Задача", "Наемникам и бандитам объединиться и уничтожить бойцов Долга взять под контроль из базу"]];

};


case EAST: // OPFOR briefing goes here
{ 
		player createDiaryRecord ["diary", ["Задача",  "Бойцы долг защищают свою базу, военные отправили два отделения СПН на помощь"]];

};


case RESISTANCE: // RESISTANCE/INDEPENDENT briefing goes here
{ 
		player createDiaryRecord ["diary", ["Задачи", "Действовать по обстоятельствам вы можете как помочь Долгу так и объединиться с наемниками и бандитами"]];
};


case CIVILIAN: // CIVILIAN briefing goes here
{ 
		player createDiaryRecord ["diary", ["Задачи сторон", "Нет"]];
};
};


player createDiaryRecord ["diary", ["Вводная",  "
На базе долга осталась небольшая охрана, наемники и бандиты решили попробовать захватить базу.
Военные постараются помочь бойцам Долга, Группы сталкеров предоставлены выбирать с кем объединиться.
<br/> 
<br/>
[RMC] Chief

"]];