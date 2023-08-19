params [];
// Variables
_cam = player getVariable "Cam";
_loadout = player getVariable "roleLoadout";

// Terminate the camera so player can return to game
_cam cameraEffect ["terminate", "back"];
_cam camCommitPrepared 0;
camDestroy _cam;
closeDialog 3;

// Equp the loadout for player 
player setUnitLoadout (getUnitLoadout _loadout);

// Clear all ACE role permissions 
player setVariable ["ACE_IsEngineer",0, true];
player setVariable ["ace_medical_medicclass", 0, true];

// Set ACE Permissions based on role 
switch (_loadout) do {
	case "fox_medTech": {player setVariable ["ace_medical_medicclass", 1, true]};
	case "fox_surgeon": {player setVariable ["ace_medical_medicclass", 2, true]};
	case "fox_cEngineer": {player setVariable ["ACE_IsEngineer", 1, true]};
};


// Open the ace arsenal for glasses customization
[ace_arsenal, player, false] call ace_arsenal_fnc_openBox;

// Set the player variable to a string instead 
player setVariable ["roleLoadout", str _loadout, true];

[_loadout, player] remoteExec ["fce_Fnc_checkRoles", 2];