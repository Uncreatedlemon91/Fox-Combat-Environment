params ["_control", "_lbCurSel"];

_det = lbText [2100, _lbCurSel];

switch (_det) do {
	case "1st Platoon - The Infantry": {
		["1stPltRoles"] call fce_fnc_getRoles;
	};
	case "2nd Platoon - The Armor": {
		["2ndPltRoles"] call fce_fnc_getRoles;
	};
	case "Artillery Battery": {
		["ArtyRoles"] call fce_fnc_getRoles;
	};
	case "317th Air Squadron": {
		["317Roles"] call fce_fnc_getRoles;
	};
	case "Engineering & Requisitions Detachment": {
		["EngRoles"] call fce_fnc_getRoles;
	};
};