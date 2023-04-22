_clients = allPlayers - entities "HeadlessClient_F";
_db = ["new", format ["Players %1 %2", missionName, worldName]] call oo_inidbi;
while {true} do {
	{
		sleep 10;
		// Current result is saved in variable _x
		_name = name _x;
		_uid = getPlayerUID _x;
		_pos = getPosASL _x;
		_dir = getDir _x;
		_kit = getUnitLoadout _x;

		["write", [format ["%1 - %2", _name, _uid], "Name", _name]] call _db;
		["write", [format ["%1 - %2", _name, _uid], "UID", _uid]] call _db;
		["write", [format ["%1 - %2", _name, _uid], "Position", _pos]] call _db;
		["write", [format ["%1 - %2", _name, _uid], "Direction", _dir]] call _db;
		["write", [format ["%1 - %2", _name, _uid], "Loadout", _kit]] call _db;
	} forEach _clients;
};