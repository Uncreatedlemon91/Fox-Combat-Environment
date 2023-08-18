_db = ["new", format ["Player Vehicles %1 %2", missionName, worldName]] call oo_inidbi;
_sections = "getSections" call _db;

// Debug

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
	_items = _data select 6;
	_ammo = _data select 7;
	_weps = _data select 8;

	// Spawn vehicle replica 
	_veh = _type createVehicle _pos;
	_veh allowDamage false;
	_veh setDir _dir;
	_veh setDamage [_dmg, false];
	_veh setFuel _fuel;

	// add Ammo 
	{
		_mag = _x select 0;
		_turret = _x select 1;
		_magCount = _x select 2;
		_veh removeMagazinesTurret [_mag, _turret];
		_veh addMagazineTurret [_mag, _turret, _magCount];
	} forEach _mags;

	// Add cargo / Inventory of the vehicle back 
	_items params ["_classes","_count"];
	for "_i" from 0 to count _classes - 1 do {
		_veh addItemCargoGlobal [_classes select _i,_count select _i]
	};

	_ammo params ["_classes","_count"];
	for "_i" from 0 to count _classes - 1 do {
		_veh addMagazineCargoGlobal [_classes select _i,_count select _i]
	};

	_weps params ["_classes","_count"];
	for "_i" from 0 to count _classes - 1 do {
		_veh addWeaponCargoGlobal [_classes select _i,_count select _i]
	};
	
	["deleteSection", _x] call _db;
	[_veh] remoteExec ["fce_fnc_setupVehicleEH", 2];
	[_veh, 0] remoteExec ["fce_fnc_saveVehicle", 2];
	_veh allowDamage true;
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
	_veh allowDamage false;
	_veh setDir _dir;
	_veh setDamage [_dmg, false];

	["deleteSection", _x] call _wVic;
	[_veh, 1] remoteExec ["fce_fnc_saveVehicle", 2];
	_veh allowDamage true;
} forEach _sections;