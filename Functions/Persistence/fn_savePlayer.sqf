params ["_pos", "_gear", "_dir", "_role", "_uid"];

_db = ["new", "Player Profiles"] call oo_inidbi;

["write", [_uid, "Position", _pos]] call _db;
["write", [_uid, "Direction", _dir]] call _db;
["write", [_uid, "Loadout", _gear]] call _db;
["write", [_uid, "Role", _role]] call _db;