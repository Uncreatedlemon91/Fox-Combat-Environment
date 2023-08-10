params ["_size"];
_db = ["new", format ["Objectives %1-%2", missionName, worldName]] call oo_inidbi;
_sections = "getSections" call _db;
{
	_randPos = ["read", [_x, "Position"]] call _db;
	_mkrName = ["read", [_x, "Marker1"]] call _db;
	_mkr2Name = ["read", [_x, "Marker2"]] call _db;
	_owner = ["read", [_x, "Owner"]] call _db;

	_mkr = createMarkerlocal [_mkrName, _randPos];
	_mkr setMarkerShapelocal "Ellipse";
	_mkr setMarkerColorlocal "ColorRed";
	_mkr setMarkerSizelocal _size;
	_mkr setMarkerAlphalocal 0;
	_mkr setMarkerBrush "DiagGrid";

	_mkr2 = createMarkerlocal [_mkr2Name, _randPos];
	_mkr2 setMarkerTypelocal "mil_objective";
	_mkr2 setMarkerColorlocal "ColorWhite";
	_mkr2 setMarkerAlphalocal 0;
	_mkr2 setMarkerText format ["%1", _mkr2Name];
	switch (_owner) do {
		case "Neutral": {_mkr2 setMarkerColorlocal "ColorWhite"};
		case "Blufor": {_mkr2 setMarkerColorlocal "ColorBlue"};
		case "Opfor": {_mkr2 setMarkerColorlocal "ColorRed"};
	};
} forEach _sections;