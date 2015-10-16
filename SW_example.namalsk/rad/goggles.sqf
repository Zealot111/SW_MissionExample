
if (!hasInterface) exitwith{};
sleep 1;

zlt_fnc_gasmaskeffects={
	100 cutRsc ["goggles","PLAIN", 2, false];
	while {alive player && goggles player in zlt_gasmaskClasses} do { playsound "zvader"; sleep 4.6};
    100 cutText ["","PLAIN"];
};



if (isnil "zlt_gasmaskClasses") then {zlt_gasmaskClasses = ["Mask_M40","Mask_M40_OD","Mask_M50"];};if (!isnil "zlt_gasmaskScript") exitwith {};

zlt_gmEffectsScript = scriptnull;
zlt_maskOn = false;

zlt_gasmaskScript = 0 spawn {
	while {alive player} do {
		if (isnull zlt_gmEffectsScript) then {
			 if (goggles player in zlt_gasmaskClasses) then {
			 	zlt_gmEffectsScript = 0 spawn zlt_fnc_gasmaskeffects;
                zlt_maskOn=true;
			 };
		}else {
			if !(goggles player in zlt_gasmaskClasses) then {
			 	terminate zlt_gmEffectsScript;
		 		100 cutText ["","PLAIN"];
                zlt_maskOn=false;
			};
		};
		sleep 0.5;
	};
};


