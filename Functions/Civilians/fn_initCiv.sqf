// Find all locations that are predetermined by the Server Init file. 
// These will be used to build AI population centers. 
_base = getMarkerPos "BASE";
_locs = nearestLocations [_base, ["Name", "NameCity", "NameLocal", "NameVillage"], worldSize * 4];

// Initialize the database for civilian locations 
_db = ["new", [format ["Civilian Module - %1 %2", missionName, worldName]]] call oo_inidbi;
_exists = "Exists" call _db;

if (_exists) then {
	// Load the database 
} else {
	// Create a database
	{
		// Get the name of the location 
		_name = str _x;

		// Get the position of the 'location'
		_pos = getPos _x;

		// Count the amount of houses that can be used as Civilian Spawn points 
		_homes = nearestObjects [_pos, ["house"], 400];
		_countHomes = count _homes;

		// Set initial population count by dividing the amount of houses by 3
		_popCount = round (_homes / 3);

		// Set population loyalty, a random number between 1 and 100
		_popLoyalty = round (random 100);

		// Set initial vehicle count, based on population count...divide it by 3
		_vehCount = round (_popCount / 3);

		// Compile data to send to inidbi 
		_data = [_name, _pos, _homes, _popCount, _popLoyalty, _vehCount];
		["write", [_name, "Civ Data", _data]] call _db;
	} forEach _locs;
};

// Setup civilians for each town 
[] remoteExec ["fce_fnc_CivPopulate", 2];

