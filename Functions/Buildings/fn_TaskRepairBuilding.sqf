// Creates a task for players (engineers) to build broken buildings in the world 
params ["_bld"];

_db = ["new", format ["Building Damages %1 %2", missionName, worldName]] call oo_inidbi;
_current = ["read", [_bld, "New"]] call _db;
_pos = ["read", [_bld, "Position"]] call _db;

_taskid = format ["%1 %2", _current, _pos];

_bldRepair = [
	west,
	_taskid,
	["Repair the building!", "Repair", ""],
	_bld,
	"CREATED",
	-1, 
	false,
	"",
	false	
] call BIS_fnc_taskCreate;

[_taskid ,"help"] call BIS_fnc_taskSetType;
[_bld] remoteExec ["fce_Fnc_addActionBuilding", 0, true];

_dmg = damage _bld;
waitUntil {_dmg == 0};

[_taskid, "SUCCEEDED", true] call BIS_fnc_taskSetState;
[_taskid] call BIS_fnc_deleteTask;