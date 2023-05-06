params ["_kit", "_pos", "_dir", "_insig"];

player setPosATL _pos;
player setDir _dir;
player setUnitLoadout _kit;
[player, _insig] call BIS_fnc_setUnitInsignia;

systemChat "Welcome back Soldier, your profile has been loaded!";