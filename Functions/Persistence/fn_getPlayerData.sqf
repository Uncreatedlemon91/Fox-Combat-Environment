params ["_name", "_uid", "_netID"];
_db = ["new", "Player Profiles"] call oo_inidbi;
_ddb = ["new", format ["Player Deaths %1 %2", missionName, worldName]] call oo_inidbi;

// Get player data from the player database
_getSections = "getSections" call _db;
if (_uid in _getSections) then {
	_date = format ["%4%5/%2%3/%1",
		systemTime select 0,
		["", "0"] select (systemTime select 1 < 10),
		systemTime select 1,
		["", "0"] select (systemTime select 2 < 10),
		systemTime select 2
	];
	_keys = ["getKeys", _date] call _ddb;

	if (_uid in _keys) then {
		// Player is dead, force them to ACE Spectator
		[] remoteExec ["fce_fnc_startSpec", _netID];
	} else {
		_pos = ["read", [_uid, "Position"]] call _db;
		_gear = ["read", [_uid, "Gear"]] call _db;
		_dir = ["read", [_uid, "Direction"]] call _db;
		_roles = ["read", [_uid, "Roles"]] call _db;
		_curRole = ["read", [_uid, "CurrentRole"]] call _db;
		_med = ["read", [_uid, "Med"]] call _db;
		_face = ["read", [_uid, "Face"]] call _db;

		// Set Kit expectations 
		_kitdb = ["new", format ["Fox Kits %1 %2", missionName, worldName]] call oo_inidbi;
		_kit = ["read", [_curRole, "Loadout"]] call _kitdb;

		systemchat format ["[getPlayer] - Med %1", _med];

		// Send Data to player 
		[_pos, _gear, _dir, _roles, _curRole, _kit, _med, _face] remoteExec ["fce_fnc_loadPlayer", _netID];
	};	
} else {
	_spawnPoint = getPosATL ace_arsenal;
	_name = ["write", [_uid, "Name", _name]] call _db;
	_pos = ["write", [_uid, "Position", _spawnPoint]] call _db;
	_gear = ["write", [_uid, "Gear", ""]] call _db;
	_dir = ["write", [_uid, "Direction", 0]] call _db;
	_roles = ["write", [_uid, "Roles", [
		"Rifleman",
		"Off Duty"
	]]] call _db;
};