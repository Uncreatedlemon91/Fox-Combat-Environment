_whitelist = player getVariable "Roles"; 

if ("MEDIC" in _whitelist) then {
	// Medics loadout
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
	player addWeapon "ACM_RDI_76M";

	comment "Add containers";
	player forceAddUniform _uniform;
	player addVest _vest;
	player addBackpack "CUP_B_PMC_Backpack_Medic";

	comment "Add items to containers";
	for "_i" from 1 to 2 do {player addItemToUniform "ACE_CableTie";};
	player addItemToUniform "ACRE_PRC343";
	player addItemToUniform "ACE_EarPlugs";
	player addItemToUniform "ACE_Flashlight_XL50";
	player addItemToUniform "ACE_MapTools";
	for "_i" from 1 to 2 do {player addItemToUniform "ace_marker_flags_red";};
	player addHeadgear _helmet;

	comment "Add items";
	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player linkItem "CUP_NVG_PVS15_Hide";

	[ace_arsenal, player, false] call ace_arsenal_fnc_openBox;
	closeDialog 2;

	player setVariable ["Role", "Medic"];
} else {
	systemChat "You are not qualified for this role! Contact S4 for qual training!";
};