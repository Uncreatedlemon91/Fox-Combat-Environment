params ["_pos", "_gear", "_dir", "_role"];

// Assign data to player 
player setPosATL _pos;
player setUnitLoadout _gear;
player setDir _dir;
player setVariable ["roleLoadout", _role, true];

systemChat "Welcome back!";