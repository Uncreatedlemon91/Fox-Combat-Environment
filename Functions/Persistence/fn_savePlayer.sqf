params ["_name", "_UID", "_netID", "_pos", "_gear", "_dir", "_roles"];
_db = ["new", "Player Profiles"] call oo_inidbi;
_sections = "getSections" call _db;

if (_uid in _sections) then {
	["write", [_uid, "Name", _name]] call _db;
	["write", [_uid, "NetId", _netID]] call _db;
	["write", [_uid, "Position", _pos]] call _db;
	["write", [_uid, "Gear", _gear]] call _db;
	["write", [_uid, "Direction", _dir]] call _db;
} else {
	["write", [_uid, "Name", _name]] call _db;
	["write", [_uid, "UID", _uid]] call _db;
	["write", [_uid, "NetId", _netID]] call _db;
	["write", [_uid, "Position", _pos]] call _db;
	["write", [_uid, "Gear", _gear]] call _db;
	["write", [_uid, "Direction", _dir]] call _db;
	["write", [_uid, "Roles", _roles]] call _db;
};