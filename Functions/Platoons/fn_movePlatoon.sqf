params ["_trg"];
// Set script variables 
_playerLimit = 2;

// Get variables
_pltStart = getPos _trg;
_mkr = _trg getVariable "unitMkr";
_type = _trg getVariable "unitType";
_id = _trg getVariable "unitID";
_active = _trg getVariable ["unitActive", false];
_side = _trg getVariable "unitSide";
_pltSpeed = _trg getVariable "unitSpeed";

// Get ending location
_base = getMarkerPos "BASE";
_locs = nearestLocations [_base, ["Name", "NameCity", "NameLocal", "NameVillage", "Strategic", "Flag", "Hill", "VegetationBroadleaf", "VegetationFir", "VegetationPalm", "VegetationVineyard"], worldSize * 4];
_loc = selectRandom _locs;
_endPos = position _loc;

// Calculate the direction and distance
_direction = _endPos vectorDiff _pltStart;
_distance = vectorMagnitude _direction;

// Normalize the direction vector
_direction = vectorNormalized _direction;

// Set the start time
_startTime = time;
_mkrCurrent = getpos _trg;

// Set objective on the trigger for spawned in AI
_trg setVariable ["PltEndPos", _endPos, true];

// Move the marker over time
while {(_mkrCurrent distance2D _endPos) > 2} do {
    _active = _trg getVariable "unitActive";
    _nearTrigs = nearestObjects [position _trg, ["EmptyDetector"], 500, true];
    _nearTrigsTypes = [];
    {
        _data = _x getVariable "unitSide";
        if !(_data == _side) then {
            _nearTrigsTypes pushback _x;
        };
    } forEach _nearTrigs;
    _countNearTrigs = count _nearTrigsTypes;
    _countPlayers = count (allPlayers);
    if (!(_active) AND (_countNearTrigs == 0) AND (_countPlayers > _playerLimit)) then {
        // Calculate the current position based on time
        _currentPosition = _pltStart vectorAdd (_direction vectorMultiply (_pltSpeed * (time - _startTime)));
        
        // Set the new position for the marker
        _trg setPos _currentPosition;
        _trg setVariable ["unitPos", _currentPosition, true];
        _mkr setMarkerPos _currentPosition;

        // Update database
        _db = "";
        switch (_side) do {
            case "O": {_db = ["new", format ["OPFOR Platoons %1 %2", missionName, worldName]] call oo_inidbi};
            case "B": {_db = ["new", format ["BLUFOR Platoons %1 %2", missionName, worldName]] call oo_inidbi};
        };
        ["write", [_id, "pos", _currentPosition]] call _db;
        };
    // Sleep for a short time
    sleep 5;
};

// Set the final position to ensure accuracy
_mkr setMarkerPos _endPos;
_trg setPos _endPos;


// Assign new mission 
systemChat "REASSINGING MOVE TASK";
[_trg] remoteExec ["fce_fnc_movePlatoon", 2];