// Starts the civilian module. 
// Populate the map with AI Civilians and give them tasks. 
// Needs a civilian task manager to allow users to see AI move around and complete tasks 
// Incorporated with the Insurgency Module 
_db = ["new", format ["City Profiles %1 %2", missionName, worldName]] call oo_inidbi;
_exists = "exists" call _db;
if !(_exists) then {
	// Get locations to use 
	_locs = nearestLocations [getMarkerPos "Base", [
		"NameCity",
		"NameCityCapital",
		"NameLocal",
		"NameVillage"
	], worldSize];

	{
		// If server owner is local, show map markers for debugging
		_mkr = createMarker [format ["%1 - %2", text _x, getpos _x], getPos _x]; 
		_mkr setMarkerTypelocal "hd_dot";
		_mkr setMarkerColorLocal "COLORBLUE";
		_mkr setMarkerTextLocal text _x;

		// Build city profile 
		[_x] remoteExec ["fce_fnc_setupCity", 2];
		sleep 5;
	} forEach _locs;
} else {
	_sections = "getSections" call _Db;
	{
		_name = ["read", [_x, "City Name"]] call _db;
		_pos = ["read", [_x, "City Position"]] call _db;

		_mkr = createMarker [format ["%1 - %2", _name, _pos], _pos]; 
		_mkr setMarkerTypelocal "hd_dot";
		_mkr setMarkerColorLocal "COLORBLUE";
		_mkr setMarkerTextLocal _name;
	} forEach _sections;
	
	[] remoteExec ["fce_fnc_loadCiv", 2];
	[] remoteExec ["fce_fnc_loadStash", 2];
};