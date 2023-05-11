params ["_veh", "_class"];

_Vdb = ["new", format ["ALLITEMS %1 %2", missionName, worldName]] call oo_inidbi;


while {true} do {
	_section = format ["%1 - %2", _class, netId _veh];
	// Get info 
	_pos = getPos _veh;
	_dir = getDir _veh;
	_dmg = damage _veh;
	_fuel = fuel _veh;

	_items = getItemCargo _veh;
	_mags = getMagazineCargo _veh;
	_weps = getWeaponCargo _veh;
	_backs = getBackpackCargo _veh;

	if (_dmg  == 1) exitWith {
		["deleteSection", _section] call _Vdb;
	};
	
	
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

	sleep 30;
};