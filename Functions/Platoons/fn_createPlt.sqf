// Creates a platoon to be used for %1OR or BLUFOR forces. 
params ["_pltSide", "_spawnmkr"];

// Platoon variables 
_pltDb = "";
_pltSelect = "";
switch (_pltSide) do {
	case "O": {
		_pltSelect = selectRandomWeighted [
			["Infantry", round (random [12, 18, 24]), fox_opf_Infantry, "o_inf", 0.4], 0.7,
			["Mechanized", selectRandom [1, 2, 3, 4], fox_opf_Mech, "o_mech_inf", 0.6], 0.3,
			["Armored", selectRandom [1, 2, 3, 4], fox_opf_Armored, "o_armor", 0.5], 0.2,
			["Recon", round (random [8, 10, 12]), fox_opf_Recon, "o_recon", 0.3], 0.3
		];
		_pltDb = ["new", format ["OPFOR Platoons %1 %2", missionName, worldName]] call oo_inidbi
	};
	case "B": {
		_pltSelect = selectRandomWeighted [
			["Infantry", round (random [12, 18, 24]), fox_blu_Infantry, "b_inf", 0.4], 0.7,
			["Mechanized", round (random [1, 2, 4]), fox_blu_Mech, "b_mech_inf", 0.6], 0.3,
			["Armored", round (random [1, 2, 5]), fox_blu_Armored, "b_armor", 0.5], 0.2, 
			["Recon", round (random [8, 10, 12]), fox_blu_Recon, "b_recon", 0.3], 0.3
		]; 
		_pltDb = ["new", format ["BLUFOR Platoons %1 %2", missionName, worldName]] call oo_inidbi;
	};
};

// Gather information about the platoon previously selected
_pltType = _pltSelect select 0;
_pltSize = _pltSelect select 1;
_pltComp = _pltSelect select 2;
_pltMkr = _pltSelect select 3;
_pltSpeed = _pltSelect select 4;
_active = false;

// Assign units to the platoon comp 
_composition = [];
for "_i" from 1 to _pltSize do {
	_unit = selectRandom _pltComp;
	_composition pushback _unit;
};

// Create the marker for non-instanced AI 
_pltStart = [[_spawnmkr], ["BASE"]] call BIS_fnc_randomPos;
_mkr = createMarkerLocal [format ["%1 - %2", _pltType, _pltStart], _pltStart];
_mkr setMarkerTypeLocal _pltMkr;
_mkr setMarkerSizeLocal [0.8, 0.8];
_mkr setMarkerAlphaLocal 0;
_mkr setMarkerTextLocal format ["%1 | %2", _pltType, _pltSize];

// Save to platoon database 
_id = format ["%1 %2", _pltType, random 10000];
["write", [_id, "Type", _pltType]] call _pltDb;
["write", [_id, "Pos", _pltStart]] call _pltdb;
["write", [_id, "Size", _pltSize]] call _pltdb;
["write", [_id, "Composition", _composition]] call _pltdb;
["write", [_id, "Marker", _pltMkr]] call _pltdb;
["write", [_id, "Speed", _pltSpeed]] call _pltdb;

// Create Trigger 
_trg = createTrigger ["EmptyDetector", _pltStart, true];
_trg setTriggerArea [900, 900, 0, false, 100];
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trg setTriggerStatements [
	"this", 
	"[thisTrigger] remoteExec [""fce_fnc_spawnAi"", 2]",
	""
];
_trg setVariable ["unitID", _id, true];
_trg setVariable ["unitMkr", _mkr, true];
_trg setVariable ["unitType", _pltType, true];
_trg setVariable ["unitActive", _active, true];
_trg setVariable ["unitSide", _pltSide, true];
_trg setVariable ["unitSpeed", _pltSpeed, true];

// End function - Inform admin / local server
// systemChat format ["[PLT - %2] Platoon %1 Created!", _pltType, _pltSide];

// send Platoon to objective area 
[_trg] remoteExec ["fce_fnc_movePlatoon", 2];
