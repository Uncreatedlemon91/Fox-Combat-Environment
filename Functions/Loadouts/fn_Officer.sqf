// _checkLoadout = [clientOwner, getPlayerUID player] remoteExec ["fce_fnc_CheckRoles", 2];
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
Player addWeapon "ACM_RDI_76M";
Player addPrimaryWeaponItem "CUP_acc_LLM_od";
Player addPrimaryWeaponItem "CUP_optic_MicroT1_low_OD";
Player addPrimaryWeaponItem "CUP_30Rnd_762x51_FNFAL_M";
Player addWeapon "CUP_hgun_M17_Black";
Player addHandgunItem "CUP_21Rnd_9x19_M17_Black";

comment "Add containers";
Player forceAddUniform "ACM_NAG_MCCUU_gloves";
Player addVest "ACM_NAG_CPC_Light";

comment "Add binoculars";
Player addWeapon "Binocular";

comment "Add items to containers";
Player addItemToUniform "ACRE_PRC148";
Player addItemToUniform "ACRE_PRC343";
Player addItemToUniform "ACE_EarPlugs";
Player addItemToUniform "ACE_microDAGR";
Player addItemToUniform "ACE_Flashlight_XL50";
Player addItemToUniform "ACE_MapTools";
Player addHeadgear "acm_beret_nagansk";

comment "Add items";
Player linkItem "ItemMap";
Player linkItem "ItemCompass";
Player linkItem "ItemWatch";
Player linkItem "CUP_NVG_PVS15_black";