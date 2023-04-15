/* 
Virtualize Groups for each regiment
*/ 
params ["_data"];
_db = ["new", format ["Groups - %1 %2", missionName, worldName]] call oo_inidbi;
_exists = "exists" call _db;

if !(_exists) then {
	_regimentName = _data select 0;
	_regimentSize = _data select 1;
	_regimentType = _data select 2;
	_regimentRank = _data select 3;
	_regimentRadius = _data select 4;
	_regimentSupply = _data select 5;
	_regimentPosition = _data select 6;
	_regimentFaction = _data select 7;

	// Define Group variables 
	for "_i" from 1 to _regimentSize do {
		_grpPos = [_regimentPosition, 0, _regimentRadius, 8, 0, 30, 0, ["BASE"]] call BIS_fnc_findSafePos;
		_grpID = format ["%1 - %3 - %2", _regimentName, _regimentType, random 1000];
		_active = false;

		// Create group marker 
		_mkr = createMarker [_grpID, _grpPos];
		_mkr setMarkerType "hd_dot";
		_mkr setMarkerColor "ColorBlue";
		_mkr setMarkerAlpha 1;

		// Save Group to database of Regiment 
		
		["write", [_grpID, "Regiment", _regimentName]] call _db;
		["write", [_grpID, "Position", _grpPos]] call _db;
		["write", [_grpID, "Active", _active]] call _db;
		["write", [_grpID, "Rank", _regimentRank]] call _db;
		["write", [_grpID, "Faction", _regimentFaction]] call _db;

		if (_regimentType == "O_INF") then {
			_type = selectRandomWeighted ["Infantry", 0.7, "Armored", 0.1, "Mechanized", 0.2, "Motorized", 0.4, "SpecOps", 0.3];
			_grpCfg = "true" configClasses (configFile >> "CfgGroups" >> "EAST" >> _regimentFaction >> _type);
			_grpConfig = configName (selectRandom _grpCfg);
			["write", [_grpID, "Type", _type]] call _db;
			["write", [_grpID, "Config", _grpConfig]] call _db;
		};

		if (_regimentType == "O_RECON") then {
			_type = selectRandomWeighted ["Infantry", 0.4, "Armored", 0.1, "Mechanized", 0.1, "Motorized", 0.3, "SpecOps", 0.7];
			_grpCfg = "true" configClasses (configFile >> "CfgGroups" >> "EAST" >> _regimentFaction >> _type);
			_grpConfig = configName (selectRandom _grpCfg);
			["write", [_grpID, "Type", _type]] call _db;
			["write", [_grpID, "Config", _grpConfig]] call _db;
		};

		if (_regimentType == "O_MECH_INF") then {
			_type = selectRandomWeighted ["Infantry", 0.5, "Armored", 0.2, "Mechanized", 0.7, "Motorized", 0.4, "SpecOps", 0.3];
			_grpCfg = "true" configClasses (configFile >> "CfgGroups" >> "East" >> _regimentFaction >> _type);
			_grpConfig = configName (selectRandom _grpCfg);
			["write", [_grpID, "Type", _type]] call _db;
			["write", [_grpID, "Config", _grpConfig]] call _db;
		};

		if (_regimentType == "O_MOTOR_INF") then {
			_type = selectRandomWeighted ["Infantry", 0.3, "Armored", 0.1, "Mechanized", 0.2, "Motorized", 0.8, "SpecOps", 0.3];
			_grpCfg = "true" configClasses (configFile >> "CfgGroups" >> "EAST" >> _regimentFaction >> _type);
			_grpConfig = configName (selectRandom _grpCfg);
			["write", [_grpID, "Type", _type]] call _db;
			["write", [_grpID, "Config", _grpConfig]] call _db;
		};
		// Create group trigger 
		_trg = createTrigger ["EmptyDetector", _grpPos, true];
		_trg setVariable ["grpData", _grpID];
		_trg setTriggerArea [700, 700, 0, false];
		_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
		_trg setTriggerStatements ["this", "_data = thisTrigger getVariable 'grpData'; [_data] call fce_fnc_spawnGrp", ""];
	};
} else {
	_sections = "getSections" call _db;
	{
		_reg = ["read", [_x, "Regiment"]] call _db;	
		_loc = ["read", [_x, "Position"]] call _db;	
		_active = ["read", [_x, "Active"]] call _db;	
		_rank = ["read", [_x, "Rank"]] call _db;	
		_type = ["read", [_x, "Type"]] call _db;	
		_cfg = ["read", [_x, "Config"]] call _db;	

		// Create group trigger 
		_trg = createTrigger ["EmptyDetector", _loc, true];
		_trg setVariable ["grpData", _x];
		_trg setTriggerArea [700, 700, 0, false];
		_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
		_trg setTriggerStatements ["this", "_data = thisTrigger getVariable 'grpData'; [_data] call fce_fnc_spawnGrp", ""];

	} forEach _sections;
};