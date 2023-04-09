// Pull data from main mission database.
_mainDB = ["new", format ["%1 on %2", missionName, worldName]] call oo_inidbi;
_faction = ["read", ["Mission Factions", "OPFOR"]] call _mainDb;

// Pull data from Regiment Database.
_Regdb = ["new", format ["Regiments in %1 on %2", missionName, worldName]] call oo_inidbi;

// Create Group Database
_db = ["new", format ["Groups in %1 on %2", missionName, worldName]] call oo_inidbi;
_exists = "exists" call _db;

_mkrAlpha = 1;

if (_exists) then {


} else {
	_sections = "getSections" call _RegDb;
	{
		// Gather information from Regiment Database.
		_regiment = ["read", [_x, "Name"]] call _RegDb;
		_type = ["read", [_x, "Type"]] call _RegDb;
		_size = ["read", [_x, "Size"]] call _RegDb;
		_rank = ["read", [_x, "Rank"]] call _RegDb;
		_pos = ["read", [_x, "Position"]] call _RegDb;

		for "_i" from 0 to _size do {
			// Create a marker for Group 
			_mkrPos = [_pos, 0, 500, 0, 0, 20, 0, ["BASE"]] call BIS_fnc_findSafePos;
			["write", [_section, "Position", _mkrPos]] call _db;
			_mkr = createMarker [format ["%1 - %2", _regiment, random 2000], _mkrPos]; 
			_section = format ["%1 - %2", _regiment, round (random 1000)];
			
			switch (_type) do {
				case "Infantry": {
					_mkrType = selectRandomWeighted ["O_INF", 0.5, "O_MECH_INF", 0.2, "O_MOTOR_INF", 0.4, "O_RECON", 0.2, "O_ARMOR", 0.1]; 
					["write", [_section, "Marker Type", _mkrType]] call _db;
					_mkr setMarkerType _mkrType; 
				};

				case "Mechanized": {
					_mkrType = selectRandomWeighted ["O_INF", 0.3, "O_MECH_INF", 0.5, "O_MOTOR_INF", 0.4, "O_RECON", 0.2, "O_ARMOR", 0.2]; 
					["write", [_section, "Marker Type", _mkrType]] call _db;
					_mkr setMarkerType _mkrType; 
				};

				case "Motorized": {
					_mkrType = selectRandomWeighted ["O_INF", 0.2, "O_MECH_INF", 0.1, "O_MOTOR_INF", 0.4, "O_RECON", 0.2, "O_ARMOR", 0.1]; 
					["write", [_section, "Marker Type", _mkrType]] call _db;
					_mkr setMarkerType _mkrType; 
				};

				case "SpecOps": {
					_mkrType = selectRandomWeighted ["O_INF", 0.2, "O_MECH_INF", 0.2, "O_MOTOR_INF", 0.2, "O_RECON", 0.6, "O_ARMOR", 0.1]; 
					["write", [_section, "Marker Type", _mkrType]] call _db;
					_mkr setMarkerType _mkrType; 
				};
			};
			_mkrtype = ["read", [_section, "Marker Type"]] call _db;
			_mkr setMarkerSize [0.4, 0.4];
			_mkr setMarkerAlpha _mkrAlpha;

			// Determine Group class / type by marker selected.
			switch (_mkrType) do {
				case "O_INF": {
					_class = selectRandom ["o_acmosev_infantry_aa_team", "o_acmosev_infantry_assault_group", "o_acmosev_infantry_at_team", "o_acmosev_infantry_conscript_assault_group", "o_acmosev_infantry_conscript_mg_team", "o_acmosev_infantry_conscript_patrol", "o_acmosev_infantry_at_team", "o_acmosev_infantry_paratrooper_assault_group", "o_acmosev_infantry_patrol"];
					
					["write", [_section, "SpawnClass", _class]] call _db;
				};
				case "O_MECH_INF": {
					_class = selectRandom ["o_acmosev_mechanized_mechanized_infantry_tib_58", "o_acmosev_mechanized_mechanized_infantry_tib_58_copy_1", "o_acmosev_mechanized_mechanized_infantry_tib_80", "o_acmosev_mechanized_mechanized_infantry_tib_80_copy_1"];
					
					["write", [_section, "SpawnClass", _class]] call _db;
				};
				case "O_MOTOR_INF": {
					_class = selectRandom ["o_acmosev_motorized_motorized_infantry", "o_acmosev_motorized_motorized_infantry_2"];
					
					["write", [_section, "SpawnClass", _class]] call _db;
				};
				case "O_RECON": {
					_class = selectRandom ["o_acmosev_specops_fac_4man", "o_acmosev_specops_hunter_team", "o_acmosev_specops_hunter_team_copy_1", "o_acmosev_specops_sabotage_team", "o_acmosev_specops_sabotage_team_copy_1"];
					
					["write", [_section, "SpawnClass", _class]] call _db;
				};
				case "O_ARMOR": {
					_class = selectRandom ["o_acmosev_armored_tank_section", "o_acmosev_armored_tank_platoon"];
					
					["write", [_section, "SpawnClass", _class]] call _db;
				};
			};	

			// Create trigger to spawn AI.
			_trgPos = [_mkrPos, 0, 1, 10, 0, 20, 0, ["BASE"]] call BIS_fnc_findSafePos;
			_spawnGroup = ["read", [_section, "SpawnClass"]] call _db;
			_faction = ["read", ["Mission Factions", "OPFOR"]] call _mainDB;
			_trg = createTrigger ["EmptyDetector", _trgPos, true];
			_trg setTriggerArea [800, 800, 0, false];
			_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
			_trg setVariable ["RegimentData", [_regiment, _rank, _trgPos, _spawnGroup, _mkrType, _faction]];
			_trg setTriggerStatements ["this", "_data = thisTrigger getVariable 'RegimentData'; [_data] execVM 'Enemy\SpawnEnemy.sqf'", ""];
		};
	} forEach _sections;
};

