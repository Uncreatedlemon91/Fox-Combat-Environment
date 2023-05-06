params ["_name", "_uid", "_clientID"];

_db = ["new", "Dead Players"] call oo_inidbi;
_data = format ["%1 - %2", _name, _uid];
_sections = "getSections" call _db;


if (_data in _sections) then {
	["fce_dead", false, 2] remoteExec ["BIS_fnc_endMission", _clientID];
};