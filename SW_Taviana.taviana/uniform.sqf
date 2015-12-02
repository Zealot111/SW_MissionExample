// group this setvariable ["zlt_force_uniform", [["av_shlem_chehol"],["Tarzan_ch_bron"],["rbc_U_dolg"],["STALKER_insignia_duty"]]


private ["_data","_uniform","_vest","_hg","_ins"];
while {true} do {

	if (alive player) then {
		_uniform = []; _vest = []; _hg = []; _ins = [];
		_data = [];
		if (!isnil "zlt_side_uniform") then {
			_data = zlt_side_uniform;
		};
		if (!isNil {group player getvariable "zlt_force_uniform"}) then {
			_data = group player getvariable "zlt_force_uniform";
		};
		if (!isNil {player getvariable "zlt_force_uniform"}) then {
			_data = player getvariable "zlt_force_uniform";
		};
		if !(_data isEqualTo []) then {
			_hg = _data select 0; _vest = _data select 1; _uniform = _data select 2; _ins = _data select 3;
		};
		//diag_log ["Uni check",_data, _hg, _vest,_uniform, _ins		];
		if ( !(_uniform isEqualTo [])) then {
			if !(uniform player in _uniform) then {
				player forceAddUniform (_uniform call bis_fnc_selectrandom);
			};
		};
		if ( !(_vest isEqualTo [])) then {
			if !(vest player in _vest) then {
				player addVest (_vest call bis_fnc_selectrandom);
			};
		};
		if ( !(_hg isEqualTo [])) then {
			if !(headgear player in _hg) then {
				player addHeadgear (_hg call bis_fnc_selectrandom);
			};
		};		
		if ( !(_ins isEqualTo [])) then {
			if !(([ player ] call BIS_fnc_getUnitInsignia) in _ins) then {
				[player, (_ins call bis_fnc_selectrandom)] call BIS_fnc_setUnitInsignia;
			};
		};	
	
	};
	sleep 16;
};

