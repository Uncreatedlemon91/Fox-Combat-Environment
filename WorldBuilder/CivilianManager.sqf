_base = getMarkerPos "BASE";
_locs = nearestLocations [_base, ["NameCity", "NameCityCapital", "NameLocal", "NameVillage"], worldSize * 4];
_countLocs = count _locs;
_mkrAlpha = 0;

_db = ["new", format ["Towns", missionName, worldName]] call oo_inidbi;
_exists = "Exists" call _db;
if (_exists) then {
	[] remoteExec ["fce_fnc_loadTowns", 2];
} else {
	{
		[_x] remoteExec ["fce_fnc_createTown", 2];
	} forEach _locs;
};

