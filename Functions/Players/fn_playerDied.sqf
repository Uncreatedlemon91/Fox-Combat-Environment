params ["_name", "_uid", "_killer", "_killerType"];
_db = ["new", format ["Deaths %1-%2", missionName, worldName]] call oo_inidbi;
_p_db = ["new", format ["Players %1-%2", missionName, worldName]] call oo_inidbi;
_playerInfo = format ["%1 - %2", _name, _uid];
["write", [_uid, "Position", [947.509,2880.22,0]]] call _p_db;

_time = systemTime;
_month = _time select 1;
_day = _time select 2;
_hour = _time select 3;
_minute = _time select 4;
_day = [_day, "english"] call BIS_fnc_ordinalNumber;
_date = format ["%1:%2", _hour, _minute];

_section = format ["%1-%2", _month, _day];

["write", [_section, _playerInfo, format ["%1 - Killed by %2, a %3", _date, _killer, _killerType]]] call _db;