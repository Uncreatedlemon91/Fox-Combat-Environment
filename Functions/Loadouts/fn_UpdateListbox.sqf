params ["_control", "_lbCurSel"];

_det = _control lbText _lbCurSel;
systemChat "Updating List";
switch (_det) do {
	case "1st Platoon - The Infantry": {
		systemChat "INFANTRY";
		["1stPltRoles"] call fce_fnc_getRoles;
	};
	case "2nd Platoon - The Armor": {
		systemChat "Armor";
		["2ndPltRoles"] call fce_fnc_getRoles;
	};
	case "Artillery Battery": {
		systemChat "Arty";
		["ArtyRoles"] call fce_fnc_getRoles;
	};
	case "317th Air Squadron": {
		["317Roles"] call fce_fnc_getRoles;
	};
	case "Engineering & Requisitions Detachment": {
		["EngRoles"] call fce_fnc_getRoles;
	};
};