[] execVM "WorldBuilder\WeatherManager.sqf";			// Weather and environment module 
[] execVM "WorldBuilder\ConvoyManager.sqf";				// Convoy setup and build in 
[] execVM "WorldBuilder\ATCManager.sqf";				// ATC Script  
[] remoteExec ["fce_fnc_RadioSetup", 0, true];			// Setup radio frequencies on server and players
[afterlife_teleporter, ["Return to the world", {
	params ["_target", "_caller", "_actionId", "_arguments"];
	[_caller] remoteExec ["fce_fnc_respawnPlayer", 2]
}]] remoteExec ["addaction", 0, true]; 		// allow players to rejoin the fight
