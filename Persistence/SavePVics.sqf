params ["_veh"];
_db = ["new", format ["PVics %1 %2", missionName, worldName]] call oo_inidbi;

while {true} do {
	
	// Get info 
	_pos = getPos _veh;
	_class = typeOf _veh;
	_dir = getDir _veh;
	_dmg = damage _veh;
	_fuel = fuel _veh;

	_items = getItemCargo _veh;
	_mags = getMagazineCargo _veh;
	_weps = getWeaponCargo _veh;
	_backs = getBackpackCargo _veh;
	
	_section = format ["%1 - %2", _class, netId _veh];
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

	sleep 30;
};