
if (!hasInterface) exitwith{};


zlt_fnc_gasmaskeffects={
	
	100 cutRsc ["goggles","PLAIN", 2, false];
	while {alive player && goggles player in zlt_gasmaskClasses} do { playsound "zvader"; sleep 4.6};
    100 cutText ["","PLAIN"];
	 zlt_maskOn=false;
};



if (isnil "zlt_gasmaskClasses") then {zlt_gasmaskClasses = ["Mask_M40","Mask_M40_OD","Mask_M50"];};if (!isnil "zlt_gasmaskScript") exitwith {};

zlt_gmEffectsScript = scriptnull;
zlt_maskOn = false;




zlt_checkmask = {
	if (goggles player in zlt_gasmaskClasses) then {
		if (isnull zlt_gmEffectsScript) then {
			zlt_gmEffectsScript = 0 spawn zlt_fnc_gasmaskeffects; 
		};
		zlt_maskOn=true;
	} else {
		terminate zlt_gmEffectsScript;
		100 cutText ["","PLAIN"];
		zlt_maskOn=false;
	};
};

zlt_changegasmask = {
	if (goggles player in zlt_gasmaskClasses) exitwith { 
		player unassignitem (goggles player);
		0 spawn zlt_checkmask;
	};
	_gm = "";
	{
		if (_x in items player) exitwith {_gm = _x;}
	} foreach zlt_gasmaskClasses;
	if (_gm != "") then {
		player assignitem _gm;
		0 spawn zlt_checkmask;
	};
};	

sleep 1;
0 call zlt_checkgasmask;

player addeventhandler ["InventoryClosed",{call zlt_checkgasmask}]; 
["ZltRad","PutOnGasMask",["Одеть противогаз","Одеть противогаз"],{call zlt_changegasmask},{true},[0x3F,[false,false,false]],false] call cba_fnc_addKeybind;

