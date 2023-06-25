params ["_control", "_lbCurSel", "_lbSelection"];

_det = lbText [2100, _lbCurSel];

_getRoles = {
	params ["_group"];
	lbClear 1500;
	_roles = (getmissionlayerEntities _group) select 0;
	{
		_name = _x getVariable "RoleName";
		lbAdd [1500, _name];
		_anim = selectRandom ["STAND1", "STAND2", "WATCH"];
		[_x, _anim, "ASIS"] call BIS_fnc_ambientAnim;
	} forEach _roles;
};

switch (_det) do {
	case "1st Platoon - The Infantry": {
		["1stPltRoles"] call _getRoles;
	};
	case "2nd Platoon - The Armor": {
		["2ndPltRoles"] call _getRoles;
	};
	case "Artillery Battery": {
		["ArtyRoles"] call _getRoles;
	};
	case "317th Air Squadron": {
		["317Roles"] call _getRoles;
	};
	case "Engineering & Requisitions Detachment": {
		["EngRoles"] call _getRoles;
	};
	case "Medical Detachment": {
		["MedRoles"] call _getRoles;
	};
};