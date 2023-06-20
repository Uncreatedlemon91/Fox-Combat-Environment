params [];

closeDialog 3;
_roleUnit = player getVariable "roleLoadout";
_foxCamera = player getVariable "Camera";
_foxCamera cameraEffect ["terminate", "back"];
_foxCamera camCommitPrepared 0;
camDestroy _foxCamera;

player setUnitLoadout (getUnitLoadout _roleUnit);
[ace_arsenal, player, false] call ace_arsenal_fnc_openBox;