params ["_data"];
_pos = _data select 0;
_dir = _data select 1;
_loadout = _data select 2;

player setPosASL _pos;
player setDir _dir;
player setUnitLoadout _loadout;