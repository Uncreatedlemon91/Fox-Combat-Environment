params ["_veh"];
// Add event Handler to vehicle and save to database 
_veh addEventHandler ["ContainerClosed", {
	params ["_container", "_unit"];
	_vehID = _container getVariable "SavedData";
	[_container, _vehID] remoteExec ["fce_fnc_SaveVehicle", 2];
}];

_veh addEventHandler ["Hit", {
	params ["_unit", "_selection", "_damage", "_hitIndex", "_hitPoint", "_shooter", "_projectile"];
	_vehID = _unit getVariable "SavedData";
	[_unit, _vehID] remoteExec ["fce_fnc_saveVehicle", 2];
}];

_veh addEventHandler ["Engine", {
	params ["_vehicle", "_engineState"];
	_vehID = _veh getVariable "SavedData";
	[_vehicle, _vehID] remoteExec ["fce_fnc_saveVehicle", 2];
}];

_veh addEventHandler ["Fuel", {
	params ["_vehicle", "_hasFuel"];
	_vehID = _veh getVariable "SavedData";
	[_vehicle, _vehID] remoteExec ["fce_fnc_saveVehicle", 2];
}];

_veh addEventHandler ["GetIn", {
	params ["_vehicle", "_role", "_unit", "_turret"];
	_vehID = _veh getVariable "SavedData";
	[_vehicle, _vehID] remoteExec ["fce_fnc_saveVehicle", 2];
}];

_veh addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret"];
	_vehID = _veh getVariable "SavedData";
	[_vehicle, _vehID] remoteExec ["fce_fnc_saveVehicle", 2];
}];

_veh addEventHandler ["HandleDamage", {
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit"];
	_vehID = _unit getVariable "SavedData";
	[_unit, _vehID] remoteExec ["fce_fnc_saveVehicle", 2];
}];

_veh addEventHandler ["Hit", {
	params ["_unit", "_source", "_damage", "_instigator"];
	_vehID = _unit getVariable "SavedData";
	[_unit, _vehID] remoteExec ["fce_fnc_saveVehicle", 2];
}];

_veh addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_vehID = _unit getVariable "SavedData";
	[_unit, _vehID] remoteExec ["fce_fnc_saveVehicle", 2];
}];

_veh addEventHandler ["LandedTouchDown", {
	params ["_plane", "_airportID", "_airportObject"];
	_vehID = _plane getVariable "SavedData";
	[_plane, _vehID] remoteExec ["fce_fnc_saveVehicle", 2];
}];

_veh addEventHandler ["SeatSwitched", {
	params ["_vehicle", "_unit1", "_unit2"];
	_vehID = _veh getVariable "SavedData";
	[_vehicle, _vehID] remoteExec ["fce_fnc_saveVehicle", 2];
}];


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