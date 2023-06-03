params ["_veh", "_class"];

_Vdb = ["new", format ["ALLITEMS %1 %2", missionName, worldName]] call oo_inidbi;

_section = format ["%1 - %2 - %3", _class, netId _veh, random 3000];
// Get info 
_pos = getPosATL _veh;
_dir = getDir _veh;
_dmg = damage _veh;
_fuel = fuel _veh;

_items = getItemCargo _veh;
_mags = getMagazineCargo _veh;
_weps = getWeaponCargo _veh;
_backs = getBackpackCargo _veh;

_pitch = _veh call BIS_fnc_getPitchBank;

// Save to database 
["write", [_section, "Type", _class]] call _Vdb;
["write", [_section, "Position", _pos]] call _Vdb;
["write", [_section, "Direction", _dir]] call _Vdb;
["write", [_section, "Damage", _dmg]] call _Vdb;
["write", [_section, "Fuel", _fuel]] call _Vdb;

["write", [_section, "CargoItems", _items]] call _Vdb;
["write", [_section, "CargoMags", _mags]] call _Vdb;
["write", [_section, "CargoWeps", _weps]] call _Vdb;
["write", [_section, "CargoBps", _backs]] call _Vdb;
["write", [_section, "Pitch", _pitch]] call _Vdb;

// Add event handlers to monitor database changes 
_veh addEventHandler ["ContainerClosed", {
	params ["_container", "_unit"];
	_db = ["new", format ["ALLITEMS %1 %2", missionName, worldName]] call oo_inidbi;
	_class = typeOf _container;
	_section = format ["%1 - %2 - %3", _class, netId _container, random 3000];

	_items = getItemCargo _container;
	_mags = getMagazineCargo _container;
	_weps = getWeaponCargo _container;
	_backs = getBackpackCargo _container;
	_pos = getPosATL _veh;
	_dir = getDir _veh;

	["write", [_section, "CargoItems", _items]] call _db;
	["write", [_section, "CargoMags", _mags]] call _db;
	["write", [_section, "CargoWeps", _weps]] call _db;
	["write", [_section, "CargoBps", _backs]] call _db;
	["write", [_section, "Position", _pos]] call _Vdb;
	["write", [_section, "Direction", _dir]] call _Vdb;
}];

// Save damage of vehicle 
_veh addEventHandler ["Hit", {
	params ["_unit", "_source", "_damage", "_instigator"];
	_db = ["new", format ["ALLITEMS %1 %2", missionName, worldName]] call oo_inidbi;
	_class = typeOf _unit;
	_section = format ["%1 - %2 - %3", _class, netId _unit, random 3000];
	
	_dmg = damage _unit;
	["write", [_section, "Damage", _dmg]] call _db;
}];

// Save position and fuel of vehicle 
_veh addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret"];
	_db = ["new", format ["ALLITEMS %1 %2", missionName, worldName]] call oo_inidbi;
	_class = typeOf _vehicle;
	_fuel = fuel _vehicle;
	_pos = getPosATL _vehicle;
	_dir = getDir _vehicle;

	_section = format ["%1 - %2 - %3", _class, netId _vehicle, random 3000];
	["write", [_section, "Position", _pos]] call _db;
	["write", [_section, "Direction", _dir]] call _db;
	["write", [_section, "Fuel", _fuel]] call _db;
}];

_veh addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_class = typeOf _unit;
	_section = format ["%1 - %2 - %3", _class, netId _unit, random 3000];
	_db = ["new", format ["ALLITEMS %1 %2", missionName, worldName]] call oo_inidbi;
	["deleteSection", _section] call _db;
}];