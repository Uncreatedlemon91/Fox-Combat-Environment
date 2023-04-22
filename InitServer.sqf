// Module based design mission framework
/*

*/

[] execVM "MissionStartup\SetEnemies.sqf";																	// Adds enemies to map
[] execVM "MissionStartup\Logistics.sqf";																	// Add Logistics Module 
[] execVM "Persistence\LoadVehicle.sqf";																	// Add Persistence Module 
[Ace_Arsenal, ["Get Kit", {createDialog "LoadoutMenu";}]] remoteExec ["addAction", 0, true];				// Add Loadout System
[] execVM "MissionStartup\Worldbuilder.sqf";																// Add environment database and modules