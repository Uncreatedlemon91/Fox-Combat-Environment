params ["_name", "_uid"];


_db = ["new", "Dead Players"] call oo_inidbi;
_section = format ["%1 - %2", _name, _uid];

_time = systemTime;
_day = _time select 2;
_day = [_day, "English"] call BIS_fnc_ordinalNumber;
_month = _time select 1;
_month = [_month, "English"] call BIS_fnc_ordinalNumber;
_year = _time select 0;
_hour = _time select 3;
_min = _time select 4;
_time = format ["%1 of the %2 month, %3 at %4:%5", _day, _month, _year, _hour, _min];

_inGameTime = date;
_day = _inGameTime select 2;
_day = [_day, "English"] call BIS_fnc_ordinalNumber;
_month = _inGameTime select 1;
_month = [_month, "English"] call BIS_fnc_ordinalNumber;
_year = _inGameTime select 0;
_hour = _inGameTime select 3;
_min = _inGameTime select 4;
_inGameTime = format ["%1 of the %2 month, %3 at %4:%5", _day, _month, _year, _hour, _min];

["write", [_section, "Name", _name]] call _db;
["write", [_section, "ID", _uid]] call _db;
["write", [_section, "Time of Death ingame", _inGameTime]] call _db;
["write", [_section, "Time of Death realtime", _time]] call _db;