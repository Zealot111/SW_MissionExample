
if (!hasInterface) exitwith{};


zlt_fnc_gasmaskeffects={
	
	100 cutRsc ["goggles","PLAIN", 2, false];
	while {alive player && goggles player in zlt_gasmaskClasses} do { playsound "zvader"; sleep 4.6};
    100 cutText ["","PLAIN"];
	 zlt_maskOn=false;
};



if (isnil "zlt_gasmaskClasses") then {zlt_gasmaskClasses =["RBCSW_Mask_M50_DolgExtrared","RBCSW_Mask_M50_Dolg","RBCSW_Mask_M50_Main","RBCSW_Mask_M50_Monolyth"];};if (!isnil "zlt_gasmaskScript") exitwith {};

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
	};
	_gm = "";
	{
		if (_x in items player) exitwith {_gm = _x;}
	} foreach zlt_gasmaskClasses;
	if (_gm != "") then {
		player assignitem _gm;
	};
};	

sleep 1;
0 call zlt_checkmask;

zlt_maskcheckscript = scriptnull;

player addeventhandler ["InventoryOpened",{
	if (isnull zlt_maskcheckscript) then {	zlt_maskcheckscript = 0 spawn { waituntil { !isnull (finddisplay 602) };  while {!isnull (finddisplay 602)} do {uisleep 0.5; 0 call zlt_checkmask; };	};	};
	false
}]; 
player addeventhandler ["InventoryClosed",{ terminate zlt_maskcheckscript ; 0 spawn zlt_checkmask; false }]; 
["ZltRad","PutOnGasMask",["Одеть противогаз","Одеть противогаз"],{0 call zlt_changegasmask;0 call zlt_checkmask;true},{true},[0x3F,[false,false,false]],false] call cba_fnc_addKeybind;

