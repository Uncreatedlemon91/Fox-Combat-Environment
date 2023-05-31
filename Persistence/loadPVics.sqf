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
		_cargo = ["read", [_x, "CargoSpace"]] call _db;
		_ammo = ["read", [_x, "Ammo"]] call _db;

		_items = ["read", [_x, "CargoItems"]] call _db;
		_mags = ["read", [_x, "CargoMags"]] call _db;
		_weps = ["read", [_x, "CargoWeps"]] call _db;
		_backs = ["read", [_x, "CargoBps"]] call _db;

		_veh = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
		_veh allowDamage false;
		_veh setDir _dir;
		_veh setDamage [_dmg, false];
		_veh setFuel _fuel;
		
		[_veh, _cargo] call ace_cargo_fnc_setSpace;

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

		_veh allowDamage true;
		[_veh] remoteExec ["fce_fnc_saveVehicles", 2];
	} forEach _sections;	

	_mkrdb = ["new", format ["Markers %1-%2", missionName, worldName]] call oo_inidbi;
	_mkrSections = "getSections" call _mkrdb;

	{
		// Current result is saved in variable _x
		_pos = ["read", [_x, "Position"]] call _mkrdb;
		_text = ["read", [_x, "Text"]] call _mkrdb;

		_mkr = createMarker [_x, _pos];
		_mkr setMarkerType "mil_end";
		_mkr setMarkerColor "ColorRed";
		_mkr setMarkerText _text;
	} forEach _mkrSections;

} else {
	_vehicles = (getmissionlayerEntities "playerVehicles") select 0;
	{
		_pos = getPos _x;
		_class = typeOf _x;
		_dir = getDir _x;
		_dmg = damage _x;
		_fuel = fuel _x;

		_items = getItemCargo _x;
		_mags = getMagazineCargo _x;
		_weps = getWeaponCargo _x;
		_backs = getBackpackCargo _x;
		
		_section = format ["%1 - %2", _class, netId _x];
		
		// Save to database 
		["write", [_section, "Type", _class]] call _db;
		["write", [_section, "Position", _pos]] call _db;
		["write", [_section, "Direction", _dir]] call _db;
		["write", [_section, "Damage", _dmg]] call _db;
		["write", [_section, "Fuel", _fuel]] call _db;

		["write", [_section, "CargoItems", _items]] call _db;
		["write", [_section, "CargoMags", _mags]] call _db;
		["write", [_section, "CargoWeps", _weps]] call _db;
		["write", [_section, "CargoBps", _backs]] call _db;
		
		[_veh] remoteExec ["fce_fnc_saveVehicles", 2];
	} forEach _vehicles;
};