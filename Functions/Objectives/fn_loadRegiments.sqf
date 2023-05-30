// Load regiment from database 
_db = ["new", format ["b Regiments - %1 %2", missionName, worldName]] call oo_inidbi;
_sections1 = "getSections" call _db;
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
} forEach _sections1;

_db2 = ["new", format ["o Regiments - %1 %2", missionName, worldName]] call oo_inidbi;
_sections2 = "getSections" call _db2;
{
	_hqPos = ["read", [_x, "Position"]] call _db2;
	_regimentType = ["read", [_x, "Type"]] call _db2;
	_regimentMarker = ["read", [_x, "Marker"]] call _db2;
	_regimentSpeed = ["read", [_x, "Speed"]] call _db2;
	_regimentSize = ["read", [_x, "Size"]] call _db2;
	_regimentSkill= ["read", [_x, "Skill"]] call _db2;

	// Add marker to world map 
	_mkr = createMarkerLocal [_x, _hqPos];
	_mkr setMarkerTextLocal _x;
	_mkr setMarkerAlphaLocal 0.2;
	_mkr setMarkerType _regimentMarker;
} forEach _sections2;



