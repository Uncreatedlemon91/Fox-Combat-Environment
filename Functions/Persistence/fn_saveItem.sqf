params ["_veh", "_class"];

_Vdb = ["new", format ["ALLITEMS %1 %2", missionName, worldName]] call oo_inidbi;

_section = format ["%1 - %2", _class, netId _veh];
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
_data = [_class, _pos, _dir, _dmg, _fuel, _items, _mags, _weps, _backs, _pitch];
["write", [_section, "Data", _data]] call _Vdb;

// Add event handlers to monitor database changes 
_veh addEventHandler ["ContainerClosed", {
	params ["_container", "_unit"];
	_db = ["new", format ["ALLITEMS %1 %2", missionName, worldName]] call oo_inidbi;
	_class = typeOf _container;
	_section = format ["%1 - %2 - %3", _class, netId _container, random 3000];

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
	_data = [_class, _pos, _dir, _dmg, _fuel, _items, _mags, _weps, _backs, _pitch];
	["write", [_section, "Data", _data]] call _Vdb;
}];

// Save damage of vehicle 
_veh addEventHandler ["Hit", {
	params ["_unit", "_source", "_damage", "_instigator"];
	_db = ["new", format ["ALLITEMS %1 %2", missionName, worldName]] call oo_inidbi;
	_class = typeOf _unit;
	_section = format ["%1 - %2", _class, netId _unit];
	
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
	_data = [_class, _pos, _dir, _dmg, _fuel, _items, _mags, _weps, _backs, _pitch];
	["write", [_section, "Data", _data]] call _Vdb;
}];

// Save position and fuel of vehicle 
_veh addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret"];
	_db = ["new", format ["ALLITEMS %1 %2", missionName, worldName]] call oo_inidbi;
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
	_data = [_class, _pos, _dir, _dmg, _fuel, _items, _mags, _weps, _backs, _pitch];
	["write", [_section, "Data", _data]] call _Vdb;
}];

_veh addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_class = typeOf _unit;
	_section = format ["%1 - %2", _class, netId _unit];
	_db = ["new", format ["ALLITEMS %1 %2", missionName, worldName]] call oo_inidbi;
	["deleteSection", _section] call _db;
}];