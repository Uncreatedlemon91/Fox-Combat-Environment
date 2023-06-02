params ["_veh"];
// Create initial save entry 
_db = ["new", format ["PVics %1 %2", missionName, worldName]] call oo_inidbi;
_class = typeOf _veh;
_section = format ["%1 - %2", _class, netID _veh];

_pos = getPosATL _veh;
_dir = getDir _veh;
_fuel = fuel _veh;
_dmg = damage _veh;
_items = getItemCargo _veh;
_mags = getMagazineCargo _veh;
_weps = getWeaponCargo _veh;
_backs = getBackpackCargo _veh;
_cargoSpace = 2;

if (_class == "ACM_B_NAG_Tatra") then {
	_cargoSpace = 20;
};
if (_class == "B_UGV_01_F") then {
	_cargoSpace = 10;
};
if (_class == "ACM_B_NAG_MI171_Unarmed") then {
	_cargoSpace = 10;
};


["write", [_section, "Position", _pos]] call _db;
["write", [_section, "Direction", _dir]] call _db;
["write", [_section, "Fuel", _fuel]] call _db;
["write", [_section, "Damage", _dmg]] call _db;
["write", [_section, "CargoItems", _items]] call _db;
["write", [_section, "CargoMags", _mags]] call _db;
["write", [_section, "CargoWeps", _weps]] call _db;
["write", [_section, "CargoBps", _backs]] call _db;
["write", [_section, "CargoSpace", _cargoSpace]] call _db;

// Save cargo
_veh addEventHandler ["ContainerClosed", {
	params ["_container", "_unit"];
	_db = ["new", format ["PVics %1 %2", missionName, worldName]] call oo_inidbi;
	_class = typeOf _container;
	_section = format ["%1 - %2", _class, netId _container];

	_items = getItemCargo _container;
	_mags = getMagazineCargo _container;
	_weps = getWeaponCargo _container;
	_backs = getBackpackCargo _container;

	["write", [_section, "CargoItems", _items]] call _db;
	["write", [_section, "CargoMags", _mags]] call _db;
	["write", [_section, "CargoWeps", _weps]] call _db;
	["write", [_section, "CargoBps", _backs]] call _db;
}];

// Save damage of vehicle 
_veh addEventHandler ["Hit", {
	params ["_unit", "_source", "_damage", "_instigator"];
	_db = ["new", format ["PVics %1 %2", missionName, worldName]] call oo_inidbi;
	_class = typeOf _unit;
	_section = format ["%1 - %2", _class, netId _unit];
	
	_dmg = damage _unit;
	["write", [_section, "Damage", _dmg]] call _db;
}];

// Save position and fuel of vehicle 
_veh addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret"];
	_db = ["new", format ["PVics %1 %2", missionName, worldName]] call oo_inidbi;
	_class = typeOf _vehicle;
	_fuel = fuel _vehicle;
	_pos = getPos _vehicle;
	_dir = getDir _vehicle;

	_section = format ["%1 - %2", _class, netId _vehicle];
	["write", [_section, "Position", _pos]] call _db;
	["write", [_section, "Direction", _dir]] call _db;
	["write", [_section, "Fuel", _fuel]] call _db;
}];

_veh addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_db = ["new", format ["PVics %1 %2", missionName, worldName]] call oo_inidbi;
	_class = typeOf _unit;
	_fuel = fuel _unit;
	_pos = getPos _unit;
	_dir = getDir _unit;
	_dmg = damage _unit;

	_name = gettext (configfile >> "CfgVehicles" >> _class >> "displayName");

	_section = format ["%1 - %2", _class, netId _unit];
	["write", [_section, "Position", _pos]] call _db;
	["write", [_section, "Direction", _dir]] call _db;
	["write", [_section, "Fuel", _fuel]] call _db;
	["write", [_section, "Damage", _dmg]] call _db;

	[_unit] remoteExec ["fce_fnc_wreckSetup", 0, true];
}];