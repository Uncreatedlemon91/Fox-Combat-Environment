params ["_veh"];

while {alive _veh} do {
	_type = typeOf _veh;
	_pos = getPosASL _veh;
	_dir = getDir _veh;
	_dmg = damage _veh;
	_fuel = fuel _veh;

	_ammo = magazinesAmmo _veh;

	_items = getItemCargo _veh;
	_mags = getMagazineCargo _veh;
	_weps = getWeaponCargo _veh;
	_backs = getBackpackCargo _veh;

	// Save to database 
	_db = ["new", format ["Vehicles %1 - %2", missionName, worldName]] call oo_inidbi;
	_section = format ["%1 - %2", _type, netId _veh];
	["write", [_section, "Type", _type]] call _db;
	["write", [_section, "Position", _pos]] call _db;
	["write", [_section, "Direction", _dir]] call _db;
	["write", [_section, "Damage", _dmg]] call _db;
	["write", [_section, "Fuel", _fuel]] call _db;
	
	["write", [_section, "Ammo", _ammo]] call _db;

	["write", [_section, "CargoItems", _items]] call _db;
	["write", [_section, "CargoMags", _mags]] call _db;
	["write", [_section, "CargoWeps", _weps]] call _db;
	["write", [_section, "CargoBps", _backs]] call _db;

	// Repeat 
	sleep 20;
};