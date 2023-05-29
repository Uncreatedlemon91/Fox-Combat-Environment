_whitelist = player getVariable "Roles"; 

if ("JPilot" in _whitelist) then {
	_helmet = selectRandom ["FIR_ScorpionHMCS"];
	_uniform = selectRandom ["FIR_Fighter_Pilot_Uniform_Flight"];
	_vest = selectRandom ["FIR_pilot_vest"];

	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	comment "Add containers";
	player forceAddUniform "FIR_Fighter_Pilot_Uniform_Flight";
	player addVest "FIR_pilot_vest";
	player addBackpack "CUP_O_RUS_Patrol_bag_Green";

	comment "Add binoculars";
	player addWeapon "Rangefinder";

	comment "Add items to containers";
	player addItemToUniform "NVGogglesB_blk_F";
	player addItemToVest "ACE_Flashlight_XL50";
	player addItemToVest "ACE_MapTools";
	player addItemToVest "ACE_EarPlugs";
	player addItemToVest "ACRE_PRC148_ID_1";
	for "_i" from 1 to 5 do {player addItemToVest "ACE_elasticBandage";};
	for "_i" from 1 to 5 do {player addItemToVest "ACE_packingBandage";};
	for "_i" from 1 to 5 do {player addItemToVest "ACE_quikclot";};
	player addItemToVest "CUP_hgun_Duty";
	player addItemToBackpack "ACE_EarPlugs";
	for "_i" from 1 to 2 do {player addItemToBackpack "ACE_IR_Strobe_Item";};
	for "_i" from 1 to 5 do {player addItemToBackpack "ACE_epinephrine";};
	for "_i" from 1 to 5 do {player addItemToBackpack "ACE_morphine";};
	for "_i" from 1 to 5 do {player addItemToBackpack "ACE_tourniquet";};
	for "_i" from 1 to 5 do {player addItemToBackpack "ACE_splint";};
	player addItemToBackpack "ACRE_PRC117F_ID_1";
	for "_i" from 1 to 5 do {player addItemToBackpack "16Rnd_9x21_Mag";};
	for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShellBlue";};
	for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShellGreen";};
	for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShellPurple";};
	for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShellRed";};
	for "_i" from 1 to 2 do {player addItemToBackpack "ACE_Chemlight_HiBlue";};
	for "_i" from 1 to 2 do {player addItemToBackpack "ACE_Chemlight_HiGreen";};
	for "_i" from 1 to 2 do {player addItemToBackpack "ACE_HandFlare_Green";};
	for "_i" from 1 to 2 do {player addItemToBackpack "ACE_HandFlare_Red";};
	player addHeadgear _helmet;

	comment "Add items";
	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player linkItem "ItemRadioAcreFlagged";
	player linkItem "FIR_PDU";

	[ace_arsenal, player, false] call ace_arsenal_fnc_openBox;
	closeDialog 2;

	player setVariable ["Role", "Pilot"];
} else {
	systemChat "You are not qualified for this role! Contact S4 for qual training!";
};