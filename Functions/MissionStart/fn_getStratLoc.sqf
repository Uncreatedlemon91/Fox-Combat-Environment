/* 
Function searches for desired buildings in the map. Place a marker with designated alpha on each location.
[Location types in Array, Marker Alpha number]
*/

params ["_locTypes", "_mkrAlpha"];

_mkrAlpha = 1;
_locs = nearestLocations [[0,0,0], _locTypes, worldsize * 3];
{
	// Create marker for visual representation
	_mkr = createMarker [format ["%1 - %2", position _x, name _x], _locs];
	_mkr setMarkerType "hd_dot";
	_mkr setMarkerColor "ColorGreen";
	_mkr setMarkerAlpha _mkrAlpha;

	// Create and add database for location
	_db = ["new", format ["Locations - %1 %2", missionName, worldName]] call oo_inidbi;
	["write", [text _x, "Name", text _x]] call _db;
	["write", [text _x, "Position", position _x]] call _db;
	["write", [text _x, "Loyalty", round (random 100)]] call _db;
	["write", [text _x, "Population", count (nearestTerrainObjects [position _x, ["HOUSE"], 500])]] call _db;
	["write", [text _x, "Type", type _x]] call _db;
} forEach _locs;