[] execVM "WorldBuilder\WeatherManager.sqf";			// Weather and environment module 
[] execVM "WorldBuilder\ConvoyManager.sqf";				// Convoy setup and build in 
[] execVM "WorldBuilder\ATCManager.sqf";				// ATC Script  
[] remoteExec ["fce_fnc_RadioSetup", 0, true];			// Setup radio frequencies on server and players
