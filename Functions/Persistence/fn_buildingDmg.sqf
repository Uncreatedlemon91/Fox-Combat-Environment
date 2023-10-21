// Saves the status of a vehicle when it gets blown up or changes 
addMissionEventHandler ["BuildingChanged", {
	params ["_from", "_to", "_isRuin"];
	_db = ["new", format ["Building Damages %1 %2", missionName, worldName]] call oo_inidbi;
	_sections = "getSections" call _Db;
	_countSec = count _sections;
	_id = _countSec + 1;
	_pos = Position _to;

	["write", [_id, "Old", str _from]] call _Db;
	["write", [_id, "New", str _to]] call _Db;
	["write", [_id, "isRuin", _isRuin]] call _db;
	["write", [_id, "Position", _pos]] call _db;

	if (_isRuin) then {
		// Task a player to 'repair' the wreckage
		[_id, _to] remoteExec ["fce_fnc_TaskRepairBuilding", 2];
	};
}];