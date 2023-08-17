// Populates towns and sets up civilians 

// Access the civilian database 
_db = ["new", [format ["Civilian Module - %1 %2", missionName, worldName]]] call oo_inidbi;
_sections = "getSections" call _db;

// For each location, populate the town 
{
	// Grab the database data 
	_data = ["read", [_x, "Civ Data"]] call _db;
	_name = _data select 0;
	_pos = _data select 1;
	_homes = _data select 2;
	_popCount = _data select 3;
	_popLoyalty = _data select 4;
	_vehCount = _data select 5;

	// Spawn Civilian at house 
	for "_i" from 1 to _popCount do {
		_homePos = selectRandom _homes;
		_homePos = getPosASL _homePos;

		_civ = selectRandom _civClasses;
		_grp = createGroup civilian;
		_unit = _grp createUnit [_civ, _homePos];

		// Get civilian data to save to database 
		_name = name _unit;
		_face = face _unit;
		_gear = getUnitLoadout _unit;
		_loyalty = round (random [_popLoyalty - 20, _popLoyalty, _popLoyalty + 20]);
		_languages = ["Local"];
		_langChance = round (random 100);
		if (_langChance > 30) then {
			_languages pushback "International";
		};


		_data = [_name, _face, _gear, _loyalty, _languages];
		["write", [_x, "Civ Data"]]
	};

} forEach _sections;