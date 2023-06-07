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