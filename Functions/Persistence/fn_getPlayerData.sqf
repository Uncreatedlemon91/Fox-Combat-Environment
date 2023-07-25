params ["_player", "_id", "_uid"];
// Debug 
systemChat "Player Connected!";

// Establish Database object 
_db = ["new", "Player Profiles"] call oo_inidbi;

// Check if player is already in the database 
_sections = "getSections" call _db;
if (_uid in _sections) then {
	systemChat "Loading Data!!";
	// Player is in database already, get their information 
	_pos = ["read", [_uid, "Position"]] call _db;
	_gear = ["read", [_uid, "Loadout"]] call _db;
	_dir = ["read", [_uid, "Direction"]] call _db;
	_role = ["read", [_uid, "Role"]] call _db;

	_id = owner _player;

	[_pos, _gear, _dir, _role] remoteExec ["fce_fnc_loadPlayer", _id, true];
};