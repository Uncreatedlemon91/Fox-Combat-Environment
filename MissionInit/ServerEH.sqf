// Event handlers fired on the server. 
// NOTE: May need to get / send information to clients

// Get player information when they connect to the server. 
addMissionEventHandler ["PlayerConnected", {
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	[_uid] execVM "Player\PlayerPersistence.sqf";
}];

// Save player information when they disconnect. 