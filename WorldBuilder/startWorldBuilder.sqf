[] execVM "WorldBuilder\WeatherManager.sqf";			// Weather and environment module 
[] remoteExec ["WorldBuilder\ATCManager.sqf", 0, true];				// ATC Script  
[] remoteExec ["fce_fnc_RadioSetup", 0, true];			// Setup radio frequencies on server and players
[] remoteExec ["fce_fnc_BuildingDmg", 2];				// Setup building damage tracker 
[] remoteExec ["fce_fnc_loadBuildings", 2];				// Load damage from previous ops to buildings