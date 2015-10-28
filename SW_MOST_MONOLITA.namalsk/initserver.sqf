zltrespawnplayer = [];
publicvariable "zltrespawnplayer";

{
	[_x,2] call BIS_fnc_respawnTickets;
} foreach playableunits;