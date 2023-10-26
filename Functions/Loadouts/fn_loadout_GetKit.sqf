// Get the loadout from the menu, apply it to the player.
params ["_loadout"];

_leftBox = findDisplay 3 displayCtrl 1500;

_netID = netId player;
_lbCurSel = lbCurSel 1500;
_loadout = _leftBox lbText _lbCurSel;
_loadoutVar = _leftBox lbData _lbCurSel;

player setVariable ["currentLoadout", _loadout, true];

// Set loadout and open arsenal
_uid = getPlayerUID player; 
[_loadout, player, _uid] remoteExec ["fce_fnc_loadout_SyncKit", 2];

sleep 1;
// [player setUnitLoadout _kit;]
[Ace_Arsenal, player] call ace_arsenal_fnc_openBox;