params ["_pos", "_gear", "_dir", "_roles", "_medData"];
player setPosATL _pos;
player setUnitLoadout _gear;
player setDir _dir;
player setVariable ["Fox_Tags", _roles];

{
	_var = _x select 0;
	_data = _x select 1;

	player setVariable [_var, _data];
} forEach _medData;
