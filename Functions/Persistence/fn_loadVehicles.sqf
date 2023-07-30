_db = ["new", format ["Player Vehicles %1 %2", missionName, worldName]] call oo_inidbi;
_sections = "getSections" call _db;

// apply saved vehicle locations back to the server 
{
	_data = ["read", [_x, "Vehicle Info"]] call _db;
	systemChat format ["Data: %1", _data];
	_type = _data select 0;
	_pos = _data select 1;
	_dir = _data select 2;
	_dmg = _data select 3;
	_fuel = _data select 4;
	_mags = _data select 5;

	// Spawn vehicle replica 
	_veh = _type createVehicle _pos;
	_veh setDir _dir;
	_veh setDamage [_dmg, false];
	_veh setFuel _fuel;

	// add Ammo 
	{
		_mag = _x select 0;
		_turret = _x select 1;
		_ammo = _x select 2;
		_veh removeMagazinesTurret [_mag, _turret];
		_veh addMagazineTurret [_mag, _turret, _ammo];
	} forEach _mags;
	["deleteSection", _x] call _db;
	[_veh] remoteExec ["fce_fnc_setupVehicleEH", 2];
	[_veh, 0] remoteExec ["fce_fnc_saveVehicle", 2];
} forEach _sections;

// Spawn in all wreckages 
_wVic = ["new", format ["Wrecks %1 %2", missionName, worldName]] call oo_inidbi;
_sections = "getSections" call _db;

{
	_data = ["read", [_x, "Vehicle Info"]] call _wVic;
	systemChat format ["Data: %1", _data];
	_type = _data select 0;
	_pos = _data select 1;
	_dir = _data select 2;
	_dmg = _data select 3;

	// Spawn vehicle replica 
	_veh = _type createVehicle _pos;
	_veh setDir _dir;
	_veh setDamage [_dmg, false];

	["deleteSection", _x] call _wVic;
	[_veh, 1] remoteExec ["fce_fnc_saveVehicle", 2];
} forEach _sections;