// Loads all fobs onto the map 
_db = ["new", format ["FOBs %1 %2", missionName, worldName]] call oo_inidbi;

// Get each section and deploy it to the world map 
_sections = "getSections" call _db;
{
	// Get data from database 
	_name = ["read", [_x, "Name"]] call _db;
	_id = ["read", [_x, "ID"]] call _db;
	_pos = ["read", [_x, "Position"]] call _db;
	_supply = ["read", [_x, "Supply"]] call _db;

	// Apply data from database to game world 
	_fobArea = "PARACHUTE_TARGET" createVehicle _pos;

	// Add a marker to the area 
	_mkr = createMarkerLocal [format ["%1 %2", _name, _id], _pos];
	_mkr setMarkerTypeLocal "n_hq";
	_mkr setMarkerText format ["FOB %1", _name];

	// Add a respawn point to the map
	[west, _pos, _name] call BIS_fnc_addRespawnPosition;

	// Assign name and variables to the helipad
	_nameID = format ["%1 %2", _name, _id];
	_fobArea setVariable ["fox_fob_name", _name, true];
	_fobArea setVariable ["fox_fob_id", _id, true];
	_fobArea setVariable ["fox_fob_supply", _supply, true];
	_fobArea setVariable ["fox_fob_mkr", _mkr, true];

	// Add disable fob action to area 
	[_fobArea, true] remoteExec ["fce_fnc_addFobAreaActions", 0, true];
} forEach _sections;