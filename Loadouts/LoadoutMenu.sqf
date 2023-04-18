_roles = "getText (_x >> 'Faction') == 'ACM_B_NAG' && getText (_x >> 'vehicleClass') == 'Men'" configClasses (configFile >> "CfgVehicles");
systemchat format ["%1", _roles];
// Get info from ui  
_list = findDisplay 2 displayCtrl 1500;

createDialog "LoadoutMenu";

// Populate the interface 
{
	_cfg = configName _x;
	// Current result is saved in variable _x
	_name = getText (configFile >> "CfgVehicles" >> _cfg >> 'displayName');
	_added = _list lbAdd _name;
	_list lbSetData [_added, _cfg];
} forEach _roles;