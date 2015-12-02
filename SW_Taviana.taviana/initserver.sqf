diag_log ["Initserver.sqf"];
rbc_alreadyPlayedUIDs = [];
publicVariable "rbc_alreadyPlayedUIDs";

addMissionEventHandler ["HandleDisconnect",{
	diag_log["HandleDisconnect",_this]; 
	if (alive (_this select 0)) then {
//		(_this select 0) setVariable ["rbc_disconnected",1,true];
		deleteVehicle (_this select 0);
	};

	//[_this select 0] call rbc_fnc_disableAI;
//	(_this select 0) addEventHandler ["Respawn", {deleteVehicle (_this select 0);}];
	false
}]; 

if (isserver) then {
	[] execVM "loot4.sqf";
	[] execVM "zombie.sqf";
	[] execVM "zone.sqf";
};

/*




//торговец

[this, "TORG"] call compile preprocessFileLineNumbers "MERC1.sqf";
this setvariable ["rbc_is_vip",true];
this setvariable ["rbc_vip",["TORG","MERC1.sqf",getposatl this]];  

//монолит

[this, "LMON"] call compile preprocessFileLineNumbers "tpl\mon.sqf";
this setvariable ["rbc_is_vip",true];
this setvariable ["rbc_vip",["LMON","tpl\mon.sqf",getposatl this]];
group this setvariable ["blowout_protected",true, true];
group this setvariable ["zlt_force_uniform", [["av_shlem_Vityaz2"],["Vest_monolit"],["rbc_U_monolit"],["STALKER_insignia_monolith"]];


//Долг

[this, "LDOLG"] call compile preprocessFileLineNumbers "tpl\dolg.sqf";
this setvariable ["rbc_is_vip",true];
this setvariable ["rbc_vip",["LDOLG","tpl\dolg.sqf",getposatl this]];
group this setvariable ["zlt_force_uniform", [["av_shlem_chehol","min_rf_beanie_black"],["Vest_dolg","Tarzan_ch_bron","Vest_h_dolg"],["rbc_U_dolg"],["STALKER_insignia_duty"]];

*/







sleep 1;

{
	if (alive _x && !(isplayer _x) && _x isKindof "Man" && !(_x in playableunits)) then {
		_x setVariable ["AGM_AllowUnconscious", false];
		// Monolit
		if (side _x == west) then {
			if (leader _x == _x) then {
				[_x, "MSL" ] call compile preprocessfilelinenumbers "tpl\monp.sqf";

			} else {
				[_x, ["M1","M2","M3"] call BIS_fnc_selectRandom ] call compile preprocessfilelinenumbers "tpl\monp.sqf";
			
			};
			


		};

		if (side _x == east) then {
			if (leader _x == _x) then {
				[_x, "DSL" ] call compile preprocessfilelinenumbers "tpl\dolgp.sqf";

			} else {
				[_x, ["D1","D2","D3"] call BIS_fnc_selectRandom ] call compile preprocessfilelinenumbers "tpl\dolgp.sqf";
			
			};
			


		};


	};
} foreach allUnits;