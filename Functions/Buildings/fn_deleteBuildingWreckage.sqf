// Deletes building from blown up database and removes rubble ingame 
params ["_bld"];
_db = ["new", format ["Building Damages %1 %2", missionName, worldName]] call oo_inidbi;

// Add new building 
_pos = getPosatl _bld;
_old = ["read", [_bld, "Old Model"]] call _db;
_newBld = createVehicle [_old, _pos, [], 0, "CAN_COLLIDE"];

// Align new building 
_dir = ["read", [_bld, "Direction"]] call _db;
_newBld setdir _dir;

// Clean up 
systemChat format ["%1", _bld];
["deleteSection", str _bld] call _db;
deleteVehicle _bld;

systemChat "Building Repaired!!";
