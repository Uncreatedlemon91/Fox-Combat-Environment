params ["_mkr"];
// Define the marker and radius
_markerPos = getMarkerPos _mkr;
_radius = 1000;

// Get all units of the East side within the radius of the marker
_units = nearestObjects [_markerPos, ["Man"], _radius];
_eastUnits = [];
// _westUnits = [];
{
  if (side _x == east) then {
    _eastUnits pushBack _x;
  };
/*
  if (side _x == west) then {
	_westUnits pushback _x;
  };
*/
} forEach _units;


// Do something with the East units found
_countEast = count _eastUnits;
// _countWest = count _westUnits;

if (_countEast < 5) then {
	_db = ["new", _mkr] call oo_inidbi;
	_newFaction = ["write", ["Grid Status", "Owner", "BLUFOR"]] call _db;
};

/*
if (_countWest < 5) then {
	_db = ["new", _mkr] call oo_inidbi;
	_newFaction = ["write", ["Grid Status", "Owner", "OPFOR"]] call _db;
};
*/