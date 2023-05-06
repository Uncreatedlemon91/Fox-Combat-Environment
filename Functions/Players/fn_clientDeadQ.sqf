params ["_name", "_uid", "_clientID"];

_db = ["new", "Dead Players"] call oo_inidbi;
_data = format ["%1 - %2", _name, _uid];
_sections = "getSections" call _db;

if (_data in _sections) then {
	"You have died! You will get a new life Saturday Afternoon and again on Sunday Morning. You will now be sent back, please choose Spectator!" remoteExec ["systemChat", _clientID];
	
	["fce_dead", false, 2] remoteExec ["BIS_fnc_endMission", _clientID];
};