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
	_mkr setMarkerAlpha 0.5;
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
	_mkr setMarkerAlphaLocal 0.5;
	_mkr setMarkerType _regimentMarker;

	// Add headquarters to destroy with guards 
	_hqBuilding = "Land_A_tent";
	_hqBuildingPos = [_hqPos, 0, 20, 3, 0, 10, 0, ["base"]] call BIS_fnc_findSafePos;
	_hq = _hqBuilding createVehicle _hqBuildingPos;

	_hqFlag = "Flag_ACM_HDF1";
	_flagPos = [_hqBuildingPos, 0, 5, 1, 0, 10, 0, ["base"]] call BIS_fnc_findSafePos;
	_flag = _hqFlag createVehicle _flagPos;

	_hq allowDamage false;
	_flag allowDamage false;

	_hq setVariable ["Regiment", _x];
	_hq setVariable ["Flag", _flag];

	[_hq, ["Destroy Enemy HQ", {
		_regimentName = _target getVariable "Regiment";
		_flag = _target getVariable "Flag";

		_db = ["new", format ["%1 Regiments - %2 %3", _side, missionName, worldName]] call oo_inidbi;
		deleteVehicle _flag;
		deleteVehicle _target;
		["deleteSection", _regimentName] call _db;
	}]] remoteExec ["AddAction", 0, true];
} forEach _sections2;



