// Module based design mission framework
/*
[] execVM "MissionStartup\LoadMap.sqf";
*/

[] execVM "MissionStartup\SetEnemies.sqf";				// Adds enemies to map
[] execVM "MissionStartup\Logistics.sqf";				// Add Logistics Module 
[] execVM "Persistence\LoadVehicle.sqf";				// Add Persistence Module 
[] execVM "MissionStartup\WorldBuilder.sqf";			// Add World Ambience Module
[] execVM "Loadouts\InitLoadout.sqf";					// Add Loadout System