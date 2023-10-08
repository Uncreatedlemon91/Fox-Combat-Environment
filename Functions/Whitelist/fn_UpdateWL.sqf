// Update whitelist changes to the server 
params ["_role", "_uid"];

// Get Database
_db = ["new", "Player Profiles"] call oo_inidbi;
_curRoles = ["read", [_uid, "Roles"]] call _db;

systemChat format ["Roles: %1", _curRoles];
systemChat format ["UID: %1", _uid];


// Add new whitelist role
_curRoles pushBackUnique _role;

// Save Database
["write", [_uid, "Roles", _curRoles]] call _db;