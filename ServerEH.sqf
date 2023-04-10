// Event handlers fired on the server. 
// NOTE: May need to get / send information to clients

// Get player information when they connect to the server. 
addMissionEventHandler ["PlayerConnected", {
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	_db = ["new", format ["%1 - %2", _name, _uid]] call oo_inidbi;
	_exists = "Exists" call _db;
	["write", ["Player Information", "Name", _name]] call _db;
	["write", ["Player Information", "UID", _uid]] call _db;
	["write", ["Player Company Information", "Roles", []]] call _db;
	["write", ["Player Company Information", "S-Shops", []]] call _db;

	// Disable channels 
	_channels = [0, 1, 2, 3, 4];
	{
		// Current result is saved in variable _x
		_x enableChannel [false, false];
	} forEach _channels;

	if (_exists) then {
		_unit = _uid call BIS_fnc_getUnitByUid;
		_pos = ["read", ["Player Persistence", "Position"]] call _db;
		_dir = ["read", ["Player Persistence", "Direction"]] call _db;
		_loadout = ["read", ["Player Persistence", "Loadout"]] call _db;
		_data = [_pos, _dir, _loadout];

		[[_data], "Player\PlayerLoad.sqf"] remoteExec ["execvm", _owner];
	};
}];

// Save player information when they disconnect. 

// When an enemy unit is killed.
addMissionEventHandler ["EntityKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	["Enemy Killed!"] remoteExec ["systemChat", 0];
}];
