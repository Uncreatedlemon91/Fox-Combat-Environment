params ["_pos", "_gear", "_dir", "_roles", "_medData", "_role", "_face", "_insignia"];
player setPosATL _pos;
player setUnitLoadout _gear;
player setDir _dir;
player setVariable ["Fox_Tags", _roles];
player setVariable ["roleLoadout", _role];
{
	_var = _x select 0;
	_data = _x select 1;

	player setVariable [_var, _data];
} forEach _medData;
player setFace _face;
[player, _insignia] call BIS_fnc_setUnitInsignia;
