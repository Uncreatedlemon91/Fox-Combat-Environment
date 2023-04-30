// Add player to death list 
addMissionEventHandler ["EntityKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	if (isPlayer _unit) then [
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

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	
	_pos = getPosASL _unit;
	_dir = getDir _unit;
	_kit = getUnitLoadout _unit;

	_db = ["new", format ["Players %1 %2"], _name, _uid];
	_section = format ["%1 %2", _name, _uid];
	["write", [_section, "Name", _name]] call _db;
	["write", [_section, "SteamID", _uid]] call _db;
	["write", [_section, "Position", _pos]] call _db;
	["write", [_section, "Direction", _dir]] call _db;
	["write", [_section, "Loadout", _kit]] call _db;
	true;
	deleteVehicle _unit;
}];