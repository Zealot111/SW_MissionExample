diag_log ["OnPlayerKilled", _this];
// [<oldUnit>,<killer>,<respawn>,<respawnDelay>]


{_x ppEffectEnable false} forEach ["radialBlur", "chromAberration", "wetDistortion", "filmGrain", "DynamicBlur"];

if ((_this select 0) getvariable ["rbc_is_vip",false] ) then {
  	setPlayerRespawnTime 60; 
};