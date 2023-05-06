_helmet = selectRandom ["ACM_HelmetACH_Anthraxic", "ACM_HelmetACH_Anthraxic_GCovered", "ACM_HelmetACH_Anthraxic_ESS"];
_uniform = selectRandom ["ACM_NAG_MCCUU", "ACM_NAG_MCCUU", "ACM_NAG_MCCUU_roll_2", "ACM_NAG_MCCUU_roll_2_gloves", "ACM_NAG_MCCUU_roll_gloves"];
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

comment "Add containers";
player forceAddUniform _uniform;
player addVest _vest;
player addBackpack "ACM_Bag_B_Patrol_bag_Multac_Shovel";

comment "Add items to containers";
player addItemToUniform "ACRE_PRC343";
for "_i" from 1 to 2 do {player addItemToUniform "ACE_CableTie";};
player addItemToUniform "ACE_EarPlugs";
player addItemToUniform "ACE_Flashlight_XL50";
player addItemToUniform "ACE_MapTools";
player addItemToUniform "ACE_EntrenchingTool";

player addItemToBackpack "ACE_wirecutter";
player addItemToBackpack "ToolKit";
player addItemToBackpack "ACE_rope6";
for "_i" from 1 to 20 do {player addItemToBackpack "ace_marker_flags_red";};
player addItemToBackpack "ACE_Clacker";
player addItemToBackpack "ACE_EntrenchingTool";
player addItemToBackpack "ACE_DefusalKit";
player addHeadgear _helmet;

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "CUP_NVG_PVS15_Hide";


[ace_arsenal, player, false] call ace_arsenal_fnc_openBox;
closeDialog 2;