// Grab all current player data 
// Needs to grab Name, UID, Current Role, current whitelisted roles 
params ["_netID"];

// Establish the database object 
_db = ["new", "Player Profiles"] call oo_inidbi;
_rDb = ["new", format ["Fox Kits %1 %2", missionName, worldName]] call oo_inidbi;

_loadouts = "getSections" call _rDb;
_players = "getSections" call _db;

// Scan each section / player and grab information into an array
_playerInfo = []; 
{
	_name = ["read", [_x, "Name"]] call _db;
	_uid = _x;

	_data = [_name, _uid];

	// Add Data to full array 
	_playerInfo pushback _data;
} forEach _players;

// Send data to client 
[_playerInfo, _loadouts] remoteExec ["fce_fnc_OpenWlMenu", _netID];
