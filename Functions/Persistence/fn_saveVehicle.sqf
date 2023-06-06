// Save provided data to the database. 
params ["_veh", "_vehID"];
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
["write", [_vehID, "Position", _pos]] call _db;
["write", [_vehID, "Direction", _dir]] call _db;
["write", [_vehID, "Damage", _dmg]] call _db;
["write", [_vehID, "Fuel", _fuel]] call _db;

["write", [_vehID, "Items", _items]] call _db;
["write", [_vehID, "Weapons", _weps]] call _db;
["write", [_vehID, "Magazines", _mags]] call _db;
["write", [_vehID, "Backpacks", _bpacks]] call _db;