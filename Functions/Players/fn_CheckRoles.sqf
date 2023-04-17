params ["_clientID", "_UID"];
_db = ["new", format ["Players %1 %2", missionName, worldName]] call oo_inidbi;
_roles = ["read", [_UID, "Roles"]] call _db;
