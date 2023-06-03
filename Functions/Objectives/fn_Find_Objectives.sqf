params ["_origin", "_types"];

// Define the database file
_db = ["new", format ["Objectives %1 - %2", missionName, worldName]] call oo_inidbi;
_exists = "Exists" call _db;

// Check if database is already present or not
if (_exists) then {
	// Load the database
	_sections = "getSections" call _db;
	{
		// Restore data from the database 
		_data = ["read", _x, "Data"] call _db;
		
		// Add a trigger to the center of the location 
		_trg = createTrigger ["EmptyDetector", _data select 0, true];
		_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
		_trg setTriggerArea [800, 800, 0, false, 200];
		_trg setVariable ["Data", _data];
		_trg setTriggerStatements ["this", 
			"_data = thisTrigger getVariable 'Data'; systemChat format ['Now entering %1', _data select 1];", 
			"_data = thisTrigger getVariable 'Data'; systemChat format ['Now leaving %1', _data select 1];"
		];

		// Create Debug messages and Markers 
		_mkr = createMarkerLocal [_data select 1, _data select 0];
		_mkr setMarkerTypeLocal "hd_dot";
		_mkr setMarkerColorLocal "ColorYellow";
		_mkr setMarkerAlphaLocal 0.8;
		_mkr setMarkerText _name;

		[format ["%1 location has been Loaded!", _data select 1]] remoteExec ["systemChat", 0, true];

	} forEach _sections;
} else {
	// Create the Database
	// Get Objectives for the map 
	_originPos = getMarkerPos _origin;
	_objectives = nearestLocations [_originPos, _types, worldSize * 3, true];

	{
		// Get information of each location
		_pos = getPos _x;
		_name = name _x;
		_type = type _x;
		_importance = importance _x;
		_data = [_pos, _name, _type, _importance];

		// Add a trigger to the center of the location 
		_trg = createTrigger ["EmptyDetector", _pos, true];
		_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
		_trg setTriggerArea [800, 800, 0, false, 200];
		_trg setVariable ["Data", _data];
		_trg setTriggerStatements ["this", 
			"_data = thisTrigger getVariable 'Data'; systemChat format ['Now entering %1', _data select 1];", 
			"_data = thisTrigger getVariable 'Data'; systemChat format ['Now leaving %1', _data select 1];"
		];

		// Add to Database
		["write", _name, "Saved Data", _data] call _db;

		// Create Debug messages and Markers 
		_mkr = createMarkerLocal [_name, _pos];
		_mkr setMarkerTypeLocal "hd_dot";
		_mkr setMarkerColorLocal "ColorYellow";
		_mkr setMarkerAlphaLocal 0.8;
		_mkr setMarkerText _name;

		[format ["%1 location has been created!", _name]] remoteExec ["systemChat", 0, true];
	} forEach _objectives;
};

