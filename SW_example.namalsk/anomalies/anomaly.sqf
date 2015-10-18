/*
// while {!AnomaliesInitialized} do { sleep 1;};
  */
if (isServer) then {
	//diag_log "Server side initializing...";
	tf_Anomalies = [];
	tf_ActiveAnomalies = [];
	private ["_cnt, _Atext, _mark"];
		
	_cnt = count allMapMarkers - 1;
	for "_x" from 0 to _cnt do
	{
		_Atext = markerText (allMapMarkers select _x);
		if (_Atext in ["Jarka","Electra","Puh","Myas","Gravy"]) then
		{
			_mark = allMapMarkers select _x;
			tf_Anomalies append [_mark];
		};
	};
		
	publicVariable "tf_Anomalies";
		
	//diag_log "Server side: main cycle starting...";
	
	_null = [] spawn {
		private ["_Aname, _Aactive, _Aplayers"];
		while {true} do
		{
		  sleep 1;
		  {
				_Aname = _x;
		    _Aactive = VAR getVariable [_Aname,false];
				if (_Aactive) then
	      {
	   	    diag_log format["Checking anomaly %1",_Aname];
	      
					_Aplayers = false;
					scopeName "ifAnomalyisactive";
					{
						if (markerPos _Aname distance (_x) < 7) then
						{
						  if (alive _x) then
						  {
							  _Aplayers = true;
							  breakout "ifAnomalyisactive";
							};
						};
				 	} forEach allPlayers;
					if (!_Aplayers) then
					{
					  VAR setVariable [_Aname, false, true];
						[[_Aname],"anomaly_fnc_Ahide",true,false] call BIS_fnc_MP;
						tf_ActiveAnomalies = tf_ActiveAnomalies - [_Aname];
				  };
				};
			} forEach tf_ActiveAnomalies;
		};
	};
	//diag_log "Server side fully initialized.";
};
  
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
diag_log "User side Acycle finished.";        
        };
    };
//diag_log "User side stoped.";
};
//diag_log "User side fully initialized.";
