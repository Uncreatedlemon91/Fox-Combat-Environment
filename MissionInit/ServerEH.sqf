// Event handlers fired on the server. 
// NOTE: May need to get / send information to clients

// Get player information when they connect to the server. 
addMissionEventHandler ["PlayerConnected", {
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
_player = _uid call BIS_fnc_getUnitByUid;
	_db = ["new", ["%1 - %2", _name, _uid]] call oo_inidbi;
	_pos = getPosASL _player;
	_dir = getDir _player;
	_Loadout = getUnitLoadout _player;

	["write", ["Player Persistence", "Position", _pos]] call _db;
	["write", ["Player Persistence", "Direction", _dir]] call _db;
	["write", ["Player Persistence", "Loadout", _loadout]] call _db;

	while {alive _player} do {
		_pos = getPosASL _player;
		_dir = getDir _player;
		_Loadout = getUnitLoadout _player;
	};
}];


// Save player information when they disconnect. 