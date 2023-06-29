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

// Open the ace arsenal for glasses customization
[ace_arsenal, player, false] call ace_arsenal_fnc_openBox;