case ( _cl == "min_rf_soldier"):{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "min_rf_klmk";
_unit addItemToUniform "RBCSW_AdetectorCA2";
_unit addItemToUniform "AGM_CableTie";
for "_i" from 1 to 3 do {_unit addItemToUniform "10Rnd_av_9x39mm_SP5";};
_unit addItemToUniform "SmokeShell";
_unit addVest "min_rf_highcapacity_vest_flora";
for "_i" from 1 to 3 do {_unit addItemToVest "10Rnd_av_9x39mm_SP5";};
for "_i" from 1 to 3 do {_unit addItemToVest "20Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
_unit addItemToVest "SmokeShellGreen";
for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_green";};
_unit addBackpack "min_rf_torna_flora_Ammo";
for "_i" from 1 to 8 do {_unit addItemToBackpack "AGM_Bandage";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "AGM_Morphine";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "zlt_radx";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rbc_bacon";};
_unit addHeadgear "min_rf_helmet_para";
_unit addGoggles "RBCSW_Mask_M40_OD";
_unit addItem "10Rnd_av_9x39mm_SP5";
_unit addItem "20Rnd_9x21_Mag";
_unit addWeapon "arifle_av_vss";
_unit addPrimaryWeaponItem "acc_flashlight";
_unit addPrimaryWeaponItem "optic_av_pso";
_unit addWeapon "av_aps_sd";
_unit addHandgunItem "muzzle_snds_L";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
};

case ( _cl == "min_rf_soldier"):{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "min_rf_klmk";
_unit addItemToUniform "RBCSW_AdetectorCA2";
for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_ak_545x39_mag";};
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "SmokeShellGreen";
_unit addVest "min_rf_highcapacity_vest_flora";
for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_ak_545x39_mag";};
for "_i" from 1 to 5 do {_unit addItemToVest "20Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_green";};
_unit addBackpack "min_rf_torna_flora_Ammo";
for "_i" from 1 to 8 do {_unit addItemToBackpack "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "AGM_Morphine";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "zlt_radx";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rbc_bacon";};
_unit addHeadgear "min_rf_helmet_para";
_unit addGoggles "RBCSW_Mask_M40_OD";
_unit addItem "30Rnd_ak_545x39_mag";
_unit addItem "20Rnd_9x21_Mag";
_unit addWeapon "arifle_av_aek";
_unit addWeapon "av_aps";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
};

case ( _cl == "min_rf_soldier"):{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "min_rf_klmk";
_unit addItemToUniform "RBCSW_AdetectorCA2";
for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_ak_545x39_mag";};
_unit addItemToUniform "SmokeShell";
_unit addVest "min_rf_highcapacity_vest_flora";
for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_ak_545x39_mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 3 do {_unit addItemToVest "20Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
_unit addItemToVest "SmokeShellGreen";
for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_green";};
_unit addBackpack "min_rf_torna_flora_Ammo";
for "_i" from 1 to 8 do {_unit addItemToBackpack "AGM_Bandage";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "AGM_Morphine";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "zlt_radx";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rbc_bacon";};
_unit addHeadgear "min_rf_helmet_para";
_unit addGoggles "RBCSW_Mask_M40_OD";
_unit addItem "30Rnd_ak_545x39_mag";
_unit addItem "1Rnd_HE_Grenade_shell";
_unit addItem "20Rnd_9x21_Mag";
_unit addWeapon "arifle_av_aekg";
_unit addWeapon "av_aps_sd";
_unit addHandgunItem "muzzle_snds_L";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
};

case ( _cl == "min_rf_soldier_SL"):{
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "min_rf_klmk";
_unit addItemToUniform "RBCSW_AdetectorCA1";
_unit addItemToUniform "AGM_CableTie";
_unit addItemToUniform "30Rnd_ak_545x39_mag";
_unit addItemToUniform "SmokeShell";
_unit addVest "min_rf_highcapacity_vest_flora";
for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_ak_545x39_mag";};
for "_i" from 1 to 3 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToVest "20Rnd_9x21_Mag";};
_unit addBackpack "min_rf_torna_flora_Ammo";
for "_i" from 1 to 10 do {_unit addItemToBackpack "AGM_Bandage";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "AGM_Morphine";};
for "_i" from 1 to 8 do {_unit addItemToBackpack "zlt_radx";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "rbc_bacon";};
_unit addHeadgear "min_rf_helmet_para";
_unit addGoggles "RBCSW_Mask_M40_OD";
_unit addItem "30Rnd_ak_545x39_mag";
_unit addItem "20Rnd_9x21_Mag";
_unit addWeapon "arifle_av_aek";
_unit addPrimaryWeaponItem "optic_av_pso";
_unit addWeapon "av_aps_sd";
_unit addHandgunItem "muzzle_snds_L";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";
};
