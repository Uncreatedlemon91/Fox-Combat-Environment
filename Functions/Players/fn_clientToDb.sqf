params ["_name", "_uid", "_id", "_pos", "_dir", "_kit"];

_db = ["new", format ["Players %1 %2", missionName, worldName]] call oo_inidbi;
_section = format ["%1 - %2", _name, _uid];
_exists = "exists" call _db;

["write", [_section, "Name", _name]] call _db;
["write", [_section, "Steam ID", _uid]] call _db;
["write", [_section, "ClientID", _id]] call _db;

["write", [_section, "Position", _pos]] call _db;
["write", [_section, "Direction", _dir]] call _db;
["write", [_section, "Loadout", _kit]] call _db;

if !(_exists) then {
	["write", [_section, "Roles", [
		"Rifleman"
		]]] call _db;
	["write", [_section, "Shops", [
		""
		]]] call _db;
};
