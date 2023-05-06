params ["_kit", "_pos", "_dir"];

player setPosATL _pos;
player setDir _dir;
player setUnitLoadout _kit;

systemChat "Welcome back Soldier, your profile has been loaded!";