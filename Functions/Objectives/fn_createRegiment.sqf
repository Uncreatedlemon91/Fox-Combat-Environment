params ["_loc", "_locMkr", "_regimentSide"];
_db = ["new", format ["%1 Regiments - %2 %3", _regimentSide, missionName, worldName]] call oo_inidbi;

// Create Regiment Identity
_regimentNumber = round (random 300);
_regimentNumber = [_regimentNumber, "english"] call BIS_fnc_ordinalNumber;
_regimentType = selectRandom ["Infantry", "Mechanized", "Motorized", "Special Operations", "Armored"];
_regimentName = format ["%1 %2 Regiment", _regimentNumber, _regimentType];
_regimentMarker = "";
_regimentSpeed = 5;
_regimentSkill = selectRandom ["Private", "Corporal", "Sergeant"];
_values = [];
switch (_regimentType) do {
	case "Infantry": {_regimentMarker = format ["%1_Inf", _regimentSide]; _regimentSpeed = 6; _values = [0.5, 0.2, 0.2, 0.1, 0.1]};
	case "Mechanized": {_regimentMarker = format ["%1_mech_inf", _regimentSide]; _regimentSpeed = 10; _values = [0.3, 0.5, 0.3, 0.1, 0.2]};
	case "Motorized": {_regimentMarker = format ["%1_Motor_inf", _regimentSide]; _regimentSpeed = 15; _values = [0.3, 0.1, 0.5, 0.2, 0.1]};
	case "Special Operations": {_regimentMarker = format ["%1_Recon", _regimentSide]; _regimentSpeed = 8; _values = [0.2, 0.1, 0.1, 0.5, 0.1]};
	case "Armored": {_regimentMarker = format ["%1_Armor", _regimentSide]; _regimentSpeed = 6; _values = [0.2, 0.2, 0.2, 0.2, 0.4]};
};
_regimentSize = round (random [10, 15, 20]);
_HqPos = [[_locMkr], ["base", "water"]] call BIS_fnc_randomPos;

// Save regiment to database 
["write", [_regimentName, "Position", _hqPos]] call _db;
["write", [_regimentName, "Type", _regimentType]] call _db;
["write", [_regimentName, "Marker", _regimentMarker]] call _db;
["write", [_regimentName, "Speed", _regimentSpeed]] call _db;
["write", [_regimentName, "Size", _regimentSize]] call _db;
["write", [_regimentName, "Skill", _regimentSkill]] call _db;
["write", [_regimentName, "Side", _regimentSide]] call _db;

// Add marker to world map 
_mkr = createMarkerLocal [_regimentName, _hqPos];
_mkr setMarkerTextLocal _regimentName;
_mkr setMarkerAlphaLocal 0;
_mkr setMarkerType _regimentMarker;

// Start function to watch for player locality
_trg = createTrigger ["EmptyDetector", _hqPos, true];
_trg setVariable ["Active", false, true];
_trg setVariable ["Regiment", _regimentName];
_trg setVariable ["Side", _regimentSide];
_trg setTriggerArea [700, 700, 0, false, 200];
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trg setTriggerStatements ["this", "[thisTrigger] remoteExec ['fce_fnc_SpawnAI', 2]", ""];

// Define classnames for AI spawning 
_faction = "";
_inf = [];
_mech = [];
_mot = [];
_armor = [];
_recon = [];

switch (_regimentSide) do {
	case "b": {
		_faction = west;
		_inf = [
			"ACM_NAG_Soldier_AR",
			"ACM_NAG_Soldier_CLS",
			"ACM_NAG_Soldier_GL",
			"ACM_NAG_Soldier_MR",
			"ACM_NAG_Soldier_ExplEx",
			"ACM_NAG_Soldier_AA",
			"ACM_NAG_Soldier_AT",
			"ACM_NAG_Soldier_ATA",
			"ACM_NAG_Soldier_Radio",
			"ACM_NAG_Soldier_Repair",
			"ACM_NAG_Soldier",
			"ACM_NAG_Soldier_RifleAT",
			"ACM_NAG_Soldier_RifleLight",
			"ACM_NAG_Soldier_TL"
		];

		_mech = [
			"ACM_B_NAG_BMP2",
			"ACM_B_NAG_BTR80A",
			"ACM_B_NAG_BMP2_ZU"
		];

		_mot = [
			"ACM_B_NAG_Ifrit_HMG",
			"ACM_B_NAG_UAZ_AGS30",
			"ACM_B_NAG_UAZ_MG",
			"ACM_B_NAG_UAZ_SPG"
		];
		
		_armor = [
			"ACM_B_NAG_T72"
		];
		
		_recon = [
			"ACM_NAG_Soldier_SPEC_AR",
			"ACM_NAG_Soldier_SPEC_CLS",
			"ACM_NAG_Soldier_SPEC_GL",
			"ACM_NAG_Soldier_SPEC_MR",
			"ACM_NAG_Soldier_SPEC_ExplEx",
			"ACM_NAG_Soldier_SPEC",
			"ACM_NAG_Soldier_SPEC_AT",
			"ACM_NAG_Soldier_SPEC_RifleAT",
			"ACM_NAG_Soldier_SPEC_TL",
			"ACM_NAG_Soldier_SPEC_RifleLight"
		];
	};
	case "o": {
		_faction = east;
		_inf = [
			"ACM_HDF_Soldier_AA",
			"ACM_HDF_Soldier_AR",
			"ACM_HDF_Soldier_CLS",
			"ACM_HDF_Soldier_GL",
			"ACM_HDF_Soldier_MR",
			"ACM_HDF_Soldier_AT",
			"ACM_HDF_Soldier",
			"ACM_HDF_Soldier_LiteAT",
			"ACM_HDF_Soldier_Light",
			"ACM_HDF_Soldier_Thermals",
			"ACM_HDF_Soldier_TL"
		];

		_mech = [
			"ACM_O_HDF_BMP2",
			"ACM_O_HDF_BMP2_HQ"
		];

		_mot = [
			"ACM_O_HDF_HILUX_DSHKM",
			"ACM_O_HDF_HILUX_IGLA",
			"ACM_O_HDF_HILUX_ARMORED_SPG9",
			"ACM_O_HDF_HILUX_ARMORED_ZU23",
			"ACM_O_HDF_UAZ_MG",
			"ACM_O_HDF_UAZ_SPG9"
		];

		_armor = [
			"ACM_O_HDF_T55",
			"ACM_O_HDF_T34",
			"ACM_O_HDF_T72"
		];

		_recon = [
			"ACM_HDF_Soldier_LI_MG",
			"ACM_HDF_Soldier_LI_CLS",
			"ACM_HDF_Soldier_LI_GL",
			"ACM_HDF_Soldier_LI_MR",
			"ACM_HDF_Soldier_LI_Expl",
			"ACM_HDF_Soldier_LI_MR2",
			"ACM_HDF_Soldier_LI_AA",
			"ACM_HDF_Soldier_LI_AT",
			"ACM_HDF_Soldier_LI_ATA",
			"ACM_HDF_Soldier_LI",
			"ACM_HDF_Soldier_LI_Repair",
			"ACM_HDF_Soldier_LI_LiteAT",
			"ACM_HDF_Soldier_LI_RifleLite"
		];
	};
};

// Create Groups for the regiment 
for "_i" from 1 to _regimentSize do {
	_groupType = selectRandomWeighted ["Infantry", _values select 0, "Mechanized", _values select 1, "Motorized", _values select 2, "Special Operations", _values select 3, "Armored", _values select 4];
	_pltType = "";
	_pltSize = 4;
	switch (_groupType) do {
		case "Infantry": {_pltType = _inf; _pltSize = round (random [10, 14, 18]);};
		case "Mechanized": {_pltType = _mech; _pltSize = 1;};
		case "Motorized": {_pltType = _mot; _pltSize = 1;};
		case "Special Operations": {_pltType = _recon; _pltSize = round (random [6, 8, 10]);};
		case "Armored": {_pltType = _armor; _pltSize = 1;};
	};
	
	_pltComp = [];
	for "_i" from 1 to _pltSize do {
		_unit = selectRandom _pltType;
		_pltComp pushback _unit;
	};
	["write", [_regimentName, format ["Group %1", _i], _pltComp]] call _db;
};
