// Civ will move to a random house in the town 
params ["_civ"];

// Define Variables 
_civG = group _civ;

// Task Civilian to move around
_pos = getPos _civ;
[_civG, _pos, 50] call BIS_fnc_taskPatrol;