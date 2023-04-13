/*
Establishes markers and triggers for AI to spawn in from regiments. 
*/ 
params ["_regiment"];

_mkrAlpha = 0;

// Get information from the database 
_db = ["new", format ["Regiments - %1 %2", missionName, worldName]] call oo_inidbi;
_regimentName = ["read", [_regiment, "Name"]] call _db;
_regimentSize = ["read", [_regiment, "Size"]] call _db;
_regimentType = ["read", [_regiment, "Type"]] call _db;
_regimentRank = ["read", [_regiment, "Rank"]] call _db;
_regimentRadius = ["read", [_regiment, "Radius"]] call _db;
_regimentSupply = ["read", [_regiment, "Supplies"]] call _db;
_regimentPosition = ["read", [_regiment, "Position"]] call _db;
_regimentFaction = ["read", [_regiment, "Faction"]] call _db;

// Create a Marker for the regiment for debug purposes 
_mkr = createMarker [_regimentName, _regimentPosition];
_mkr setMarkerType _regimentType;
_mkr setMarkerAlpha _mkrAlpha;
_mkr setMarkerSize [0.6, 0.6];

// Create marker for a radius of the regiment (It's AO)
_mkrRadius = createMarker [format ["%1_%2", _regimentName, _regimentRadius], _regimentPosition];
_mkrRadius setMarkerShape "ELLIPSE";
_mkrRadius setMarkerAlpha 1;
_mkrRadius setMarkerSize [_regimentRadius, _regimentRadius];
_mkrRadius setMarkerColor "COLORRED";
_mkrRadius setMarkerBrush "SolidBorder";

// Virtualize Groups 
_data = [_regimentName, _regimentSize, _regimentType, _regimentRank, _regimentRadius, _regimentSupply, _regimentPosition, _regimentFaction];

[_data] call fce_fnc_virtGroups;