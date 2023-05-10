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
        _marker setMarkerShape "Rectangle";
        _marker setMarkerSize [500, 500];
        _marker setMarkerColor "ColorRed";
        _marker setMarkerText format ["Grid %1,%2", _x, _y];
        _marker setMarkerAlpha 0;

        if (_exists) then {
            _markers = "getSections" call _db;
            _notOpfor = ["Grid Status", "Grid Locations", "Grid Civilians"];
            {
                // Current result is saved in variable _x
                if (_x in _notOpfor) then 
                {

                } else 
                {
                    _pos = ["read", [_x, "Position"]] call _db;

                    _mkr = createMarker [_x, _pos];
                    _mkr setMarkerType "o_inf";
                    _mkr setMarkerSize [0.4, 0.4];
                    _mkr setMarkerAlpha 0;
                    _mkr setMarkerColor "ColorRed";

                    ["write", [_mkr, "Active", false]] call _db;

                    [_mkr, _marker] execVM "NewSpawns\CheckForPlayers.sqf";
                };
            } forEach _markers;
        
        } else {
            // Get Grid information 
            _houses = nearestObjects [_pos, ["HOUSE"], 1000];
            _houseCount = count _houses;

            _civCount = round (_houseCount / 3);
            _civLoyalty = round (random 100);

            // Establish Safe zone 
            _base = ["Grid_0_2", "Grid_0_3", "Grid_1_2", "Grid_1_3", "Grid_0_4"];
            // Save marker to database 
            
            // Status 
            if (_marker in _base) then {
                ["write", ["Grid Status", "Owner", "BLUFOR"]] call _db;
            } else {
                ["write", ["Grid Status", "Owner", "OPFOR"]] call _db;
            };
            // Houses
            ["write", ["Grid Locations", "Houses", _houseCount]] call _db;
            // Civilians 
            ["write", ["Grid Civilians", "Civilian Population", _civCount]] call _db;
            ["write", ["Grid Civilians", "Civilian Loyalty", _civLoyalty]] call _db;

            // Existing Emplacements
            _chanceOfEmplacement = random 100;
            if (_chanceOfEmplacement < 25) then {
                _selectEmplacement = selectRandom ["MG Post", "Mortar", "Mechanized", "Tanks", "Helicopter"];
                [_selectEmplacement] execVM "NewSpawns\SpawnEmplacement.sqf";
            };

            // Set OPFOR Presence 
            _infCount = round (random 10);

            for "_i" from 1 to _infCount do
            {
                // Current result is saved in variable _x
                _size = round (random [6, 8, 10]);
                _grpUnits = ["ACM_HDF_Soldier_TL"];
                for "_i" from 2 to _size do {
                    _type = selectRandom [
                        "ACM_HDF_Soldier_AA",
                        "ACM_HDF_Soldier_AR",
                        "ACM_HDF_Soldier_CLS",
                        "ACM_HDF_Soldier_GL",
                        "ACM_HDF_Soldier_MR",
                        "ACM_HDF_Soldier_AT",
                        "ACM_HDF_Soldier",
                        "ACM_HDF_Soldier_LiteAT",
                        "ACM_HDF_Soldier_Light",
                        "ACM_HDF_Soldier_Thermals"
                    ];
                    _grpUnits pushback _type;
                    };
                _pos = [[_marker], ["Base", "water"]] call BIS_fnc_randomPos;
                if (_pos select 0 == 0) then {} else {
                    _mkr = createMarker [format ["%1 %2", _marker, format ["Group %1", _i]], _pos];
                    _mkr setMarkerType "o_inf";
                    _mkr setMarkerSize [0.4, 0.4];
                    _mkr setMarkerAlpha 0.6;
                    _mkr setMarkerColor "ColorRed";

                    _rank = selectRandomWeighted ["PRIVATE", 0.7, "CORPORAL", 0.6, "SERGEANT", 0.5, "LIEUTENANT", 0.4, "CAPTAIN", 0.3, "MAJOR", 0.2, "COLONEL", 0.1];
                    _orders = selectRandomWeighted ["Patrol", 0.7, "Camp", 0.3];
                
                    ["write", [format ["%1 %2", _marker, format ["Group %1", _i]], "Units", _grpUnits]] call _db;
                    ["write", [format ["%1 %2", _marker, format ["Group %1", _i]], "Size", count _grpUnits]] call _db;
                    ["write", [format ["%1 %2", _marker, format ["Group %1", _i]], "Position", _pos]] call _db;
                    ["write", [format ["%1 %2", _marker, format ["Group %1", _i]], "Rank", _rank]] call _db;
                    ["write", [format ["%1 %2", _marker, format ["Group %1", _i]], "Active", false]] call _db;
                    ["write", [format ["%1 %2", _marker, format ["Group %1", _i]], "Orders", _orders]] call _db;

                    [_mkr, _marker] execVM "NewSpawns\CheckForPlayers.sqf";
                };
            };
        };
    };
};

execVM "NewSpawns\OngoingActions.sqf";