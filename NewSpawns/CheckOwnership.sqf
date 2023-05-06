params ["_mkr"];

while {true} do {
	_db = ["new", _mkr] call oo_inidbi;
	_sections = "getSections" call _db;
	_sectionCount = count _sections;

	if (_sectionCount < 5) then {
		["write", ["Grid Status", "Owner", "BLUFOR"]] call _db;
		_mkr setMarkerColor "ColorBlue";
	} else {
		["write", ["Grid Status", "Owner", "OPFOR"]] call _db;
		_mkr setMarkerColor "ColorRed";
	};
	sleep 5;
};
