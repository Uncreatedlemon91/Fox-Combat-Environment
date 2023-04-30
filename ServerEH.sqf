// Add player to death list 
addMissionEventHandler ["EntityKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	if (_unit in allPlayers) then [
		_name = name _unit;
		_uid = getPlayerUID _unit;
		_pos = getPos _unit;

		_db = ["new", "Dead Players"] call oo_inidbi;
		_section = format ["%1 %2", _name, _uid];
		["write", [_section, "Name", _name]] call _db;
		["write", [_section, "UID", _uid]] call _db;
		["write", [_section, "Pos", _pos]] call _db;
		["write", [_section, "Killer", _killer]] call _db;
	];
}];