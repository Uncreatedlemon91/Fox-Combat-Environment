params ["_control", "_lbCurSel"];

_det = _control lbText _lbCurSel;
_roles = [];
switch (_det) do {
	case "1st Platoon - The Infantry": {
		_roles = [fox_rifleman, fox_ammoCarrier, fox_mg, fox_cls, fox_gren, fox_missileSpec, fox_rto, fox_jtac, fox_ftl, fox_sl, fox_pl];
	};
	case "2nd Platoon - The Armor": {
		_roles = [fox_crewleader, fox_crew];
	};
	case "B Battery": {
		_roles = [fox_battCommander, fox_battFO, fox_battGunner];
	};
	case "317th Air Squadron": {
		_roles = [fox_hPilot, fox_hCrew, fox_jPilot];
	};
	case "7th Medical Detachment": {
		_roles = [fox_cls2, fox_medtech, fox_surgeon];
	};
	case "Intelligence Detachment": {
		_roles = [fox_scoutLead, fox_scout, fox_scoutMg, fox_scoutMule, fox_scoutSniper];
	};
	case "Engineering & Requisitions Detachment": {
		_roles = [fox_Quartermaster, fox_ATC, fox_cEngineer, fox_EOD, fox_groundCrew];
	};
};

lbClear 1500;
_ctrl = findDisplay 3 displayCtrl 1500;
{
	_name = _x getVariable "RoleName";
	_ctrl lbAdd _name;
} forEach _roles;