/* 
Virtualize Groups for each regiment
*/ 
params ["_data"];
_regimentName = _data select 0;
_regimentSize = _data select 1;
_regimentType = _data select 2;
_regimentRank = _data select 3;
_regimentRadius = _data select 4;
_regimentSupply = _data select 5;
_regimentPosition = _data select 6;
_regimentFaction = _data select 7;


// Define Group variables 
switch (_regimentType) do {
	case "O_INF": {_type = selectRandomWeighted ["Infantry", 0.7, "Armored", 0.1, "Mechanized", 0.2, "Motorized", 0.4, "SpecOps", 0.3, "Static", 0.4]};

	case "O_RECON": {_type = selectRandomWeighted ["Infantry", 0.4, "Armored", 0.1, "Mechanized", 0.1, "Motorized", 0.3, "SpecOps", 0.7, "Static", 0.2]};

	case "O_MECH_INF": {_type = selectRandomWeighted ["Infantry", 0.5, "Armored", 0.2, "Mechanized", 0.7, "Motorized", 0.4, "SpecOps", 0.3, "Static", 0.1]};

	case "O_MOT_INF": {_type = selectRandomWeighted ["Infantry", 0.3, "Armored", 0.1, "Mechanized", 0.2, "Motorized", 0.8, "SpecOps", 0.3, "Static", 0.4]}
};

_grpCfg = "true" configClasses (configFile >> "CfgGroups" >> "EAST" >> _regimentFaction >> _type);
_grpConfig = selectRandom _grpCfg;
_grpPos = [_regimentPosition, 0, _regimentRadius, 10, 0, 30, 0, ["BASE"]] call BIS_fnc_findSafePos;
_grpID = format ["%1 - %3 - %2", _regimentName, _type, random 1000];
_active = false;

// Create group marker 
_mkr = createMarker [_grpID, _grpPos];
_mkr setMarkerType "hd_dot";
_mkr setMarkerColor "ColorBlue";

// Save Group to database of Regiment 
_grpData = [_grpID, _regimentName,  _grpPos, _type, _grpConfig, _active];
_db = ["new", _regimentName] call oo_inidbi;
["write", [_regimentName, _grpID, _grpData]] call _db;

// Create group trigger 
_trg = createTrigger ["EmptyDetector", _grpPos, true];
_trg setVariable ["grp", _grpID];
_trg setTriggerArea [800, 800, 0, false];
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trg setTriggerStatements ["this", "_grp = thisTrigger getVariable 'grp'; [_grp] call fce_fnc_spawnGrp", ""];