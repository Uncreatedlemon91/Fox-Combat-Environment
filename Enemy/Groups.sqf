params ["_faction"]; 
_Regdb = ["new", format ["Regiments in %1 on %2", missionName, worldName]] call oo_inidbi;

_db = ["new", format ["Groups in %1 on %2", missionName, worldName]] call oo_inidbi;
_exists = "exists" call _db;

if (_exists) then {
	_sections = "getSections" call _RegDb;
	{
		// Gather information from Regiment Database.
		_regiment = ["read", [_x, "Name"]] call _RegDb;
		_type = ["read", [_x, "Type"]] call _RegDb;
		_size = ["read", [_x, "Size"]] call _RegDb;
		_rank = ["read", [_x, "Rank"]] call _RegDb;
		_pos = ["read", [_x, "Position"]] call _RegDb;

		for "_i" from 0 to _size do {
			// Create trigger to spawn AI.
			_trgPos = [_pos, 0, 500, 5, 0, 20, 0, ["BASE"]] call BIS_fnc_findSafePos;
			_trg = createTrigger ["EmptyDetector", _trgPos, true];
			_trg setTriggerArea [800, 800, 0, false];
			_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
			_trg setVariable ["RegimentData", [_regiment, _rank, _trgPos]];
			_trg setTriggerStatements ["this", "_data = thisTrigger getVariable 'RegimentData'; [_data] execVM 'Enemy\SpawnEnemy.sqf'", ""];

			// Create a marker for Group 
			switch (_type) do {
				case "Infantry": {_mkrType = "O_INF";};
				case "Mechanized": {_mkrType = "O_MECH_INF" };
				case "Motorized": {_mkrType = "O_MOT_INF" };
				case "Special Operations": {_mkrType = "O_RECON" };
			};
			_mkr = createMarker [format ["%1 - %2", _regimentName, _trgPos]]; 
			_mkr setMarkerType _mkrType; 
			_mkr setMarkerSize [0.4, 0.4];

			// Find group class to pass onto spawngroup script. 
			_classData = "true" configClasses (configFile >> "CfgGroups" >> east >> _faction >> _type);
			_class = selectRandom _classData;

			// Save to the Group Database.
			["write", [_regiment, "GroupID", random 500]] call _db;
			["write", [_regiment, "Position", _pos]] call _db;
			["write", [_regiment, "Rank", _rank]] call _db;
			["write", [_regiment, "GroupClass", _class]] call _db;
		};
	} forEach _sections;

} else {

};

