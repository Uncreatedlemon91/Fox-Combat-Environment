params ["_name", "_uid", "_netID", "_side"];
"checking database!" remoteExec ["systemChat", _netID];
_db = ["new", format ["Players %1-%2", missionName, worldName]] call oo_inidbi;
_deathdb = ["new", format ["Deaths %1-%2", missionName, worldName]] call oo_inidbi;

// Get player data from the player database
_getSections = "getSections" call _db;
if (_uid in _getSections) then {
	_pos = ["read", [_uid, "Position"]] call _db;
	_gear = ["read", [_uid, "Gear"]] call _db;
	_dir = ["read", [_uid, "Direction"]] call _db;
	_roles = ["read", [_uid, "Combat Quals"]] call _db;
	_medData = ["read", [_uid, "MedData"]] call _db;
	[_pos, _gear, _dir, _roles, _medData] remoteExec ["fce_fnc_loadPlayerData", _netID];
} else {
	[_name, _uid, _netID] remoteExec ["fce_fnc_addPlayerToDatabase", 2];
};

// Check if the player died today 
_time = systemTime;
_month = _time select 1;
_day = _time select 2;
_day = [_day, "english"] call BIS_fnc_ordinalNumber;

_section = format ["%1-%2", _month, _day];
_keys = ["getKeys", _section] call _deathdb;

if ((_uid in _keys) && (_side == west)) then {
	["KILLED"] remoteExec ["endMission", _netID, true];
	"You have already used your one life today soldier....come back as a spectator..." remoteExec ["systemChat", _netID, true];
};