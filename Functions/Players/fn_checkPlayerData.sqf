params ["_name", "_uid", "_netID"];
"checking database!" remoteExec ["systemChat", _netID];
_db = ["new", format ["Players %1-%2", missionName, worldName]] call oo_inidbi;

_getSections = "getSections" call _db;
if (_uid in _getSections) then {
	_pos = ["read", [_uid, "Position"]] call _db;
	_gear = ["read", [_uid, "Gear"]] call _db;
	_dir = ["read", [_uid, "Direction"]] call _db;
	_roles = ["read", [_uid, "Combat Quals"]] call _db;
	[_pos, _gear, _dir, _roles] remoteExec ["fce_fnc_loadPlayerData", _netID];
} else {
	[_name, _uid, _netID] remoteExec ["fce_fnc_addPlayerToDatabase", 2];
};