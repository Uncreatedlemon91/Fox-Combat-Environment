_roles = "getText (_x >> 'Faction') == 'ACM_B_NAG' && getText (_x >> 'vehicleClass') == 'Men'" configClasses (configFile >> "CfgVehicles");

// Get info from ui  
_list = findDisplay 2 displayCtrl 1500;
_list ctrlAddEventHandler ["OnLBSelChanged", "call fce_fnc_loadoutRefresh"];

createDialog "LoadoutMenu";

// Populate the interface 
{
	// Current result is saved in variable _x
	_name = getText (configFile >> "CfgVehicles" >> _x >> 'displayName');
	_added = _list lbAdd _name;
	_list lbSetData [_added, _x];
} forEach _roles;