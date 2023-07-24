// Get all vehicles and save them regularly to the server 
_db = ["new", format ["Vehicles - %1 %2", missionName, worldName]] call oo_inidbi;
_sections = "getSections" call _db;

// apply saved vehicle locations back to the server 
{
	_data = ["read", [_x, "VehicleInfo"]] call _db;
	_type = _data select 0;
	_pos = _data select 1;
	_dir = _data select 2;
	_dmg = _data select 3;
	_fuel = _data select 4;

	// Spawn vehicle replica 
	[_type, _pos, _dir, _fuel, _dmg] remoteExec ["fce_fnc_spawnVehicle", 2];
	["deleteSection", _x] call _db;
} forEach _sections;

// Start the Saving process 
while {true} do {
	call fce_fnc_saveVehicles;
	sleep 30;
};