params ["_name", "_uid", "_id"];

_db = ["new", format ["Players %1 %2", missionName, worldName]] call oo_inidbi;
_section = format ["%1 - %2", _name, _uid];

_pos = ["read", [_section, "Position", []]] call _db;
_dir = ["read", [_section, "Direction", 0]] call _db;
_loadout = ["read", [_section, "Loadout", []]] call _db;

[_pos, _dir, _loadout] remoteExec ["fce_fnc_LoadPlayer", _clientID];