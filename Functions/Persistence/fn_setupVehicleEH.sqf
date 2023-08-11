// Sets up vehicle event handlers 
params ["_veh"];

if (_isVehicle) then {
	_veh setDamage 0.8;
	_veh setFuel 0.1;
};

// Debug 
// Database addition
_pDb = ["new", format ["Player Profiles %1 %2", missionName, worldName]] call oo_inidbi;

// If the vehicle is in a list of saved factions, add these event handlers
_savedFactions = ["ACM_I_HRA2", "BLU_F", "ACM_I_HRA"];
_vehFaction = getText (configfile >> "CfgVehicles" >> typeOf _veh >> "faction");
if (_vehFaction in _savedFactions) then {
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
};

// Add these event handlers to all vehicles
_veh addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[_unit, 1] remoteExec ["fce_fnc_saveVehicle", 2];
	[_unit] remoteExec ["fce_fnc_deleteVehicle", 2];
}];