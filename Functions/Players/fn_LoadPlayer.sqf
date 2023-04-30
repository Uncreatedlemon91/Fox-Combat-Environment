params ["_pos", "_dir", "_kit"];

player setPosASL _pos;
player setDir _dir;
player setUnitLoadout _kit;

systemChat "Welcome back Soldier, your profile has been loaded!";