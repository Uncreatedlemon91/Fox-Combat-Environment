// Saves the status of a vehicle when it gets blown up or changes 
addMissionEventHandler ["BuildingChanged", {
	params ["_from", "_to", "_isRuin"];
	_db = ["new", format ["Building Damages %1 %2", missionName, worldName]] call oo_inidbi;
	_sections = "getSections" call _Db;
	_pos = getPos _to;
	_oldM = typeOf _from;
	_dir = direction _to;

	["write", [str _to, "Old Model", _oldM]] call _Db;
	["write", [str _to, "New", str _to]] call _Db;
	["write", [str _to, "Position", _pos]] call _db;
	["write", [str _to, "Direction", _dir]] call _db;
	
	if (_isRuin) then {
		// Task a player to 'repair' the wreckage
		[_to] remoteExec ["fce_fnc_TaskRepairBuilding", 2];
	};
}];