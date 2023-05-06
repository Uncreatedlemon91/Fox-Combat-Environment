params ["_name", "_uid", "_clientID"];

_db = ["new", "Players"] call oo_inidbi;
_exists = "exists" call _db;

_section = format ["%1 %2", _name, _uid];
if (_exists) then {
	_kit = ["Read", [_section, "Kit"]] call _db;
	_pos = ["Read", [_section, "Pos"]] call _db;
	_dir = ["Read", [_section, "Direction"]] call _db;

	[_kit, _pos, _dir] remoteExec ["fce_fnc_loadPlayer", _clientID];
};