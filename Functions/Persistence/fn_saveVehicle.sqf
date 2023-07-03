// Save provided data to the database. 
params ["_veh"];
_db = ["new", format ["Player-Vehicles %1 %2", missionName, worldName]] call oo_inidbi;

// Get data needed to save 
_pos = getPosATL _veh;
_dir = getDir _veh;
_dmg = damage _veh;
_fuel = fuel _veh;

// Get cargo data 
_items = getItemCargo _veh;
_weps = getWeaponCargo _veh;
_mags = getMagazineCargo _veh;
_bpacks = getBackpackCargo _veh;


// Save items to the database 
["write", [_veh, "Position", _pos]] call _db;
["write", [_veh, "Direction", _dir]] call _db;
["write", [_veh, "Damage", _dmg]] call _db;
["write", [_veh, "Fuel", _fuel]] call _db;

["write", [_veh, "CargoItems", _items]] call _db;
["write", [_veh, "CargoWeps", _weps]] call _db;
["write", [_veh, "CargoMags", _mags]] call _db;
["write", [_veh, "CargoBps", _bpacks]] call _db;