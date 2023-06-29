params ["_name", "_uid", "_netID"];
"Generating profile on Database..." remoteExec ["systemChat", _netID];
_db = ["new", format ["Players %1-%2", missionName, worldName]] call oo_inidbi;
["write", [_uid, "Name", _name]] call _db;
["write", [_uid, "UID", _uid]] call _db;
["write", [_uid, "NetId", _netID]] call _db;
["write", [_uid, "Combat Quals", ["Rifle"]]] call _db;

"Profile Created" remoteExec ["systemChat", _netID];