
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
Player addWeapon "ACM_RDI_76_Railed";
Player addPrimaryWeaponItem "CUP_30Rnd_762x51_FNFAL_M";

comment "Add containers";
Player forceAddUniform "ACM_NAG_MCCUU_roll_pads_gloves";
Player addVest "ACM_Nag_CARRIER_LIGHT";
Player addBackpack "ACM_B_Anthraxic_Radio";

comment "Add items to containers";
Player addItemToUniform "FirstAidKit";
Player addItemToUniform "CUP_30Rnd_762x51_FNFAL_M";
Player addHeadgear "ACM_HelmetACH_Anthraxic_GCovered_Headset";

comment "Add items";
Player linkItem "ItemMap";
Player linkItem "ItemCompass";
Player linkItem "ItemWatch";
Player linkItem "CUP_NVG_PVS15_black";