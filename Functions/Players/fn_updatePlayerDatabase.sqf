params ["_name", "_UID", "_netID", "_pos", "_gear", "_dir", "_medData"];
_db = ["new", format ["Players %1-%2", missionName, worldName]] call oo_inidbi;

["write", [_uid, "Name", _name]] call _db;
["write", [_uid, "UID", _uid]] call _db;
["write", [_uid, "NetId", _netID]] call _db;
["write", [_uid, "Position", _pos]] call _db;
["write", [_uid, "Gear", _gear]] call _db;
["write", [_uid, "Direction", _dir]] call _db;

// Save Medical Data 
["write", [_uid, "Medical - Airway Obstructed", _medData select 0]] call _db;
["write", [_uid, "Medical - Airway Occulded", _medData select 1]] call _db;
["write", [_uid, "Medical - Pneumothorax", _medData select 2]] call _db;
["write", [_uid, "Medical - Hemopnumothorax", _medData select 3]] call _db;
["write", [_uid, "Medical - tensionpneumothorax", _medData select 4]] call _db;
