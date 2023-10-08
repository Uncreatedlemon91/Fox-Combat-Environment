// Puts the player into a SPECTATOR Mode 
[true] call ace_spectator_fnc_setSpectator;
[allPlayers, [player]] call ace_spectator_fnc_updateUnits;
[[west], [east,civilian]] call ace_spectator_fnc_updateSides;
[[0, 1, 2], []] call ace_spectator_fnc_updateCameraModes;
[[-2, -1, 0, 1], []] call ace_spectator_fnc_updateVisionModes;
[2, true, -2] call ace_spectator_fnc_setCameraAttributes;