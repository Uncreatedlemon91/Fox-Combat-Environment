_whitelist = player getVariable "Roles"; 

if ("Scout" in _whitelist) then {
	// Scout loadout
	_helmet = selectRandom ["ACM_H_Nagansk_Boonie"];
	_uniform = selectRandom ["ACM_NAG_GORKA_Base"];
	_vest = selectRandom ["ACM_Vest_Nagansk_6B45_Sh117", "ACM_Vest_Nagansk_6B45_Sh117_Var2", "ACM_Vest_Nagansk_6B45_Sh117_Var3", "ACM_Vest_Nagansk_6B45_Sh117_Var4", "ACM_Vest_Nagansk_6B45_Sh117_Var5"];


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
	player addWeapon "ACM_RDI_76M";
	player addPrimaryWeaponItem "ace_acc_pointer_green";
	player addPrimaryWeaponItem "cup_muzzle_snds_kzrzp_ak545";

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
	player addItemToUniform "ACE_EntrenchingTool";

	player addItemToVest "ACE_Vector";
	player addHeadgear _helmet;

	comment "Add items";
	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player linkItem "CUP_NVG_PVS15_Hide";

	[ace_arsenal, player, false] call ace_arsenal_fnc_openBox;
	closeDialog 2;

	player setVariable ["Role", "Sct"];
} else {
	systemChat "You are not qualified for this role! Contact S4 for qual training!";
};