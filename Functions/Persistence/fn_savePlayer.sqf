params ["_player"];
_db = ["new", "Player Profiles"] call oo_inidbi;

// Get player information 
_name = name _player;
_uid = getPlayerUID _player;
_netID = netId _player;
_pos = getPosATL _player;
_gear = getUnitLoadout _player;
_dir = getDir _player;


_face = face _player;

// write to the database 
_1 = ["write", [_uid, "Name", _name]] call _db;
_2 = ["write", [_uid, "UID", _uid]] call _db;
_3 = ["write", [_uid, "NetId", _netID]] call _db;
_4 = ["write", [_uid, "Position", _pos]] call _db;
_5 = ["write", [_uid, "Gear", _gear]] call _db;
_6 = ["write", [_uid, "Direction", _dir]] call _db;
_7 = ["write", [_uid, "Face", _face]] call _db;