params ["_control", "_lbCurSel"];

_det = _control lbText _lbCurSel;
switch (_det) do {
	case "1st Platoon - The Infantry": {
		["1stPlt"] call fce_fnc_getRoles;
	};
	case "2nd Platoon - The Armor": {
		["2ndPlt"] call fce_fnc_getRoles;
	};
	case "B Battery": {
		["Arty"] call fce_fnc_getRoles;
	};
	case "317th Air Squadron": {
		["317Air"] call fce_fnc_getRoles;
	};
	case "7th Medical Detachment": {
		["7Med"] call fce_fnc_getRoles;
	};
	case "Intelligence Detachment": {
		["S2"] call fce_fnc_getRoles;
	};
	case "Engineering & Requisitions Detachment": {
		["S5"] call fce_fnc_getRoles;
	};
};