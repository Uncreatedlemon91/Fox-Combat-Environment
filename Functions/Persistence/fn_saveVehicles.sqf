params ["_veh"];
// Create initial save entry 

while {true} do {
	sleep 5;
	_db = ["new", format ["PVics %1 %2", missionName, worldName]] call oo_inidbi;
	_class = typeOf _veh;
	//_section = format ["%1 - %2", _class, netID _veh];
	_section = str _x;

	_pos = getPosATL _veh;
	_dir = getDir _veh;
	_fuel = fuel _veh;
	_dmg = damage _veh;
	_items = getItemCargo _veh;
	_mags = getMagazineCargo _veh;
	_weps = getWeaponCargo _veh;
	_backs = getBackpackCargo _veh;
	/*_cargoSpace = 2;

	if (_class == "ACM_B_NAG_Tatra") then {
		_cargoSpace = 20;
	};
	if (_class == "B_UGV_01_F") then {
		_cargoSpace = 10;
	};
	if (_class == "ACM_B_NAG_MI171_Unarmed") then {
		_cargoSpace = 10;
	};
	*/


	["write", [_section, "Position", _pos]] call _db;
	["write", [_section, "Direction", _dir]] call _db;
	["write", [_section, "Fuel", _fuel]] call _db;
	["write", [_section, "Damage", _dmg]] call _db;
	["write", [_section, "CargoItems", _items]] call _db;
	["write", [_section, "CargoMags", _mags]] call _db;
	["write", [_section, "CargoWeps", _weps]] call _db;
	["write", [_section, "CargoBps", _backs]] call _db;
	["write", [_section, "CargoSpace", _cargoSpace]] call _db;

	sleep 5;
};