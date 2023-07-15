params ["_name", "_uid", "_netID"];
"Generating profile on Database..." remoteExec ["systemChat", _netID];

_time = systemTime;
_year = _time select 0;
_month = _time select 1;
_day = _time select 2;
_hour = _time select 3;
_minute = _time select 4;
_day = [_day, "english"] call BIS_fnc_ordinalNumber;
_date = format ["The %1 of %2, %3", _day, _month, _year];

_db = ["new", format ["Players %1-%2", missionName, worldName]] call oo_inidbi;
["write", [_uid, "Name", _name]] call _db;
["write", [_uid, "UID", _uid]] call _db;
["write", [_uid, "NetId", _netID]] call _db;
["write", [_uid, "Combat Quals", ["Rifle"]]] call _db;
["write", [_uid, "Enlist Date", _date]];

"Profile Created" remoteExec ["systemChat", _netID];