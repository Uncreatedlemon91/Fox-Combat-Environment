
comment "Remove existing items";
removeAllWeapons Player;
removeAllItems Player;
removeAllAssignedItems Player;
removeUniform Player;
removeVest Player;
removeBackpack Player;
removeHeadgear Player;
removeGoggles Player;

comment "Add weapons";
Player addWeapon "ACM_RDI_584_C";
Player addPrimaryWeaponItem "CUP_acc_LLM_od";
Player addPrimaryWeaponItem "30Rnd_580x42_Mag_F";

comment "Add containers";
Player forceAddUniform "ACM_NAG_MCCUU_roll_2_gloves";
Player addVest "ACM_Nag_CARRIER_LIGHT";

comment "Add items to containers";
Player addItemToUniform "ACE_EarPlugs";
Player addItemToUniform "ACRE_PRC343";
Player addItemToUniform "ACE_SpraypaintBlue";
for "_i" from 1 to 2 do {Player addItemToUniform "ace_marker_flags_red";};
Player addItemToUniform "FirstAidKit";
Player addHeadgear "ACM_HelmetACH_Anthraxic_Headset";

comment "Add items";
Player linkItem "ItemMap";
Player linkItem "ItemCompass";
Player linkItem "ItemWatch";
Player linkItem "CUP_NVG_PVS15_black";
