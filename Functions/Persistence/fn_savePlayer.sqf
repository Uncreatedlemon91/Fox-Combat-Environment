params ["_data"];

_name = _data select 0;
_uid = _data select 1;
_pos = _data select 2;
_dir = _data select 3;
_gear = _data select 4;
_alive = _data select 5;

_db = ["new", format ["Player: %1 - %2", _name, _uid]] call oo_inidbi;
_exists = "exists" call _db;

if (_exists) then {
	["write", ["Persistence", "Position", _pos]] call _db;
	["write", ["Persistence", "Direction", _dir]] call _db;
	["write", ["Persistence", "Gear", _gear]] call _db;
} else {
	["write", ["Player Info", "Name", _name]] call _db;
	["write", ["Player Info", "SteamID", _uid]] call _db;

	["write", ["Company Info", "Qualifications", ["Rifleman"]]] call _db;
	["write", ["Company Info", "S-Shops", [""]]] call _db;

	["write", ["Persistence", "Position", _pos]] call _db;
	["write", ["Persistence", "Direction", _dir]] call _db;
	["write", ["Persistence", "Gear", _gear]] call _db;
};

if (_alive) then {

} else {
	["deleteSection", "Persistence"] call _db;
};