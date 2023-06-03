// Finds suitable objective points to fight over. 
params ["_size"];

_randPos = [["AO"], ["water"]] call BIS_fnc_randomPos;

_mkr = createMarkerlocal ["Objective", _randPos];
_mkr setMarkerShapelocal "Ellipse";
_mkr setMarkerColorlocal "ColorRed";
_mkr setMarkerSizelocal _size;
_mkr setMarkerAlphalocal 0.5;
_mkr setMarkerBrush "DiagGrid";

_mkr2 = createMarkerlocal [format ["ObjectiveIcon %1", _i], _randPos];
_mkr2 setMarkerTypelocal "mil_objective";
_mkr2 setMarkerColorlocal "ColorWhite";
_mkr2 setMarkerAlphalocal 1;
_mkr2 setMarkerText "Mission AO";

_db = ["new", format ["Objective %1-%2", missionName, worldName]] call oo_inidbi;
["write", [_mkr, "Position", _randPos]] call _db;
