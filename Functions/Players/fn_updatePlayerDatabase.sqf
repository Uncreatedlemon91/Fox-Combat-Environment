params ["_name", "_UID", "_netID", "_pos", "_gear", "_dir", "_bullets"];
_db = ["new", format ["Players %1-%2", missionName, worldName]] call oo_inidbi;

["write", [_uid, "Name", _name]] call _db;
["write", [_uid, "UID", _uid]] call _db;
["write", [_uid, "NetId", _netID]] call _db;
["write", [_uid, "Position", _pos]] call _db;
["write", [_uid, "Gear", _gear]] call _db;
["write", [_uid, "Direction", _dir]] call _db;

_bulletsFired = ["read", [_uid, "Bullets Fired", 0]] call _db;
_bullets = _bulletsFired + _bullets;
["write", [_uid, "Bullets Fired", _bullets]] call _db;