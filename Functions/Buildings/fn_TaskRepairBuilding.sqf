// Creates a task for players (engineers) to build broken buildings in the world 
params ["_bld"];

_db = ["new", format ["Building Damages %1 %2", missionName, worldName]] call oo_inidbi;
_current = typeOf _bld;
_pos = getPos _bld;
_oldModel = ["read", [_bld, "Old Model"]] call _db;

_taskid = format ["%1 %2", _current, _pos];
_bld setVariable ["fox_bld_taskid", _taskid, true];

_bldRepair = [
	true,
	_taskid,
	["Repair the building!", "Repair", ""],
	_bld,
	"CREATED",
	-1, 
	false,
	"",
	true	
] call BIS_fnc_taskCreate;

[_taskid ,"help"] call BIS_fnc_taskSetType;
[_bld, _taskid, _oldModel] remoteExec ["fce_fnc_addActionBuilding", 0, true];
