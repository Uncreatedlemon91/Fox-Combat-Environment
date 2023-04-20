// Rifleman loadout
_helmet = selectRandom ["ACM_HelmetACH_Anthraxic", "ACM_HelmetACH_Anthraxic_GCovered", "ACM_HelmetACH_Anthraxic_ESS"];
_uniform = selectRandom ["ACM_NAG_MCCUU", "ACM_NAG_MCCUU", "ACM_NAG_MCCUU_roll_2", "ACM_NAG_MCCUU_roll_2_gloves", "ACM_NAG_MCCUU_roll_2_pads",
	"ACM_NAG_MCCUU_roll_2_pads_gloves", "ACM_NAG_MCCUU_pads", "ACM_NAG_MCCUU_pads_gloves", "ACM_NAG_MCCUU_pads_roll", "ACM_NAG_MCCUU_roll_gloves", 
	"ACM_NAG_MCCUU_roll_pads", "ACM_NAG_MCCUU_roll_pads_gloves"];
_vest = selectRandom ["ACM_Vest_Nagansk_6B45_Sh117", "ACM_Vest_Nagansk_6B45_Sh117_Var2", "ACM_Vest_Nagansk_6B45_Sh117_Var3", "ACM_Vest_Nagansk_6B45_Sh117_Var4",
	"ACM_Vest_Nagansk_6B45_Sh117_Var5"];

comment "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add weapons";
player addWeapon "ACM_RDI_76_TopRail";
player addPrimaryWeaponItem "CUP_optic_Aimpoint_5000";
player addWeapon "CUP_launch_APILAS";

comment "Add containers";
player forceAddUniform _uniform;
player addVest _vest;
player addBackpack "ACM_Bag_B_Patrol_bag_Multac";

comment "Add items to containers";
player addItemToUniform "ACRE_PRC343";
player addItemToUniform "ACE_EarPlugs";
player addItemToUniform "ACE_Flashlight_XL50";
player addItemToUniform "ACE_MapTools";
for "_i" from 1 to 2 do {player addItemToUniform "ACE_CableTie";};
player addHeadgear _helmet;

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "CUP_NVG_PVS15_Hide";

call fce_fnc_openArsenal;