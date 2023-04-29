_db = ["new", format ["Craters - %1 %2", missionName, worldName]] call oo_inidbi;
debugLog "Craters Saving";

while {true} do {
	"delete" call _db;
	_db = ["new", format ["Craters - %1 %2", missionName, worldName]] call oo_inidbi;
	
	{
		_class = typeOf _x;
		_savedItems = ["ACE_envelope_big", "GRAD_envelope_giant", "GRAD_envelope_long", "GRAD_envelope_short", "ACE_envelope_small", "GRAD_envelope_vehicle"];
		if (_class in _savedItems) then {
			_pos = getPos _x;
			_type = typeOf _x;
			_dir = getDir _x;
			_dmg = damage _x;
			
			// Save to database 
			_section = format ["%1 - %2", _type, netId _x];
			["write", [_section, "Type", _type]] call _db;
			["write", [_section, "Position", _pos]] call _db;
			["write", [_section, "Direction", _dir]] call _db;
			["write", [_section, "Damage", _dmg]] call _db;
		};
	} forEach allMissionObjects "All";
	sleep 60;
};