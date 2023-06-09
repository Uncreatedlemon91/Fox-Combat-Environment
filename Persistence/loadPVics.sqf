_db = ["new", format ["Player-Vehicles %1 %2", missionName, worldName]] call oo_inidbi;
_exists = "exists" call _db;
_vehicles = (getmissionlayerEntities "PlayerVehicles") select 0;

if (_exists) then {
	{
		_vehID = _x;

		_class = ["read", [_vehID, "Type"]] call _db;
		_pos = ["read", [_vehID, "Position"]] call _db;
		_dir = ["read", [_vehID, "Direction"]] call _db;
		_dmg = ["read", [_vehID, "Damage"]] call _db;
		_fuel = ["read", [_vehID, "Fuel"]] call _db;

		_items = ["read", [_vehID, "CargoItems"]] call _db;
		_mags = ["read", [_vehID, "CargoMags"]] call _db;
		_weps = ["read", [_vehID, "CargoWeps"]] call _db;
		_backs = ["read", [_vehID, "CargoBps"]] call _db;

		_x setPosATL _pos;
		_x allowDamage false;
		_x setDir _dir;
		_x setDamage [_dmg, false];
		_x setFuel _fuel;

		// Set Wreckage 
		if (_dmg > 0.75) then {
			_x allowDamage false;
		} else {
			_x allowDamage true;
		};

		_items params ["_classes","_count"];
		for "_i" from 0 to count _classes - 1 do {
			_x addItemCargoGlobal [_classes select _i,_count select _i]
		};

		_mags params ["_classes","_count"];
		for "_i" from 0 to count _classes - 1 do {
			_x addMagazineCargoGlobal [_classes select _i,_count select _i]
		};

		_weps params ["_classes","_count"];
		for "_i" from 0 to count _classes - 1 do {
			_x addWeaponCargoGlobal [_classes select _i,_count select _i]
		};

		_backs params ["_classes","_count"];
		for "_i" from 0 to count _classes - 1 do {
			_x addBackpackCargoGlobal [_classes select _i,_count select _i]
		};

		_x allowDamage true;
		[_x] remoteExec ["fce_fnc_saveVehicles", 2];
	} forEach _vehicles;
} else {
	{
		_vehID = _x;
		_pos = getPos _x;
		_class = typeOf _x;
		_dir = getDir _x;
		_dmg = damage _x;
		_fuel = fuel _x;

		_items = getItemCargo _x;
		_mags = getMagazineCargo _x;
		_weps = getWeaponCargo _x;
		_backs = getBackpackCargo _x;
		
		// Save to database 
		["write", [_vehID, "Position", _pos]] call _db;
		["write", [_vehID, "Direction", _dir]] call _db;
		["write", [_vehID, "Damage", _dmg]] call _db;
		["write", [_vehID, "Fuel", _fuel]] call _db;

		["write", [_vehID, "CargoItems", _items]] call _db;
		["write", [_vehID, "CargoMags", _mags]] call _db;
		["write", [_vehID, "CargoWeps", _weps]] call _db;
		["write", [_vehID, "CargoBps", _backs]] call _db;

		[_x] remoteExec ["fce_fnc_saveVehicles", 2];
	} forEach _vehicles;
};