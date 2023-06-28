params ["_control", "_lbCurSel"];

_det = _control lbText _lbCurSel;
_roles = [];
switch (_det) do {
	case "1st Platoon - The Infantry": {
		_roles = [fox_rifleman, fox_ammoCarrier, fox_mg, fox_cls, fox_gren, fox_missileSpec, fox_rto, fox_jtac, fox_ftl, fox_sl, fox_pl];
	};
	case "2nd Platoon - The Armor": {
		_roles = [fox_crewlead, fox_crew];
	};
	case "B Battery": {
		_roles = [fox_fo, fox_gunner];
	};
	case "317th Air Squadron": {
		_roles = [fox_helicopterPilot, fox_helicopterCrew, fox_jetPilot];
	};
	case "7th Medical Detachment": {
		_roles = [fox_mt, fox_cls2];
	};
	case "Intelligence Detachment": {
		_roles = [fox_scout, fox_ScoutTl, fox_Sniper];
	};
	case "Engineering & Requisitions Detachment": {
		_roles = [];
	};
};

lbClear 1500;
_ctrl = findDisplay 3 displayCtrl 1500;
{
	_name = _x getVariable "RoleName";
	_ctrl lbAdd _name;
} forEach _roles;