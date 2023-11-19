// Load player data and apply it to the player unit 
params ["_pos", "_gear", "_dir", "_roles", "_curRole", "_kit", "_face"];
// player setPosATL _pos;
player setUnitLoadout _gear;
player setFace _face;
player setPosATL _pos;
player setDir _dir;
player setVariable ["roleLoadout", _curRole];
player setVariable ["fox_loadout_kit", _kit];

// Add a respawn point to the map
//[player, _pos, "Previous Location"] call BIS_fnc_addRespawnPosition;

_engineer = 0;
_medic = 0;

// Assign ace roles 
switch (_curRole) do {
	case "Combat Engineer": {_engineer = 1};
	case "Ground Crew": {_engineer = 2};
	case "Squad Medic": {_medic = 1};
	case "CSAR Operator": {_medic = 1};
	case "Surgeon": {_engineer = 2};
	default { };
};

player setVariable ["ace_medical_medicclass", _medic, true];
player setVariable ["ace_isEngineer", _engineer, true];