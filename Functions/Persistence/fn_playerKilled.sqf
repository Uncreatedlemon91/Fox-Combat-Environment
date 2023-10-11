// Manages what happens when the player is killed 
params ["_unit", "_killer", "_instigator"];

_name = name _unit;
_uid = getPlayerUID _unit;
_killerName = name _killer;
_killerType = typeOf _killer;
_killerType = getText (configFile >> "CfgVehicles" >> _killerType >> "displayName");

_timeData = systemTime;
_year = _timeData select 0;
_month= _timeData select 1;
_day= _timeData select 2;
_hours= _timeData select 3;
_minutes= _timeData select 4;

_date = format ["%4%5/%2%3/%1",
	systemTime select 0,
	["", "0"] select (systemTime select 1 < 10),
	systemTime select 1,
	["", "0"] select (systemTime select 2 < 10),
	systemTime select 2
];

_time = format ["%1H:%2M", _hours, _minutes];


if !(_name == _killerName) then {
	_db = ["new", format ["Player Deaths %1 %2", missionName, worldName]] call oo_inidbi;
	["write", [_date, _uid, format ["%1 killed by %2, a %3 at %4", _name, _killerName, _killerType, _time]]] call _db;

	
	// Update player location to the HQ 
	_ddb = ["new", "Player Profiles"] call oo_inidbi;
	_newPos = getPosASL Ace_Arsenal;
	["write", [_uid, "Position", _newPos]] call _ddb;
};