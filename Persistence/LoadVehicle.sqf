_db = ["new", format ["Vehicles %1 - %2", missionName, worldName]] call oo_inidbi;
_sections = "getSections" call _db;
{
	if (_x == "Supply Points") then {} else {
		// Current result is saved in variable _x
		_type = ["read", [_x, "Type"]] call _db;
		_pos = ["read", [_x, "Position"]] call _db;
		_dir = ["read", [_x, "Direction"]] call _db;
		_dmg = ["read", [_x, "Damage"]] call _db;
		_fuel = ["read", [_x, "Fuel"]] call _db;

		_items = ["read", [_x, "CargoItems"]] call _db;
		_mags = ["read", [_x, "CargoMags"]] call _db;
		_weps = ["read", [_x, "CargoWeps"]] call _db;
		_backs = ["read", [_x, "CargoBps"]] call _db;

		_carry = ["read", [_class, "CanCarry"]] call _db;
		_weight = ["read", [_class, "Weight"]] call _db;

		// Create new vehicle based on data input 
		_veh = _type createVehicle _pos;
		clearItemCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
		_veh setDir _dir;
		_veh setDamage [_dmg, false];
		_veh setFuel _fuel;

		[_veh, _carry, [0, 3, 1], 10] call ace_dragging_fnc_setCarryable;
		[_veh, _weight] call ace_cargo_fnc_setSize;
		
		for "_i" from 0 to count _items - 1 do {
			_veh addItemCargo [_items select _i,_count select _i];
		};

		for "_i" from 0 to count _mags - 1 do {
			_veh addItemCargo [_mags select _i,_count select _i];
		};

		for "_i" from 0 to count _weps - 1 do {
			_veh addItemCargo [_weps select _i,_count select _i];
		};

		for "_i" from 0 to count _backs - 1 do {
			_veh addItemCargo [_backs select _i,_count select _i];
		};
	};
} forEach _sections;