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
		_mkr setMarkerAlpha 0.2;

		_trg = createTrigger ["emptyDetector", _pos];
		_trg setTriggerArea [1000, 1000, 0, false, 500];
		_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
		_trg setVariable ["Active", false];
		_trg setVariable ["PlatoonComp", _platoonComp];
		_trg setVariable ["Side", _side];
		_trg setTriggerStatements [
			"this",
			"[thisTrigger] remoteExec [""fce_fnc_spawnAI"", 2]",
			""
		];

		_Objdb = ["new", format ["Objectives %1-%2", missionName, worldName]] call oo_inidbi;
		_Objsections = "getSections" call _Objdb;
		_objective = selectRandom _objSections;
		_objPosOrigin = ["read", [_objective, "Position"]] call _Objdb;
		_objPos = [_objPosOrigin, 10, 500, 5, 0, 10, 0, ["base"], _objPosOrigin] call BIS_fnc_findSafePos;

		// Calculate direction and distance between positions
		_markerPosDiff = _objPos vectorDiff _pos;
		_markerPosDir = vectorNormalized _markerPosDiff;

		// Loop to update position of the marker over time
		_markerPos = _pos;
		_trgActive = _trg getVariable "Active";
		while {_markerPos distance _objPos > 10} do {
			if (_trgActive) then {
				
			} else {
				_markerPos = _markerPos vectorAdd (_markerPosDir vectorMultiply _speed * 0.05);
				_mkr setMarkerPos _markerPos;
				_trg setPos _markerPos;
				sleep 0.05;
			};
		};
	};
};