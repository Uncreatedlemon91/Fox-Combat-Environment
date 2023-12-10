// Load player data and apply it to the player unit 
params ["_pos", "_gear", "_dir", "_roles", "_curRole", "_kit", "_face"];
player setPosATL _pos;
player setUnitLoadout _gear;
player setFace _face;

// player setDir _dir;
player setVariable ["roleLoadout", _curRole];
player setVariable ["fox_loadout_kit", _kit];

_engineer = 0;
_medic = 0;


// Assign ace roles 
switch (_curRole) do {
	case "LAV Crew": {_engineer = 1};
	case "Engineer": {_engineer = 2};
	case "Corpsman": {_medic = 1};
	case "Surgeon": {_medic = 2};
	case "Surgeon Assistant": {_medic = 2};
	default { };
};

player setVariable ["ace_medical_medicclass", _medic, true];
player setVariable ["ace_isEngineer", _engineer, true];