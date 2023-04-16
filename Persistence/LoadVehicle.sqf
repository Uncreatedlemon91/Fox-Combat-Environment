_db = ["new", format ["Vehicles %1 - %2", missionName, worldName]] call oo_inidbi;
_section = format ["%1 - %2", _type, netId _veh];
_type = ["read", [_section, "Type"]] call _db;
_pos = ["read", [_section, "Position"]] call _db;
_dir = ["read", [_section, "Direction"]] call _db;
_dmg = ["read", [_section, "Damage"]] call _db;
_fuel = ["read", [_section, "Fuel"]] call _db;

_ammo = ["read", [_section, "Ammo"]] call _db;

_items = ["read", [_section, "CargoItems"]] call _db;
_mags = ["read", [_section, "CargoMags"]] call _db;
_weps = ["read", [_section, "CargoWeps"]] call _db;
_backs = ["read", [_section, "CargoBps"]] call _db;

// Create new vehicle based on data input 
_veh = _type createVehicle _pos;
_veh setDir _dir;
_veh setDamage _dmg;
_veh setFuel _fuel;

_veh setVehicleAmmo _ammo;

{
	for "_i" from 1 to (count _x - 1) do {
		_veh addItemCargoGlobal _x;
	};
} forEach _items;
{
	for "_i" from 1 to (count _x - 1) do {
		_veh addItemCargoGlobal _x;
	};
} forEach _mags;
{
	for "_i" from 1 to (count _x - 1) do {
		_veh addItemCargoGlobal _x;
	};
} forEach _weps;
{
	for "_i" from 1 to (count _x - 1) do {
		_veh addItemCargoGlobal _x;
	};
} forEach _backs;