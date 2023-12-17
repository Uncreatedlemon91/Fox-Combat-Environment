// Module based design mission framework
// Define classes used in the framework 
[] remoteExec ["Fce_fnc_defineClasses", 2];
sleep 1;

// Create Regiment and Locations 
[] remoteExec ["fce_fnc_Objectives", 2];

// Start Logistics Module
[] remoteExec ["fce_fnc_startLogistics", 0, true];
[] remoteExec ["fce_fnc_convoyManager", 2];

// Start persistence module 
[] remoteExec ["fce_fnc_loadVehicles", 2];
[] remoteExec ["fce_fnc_loadItems", 2];

// Add loadouts and gear on menu
[] remoteExec ["fce_fnc_loadout_DefineKits", 0, true];

// Add whitelist Controller 
[] remoteExec ["fce_fnc_initWL", 0, true];

// Start environmental module
[] execVM "WorldBuilder\startWorldBuilder.sqf";

// Add event handlers 
addMissionEventHandler ["HandleDisconnect", {
	params ["_unit"];
	[_unit] remoteExec ["fce_fnc_savePlayer", 2];
}];

/*
// Loop module starts
while {true} do {
	[] call fce_fnc_convoyManager;
	sleep random [10, 300, 600];
};