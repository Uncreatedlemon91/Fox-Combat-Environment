// Fireteamleader loadout
_helmet = ["ACM_HelmetACH_Anthraxic_GCovered_Headset", "ACM_HelmetACH_Anthraxic_ESS_Goggles_Headset", "ACM_HelmetACH_Anthraxic_Headset"];
_uniform = selectRandom ["ACM_NAG_MCCUU", "ACM_NAG_MCCUU", "ACM_NAG_MCCUU_roll_2", "ACM_NAG_MCCUU_roll_2_gloves", "ACM_NAG_MCCUU_roll_2_pads",
	"ACM_NAG_MCCUU_roll_2_pads_gloves", "ACM_NAG_MCCUU_pads", "ACM_NAG_MCCUU_pads_gloves", "ACM_NAG_MCCUU_pads_roll", "ACM_NAG_MCCUU_roll_gloves", 
	"ACM_NAG_MCCUU_roll_pads", "ACM_NAG_MCCUU_roll_pads_gloves"];
_vest = selectRandom ["ACM_Vest_Nagansk_6B45_Sh117_VOG", "ACM_Vest_Nagansk_6B45_Sh117_VOG_Var2", "ACM_Vest_Nagansk_6B45_Sh117_VOG_Var3", 
	"ACM_Vest_Nagansk_6B45_Sh117_VOG_Var4", "ACM_Vest_Nagansk_6B45_Sh117_VOG_Var5"];

removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add weapons";
player addWeapon "ACM_RDI_76_TopRail_GL";
player addPrimaryWeaponItem "optic_mrco";

comment "Add containers";
player forceAddUniform _uniform;
player addVest _vest;
player addBackpack "ACM_Bag_B_Patrol_bag_Multac";

comment "Add items to containers";
player addItemToUniform "ACRE_PRC148";
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
