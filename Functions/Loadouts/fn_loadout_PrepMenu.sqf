// Gets the player's data and pulls their current approved loadouts 
// into a list box, enabling them to select them. 
params ["_caller", "_netID"];
// Initialize database reference 
_pDb = ["new", "Player Profiles"] call oo_inidbi;

// get the player's information from pDb (Player Database)
_uid = getPlayerUID _caller;

_whitelisted = ["read", [_uid, "Roles"]] call _pDb;

// Send data to the client 
[_whitelisted] remoteExec ["fce_fnc_Loadout_OpenMenu", _netID, false];