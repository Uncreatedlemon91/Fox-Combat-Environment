// Finds suitable objective points to fight over. 
params ["_count", "_size"];

_objs = [];
_blkList = ["water", "base"];
for "_i" from 1 to _count do {
	_blkList pushBackUnique _objs;
	_randPos = [["AO"], _blkList] call BIS_fnc_randomPos;

	_mkr = createMarkerlocal [format ["Objective %1", _i], _randPos];
	_mkr setMarkerShapelocal "Ellipse";
	_mkr setMarkerColorlocal "ColorRed";
	_mkr setMarkerSizelocal _size;
	_mkr setMarkerAlphalocal 0.5;
	_mkr setMarkerBrush "DiagGrid";

	_mkr2 = createMarkerlocal [format ["ObjectiveIcon %1", _i], _randPos];
	_mkr2 setMarkerTypelocal "mil_objective";
	_mkr2 setMarkerColorlocal "ColorWhite";
	_mkr2 setMarkerAlphalocal 1;
	_mkr2 setMarkerText format ["Objective %1", _i];

	_objs pushback [_mkr, _mkr2];
	_db = ["new", format ["Objectives %1-%2", missionName, worldName]] call oo_inidbi;
	["write", [_mkr, "Position", _randPos]] call _db;
	["write", [_mkr, "Marker1", _mkr]] call _db;
	["write", [_mkr, "Marker2", _mkr2]] call _db;
	["write", [_mkr, "Owner", "Neutral"]] call _db;
};
