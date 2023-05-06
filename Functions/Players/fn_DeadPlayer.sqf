params ["_name", "_uid"];

_db = ["new", "Dead Players"] call oo_inidbi;
_section = format ["%1 - %2", _name, _uid];

["write", [_section, _section]] call _db;