params ["_regiment", "_side"];
_db = ["new", format ["%1 Regiments - %2 %3", _side, missionName, worldName]] call oo_inidbi;
_sections = "getSections" call _db;

// Get data from db
_type = ["read", [_regiment, "Type"]] call _db;
_size = ["read", [_regiment, "Size"]] call _db;
_skill = ["read", [_regiment, "Skill"]] call _db;
_pos = ["read", [_regiment, "Position"]] call _db;
_mkrType = ["read", [_regiment, "Marker"]] call _db;
_speed = ["read", [_regiment, "Speed"]] call _db;
_side = ["read", [_regiment, "Side"]] call _db;

while {true} do {
	// Virtualize new group 
	if (_size > 0) then {
		_size = _size - 1;
		["write", [_regiment, "Size", _size]] call _db;
		_platoonSize = round (random [3, 5, 7]);
		_platoonComp = [];
		_values = [];
		switch (_type) do {
			case "Infantry": {_values = [0.6, 0.2, 0.2, 0.2, 0.1]};
			case "Mechanized": {_values = [0.3, 0.6, 0.2, 0.2, 0.2]};
			case "Motorized": {_values = [0.2, 0.3, 0.5, 0.2, 0.1]};
			case "Special Operations": {_values = [0.3, 0.1, 0.2, 0.6, 0.1]};
			case "Armored": {_values = [0.3, 0.2, 0.2, 0.2, 0.4]};
		};
		for "_i" from 1 to _platoonSize do {
			_pickSquad = selectRandomWeighted ["Infantry", _values select 0, "Mechanized", _values select 1, "Motorized", _values select 2, "Special Operations", _values select 3, "Armored", _values select 4];
			_platoonComp pushback _pickSquad;
		};

		

		// Send platoon to objective area
		_size = _size - 1;
		["write", [_regiment, "size", _size]] call _db;
		_mkr = createMarkerLocal [format ["Platoon %1-%2-%3", _regiment, _platoonSize, random 1000], _pos];
		_mkr setMarkerTypeLocal _mkrType;
		_mkr setMarkerSizeLocal [0.3, 0.3];
		_mkr setMarkerAlpha 0.1;
		};
	};
};