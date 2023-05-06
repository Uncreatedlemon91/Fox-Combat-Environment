params ["_kit", "_pos", "_dir", "_name", "_uid", "_clientID"];
_db = ["new", "Players"] call oo_inidbi;

_section = format ["%1 %2", _name, _uid];
["write", [_section, "Name", _name]] call _db;
["write", [_section, "UID", _uid]] call _db;
["write", [_section, "Client ID", _clientID]] call _db;
["write", [_section, "Kit", _kit]] call _db;
["write", [_section, "Pos", _pos]] call _db;
["write", [_section, "Direction", _dir]] call _db;

["write", [_section, "Roles", ["Rifleman"]]] call _db;
["write", [_section, "S Shops", [""]]] call _db;