params ["_name", "_UID", "_netID", "_pos", "_gear", "_dir", "_medData"];
_db = ["new", format ["Players %1-%2", missionName, worldName]] call oo_inidbi;

["write", [_uid, "Name", _name]] call _db;
["write", [_uid, "UID", _uid]] call _db;
["write", [_uid, "NetId", _netID]] call _db;
_spectators = [] call ace_spectator_fnc_players;
if (_name in _spectators) then {
	["write", [_uid, "Position", [947.509,2880.22,0]]] call _db;
} else {
	["write", [_uid, "Position", _pos]] call _db;
};
["write", [_uid, "Gear", _gear]] call _db;
["write", [_uid, "Direction", _dir]] call _db;

// Save Medical Data
["write", [_uid, "MedData", _medData]] call _db;

