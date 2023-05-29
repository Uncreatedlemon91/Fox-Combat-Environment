params ["_name", "_uid", "_killer", "_killerType", "_date"];
_db = ["new", format ["Deaths %1-%2", missionName, worldName]] call oo_inidbi;
_p_db = ["new", format ["Players %1-%2", missionName, worldName]] call oo_inidbi;
_playerInfo = format ["%1 - %2", _name, _uid];
["write", ["Deaths", _playerInfo, format ["%1 - Killed by %2 which is a %3", _date, _killer, _killerType]]] call _db;

_deaths = ["read", [_playerInfo, "Deaths"]] call _p_db;
_deaths = _deaths + 1;
["write", [_playerInfo, "Deaths", _deaths]] call _p_db;