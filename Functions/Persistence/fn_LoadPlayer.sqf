params ["_pos", "_gear", "_dir", "_roles", "_curRole"];
player setPosATL _pos;
player setUnitLoadout _gear;
player setDir _dir;
player setVariable ["roleLoadout", _curRole];
