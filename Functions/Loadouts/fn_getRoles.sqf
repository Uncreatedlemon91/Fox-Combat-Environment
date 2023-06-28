params ["_group"];
systemChat "Getting Roles";
lbClear 1500;
_roles = [];
switch (_group) do {
	case "1stPlt": {_roles = [fox_rifleman, fox_ammoCarrier, fox_mg, fox_cls, fox_gren, fox_missile, fox_rto, fox_jtac, fox_ftl, fox_sl, fox_pl]};
	case "2ndPlt": {_roles = [fox_crewlead, fox_crew]};
	case "Arty": {_roles = [fox_fo, fox_gunner]};
	case "317Air": {_roles = [fox_helicopterPilot, fox_helicopterCrew, fox_jetPilot]};
	case "7Med": {_roles = [fox_mt, fox_cls2]};
	case "S2": {_roles = [fox_scout, fox_ScoutTl, fox_Sniper]};
	case "S5": {_roles = []};
};

systemChat format ["Roles: %1", _roles];
_ctrl = findDisplay 3 displayCtrl 1500;
{
	_name = _x getVariable "RoleName";
	_ctrl lbAdd _name;
	_anim = selectRandom ["STAND1", "STAND2", "WATCH"];
	[_x, _anim, "ASIS"] call BIS_fnc_ambientAnim;
} forEach _roles;