params [];

closeDialog 3;
_loadout = player getVariable "roleLoadout";
Fox_Loadout_camera cameraEffect ["terminate", "back"];
Fox_Loadout_camera camCommitPrepared 0;
camDestroy Fox_Loadout_camera;
player setUnitLoadout (getUnitLoadout _loadout);
[ace_arsenal, player, false] call ace_arsenal_fnc_openBox;