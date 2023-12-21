_base = getMarkerPos "BASE";
_locs = nearestLocations [_base, ["Name", "NameCity", "NameLocal", "NameVillage", "Strategic", "Flag", "Hill", "VegetationBroadleaf", "VegetationFir", "VegetationPalm", "VegetationVineyard"], worldSize * 4];
_mkrAlpha = 0;

_db = ["new", format ["Objectives %1 %2", missionName, worldName]] call oo_inidbi;
_exists = "Exists" call _db;

{
	// Add markers to the map
	_mkr = createMarkerLocal [format ["Location: %1", str _x], position _x];
	_mkr setMarkerTypeLocal "hd_Flag";
	_mkr setMarkerTextLocal str _x;
	_mkr setMarkerAlphaLocal _mkrAlpha;
	_mkr setMarkerColorLocal "ColorYellow";

	// Do not add more objectives to the database if it already exists.
	if !(_exists) then {
		_locType = type _x;
		_locstr = _x;
		_locName = text _x;
		_locOwner = "Neutral";
		_locUnits = [];
		_locPos = position _x;

		["write", [_locType, _locstr, [_locName, _locOwner, _locUnits, _locPos]]] call _db;
	};
} forEach _locs;

// Inform server that locations have been loaded
systemChat "[OBJ] Locations Loaded...";

_pltDb = ["new", format ["OPFOR Platoons %1 %2", missionName, worldName]] call oo_inidbi;
_pltExists = "exists" call _pltDb;

if !(_pltExists) then {
	// Initiate generals for b and o sides 
	// _amountOfPlatoons = 3;
	for "_i" from 1 to 200 do {
		["O", "Ospawn"] remoteExec ["fce_fnc_createPlt", 2];
	};
	for "_i" from 1 to 50 do {
		["B", "Bspawn"] remoteExec ["fce_fnc_createPlt", 2];
	};
} else {
	["BLUFOR", "B"] remoteExec ["fce_fnc_loadPlt", 2];
	["OPFOR", "O"] remoteExec ["fce_fnc_loadPlt", 2];
};