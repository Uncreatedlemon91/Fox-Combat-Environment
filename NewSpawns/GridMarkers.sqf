// Define the size of each grid square in meters
_gridSize = 1000;

// Get the size of the map in meters
_mapSize = getNumber(configFile >> "CfgWorlds" >> worldName >> "MapSize");

// Calculate the number of grid squares in each direction
_numGridsX = floor(_mapSize / _gridSize);
_numGridsY = floor(_mapSize / _gridSize);

// Loop over each grid square
for [{_x = 0}, {_x < _numGridsX}, {_x = _x + 1}] do {
    for [{_y = 0}, {_y < _numGridsY}, {_y = _y + 1}] do {
        // Calculate the position of the center of the grid square
        _pos = [(_x * _gridSize) + (_gridSize / 2), (_y * _gridSize) + (_gridSize / 2), 0];

        // Create a marker at the center of the grid square
        _marker = createMarker [format ["Grid_%1_%2", _x, _y], _pos];
        _db = ["new", _marker] call oo_inidbi;
        _exists = "exists" call _db;

        // Customize the marker's appearance and text
        _marker setMarkerType "mil_dot";
        _marker setMarkerSize [1, 1];
        _marker setMarkerColor "ColorRed";
        _marker setMarkerText format ["Grid %1,%2", _x, _y];
        _marker setMarkerAlpha 1;

        [_marker] execVM "NewSpawns\CheckForPlayers.sqf";
        if (_exists) then {
        
        } else {
            // Set OPFOR Presence 
            _infCount = round (random 6);
            _tankCount = round (random 1);
            _mortarCount = round (random 1);
            _mechCount = round (random 2);
            _motCount = round (random 3);

            _infTypes = [];
            for "_i" from 1 to _infCount do
            {
                // Current result is saved in variable _x
                _pick = selectRandom ["o_acmohdf_infantry_at_team", "o_acmohdf_infantry_squad", "o_acmohdf_infantry_weapons_squad", "o_acmohdf_infantry_aa_team"];
                _infTypes pushback _pick;
            };

            _tankTypes = [];
            for "_i" from 1 to _tankCount do
            {
                // Current result is saved in variable _x
                _pick = selectRandom ["o_acmohdf_armored_tank_section_T55", "o_acmohdf_armored_tank_section", "o_acmohdf_armored_tank_platoon"];
                _tankTypes pushback _pick;
            };

            // Set rank of AI 
            _rank = selectRandom ["PRIVATE", "CORPORAL", "SERGEANT"];

            // Get Grid information 
            _houses = nearestObjects [_pos, ["HOUSE"], 1000];
            _houseCount = count _houses;

            _civCount = round (_houseCount / 3);
            _civLoyalty = round (random 100);

            // Establish Safe zone 
            _base = ["Grid_0_2", "Grid_0_3", "Grid_1_2", "Grid_1_3"];
            // Save marker to database 
            
            // Status 
            if (_marker in _base) then {
                ["write", ["Grid Status", "Owner", "BLUFOR"]] call _db;
            } else {
                ["write", ["Grid Status", "Owner", "OPFOR"]] call _db;
            };
            // OPFOR Info
            ["write", ["OPFOR-Info", "Difficulty", _rank]] call _db;
            // Houses
            ["write", ["Grid Locations", "Houses", _houseCount]] call _db;
            // Civilians 
            ["write", ["Grid Civilians", "Civilian Population", _civCount]] call _db;
            ["write", ["Grid Civilians", "Civilian Loyalty", _civLoyalty]] call _db;
            // OPFOR Count 
            ["write", ["OPFOR-Count", "Infantry", _infCount]] call _db;
            ["write", ["OPFOR-Count", "Armored", _tankCount]] call _db;
            ["write", ["OPFOR-Count", "Mortars", _mortarCount]] call _db;
            ["write", ["OPFOR-Count", "Mechanized", _mechCount]] call _db;
            ["write", ["OPFOR-Count", "Motorized", _motCount]] call _db;
            // OPFOR Types
            ["write", ["OPFOR-Types", "Infantry", _infTypes]] call _db;
            ["write", ["OPFOR-Types", "Armored", _tankTypes]] call _db;
        };
    };
};

