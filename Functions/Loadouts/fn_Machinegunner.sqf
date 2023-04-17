
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
Player addWeapon "CUP_lmg_Pecheneg_top_rail_B50_vfg";
Player addPrimaryWeaponItem "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M";
Player addWeapon "CUP_hgun_M17_Black";
Player addHandgunItem "CUP_21Rnd_9x19_M17_Black";

comment "Add containers";
Player forceAddUniform "ACM_NAG_MCCUU_roll_2_pads_gloves";
Player addVest "ACM_Nag_CARRIER_LIGHT";
Player addBackpack "ACM_Bag_Nag_AR";

comment "Add items to containers";
Player addItemToUniform "ACE_EarPlugs";
Player addItemToUniform "ACRE_PRC343";
Player addItemToUniform "FirstAidKit";
Player addItemToVest "ACE_SpareBarrel_Item";
for "_i" from 1 to 2 do {Player addItemToVest "ACE_WaterBottle";};
Player addHeadgear "ACM_HelmetACH_Anthraxic_GCovered_Headset";

comment "Add items";
Player linkItem "ItemMap";
Player linkItem "ItemCompass";
Player linkItem "ItemWatch";
Player linkItem "CUP_NVG_PVS15_black";
