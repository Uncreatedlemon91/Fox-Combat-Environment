params ["_target", "_caller", "_actionId", "_arguments"];

// Checks if player has served their 'time' or not
_date = format ["%4%5/%2%3/%1",
	systemTime select 0,
	["", "0"] select (systemTime select 1 < 10),
	systemTime select 1,
	["", "0"] select (systemTime select 2 < 10),
	systemTime select 2
];

_db = ["new", format ["Player Deaths %1 %2", missionName, worldName]] call oo_inidbi;
_uid = getPlayerUID _caller;
_id = netId _caller;

_deaths = ["getKeys", _date] call _db;

if (_uid in _deaths) then {
	// Respawn player 
	_caller setPosATL [949.776,2888.16,0];
	["Welcome back soldier, be more careful next time..."] remoteExec ["systemChat", _id];
} else {
	// Tell the player that they are not eligible to be 'released'
	["You have died today, please wait until tomorrow to return to the action!"] remoteExec ["systemChat", _id];
};