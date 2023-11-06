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


// [player setUnitLoadout _kit;]
[Ace_Arsenal, player] call ace_arsenal_fnc_openBox;

_engineer = 0;
_medic = 0;


// Assign ace roles 
switch (_loadout) do {
	// Engineer Perms
	case "Combat Engineer": {_engineer = 1};
	case "Naval Crewman": {_engineer = 1};
	case "Ground Crew": {_engineer = 2};
	// Medical Perms 
	case "Squad Medic": {_medic = 1};
	case "CSAR Operator": {_medic = 1};
	case "Surgeon": {_medic = 2};
	case "Surgeon Assistant": {_medic = 2};
	default { };
};

player setVariable ["ace_medical_medicclass", _medic, true];
player setVariable ["ace_isEngineer", _engineer, true];