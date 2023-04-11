[LogiLapt, ["Open Logistics Menu", {
	createDialog "LogiMenu";
	_vehs = "configName _x isKindof 'Car' && gettext (_x >> 'faction') == 'ACM_O_HDF'" configClasses (configFile >> "CfgVehicles");


	_listbox = findDisplay 1 displayCtrl 1500;
	{
		// Current result is saved in variable _x
		_added = _listbox lbAdd getText (_x >> "displayName");
		_listbox lbsetTextRight [_added, str (getNumber (_x >> "armor"))];
		_listbox lbSetPicture [_added, (getText (_x >> "editorPreview"))];

		_veh = configName _x;
		buttonSetAction [1600, "
			_listbox = findDisplay 1 displayCtrl 1500;
			_index = lbCurSel _listbox;
			_name = _listbox lbText _index;
			_cost = _listbox lbtextRight _index;
			_clientID = clientOwner;
			_funds = [[_clientID], ['Logistics\GetFunds.sqf']] remoteExec ['execVM', 2];
			_newBalance = _funds - _cost;
			[_newBalance, ['Logistics\SetFunds.sqf']] remoteExec ['execVM', 2];
			_vehSpawn = _veh createVehicle position logi_spawn;
			hint 'Object spawned!';
		"]
	} forEach _vehs;
}]] remoteExec ["addAction", 0, true];

