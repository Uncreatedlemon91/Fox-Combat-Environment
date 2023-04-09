// Regiment module. 
// Allows ai to generate regiments that are setup in the map.

// Check for database.
_db = ["new", format ["Regiments in %1 on %2", missionName, worldName]] call oo_inidbi;
_exists = "exists" call _db;

_mkrAlpha = 0;

if (_exists) then {
	// Database exists, spawn existing regiments from database. 
	[] execVM "Enemy\Groups.sqf";
	

} else {
	// Database does not exist, create new regiments.
	_regimentCount = round (random [75, 100, 125]);

	for "_i" from 0 to _regimentCount do {
		// For each regiment, do this.
		_worldPos = [["AO"], ["BASE"]] call BIS_fnc_randomPos;
		_regimentPos = [_worldPos, 0, 50, 0, 0, 20, 0, ["BASE"]] call BIS_fnc_findSafePos;

		// Regiment Name
		_type = selectRandom ["Infantry", "Mechanized", "Motorized", "SpecOps"];
		_Size = selectRandom ["Platoon", "Regiment", "Battalion"];
		_regimentName = format ["%1 %2 %3", round (random 300), _type, _size];

		// Regiment Values
		switch (_size) do {
			case "Platoon": {_grpCount = round (random [4, 8, 10]); ["write", [_regimentName, "Size", _grpCount]] call _db};
			case "Regiment": {_grpCount = round (random [8, 12, 16]); ["write", [_regimentName, "Size", _grpCount]] call _db};
			case "Battalion": {_grpCount = round (random [12, 16, 20]); ["write", [_regimentName, "Size", _grpCount]] call _db};
			default {_grpCount = round (random [8, 15, 25]); ["write", [_regimentName, "Size", _grpCount]] call _db;};
		};
		_rank = selectRandom ["PRIVATE", "CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL"];

		// Add Marker for Regiment 
		_mkr = createMarker [format ["%1 - %2", _regimentName, _regimentPos], _regimentPos]; 
		_mkr setMarkerType "O_HQ"; 
		_mkr setMarkerSize [1, 1];
		_mkr setMarkerAlpha _mkrAlpha;
		_mkr setMarkerText _regimentName;
				
		// Save Regiment to database.
		["write", [_regimentName, "Name", _regimentName]] call _db;
		["write", [_regimentName, "Type", _type]] call _db;
		["write", [_regimentName, "Rank", _rank]] call _db;
		["write", [_regimentName, "Position", _regimentPos]] call _db;
	};

	execVM "Enemy\Groups.sqf";
};