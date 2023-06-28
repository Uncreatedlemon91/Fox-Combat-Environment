params ["_group"];
systemChat "Getting Roles";
lbClear 1500;
_roles = [];
switch (_group) do {
	case "1stPltRoles": {_roles = [fox_rifleman, fox_ammoCarrier, fox_mg, fox_cls, fox_gren, fox_at, fox_aa, fox_rto, fox_jtac, fox_ftl]};
	default { };
};

systemChat format ["Roles: %1", _roles];
_ctrl = findDisplay 3 displayCtrl 1500;
{
	_name = _x getVariable "RoleName";
	_ctrl lbAdd _name;
	_anim = selectRandom ["STAND1", "STAND2", "WATCH"];
	[_x, _anim, "ASIS"] call BIS_fnc_ambientAnim;
} forEach _roles;