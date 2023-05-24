// Functions 
fce_fnc_createRegiment = {
	// Name the regiment
	params ["_faction", "_side"];
	_reg1 = round (random 300);
	_reg2 = selectRandom ["Infantry", "Mechanized", "Armored", "Recon"];
	_reg3 = selectRandom ["Platoon", "Company"];
	_reg1 = [_reg1, "english"] call BIS_fnc_ordinalNumber;
	_regiment = format ["%1 %2 %3", _reg1, _reg2, _reg3];

	// Determine size of regiment 
	_regSize = 0;
	switch (_reg3) do {
		case "Platoon": {_regSize = round (random [4, 5, 6])};
		case "Company": {_regSize = round (random [6, 7, 8])};
	};

	// Determine the specialization
	_regGroups = [];
	_mkrSide = "";
	_values = [];
	switch (_reg3) do {
		case "Infantry": {_values = [0.5, 0.1, 0.1, 0.2]};
		case "Mechanized": {_values = [0.3, 0.2, 0.1, 0.1]};
		case "Armored": {_values = [0.2, 0.2, 0.3, 0.2]};
		case "Recon": {_values = [0.4, 0.2, 0.1, 0.5]};
	};
	switch (_side) do {
		case west: {_mkrSide = "b"};
		case east: {_mkrSide = "o"};
	};
	for "_i" from 1 to _regSize do {
		_mkrType = selectRandomWeighted [format ["%1_inf", _mkrSide], _values select 0, format ["%1_mech_inf", _mkrSide], _values select 1, format ["%1_armor", _mkrSide], _values select 2, format ["%1_recon", _mkrSide], _values select 3];
		_regGroups pushback _mkrType;
	};
	
	// Write data to server 
	_db = ["new", format ["%3 Regiments %1 - %2", missionName, worldName, _side]] call oo_inidbi;
	["write", [_regiment, "Name", _regiment]] call _db;
	["write", [_regiment, "Type", _reg3]] call _db;
	["write", [_regiment, "Side", _side]] call _db;
	["write", [_regiment, "Faction", _faction]] call _db;
	["write", [_regiment, "GroupSize", _regSize]] call _db;
	["write", [_regiment, "Group Composition", _regGroups]] call _db;

	_regiment;
};

fce_fnc_CreateMapMarkers = {
	_flashPos = [] call BIS_fnc_randomPos;
	_flashMkr = createMarkerLocal ["Flashpoint", _flashPos];
	_flashMkr setMarkerColorLocal "ColorGrey";
	_flashMkr setMarkerShapeLocal "Rectangle";
	_flashMkr setMarkerSizeLocal [5, 200];
	_flashMkr setMarkerDirLocal random 360;
	_flashMkr setMarkerAlpha 1;

	_aoPos = _flashPos;
	_aoMkr = createMarkerLocal ["AO", _aoPos];
	_aoMkr setMarkerColorLocal "ColorYellow";
	_aoMkr setMarkerShapeLocal "ELLIPSE";
	_aoMkr setMarkerSizeLocal [1000, 1000];
	_aoMkr setMarkerAlpha 0.5;

	_BluPos = [["AO"], ["noWater", _flashPos]] call BIS_fnc_randomPos;
	_bluMkr = createMarkerLocal ["BLUForces", _bluPos];
	_bluMkr setMarkerColorLocal "ColorBlue";
	_bluMkr setMarkerShapeLocal "ELLIPSE";
	_bluMkr setMarkerAlphaLocal 0.3;
	_bluMkr setMarkerSize [300, 300];

	_opfPos = [["AO"], ["noWater", _flashPos, _BluPos]] call BIS_fnc_randomPos;
	_opfMkr = createMarkerLocal ["BLUForces", _bluPos];
	_opfMkr setMarkerColorLocal "ColorRed";
	_opfMkr setMarkerShapeLocal "ELLIPSE";
	_opfMkr setMarkerAlphaLocal 0.3;
	_opfMkr setMarkerSize [300, 300];

	_mkrs = [_flashMkr, _aoMkr, _BluMkr, _opfMkr];
};

fce_fnc_placeRegiment = {
	params ["_regiment", "_markers", "_side"];
	_db = ["new", format ["%3 Regiments %1 - %2", missionName, worldName, _side]] call oo_inidbi; 
	_flashpoint = _markers select 0;
	_opfor = _markers select 3;
	_blufor = _markers select 2;

	if (_side == east) then {
		_groups = ["read", [_regiment, "Group Composition"]] call _db;
		{
			_pos = [[_opFor], ["NoWater"]] call BIS_fnc_randomPos;	
			_mkr = createMarkerLocal [format ["Opfor%1%2", _regiment, _pos], _pos];
			_mkr setMarkerAlphaLocal 0.6;
			_mkr setMarkerType _x;
		} forEach _groups;
	};
};


// Create Regiments
_opforCount = round (random [40, 50, 60]);
_opforForces = [];
for "_i" from 1 to _opforCount do {
	_regiment = ["ACM_O_HDF", east] remoteExec ["fce_fnc_createRegiment", 2];
	_opforForces pushback _regiment;
};
systemChat "Opfor Forces Created";

_bluforCount = round (random [20, 30, 40]);
_bluforForces = [];
for "_i" from 1 to _bluforCount do {
	_regiment = ["ACM_B_NAG", west] remoteExec ["fce_fnc_createRegiment", 2];
	_bluforForces pushback _regiment;
};
systemChat "Blufor Forces Created";

// Distribute forces onto the map
_markers = [] call fce_fnc_createMapMarkers;

{
	[_x, _markers, east] call fce_fnc_placeRegiment;
} forEach _opforForces;

{
	[_x, _markers, west] call fce_fnc_placeRegiemnt;	
} forEach _bluforForces;
