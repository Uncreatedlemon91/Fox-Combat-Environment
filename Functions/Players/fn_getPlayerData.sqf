// Grabs player data from the server database and sends it back to the client to load or check. 
params ["_name", "_uid", "_netID"];

// Get reference point to the database 
_db = ["new", "Player Profiles"] call oo_inidbi;

// Grab player profile data 
_name = ["read", _uid, "Name"] call _db;
_pos = ["read", _uid, "Position"] call _db;
_dir = ["read", _uid, "Direction"] call _db;
_gear = ["read", _uid, "Loadout"] call _db;
_insig = ["read", _uid, "Insignia"] call _db;
_face = ["read", _uid, "Face"] call _db;
_health = ["read", _uid, "Health"] call _db;
_role = ["read", _uid, "Role"] call _db;
_quals = ["read", _uid, "Qualifications"] call _db;

// Return player data to the client 
_data = [_name, _pos, _dir, _gear, _insig, _face, _health, _role, _quals];