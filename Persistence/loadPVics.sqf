_db = ["new", format ["PVics %1 %2", missionName, worldName]] call oo_inidbi;
_exists = "exists" call _db;

if (_exists) then {
	_vehicles = (getmissionlayerEntities "playerVehicles") select 0;
	{
		// Current result is saved in variable _x
		deleteVehicle _x;
	} forEach _vehicles;
	sleep 1;
	_sections = "getSections" call _db;
	{
		// Current result is saved in variable _x
		_class = ["read", [_x, "Type"]] call _db;
		_pos = ["read", [_x, "Position"]] call _db;
		_dir = ["read", [_x, "Direction"]] call _db;
		_dmg = ["read", [_x, "Damage"]] call _db;
		_fuel = ["read", [_x, "Fuel"]] call _db;

		_items = ["read", [_x, "CargoItems"]] call _db;
		_mags = ["read", [_x, "CargoMags"]] call _db;
		_weps = ["read", [_x, "CargoWeps"]] call _db;
		_backs = ["read", [_x, "CargoBps"]] call _db;

		_veh = _class createVehicle _pos;
		_veh allowDamage false;
		_veh setDir _dir;
		_veh setDamage [_dmg, false];
		_veh setFuel _fuel;

		_items params ["_classes","_count"];
		for "_i" from 0 to count _classes - 1 do {
			_veh addItemCargoGlobal [_classes select _i,_count select _i]
		};

		_mags params ["_classes","_count"];
		for "_i" from 0 to count _classes - 1 do {
			_veh addMagazineCargoGlobal [_classes select _i,_count select _i]
		};

		_weps params ["_classes","_count"];
		for "_i" from 0 to count _classes - 1 do {
			_veh addWeaponCargoGlobal [_classes select _i,_count select _i]
		};

		_backs params ["_classes","_count"];
		for "_i" from 0 to count _classes - 1 do {
			_veh addBackpackCargoGlobal [_classes select _i,_count select _i]
		};

		_veh allowDamage false;
		[_veh] execVM "Persistence\SavePVics.sqf";
	} forEach _sections;

	sleep 10; 
	
} else {
	_vehicles = (getmissionlayerEntities "playerVehicles") select 0;
	{
		// Current result is saved in variable _x
		[_x]execVM "Persistence\SavePVics.sqf";
	} forEach _vehicles;
};