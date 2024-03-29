// Sets up vehicle event handlers 
params ["_veh"];

// Database addition
_veh addEventHandler ["GetIn", {
	params ["_vehicle", "_role", "_unit", "_turret"];
	[_vehicle] remoteExec ["fce_fnc_saveVehicle", 2];
}];

_veh addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret", "_isEject"];
	[_vehicle] remoteExec ["fce_fnc_saveVehicle", 2];
}];

_veh addEventHandler ["Hit", {
	params ["_unit", "_source", "_damage", "_instigator"];
	[_unit] remoteExec ["fce_fnc_saveVehicle", 2];
}];

_veh addEventHandler ["ContainerClosed", {
	params ["_container", "_unit"];
	[_container] remoteExec ["fce_fnc_saveVehicle", 2];
}];

_veh addEventHandler ["Explosion", {
	params ["_vehicle", "_damage", "_source"];
	[_vehicle] remoteExec ["fce_fnc_saveVehicle", 2];
}];

// Add these event handlers to all vehicles
_veh addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[_unit] remoteExec ["fce_fnc_saveVehicle", 2];
}];
