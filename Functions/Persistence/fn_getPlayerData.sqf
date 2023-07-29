params ["_name", "_uid", "_netID"];
_db = ["new", format ["Player Profiles %1 %2", missionName, worldName]] call oo_inidbi;

// Get player data from the player database
_getSections = "getSections" call _db;
if (_uid in _getSections) then {
	_pos = ["read", [_uid, "Position"]] call _db;
	_gear = ["read", [_uid, "Gear"]] call _db;
	_dir = ["read", [_uid, "Direction"]] call _db;
	_roles = ["read", [_uid, "Combat Quals"]] call _db;
	_medData = ["read", [_uid, "MedData"]] call _db;
	[_pos, _gear, _dir, _roles, _medData] remoteExec ["fce_fnc_loadPlayer", _netID];
};