params ["_group"];
lbClear 1500;
_roles = (getmissionlayerEntities _group) select 0;
_ctrl = findDisplay 3 displayCtrl 1500;
{
	"Test" remoteExec ["systemChat", 0];
	_name = _x getVariable "RoleName";
	_ctrl lbAdd _name;
	[format ["Name %1", _name]] remoteExec ["systemChat", 0];
	_anim = selectRandom ["STAND1", "STAND2", "WATCH"];
	[_x, _anim, "ASIS"] call BIS_fnc_ambientAnim;
} forEach _roles;