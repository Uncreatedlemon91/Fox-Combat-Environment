params ["_name", "_uid", "_netID"];
_db = ["new", format ["Player Profiles %1 %2", missionName, worldName]] call oo_inidbi;

// Get player data from the player database
_getSections = "getSections" call _db;
if (_uid in _getSections) then {
	_pos = ["read", [_uid, "Position"]] call _db;
	_gear = ["read", [_uid, "Gear"]] call _db;
	_dir = ["read", [_uid, "Direction"]] call _db;
	_roles = ["read", [_uid, "Roles"]] call _db;
	_curRole = ["read", [_uid, "CurrentRole"]] call _db;
	[_pos, _gear, _dir, _roles, _curRole] remoteExec ["fce_fnc_loadPlayer", _netID];
} else {
	_name = ["write", [_uid, "Name", _name]] call _db;
	_pos = ["write", [_uid, "Position", [11955.9,2297.09,0]]] call _db;
	_gear = ["write", [_uid, "Gear", ""]] call _db;
	_dir = ["write", [_uid, "Direction", 0]] call _db;
	_roles = ["write", [_uid, "Roles", ["fox_rifleman", "fox_ammoCarrier"]]] call _db;
};