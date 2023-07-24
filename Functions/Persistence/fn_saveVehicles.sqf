_pvic = ["new", format ["Player Vehicles %1 %2", missionName, worldName]] call oo_inidbi;
_wVic = ["new", format ["Wrecks %1 %2", missionName, worldName]] call oo_inidbi;
{
	_faction = getText (configfile >> "CfgVehicles" >> typeOf _x >> "faction");
	_factions = ["ACM_B_NAG", "BLU_F", "OPF_F"];
	if ((_faction in _factions) && (alive _x)) then {
		_pos = getPosATL _x;
		_dir = getDir _x;
		_dmg = damage _x;
		_fuel = fuel _x;
		_type = typeOf _x;
		_netId = netId _x;

		_data = [_type, _pos, _dir, _dmg, _fuel];

		["write", [_netId, "Vehicle Info", _data]] call _pVic;
	};

	if !(alive _x) then {
		_pos = getPosATL _x;
		_dir = getDir _x;
		_type = typeOf _x;
		_netId = netId _x;

		_data = [_type, _pos, _dir];

		["write", [_netId, "Vehicle Info", _data]] call _wVic;
	};
} forEach vehicles;