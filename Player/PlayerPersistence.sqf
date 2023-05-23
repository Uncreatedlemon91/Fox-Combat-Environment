// Create functions 
fce_fnc_addPlayerToDatabase = {
	params ["_name", "_uid", "_netID"];
	"Generating profile on Database..." remoteExec ["systemChat", _netID];
	_db = ["new", format ["Players %1-%2", missionName, worldName]] call oo_inidbi;
	_section = format ["%1 - %2", _name, _uid];
	["write", [_section, "Name", _name]] call _db;
	["write", [_section, "UID", _uid]] call _db;
	["write", [_section, "NetId", _netID]] call _db;
	"Profile Created" remoteExec ["systemChat", _netID];	
};

fce_fnc_updatePlayerDatabase = {
	params ["_name", "_UID", "_netID", "_pos", "_gear", "_dir"];
	_db = ["new", format ["Players %1-%2", missionName, worldName]] call oo_inidbi;
	_section = format ["%1 - %2", _name, _uid];
	["write", [_section, "Name", _name]] call _db;
	["write", [_section, "UID", _uid]] call _db;
	["write", [_section, "NetId", _netID]] call _db;
	["write", [_section, "Position", _pos]] call _db;
	["write", [_section, "Gear", _gear]] call _db;
	["write", [_section, "Direction", _dir]] call _db;
	"Player Profile Updated" remoteExec ["systemChat", _netId];
};

fce_fnc_checkPlayerData = {
	params ["_name", "_uid", "_netID"];
	"checking database!" remoteExec ["systemChat", _netID];
	_db = ["new", format ["Players %1-%2", missionName, worldName]] call oo_inidbi;
	_section = format ["%1 - %2", _name, _uid];
	_getSections = "getSections" call _db;
	if (_section in _getSections) then {
		_pos = ["read", [_section, "Position"]] call _db;
		_gear = ["read", [_section, "Gear"]] call _db;
		_dir = ["read", [_section, "Direction"]] call _db;
		[_pos, _gear, _dir] remoteExec ["fce_fnc_loadPlayerData", _netID];
	} else {
		[_name, _uid, _netID] remoteExec ["fce_fnc_addPlayerToDatabase", 2];
	};
};

fce_fnc_loadPlayerData = {
	params ["_pos", "_gear", "_dir"];
	player setPosATL _pos;
	player setUnitLoadout _gear;
	player setDir _dir;
	systemChat format ["Welcome back %1!", name player];
	sleep 2;
	systemChat "Your profile has been loaded!";
};

fce_fnc_playerDied = {
	params ["_name", "_uid", "_killer", "_killerType", "_date"];
	_db = ["new", format ["Deaths %1-%2", missionName, worldName]] call oo_inidbi;
	_playerInfo = format ["%1 - %2", _name, _uid];
	["write", ["Deaths", _playerInfo, format ["%1 - Killed by %2 which is a %3", _date, _killer, _killerType]]] call _db;
};

// Run persistence gathering
_name = name player;
_uid = getPlayerUID player;
_netId = clientOwner;

[_name, _uid, _netId] remoteExec ["fce_fnc_checkPlayerData", 2];

player addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_name = name _unit;
	_time = systemTime;
	_day = _time select 2;
	_hour = _time select 3;
	_minute = _time select 4;
	_day = [_day, "english"] call BIS_fnc_ordinalNumber;
	_date = format ["%1 at %2:%3", _day, _hour, _minute];
	_uid = getPlayerUID _unit;

	_killerType = typeOf _killer;
	_killer = name _killer;
	[_name, _uid, _killer, _killerType, _date] remoteExec ["fce_fnc_playerDied", 2];
}];

while {alive player} do {
	sleep 2;
	_pos = getPosATL player;
	_gear = getUnitLoadout player;
	_dir = getDir player;
	_netID = clientOwner;
	_name = name player;
	_uid = getPlayerUID player;

	[_name, _UID, _netID, _pos, _gear, _dir] remoteExec ["fce_fnc_updatePlayerDatabase", 2];
};
