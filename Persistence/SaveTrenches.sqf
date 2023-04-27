_db = ["new", format ["Trenches - %1 %2", missionName, worldName]] call oo_inidbi;

while {true} do {
	{
		_editorItems = (getMissionLayerEntities "MissionProps") select 0;
		_class = typeOf _x;
		_savedItems = ["ace_spectator_virtual", "ACE_envelope_big", "GRAD_envelope_short", "GRAD_envelope_long"];
		if (_class in _savedItems) then {
			_pos = getPosASL _x;
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
	sleep 20;
};