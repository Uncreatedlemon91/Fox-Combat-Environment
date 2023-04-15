while {true} do {
	// Get info 
	_name = name player;
	_uid = getPlayerUID player;

	_pos = getPosASL player;
	_dir = getDir player;
	_gear = getUnitLoadout player;
	_alive = alive player;

	// Send to server 
	_data = [_name, _uid, _pos, _dir, _gear, _alive];
	_data remoteExec ["fce_fnc_savePlayer", 2];

	sleep 10;
};