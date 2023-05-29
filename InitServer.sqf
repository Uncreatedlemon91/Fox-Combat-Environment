// Module based design mission framework
/*

*/
[] execVM "ServerEH.sqf";																					// Add server detectors
[] execVM "Regiments\AOCreator.sqf";
[] execVM "Logistics\startLogistics.sqf";																	// Add Logistics Module 
[] execVM "Persistence\startPersistence.sqf";																// Add Persistence Module 
[Ace_Arsenal, ["Get Kit", {createDialog "LoadoutMenu";}]] remoteExec ["addAction", 0, true];				// Add Loadout System
[] execVM "WorldBuilder\startWorldBuilder.sqf";																// Add environment + Ambience database and modules
