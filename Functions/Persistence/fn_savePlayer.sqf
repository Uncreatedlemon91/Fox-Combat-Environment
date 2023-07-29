params ["_name", "_UID", "_netID", "_pos", "_gear", "_dir"];
_db = ["new", format ["Player Profiles %1 %2", missionName, worldName]] call oo_inidbi;

["write", [_uid, "Name", _name]] call _db;
["write", [_uid, "UID", _uid]] call _db;
["write", [_uid, "NetId", _netID]] call _db;
["write", [_uid, "Position", _pos]] call _db;
["write", [_uid, "Gear", _gear]] call _db;
["write", [_uid, "Direction", _dir]] call _db;
