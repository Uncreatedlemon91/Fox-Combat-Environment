
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
Player addWeapon "ACM_TL_RDI_Xahartco";
Player addPrimaryWeaponItem "CUP_acc_LLM_od";
Player addPrimaryWeaponItem "optic_MRCO";
Player addPrimaryWeaponItem "CUP_30Rnd_762x51_FNFAL_M";

comment "Add containers";
Player forceAddUniform "ACM_NAG_MCCUU_roll_pads";
Player addVest "ACM_NAG_CARRIER_VEST_HEAVY";

comment "Add items to containers";
Player addItemToUniform "FirstAidKit";
Player addItemToUniform "CUP_30Rnd_762x51_FNFAL_M";
Player addHeadgear "ACM_HelmetACH_Anthraxic_ESS";

comment "Add items";
Player linkItem "ItemMap";
Player linkItem "ItemCompass";
Player linkItem "ItemWatch";
Player linkItem "CUP_NVG_PVS15_black";
