// Checks if player has served their 'time' or not
_date = format ["%4%5/%2%3/%1",
	systemTime select 0,
	["", "0"] select (systemTime select 1 < 10),
	systemTime select 1,
	["", "0"] select (systemTime select 2 < 10),
	systemTime select 2
];

_db = ["new", format ["Player Deaths %1 %2", missionName, worldName]] call oo_inidbi;

_dayBefore = format ["%4%5/%2%3/%1",
	systemTime select 0,
	["", "0"] select (systemTime select 1 < 10),
	(systemTime select 1) - 1,
	["", "0"] select (systemTime select 2 < 10),
	(systemTime select 2) - 1
];