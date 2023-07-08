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
