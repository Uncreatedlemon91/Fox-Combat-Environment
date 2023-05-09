params ["_veh", "_class", "_canCarry", "_vehWeight"];

_Vdb = ["new", format ["ALLITEMS %1 %2", missionName, worldName]] call oo_inidbi;


while {true} do {
	_missionLayer = (getmissionlayerEntities "MissionProps") select 0;
	if (_veh in _missionLayer) then {} else {	
		// Get info 
		_pos = getPos _veh;
		_dir = getDir _veh;
		_dmg = damage _veh;
		_fuel = fuel _veh;

		_items = getItemCargo _veh;
		_mags = getMagazineCargo _veh;
		_weps = getWeaponCargo _veh;
		_backs = getBackpackCargo _veh;

		// Save to database 
		_section = format ["%1 - %2", _class, netId _veh];
		["write", [_section, "Type", _class]] call _Vdb;
		["write", [_section, "Position", _pos]] call _Vdb;
		["write", [_section, "Direction", _dir]] call _Vdb;
		["write", [_section, "Damage", _dmg]] call _Vdb;
		["write", [_section, "Fuel", _fuel]] call _Vdb;
		
		["write", [_section, "CargoItems", _items]] call _Vdb;
		["write", [_section, "CargoMags", _mags]] call _Vdb;
		["write", [_section, "CargoWeps", _weps]] call _Vdb;
		["write", [_section, "CargoBps", _backs]] call _Vdb;
	};
	sleep 5;
};