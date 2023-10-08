// Populates towns and sets up civilians 

// Define Variables
_spawnArea = 300;

// Access the civilian database 
_db = ["new", format ["Civilian Module - %1 %2", missionName, worldName]] call oo_inidbi;
_sections = "getSections" call _db;

// Reference the civilian types database 
_Cdb = ["new", format ["Civilian Compositions %1 %2", missionName, worldName]] call oo_inidbi;
_civPeds = ["read", ["CivPed", "Classes"]] call _Cdb;

// For each location, populate the town 
{
	// Grab the database data 
	_data = ["read", [_x, "Town Data"]] call _db;
	_civData = ["read", [_x, "Civ Data"]] call _db;
	if (_civData == false) then {
		systemChat format ["CIVDATA STARTING - %1", _x];
		_name = _data select 0;
		_pos = _data select 1;
		_homes = _data select 2;
		_popCount = _data select 3;
		_popLoyalty = _data select 4;
		_vehCount = _data select 5;
		_civs = [];

		// Spawn Civilian at house 
		for "_i" from 1 to _popCount do {
			_civ = selectRandom _civPeds;
			_grp = createGroup civilian;
			_spawnPos = [_pos, 20, 400, 5, 0, 20, 0, []] call BIS_fnc_findSafePos;
			_unit = _grp createUnit [_civ, _spawnPos, [], 10, "FORM"];

			// Get civilian data to save to database 
			_name = name _unit;
			_face = face _unit;
			_gear = getUnitLoadout _unit;
			_pos = getposATL _unit;

			_loyalty = round (random [_popLoyalty - 20, _popLoyalty, _popLoyalty + 20]);
			_languages = ["Local"];
			_langChance = round (random 100);
			if (_langChance > 30) then {
				_languages pushback "International";
			};

			// Delete civilian to help frames 
			deleteVehicle _unit;
			deleteGroup _grp;

			_data = [_name, _face, _gear, _pos, _loyalty, _languages, _civ];
			_civs pushBack _data;

			// Add a trigger to spawn Civilian when they are close to players
			_trg = createTrigger ["EmptyDetector", _pos];
			_trg setVariable ["CivData", _x, true];
			_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
			_trg setTriggerArea [_spawnArea, _spawnArea, 0, false, 5];
			_trg setTriggerStatements ["this", "[thisTrigger] call fce_fnc_spawnCiv", ""];

			// Save data to the database
			["write", [_x, "Civ Data", _civs]] call _db;
		};
	} else {
		{
			systemChat format ["%1", _x];
			// Unpack the data 
			_name = _x select 0;
			_face = _x select 1;
			_gear = _x select 2;
			_pos = _x select 3;
			_loyalty = _x select 4;
			_languages = _x select 5;
			_civ = _x select 6;

			// Add a trigger to spawn Civilian when they are close to players
			_trg = createTrigger ["EmptyDetector", _pos];
			_trg setVariable ["CivData", _x, true];
			_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
			_trg setTriggerArea [_spawnArea, _spawnArea, 0, false, 5];
			_trg setTriggerStatements ["this", "[thisTrigger] call fce_fnc_spawnCiv", ""];	
		} forEach _civData;
	};
} forEach _sections;
