_db = ["new", format ["Vehicles - %1 %2", missionName, worldName]] call oo_inidbi;

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

		_logidb = ["new", format ["Logistics - %1 %2", missionName, worldName]] call oo_inidbi;
		_carry = ["read", [_type, "CanCarry"]] call _logidb;
		// _weight = ["read", [_type, "setSize"]] call _logidb;

		// Create new vehicle based on data input 
		_veh = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
		clearItemCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
		_veh setDir _dir;
		_veh setDamage [_dmg, false];
		_veh setFuel _fuel;

		[_veh, _carry, [0, 3, 1], 10] remoteExec ["ace_dragging_fnc_setCarryable", 0, true];
		// [_veh, _weight] remoteExec ["ace_cargo_fnc_setSize", 0, true];
		
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
	};
} forEach _sections;
sleep 10;

"delete" call _db;

execVM "Persistence\SaveFactionVehs.sqf";