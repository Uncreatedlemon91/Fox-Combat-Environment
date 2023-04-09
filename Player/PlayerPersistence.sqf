while {true} do {
	{
		// Current result is saved in variable _x
		_name = name _x;
		_uid = getPlayerUID _x;
		_pos = getPosASL _x;
		_dir = getDir _x;
		_Loadout = getUnitLoadout _x;

		_db = ["new", format ["%1 - %2", _name, _uid]] call oo_inidbi;

		["write", ["Player Persistence", "Position", _pos]] call _db;
		["write", ["Player Persistence", "Direction", _dir]] call _db;
		["write", ["Player Persistence", "Loadout", _loadout]] call _db;
	} forEach allPlayers;
	sleep 5;
};
