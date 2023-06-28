params [];
_cam = player getVariable "Cam";

closeDialog 3;
_loadout = player getVariable "roleLoadout";
_cam cameraEffect ["terminate", "back"];
_cam camCommitPrepared 0;
camDestroy _cam;
player setUnitLoadout (getUnitLoadout _loadout);
[ace_arsenal, player, false] call ace_arsenal_fnc_openBox;