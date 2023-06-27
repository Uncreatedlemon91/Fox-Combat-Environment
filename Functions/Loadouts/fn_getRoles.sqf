params ["_group"];
lbClear 1500;
_roles = (getmissionlayerEntities _group) select 0;
{
	_name = _x getVariable "RoleName";
	lbAdd [1500, _name];
	_anim = selectRandom ["STAND1", "STAND2", "WATCH"];
	[_x, _anim, "ASIS"] call BIS_fnc_ambientAnim;
} forEach _roles;