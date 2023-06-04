_base = getMarkerPos "BASE";
_locs = nearestLocations [_base, ["Name", "NameCity", "NameCityCapital", "NameLocal", "NameVillage", "Hill", "RockArea"], worldSize * 4];
_countLocs = count _locs;
_mkrAlpha = 0.3;

_db = ["new", format ["o Regiments - %1 %2", missionName, worldName]] call oo_inidbi;
_exists = "Exists" call _db;
if (_exists) then {
	["o"] remoteExec ["fce_fnc_loadRegiment", 2];
};
{
	// Add markers to the map
	_mkr = createMarkerLocal [format ["Location: %1", str _x], position _x];
	_mkr setMarkerTypeLocal "hd_Flag";
	_mkr setMarkerTextLocal str _x;
	_mkr setMarkerAlphaLocal _mkrAlpha;
	_mkr setMarkerColor "ColorYellow";

	_mkr2 = createMarkerLocal [format ["%1", str _x], position _x];
	_mkr2 setMarkerShapeLocal "ELLIPSE";
	_mkr2 setMarkerColorLocal "ColorRed";
	_mkr2 setMarkerSizeLocal [500, 500];
	_mkr2 setMarkerAlphaLocal _mkrAlpha;
	_mkr2 setMarkerBrush "DIAGGRID";

	if (_exists) then {
		
	} else {
		[_x, _mkr2, "o"] remoteExec ["fce_fnc_createRegiment", 2];
	};
} forEach _locs;

