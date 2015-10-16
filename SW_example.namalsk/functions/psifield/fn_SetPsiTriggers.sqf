/*
	Author: Marksman

	Description:
	Create triggers on source.

	Parameter(s):
	0: _this: NUMBER - the radius of triggers.
	1: _this: NUMBER - Psi-power.
	
	Example:
	[100,0.1] call Mrk_fnc_SetPsiTriggers;
*/

_rad = _this select 0;
_pow = format ["[thisTrigger,%1] call Mrk_fnc_PsiField;", _this select 1];

private ["_Obj","_Psitrg","_marker"];

if !(hasInterface) exitwith {};

_BigPsiSourceList = [133999,148296,119724,75514,11228,150359,72408,22509,10242,59834];
_SmallPsiSourceList = [
	83891,35302,35379,35649,67795,67849,79728,79776,81627,81736,82253,24137,5461,6752,7110,90374,90436,90789,90835,90857,91866,91913,92008,92040,92050,53586,53637,53675,53683,52388,53342,53347,53370,53367,53504,53441,53481,53475,105433,105432,
	84301,34989,35078,35077,85585,1555,21082,21635,21779,21976,22750,23331,23648,23694,8533,8654,9474,9763,91298,120001,120042,120072,120156,120315,120251,120255,
	24542,24420,24419,15600,15652,15806,20121,20122,10838,10965,17119,17157,17444,17480,18838,18890,64371,64716,86394,86723,86888,87164,87200,88618
];
_marker = "PsiField";

	for "_i" from 0 to ((count _BigPsiSourceList)-1) do {
	
		_Obj = [0,0,0] nearestObject (_BigPsiSourceList select _i);
		
		_markerM = format ["PsiField%1",_i];
		_markerS = format ["PsiFieldB%1",_i];
		
		_Psitrg = createTrigger ["EmptyDetector",getPos _Obj,true];
		_Psitrg setTriggerArea [_rad,_rad, 0, false];
		_Psitrg setTriggerActivation ["ANY", "PRESENT", true];
		_Psitrg setTriggerStatements ["player in thislist", _pow, ""];
		
		[_markerM, _Psitrg,true] call BIS_fnc_markerToTrigger;
		_markerM setMarkerColorLocal "ColorBrown";
		_markerM setMarkerBrushLocal "BDiagonal";
		[_markerS, _Psitrg,true] call BIS_fnc_markerToTrigger;
		_markerS setMarkerColorLocal "ColorBrown";
		_markerS setMarkerBrushLocal "Border";
	};
	for "_i" from 0 to ((count _SmallPsiSourceList)-1) do {
	
		_Obj = [0,0,0] nearestObject (_SmallPsiSourceList select _i);
		
		_markerM = format ["PsiField1_%1",_i];
		_markerS = format ["PsiFieldB_%1",_i];
		
		_Psitrg = createTrigger ["EmptyDetector",getPos _Obj];
		_Psitrg setTriggerArea [10,10, 0, false];
		_Psitrg setTriggerActivation ["ANY", "PRESENT", true];
		_Psitrg setTriggerStatements ["player in thislist", "[thisTrigger,0.05] call Mrk_fnc_PsiField;", ""];
		
		[_markerM, _Psitrg,true] call BIS_fnc_markerToTrigger;
		_markerM setMarkerColorLocal "ColorBrown";
		_markerM setMarkerBrushLocal "BDiagonal";
		[_markerS, _Psitrg,true] call BIS_fnc_markerToTrigger;
		_markerS setMarkerColorLocal "ColorBrown";
		_markerS setMarkerBrushLocal "Border";
	};