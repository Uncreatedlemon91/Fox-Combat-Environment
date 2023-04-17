_db = ["new", format ["Vehicles - %1 %2", missionName, worldName]] call oo_inidbi;

while {true} do {
	{
		"delete" call _db;
		_db = ["new", format ["Vehicles - %1 %2", missionName, worldName]] call oo_inidbi;
		_editorItems = (getMissionLayerEntities "MissionProps") select 0;
		if (_x in _editorItems) then {
			
		} else {
			_pos = getPosASL _x;
			_type = typeOf _x;
			_dir = getDir _x;
			_dmg = damage _x;
			_fuel = fuel _x;

			_items = getItemCargo _x;
			_mags = getMagazineCargo _x;
			_weps = getWeaponCargo _x;
			_backs = getBackpackCargo _x;

			
			// Save to database 
			_section = format ["%1 - %2", _type, netId _x];
			["write", [_section, "Type", _type]] call _db;
			["write", [_section, "Position", _pos]] call _db;
			["write", [_section, "Direction", _dir]] call _db;
			["write", [_section, "Damage", _dmg]] call _db;
			["write", [_section, "Fuel", _fuel]] call _db;
			
			["write", [_section, "CargoItems", _items]] call _db;
			["write", [_section, "CargoMags", _mags]] call _db;
			["write", [_section, "CargoWeps", _weps]] call _db;
			["write", [_section, "CargoBps", _backs]] call _db;
		};
	} forEach vehicles;
	sleep 20;
};