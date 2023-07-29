params ["_pos", "_gear", "_dir", "_roles"];
player setPosATL _pos;
player setUnitLoadout _gear;
player setDir _dir;
player setVariable ["Fox_Tags", _roles];
