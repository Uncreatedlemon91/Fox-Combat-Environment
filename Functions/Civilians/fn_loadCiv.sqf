// Loads civilians from the database 
_db = ["new", format ["Civilian Database %1 %2", missionName, worldName]] call oo_inidbi;
_sections = "getSections" call _db;

{
	// Get data 
	_city = ["read", [_x, "Home Town"]] call _db;
	_civName = ["read", [_x, "Name"]] call _db;
	_pos = ["read", [_x, "Position"]] call _db;

	// Create Trigger from civilian position location
	_trg = createTrigger ["EmptyDetector", _pos, true];

	// Set Trigger variables 
	_trg setVariable ["fox_civ_data", format ["%1 - %2", _city, _civName], true];

	// Configure Trigger
	_trg setTriggerArea [200, 200, 0, false, 100];
	_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	_trg setTriggerStatements [
		"this",
		"_civ = thisTrigger getVariable ""fox_civ_data""; [_civ] remoteExec [""fce_fnc_spawnCiv"", 2];",
		""
	];

	// For debug only 
	_mkr = createMarkerLocal [format ["%1 %2", _city, _civName], _pos];
	_mkr setMarkerTypelocal "hd_dot";
	_mkr setMarkerSizeLocal [0.3, 0.3];
	_mkr setMarkerColorLocal "ColorYellow";
	sleep 0.5;
} forEach _sections;