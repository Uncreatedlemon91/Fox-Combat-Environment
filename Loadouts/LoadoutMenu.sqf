_riflemanImg = "ACM_NAG_Soldier";
_atImg = "ACM_NAG_Soldier_RifleAT";
_clsImg = "ACM_NAG_Soldier_CLS";
_grenImg = "ACM_NAG_Soldier_GL";
_pltSgt = "ACM_NAG_Soldier_Radio";
_engineerImg = "ACM_NAG_Soldier_Repair";
_leader = "ACM_NAG_Soldier_TL";
_officer = "ACM_NAG_Soldier_Officer";
_mg = "ACM_NAG_Soldier_AR";

_roles = [
	_riflemanImg,
	_atImg,
	_clsImg,
	_grenImg,
	_pltSgt,
	_engineerImg,
	_leader,
	_officer,
	_mg
];
// Get info from ui  
_list = findDisplay 2 displayCtrl 1500;
createDialog "LoadoutMenu";

// Populate the interface 
{
	// Current result is saved in variable _x
	_name = getText (configFile >> "CfgVehicles" >> _x >> 'displayName');
	_added = _list lbAdd _name;
	_list lbSetData [_added, _x];
} forEach _roles;