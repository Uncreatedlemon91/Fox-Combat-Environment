// Autorifleman loadout
_helmet = selectRandom ["ACM_HelmetACH_Anthraxic", "ACM_HelmetACH_Anthraxic_GCovered", "ACM_HelmetACH_Anthraxic_ESS"];
_uniform = selectRandom ["ACM_NAG_MCCUU", "ACM_NAG_MCCUU", "ACM_NAG_MCCUU_roll_2", "ACM_NAG_MCCUU_roll_2_gloves", "ACM_NAG_MCCUU_roll_2_pads",
	"ACM_NAG_MCCUU_roll_2_pads_gloves", "ACM_NAG_MCCUU_pads", "ACM_NAG_MCCUU_pads_gloves", "ACM_NAG_MCCUU_pads_roll", "ACM_NAG_MCCUU_roll_gloves", 
	"ACM_NAG_MCCUU_roll_pads", "ACM_NAG_MCCUU_roll_pads_gloves"];
_vest = selectRandom ["ACM_Vest_Nagansk_6B45_Sh117_PKP", "ACM_Vest_Nagansk_6B45_Sh117_PKP_Var2", "ACM_Vest_Nagansk_6B45_Sh117_PKP_Var3",
	"ACM_Vest_Nagansk_6B45_Sh117_PKP_Var3", "ACM_Vest_Nagansk_6B45_Sh117_PKP_Var5"];


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
player addWeapon "CUP_lmg_Pecheneg_top_rail_B50_vfg";
player addWeapon "CUP_hgun_M17_Black";

comment "Add containers";
player forceAddUniform _uniform;
player addVest _vest;
player addBackpack "ACM_Bag_B_Patrol_bag_Multac";

comment "Add items to containers";
player addItemToUniform "ACRE_PRC343";
for "_i" from 1 to 2 do {player addItemToUniform "ACE_CableTie";};
player addItemToUniform "ACE_EarPlugs";
player addItemToUniform "ACE_Flashlight_XL50";
player addItemToUniform "ACE_MapTools";
player addHeadgear _helmet;

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "CUP_NVG_PVS15_Hide";

[ace_arsenal, player, false] call ace_arsenal_fnc_openBox;
closeDialog 2;