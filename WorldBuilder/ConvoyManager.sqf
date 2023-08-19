// Manages the convoy functions 
_opfordb = ["new", format ["OPFOR Compositions %1 %2", missionName, worldName]] call oo_inidbi;
_regDb = ["new", format ["o Regiments - %1 %2", missionName, worldName]] call oo_inidbi;

// Variables 
_arty = ["read", ["opfArty", "Classes"]] call _opfordb;
_aa = ["read", ["opfAA", "Classes"]] call _opfordb;

while {true} do {
	if (playersNumber west > 0) then {
		systemChat "Running Convoy!";
		_deployClass = "";
		// Get locations that are hostile still 
		_sections = "getSections" call _regDb;
		_locations = [];
		{
			_pos = ["read", [_x, "Position"]] call _regDb;
			_locations pushback _pos;	
		} forEach _sections;
		_deployPoint = selectRandom _locations;
		_deployPoint = [_deployPoint, 0, 200, 7, 0, 10, 0, ["base"]] call BIS_fnc_findSafePos;
		_deployType = selectRandom ["OPFOR AA Sites", "Opfor Artillery"];

		switch (_deployType) do {
			case "OPFOR AA Sites": {_deployClass = selectRandom _aa};
			case "Opfor Artillery": {_deployClass = selectRandom _arty};
		};

		[_deployClass, _deployPoint, _deployType] remoteExec ["fce_fnc_createConvoy", 2];
	};
	sleep random [600, 1200, 1800];
};