// Setup player character
//
_name = name player;
_uid = getPlayerUID player;
_netId = clientOwner;
[_name, _uid, _netId] remoteExec ["fce_fnc_checkPlayerData", 2];

player addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_name = name _unit;
	_uid = getPlayerUID _unit;

	_killerType = typeOf _killer;
	_killer = name _killer;
	[_name, _uid, _killer, _killerType, _date] remoteExec ["fce_fnc_playerDied", 2];
	_unit setPos [947.509,2880.22,0];
}];

// Get player information to relay with the database 
_name = name player;
_uid = getPlayerUID player;
_netID = clientOwner;

// Connect players to the database 
_inDatabase = [_name, _uid, _netID] remoteExec ["fce_fnc_checkDb", 2];
if (_inDatabase) then {
	// If data present, grab it and load it to player model 
	_playerData = [_name, _uid, _netID] remoteExec ["fce_fnc_getPlayerData", 2];
	params ["_pos", "_dir", "_gear", "_face", "_insignia", "_health", "_role", "_quals", "_Det"];
	player setPosATL _pos;
	player setDir _dir;
	player setUnitLoadout _gear;
	player setFace _face;
	[player, _insignia] call BIS_fnc_setUnitInsignia;
	player setVariable ["fox_role", _role];
	player setVariable ["fox_Quals", _quals];
	player setVariable ["fox_Detachment", _det];
	{
		_var = _x select 0;
		_val = _x select 1;
		player setVariable [_var, _val];
	} forEach _health;

	systemChat "Player Data loaded!";
} else {
	// If no data present, create data point for player

};



