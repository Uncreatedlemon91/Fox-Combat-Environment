params ["_pos", "_gear", "_dir", "_roles", "_curRole"];
player setPosATL _pos;
player setUnitLoadout _gear;
player setDir _dir;
player setVariable ["roleLoadout", _curRole];

// Clear all ACE role permissions 
player setVariable ["ACE_IsEngineer",0, true];
player setVariable ["ace_medical_medicclass", 0, true];

// Set ACE Permissions based on role 
switch (_loadout) do {
	case "fox_medTech": {player setVariable ["ace_medical_medicclass", 1, true]};
	case "fox_surgeon": {player setVariable ["ace_medical_medicclass", 2, true]};
	case "fox_cEngineer": {player setVariable ["ACE_IsEngineer", 1, true]};
};

