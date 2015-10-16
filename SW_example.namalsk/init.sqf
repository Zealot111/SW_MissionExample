enableSaving [false, false];
TF_give_personal_radio_to_regular_soldier=true;
TF_give_microdagr_to_soldier=false;
tf_no_auto_long_range_radio=true;


waituntil {!isnil "bis_fnc_init"};

[] call wmt_fnc_briefingmap;
_bs = [] execVM "t.sqf";
[] execVM "briefing.sqf";
waituntil {scriptDone _bs};
0 execVM "loot2.sqf";

0 spawn {sleep 1;  10 setFog [0.1, 0.02, 50]; };


/*
// while {!AnomaliesInitialized} do { sleep 1;};
  */
if (isDedicated) exitWith {};
sleep 3;
//diag_log "User side initializing...";
//diag_log Player;
//diag_log "tf_Anomalies";
while {isNil "tf_Anomalies"} do {diag_log "sleep";sleep 1;};
//diag_log tf_Anomalies;

_null = [] spawn {
    private ["_Aname, _Aactive, _Adist"];
    while {true} do
    {
      sleep 0.4;
      // sleep можно оптимизировать следующим образом: при опросе аномалий вы¤сн¤ем на машине ли игрок?
      //        если на машине, то есть ли р¤дом с ним хоть одна аномали¤ в радиусе 200 м. ≈сли пешком, то
      //        есть ли р¤дом с ним хоть одна аномали¤ в радиусе 15 м. ≈сли нет, то sleep 5 (к примеру), если есть, то sleep 0.2-0.3;
      // “ак же значение sleep вли¤ет на скорость нанесени¤ урона игроку аномалией.
      if (alive Player) then
      {
        {
              _Adist = markerPos _x distance (Player);
            _Aactive = VAR getVariable [_x,false];
                if (!_Aactive) then
                {
                    if (_Adist < 7) then
                    {
                      VAR setVariable [_x, true, true];
                      [[_x],"anomaly_fnc_Aview",true,false] spawn BIS_fnc_MP;
                    };
                };
                if (_Aactive)   then
                {
                    if (_Adist < 3 and alive Player) then
                    {
    //                [[_x],"anomaly_fnc_Ahit",Player,true,false] spawn BIS_fnc_MP;
                      nul = [_x] spawn anomaly_fnc_Ahit;
                    };
                };
            } forEach tf_Anomalies;
        }   ;
    };
//diag_log "User side stoped.";
};
//diag_log "User side fully initialized.";

//с качестве параметра - список триггеров
[[trad1,trad2,trad3,trad4,trad5,trad6,trad7,trad8,trad9,trad10,trad11,trad12,trad13,trad14,trad16]] execvm "rad\geiger.sqf";

[30,240] execVM "blowout\blowout.sqf";

//################ MISSION SPECIFIC ##################################################