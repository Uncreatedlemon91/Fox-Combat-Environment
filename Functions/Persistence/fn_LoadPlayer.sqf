params ["_pos", "_gear", "_dir", "_role"];

// Debug 
systemChat format ["%1", _role];

// Assign data to player 
player setPosATL _pos;
player setUnitLoadout _gear;
player setDir _dir;
player setVariable ["roleLoadout", _role];

systemChat "Welcome back!";