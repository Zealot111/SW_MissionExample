/*
*/
if (!hasInterface) exitWith {};
detectAdistconst3 = detectAdistconst/3;
detectAdistconst2 = detectAdistconst*2/3;

DetectorRenew = {
	Adetector_lvl = 0;
	Adetector_dir = 0;
	private "_dir";
	disableserialization;
	_display = uiNamespace getVariable ["Adetector_display",displayNull];
	_ctrl = _display displayCtrl 574101; _ctrl ctrlShow false;
	_ctrl = _display displayCtrl 574102; _ctrl ctrlShow false;
	_ctrl = _display displayCtrl 574103; _ctrl ctrlShow false;
	_ctrl = _display displayCtrl 574104; _ctrl ctrlShow false;
	_ctrl = _display displayCtrl 574106; _ctrl ctrlShow false;
	_ctrl = _display displayCtrl 574107; _ctrl ctrlShow false;
	_ctrl = _display displayCtrl 574108; _ctrl ctrlShow false;
	_ctrl = _display displayCtrl 574109; _ctrl ctrlShow false;
	_ctrl = _display displayCtrl 574111; _ctrl ctrlShow false;
	_ctrl = _display displayCtrl 574112; _ctrl ctrlShow false;
	_ctrl = _display displayCtrl 574113; _ctrl ctrlShow false;
	
	while {alive player && !isnull (uiNamespace getVariable ["Adetector_display",displayNull])} do 
	{
		switch (Adetector_lvl) do 
		{
	    case 1: {	_ctrl = _display displayCtrl 574111; _ctrl ctrlShow false;Adetector_lvl=0;};
	    case 2: { _ctrl = _display displayCtrl 574112; _ctrl ctrlShow false;Adetector_lvl=0;};
	    case 3: { _ctrl = _display displayCtrl 574113; _ctrl ctrlShow false;Adetector_lvl=0;};
		};
		switch (Adetector_dir) do 
		{
	    case 0: {	_ctrl = _display displayCtrl 574101; _ctrl ctrlShow false;Adetector_dir=0;};
	    case 1: { _ctrl = _display displayCtrl 574102; _ctrl ctrlShow false;Adetector_dir=0;};
	    case 2: { _ctrl = _display displayCtrl 574103; _ctrl ctrlShow false;Adetector_dir=0;};
	    case 3: { _ctrl = _display displayCtrl 574104; _ctrl ctrlShow false;Adetector_dir=0;};
	    case 4: { _ctrl = _display displayCtrl 574106; _ctrl ctrlShow false;Adetector_dir=0;};
	    case 5: { _ctrl = _display displayCtrl 574107; _ctrl ctrlShow false;Adetector_dir=0;};
	    case 6: { _ctrl = _display displayCtrl 574108; _ctrl ctrlShow false;Adetector_dir=0;};
	    case 7: { _ctrl = _display displayCtrl 574109; _ctrl ctrlShow false;Adetector_dir=0;};
	    case 8: { _ctrl = _display displayCtrl 574101; _ctrl ctrlShow false;Adetector_dir=0;};
		};
		if (detectedAname != "") then
		{
	    _Apos = markerPos detectedAname;_Apos = [_Apos select 0, _Apos select 1, 0];_dir = [player,_Apos] call BIS_fnc_dirTo;_dir = _dir - (getdir (player));if (_dir < 0) then {_dir = _dir + 360};if (_dir > 360) then {_dir = _dir - 360};
	    if (detectedAdist <= detectAdistconst3) then
	    {
	      _ctrl = _display displayCtrl 574113; _ctrl ctrlShow true;
	      Adetector_lvl = 3;
	    }
	    else
	    {
	    	if (detectedAdist <= detectAdistconst2) then
		    {
		      _ctrl = _display displayCtrl 574112; _ctrl ctrlShow true;
		      Adetector_lvl = 2;
		    }
		    else
		    {
			    if (detectedAdist <= detectAdistconst ) then
			    {
			      _ctrl = _display displayCtrl 574111; _ctrl ctrlShow true;
			      Adetector_lvl = 1;
			    };
			  };
		  };
//	    hint str(_dir);
	    _dir = round (_dir / 45);
	    switch (_dir) do
			{
		    case 0: {	_ctrl = _display displayCtrl 574101; _ctrl ctrlShow true;Adetector_dir = 0;};
		    case 1: { _ctrl = _display displayCtrl 574102; _ctrl ctrlShow true;Adetector_dir = 1;};
		    case 2: { _ctrl = _display displayCtrl 574103; _ctrl ctrlShow true;Adetector_dir = 2;};
		    case 3: { _ctrl = _display displayCtrl 574104; _ctrl ctrlShow true;Adetector_dir = 3;};
		    case 4: { _ctrl = _display displayCtrl 574106; _ctrl ctrlShow true;Adetector_dir = 4;};
		    case 5: { _ctrl = _display displayCtrl 574107; _ctrl ctrlShow true;Adetector_dir = 5;};
		    case 6: { _ctrl = _display displayCtrl 574108; _ctrl ctrlShow true;Adetector_dir = 6;};
		    case 7: { _ctrl = _display displayCtrl 574109; _ctrl ctrlShow true;Adetector_dir = 7;};
		    case 8: { _ctrl = _display displayCtrl 574101; _ctrl ctrlShow true;Adetector_dir = 8;};
			};
	    	//   	_radt =  detectedAname + " " + str(detectedAdist) + " " + str(_dir);
	// вычисляем направление		
	//		_ctrl ctrlSetText _radt; 
	//		_ctrl ctrlCommit 0;
		};
    switch (Adetector_lvl) do
		{
			case 1: {Player say3d "AdetectorBeep";};
			case 2: {Player say3d "AdetectorBeep2";};
			case 3: {Player say3d "AdetectorBeep3";};
		};
		uisleep 1;
	};
};
/*
ADetectorMainCycle = {
// if detector online
	while {alive player} do 
	{
//		0 call ZRadGetCurrent;
		sleep 0.5;
	};
};


ADetectorMainCycleP = 0 spawn ADetectorMainCycle;
*/
["Детектер аномалий (on/off)", {true}, {if (isnull (uiNamespace getVariable ["Adetector_display",displaynull])) then {("ADetector" call BIS_fnc_rscLayer) cutrsc ["RscADetector", "PLAIN"];} else {("ADetector" call BIS_fnc_rscLayer) cuttext ["", "PLAIN"];}}, true] call AGM_Interaction_fnc_addInteractionSelf;                                       