diag_log ["OnPlayerKilled", _this];
// [<oldUnit>,<killer>,<respawn>,<respawnDelay>]



zltrespawnplayer = zltrespawnplayer + [getPlayerUID player];
publicvariable "zltrespawnplayer";

if ({getplayeruid player == _x} count zltrespawnplayer > 0) then {
	setPlayerRespawnTime 900;
} else {
	setPlayerRespawnTime 5;
};