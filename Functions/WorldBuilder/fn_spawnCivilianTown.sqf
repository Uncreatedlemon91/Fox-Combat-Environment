_civilianCenters = nearestLocations [[0,0,0], ["Name", "NameCity", "NameCityCapital", "NameLocal", "NameMarine", "NameVillage"], worldSize * 3, false];

_db = ["New", format ["Civilian Centers %1 %2", missionName, worldName]] call oo_inidbi;
_exists = "Exists" call _db;
if (_exists) then {
	
} else {
	{
		_trg = createTrigger ["EmptyDetector", position _x, true];
		_trg setTriggerArea [500, 500, 0, false];
		_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
		_trg setTriggerStatements ["this", "[getPos thisTrigger] call Fce_fnc_spawnCivilianTown", ""];

		_mkr = createMarker [format ["%1 - %2", text _x, position _x], position];
		_mkr setMarkerText text _x;
		_mkr setMarkerShape "ELLIPSE";
		_mkr setMarkerAlpha 0.4;
		_mkr setMarkerColor "COLORYELLOW";
		_mkr setMarkerBrush "DIAGGRID";

		_population = position _x nearObjects ["HOUSE", 500];
		_population = _population / 3;
		_pos = position _x;
		_loyalty = round (random 100);
		_name = text _x;

		_mkr2 = createMarker [format "%1 2 - %2 2", _x, position _x];
		_mkr2 setMarkerType "hd_dot";
		_mkr2 setMarkerColor "COLORWHITE";
		_mkr2 setMarkerText format ["Town: %1 | Pop: %2 | Loyalty: %3", text _x, _population, _loyalty];

		["write", [text _X, "Name", _name]] call _db;
		["write", [text _x, "Position", _pos]] call _db;
		["write", [text _x, "Population", _population]] call _db;
		["write", [text _x, "Loyalty", _loyalty]] call _db;
		["write", [text _x, "Animals", round(random 30)]] call _db;
		["write", [text _x, "Vehicles", round(random 10)]] call _db;                            

		{
			[_pos, _loyalty, _name] call fce_fnc_buildCiv;				// Build civilian Identities
		} forEach _population;
	} forEach _civilianCenters;
};
