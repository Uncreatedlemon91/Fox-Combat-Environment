
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
Player addWeapon "ACM_RDI_76_Railed_GL";
Player addPrimaryWeaponItem "CUP_acc_LLM_od";
Player addPrimaryWeaponItem "CUP_optic_Aimpoint_5000";
Player addPrimaryWeaponItem "CUP_30Rnd_762x51_FNFAL_M";

comment "Add containers";
Player forceAddUniform "ACM_NAG_MCCUU_gloves";
Player addVest "ACM_NAG_CARRIER_VEST_HEAVY";

comment "Add items to containers";
Player addItemToUniform "ACRE_PRC343";
Player addItemToUniform "ACE_EarPlugs";
Player addItemToUniform "FirstAidKit";
Player addHeadgear "ACM_HelmetACH_Anthraxic_Headset";

comment "Add items";
Player linkItem "ItemMap";
Player linkItem "ItemCompass";
Player linkItem "ItemWatch";
Player linkItem "CUP_NVG_PVS15_black";