// Check roles of players and make sure they have a whitelisted slot to take the kbAddTopic
params ["_loadout", "_player"];

_uid = getPlayerUID _player;
_netid = netId _player;
_loadout = str _loadout;

systemChat format ["%1", _loadout];

_db = ["new", format ["Player Profiles %1 %2", missionName, worldName]] call oo_inidbi;
_whitelisted = ["read", [_uid, "Roles"]] call _db;

if (_loadout in _whitelisted) then {
	["write", [_uid, "CurrentRole", _loadout]] call _db;
} else {
	"You are not registered for this role! Contact S4 for training" remoteExec ["systemChat", _netid];
	_player setUnitLoadout (getUnitLoadout dummy);
	_player setVariable ["roleLoadout", "Dummy"];
};