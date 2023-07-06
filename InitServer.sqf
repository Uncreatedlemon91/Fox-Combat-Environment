// Module based design mission framework
// Find and run server event handlers 
[] execVM "ServerEH.sqf";
// Create Regiment and Locations 
[] execVM "Regiments\AOCreator.sqf";
// Start Logistics Module
[] execVM "Logistics\startLogistics.sqf";
// Start persistence module 
[] execVM "Persistence\startPersistence.sqf";
// Add loadouts and gear on menu
[Ace_Arsenal, ["Get Kit", {call fce_fnc_loadoutMenu}]] remoteExec ["addAction", 0, true];
// Start environmental module
[] execVM "WorldBuilder\startWorldBuilder.sqf";
// Set combat radios to right channels and frequencies 
[] remoteExec ["fce_fnc_setRadios", 0, true];

