params ["_loc", "_locMkr", "_regimentSide"];
_db = ["new", format ["%1 Regiments - %2 %3", _regimentSide, missionName, worldName]] call oo_inidbi;
_opfordb = ["new", format ["OPFOR Compositions %1 %2", missionName, worldName]] call oo_inidbi;

// Create Regiment Identity
_regimentNumber = round (random 300);
_regimentNumber = [_regimentNumber, "english"] call BIS_fnc_ordinalNumber;
_regimentType = selectRandom ["Infantry", "Mechanized", "Motorized", "Special Operations", "Armored"];
_regimentName = format ["%1 %2 Regiment", _regimentNumber, _regimentType];
_regimentMarker = "";
_regimentSpeed = 5;
_regimentSkill = selectRandom ["Private", "Corporal", "Sergeant", "Captain"];
_values = [];
switch (_regimentType) do {
	case "Infantry": {_regimentMarker = format ["%1_Inf", _regimentSide]; _regimentSpeed = 6; _values = [0.8, 0.2, 0.2, 0.2, 0.2]};
	case "Mechanized": {_regimentMarker = format ["%1_mech_inf", _regimentSide]; _regimentSpeed = 10; _values = [0.8, 0.5, 0.3, 0.2, 0.2]};
	case "Motorized": {_regimentMarker = format ["%1_Motor_inf", _regimentSide]; _regimentSpeed = 15; _values = [0.8, 0.1, 0.5, 0.2, 0.2]};
	case "Special Operations": {_regimentMarker = format ["%1_Recon", _regimentSide]; _regimentSpeed = 8; _values = [0.8, 0.1, 0.1, 0.5, 0.1]};
	case "Armored": {_regimentMarker = format ["%1_Armor", _regimentSide]; _regimentSpeed = 6; _values = [0.8, 0.2, 0.2, 0.2, 0.5]};
};
_regimentSize = round (random [10, 15, 20]);
_HqPos = [[_locMkr], ["base", "water"]] call BIS_fnc_randomPos;
_noPos = _hqPos inArea "NoLocation";
if (_noPos) then {
	_HqPos = [["AO"], ["base", "water"]] call BIS_fnc_randomPos;
};

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
_trg setTriggerArea [1500, 1500, 0, false, 100];
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trg setTriggerStatements ["this", "[thisTrigger] remoteExec ['fce_fnc_SpawnAI', 2]", ""];

// Grab unit classnames 
_inf = ["read", ["opfInf", "Classnames"]] call _opfordb;
_mech = ["read", ["opfAPCs", "Classnames"]] call _opfordb;
_mot = ["read", ["opfCars", "Classnames"]] call _opfordb;
_recon = ["read", ["opfRecon", "Classnames"]] call _opfordb;
_armor = ["read", ["opfArmor", "Classnames"]] call _opfordb;

// Create Groups for the regiment 
for "_i" from 1 to _regimentSize do {
	_groupType = selectRandomWeighted ["Infantry", _values select 0, "Mechanized", _values select 1, "Motorized", _values select 2, "Special Operations", _values select 3, "Armored", _values select 4];
	_pltType = "";
	_pltSize = 4;
	switch (_groupType) do {
		case "Infantry": {_pltType = _inf; _pltSize = round (random [15, 20, 25]);};
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
