// Sets up vehicle event handlers 
params ["_veh"];

// Database addition
_pDb = ["new", format ["Player Profiles %1 %2", missionName, worldName]] call oo_inidbi;

_veh addEventHandler ["GetIn", {
	params ["_vehicle", "_role", "_unit", "_turret"];
	[_vehicle, 0] remoteExec ["fce_fnc_saveVehicle", 2];
}];

_veh addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret", "_isEject"];
	[_vehicle, 0] remoteExec ["fce_fnc_saveVehicle", 2];
}];

_veh addEventHandler ["Hit", {
	params ["_unit", "_source", "_damage", "_instigator"];
	[_unit, 0] remoteExec ["fce_fnc_saveVehicle", 2];
}];

_veh addEventHandler ["ContainerClosed", {
	params ["_container", "_unit"];
	[_container, 0] remoteExec ["fce_fnc_saveVehicle", 2];
}];

_veh addEventHandler ["Explosion", {
	params ["_vehicle", "_damage", "_source"];
	[_vehicle, 0] remoteExec ["fce_fnc_saveVehicle", 2];
}];

// Add these event handlers to all vehicles
_veh addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[_unit, 1] remoteExec ["fce_fnc_saveVehicle", 2];
	[_unit] remoteExec ["fce_fnc_deleteVehicle", 2];
}];

// Setup ACRE Radio on the vehicle 
[_veh, ["ACRE_VRC103", "FOX Radio Network", "Land", false, ["inside"], ["CARGO"], "ACRE_PRC117F", [], []], true] call acre_api_fnc_addRackToVehicle;

// If the vehicle is a phone line 
if (_class == "Land_IPPhone_01_sand_F") then {
	[_veh, ["ACRE_VRC103", "FOX Landlines", "Dash", false, ["external"], [], "ACRE_PRC148", [], []], true] call acre_api_fnc_addRackToVehicle;
	
	// Get the radio 
	_radios = [_veh] call acre_api_fnc_getVehicleRacks;

	// Set radio to speaker + change to channel 101 for landline
	{
		[_x, true] call acre_api_fnc_setRadioSpeaker;
		[_x, 101] call acre_api_fnc_setRadioChannel;
	} forEach _radios;
};