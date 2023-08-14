params ["_veh", "_wreck"];

// Setup databases for Wrecks and Player vehicles 
_pvic = ["new", format ["Player Vehicles %1 %2", missionName, worldName]] call oo_inidbi;
_wVic = ["new", format ["Wrecks %1 %2", missionName, worldName]] call oo_inidbi;


if (_wreck == 1) then {
	_pos = getPosATL _veh;
	_dir = getDir _veh;
	_type = typeOf _veh;
	_dmg = damage _veh;
	_netId = netId _veh;
	
	_data = [_type, _pos, _dir, _dmg];

	["write", [_netId, "Vehicle Info", _data]] call _wVic;
} else {
	_pos = getPosATL _veh;
	_dir = getDir _veh;
	_dmg = damage _veh;
	_fuel = fuel _veh;
	_type = typeOf _veh;
	_netId = netId _veh;
	_mags = magazinesAllTurrets _veh;
	{
		_x deleteAt 3;
	} forEach _mags;
	_items = getItemCargo _veh;
	_ammo = getMagazineCargo _veh;
	_weps = getWeaponCargo _veh;

	_data = [_type, _pos, _dir, _dmg, _fuel, _mags, _items, _ammo, _weps];

	["write", [_netId, "Vehicle Info", _data]] call _pVic;
};