/* 
Receives data from server to client for menu 
*/
params ["_items"];
_loadout = player getVariable "roleLoadout";

if (_loadout == "fox_Quartermaster") then {
	createDialog "LogiMenu";
	_list = findDisplay 1 displayCtrl 1500;
	_hint = findDisplay 1 displayCtrl 1602;
	_purchase = findDisplay 1 displayCtrl 1601;

	{
		_x params ["_classname", "_name"];
		_added = _list lbAdd _name;
		_list lbSetData [_added, _classname];
	} forEach _items;

	buttonSetAction [1601, "_list = findDisplay 1 displayCtrl 1500;
		_cur = lbCurSel _list;
		_data = _list lbData _cur;
		_name = _list lbText _cur;
		[_data, _name] remoteExec ['fce_fnc_spawnVehicle', 2];"
	];
} else {
	systemChat "You are not authorized to access this! Contact Logistics for assistance";
};
