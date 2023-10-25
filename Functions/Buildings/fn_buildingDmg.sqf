// Saves the status of a vehicle when it gets blown up or changes 
addMissionEventHandler ["BuildingChanged", {
	params ["_from", "_to", "_isRuin"];
	_db = ["new", format ["Building Damages %1 %2", missionName, worldName]] call oo_inidbi;
	_sections = "getSections" call _Db;
	_countSec = count _sections;
	_pos = Position _to;
	_oldM = typeOf _from;
	_newM = typeOf _to;
	_dmg = damage _to;

	["write", [_to, "Old", str _from]] call _Db;
	["write", [_to, "Old Model", _oldM]] call _Db;
	["write", [_to, "New", str _to]] call _Db;
	["write", [_to, "New Model", _newM]] call _Db;
	["write", [_to, "isRuin", _isRuin]] call _db;
	["write", [_to, "Position", _pos]] call _db;
	["write", [_to, "Damage", _dmg]] call _db;
	
	if (_isRuin) then {
		// Task a player to 'repair' the wreckage
		[_to] remoteExec ["fce_fnc_TaskRepairBuilding", 2];
	};
}];

addMissionEventHandler ["MarkerCreated", {
	params ["_marker", "_channelNumber", "_owner", "_local"];
	if !(_local) then {
		deleteMarkerLocal _marker;
	};
}];