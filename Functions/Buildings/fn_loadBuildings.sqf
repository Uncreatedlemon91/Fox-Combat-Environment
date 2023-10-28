_db = ["new", format ["Building Damages %1 %2", missionName, worldName]] call oo_inidbi;
_sections = "getSections" call _Db;
systemChat "Loading Buildings...";
{
	_pos = ["read", [_x, "Position"]] call _db;
	_model = ["read", [_x, "New Model"]] call _db;

	_bld = nearestBuilding _pos;
	_bld setDamage [1, false, objNull, objNull];
	[_bld] remoteExec ["fce_fnc_TaskRepairBuilding", 2];
} forEach _sections;