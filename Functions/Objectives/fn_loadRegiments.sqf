// Load Regiments from database 
params ["_side"];
_db = ["new", format ["%3 Regiments - %1 %2", missionName, worldName, _side]] call oo_inidbi;
_sections = "getSections" call _db;
{
	_hqPos = ["read", [_x, "Position"]] call _db;
	_regimentType = ["read", [_x, "Type"]] call _db;
	_regimentMarker = ["read", [_x, "Marker"]] call _db;
	_regimentSpeed = ["read", [_x, "Speed"]] call _db;
	_regimentSize = ["read", [_x, "Size"]] call _db;
	_regimentSkill= ["read", [_x, "Skill"]] call _db;

	// Add marker to world map 
	_mkr = createMarkerLocal [_x, _hqPos];
	_mkr setMarkerTextLocal _x;
	_mkr setMarkerAlpha 0;
	_mkr setMarkerType _regimentMarker;
} forEach _sections;