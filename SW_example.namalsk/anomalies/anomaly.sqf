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
      sleep 0.3;
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
        };
    };
//diag_log "User side stoped.";
};
//diag_log "User side fully initialized.";
