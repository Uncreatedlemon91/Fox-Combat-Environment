[LogiLapt, ["Open Logistics Menu", {[format ["%1 on %2", missionName, worldName], clientOwner] remoteExec ["Fnc_fce_getShopData", 2]}]] remoteExec ["addaction", 0, true];

	



















































	/*createDialog "LogiMenu";
	_vehs = "configName _x isKindof 'Car' && gettext (_x >> 'faction') == 'ACM_B_NAG'" configClasses (configFile >> "CfgVehicles");


	_listbox = findDisplay 1 displayCtrl 1500;
	{
		// Current result is saved in variable _x
		_added = _listbox lbAdd getText (_x >> "displayName");
		_listbox lbsetTextRight [_added, str (getNumber (_x >> "armor"))];
		_listbox lbSetPicture [_added, (getText (_x >> "editorPreview"))];
		_listbox lbSetData [_added, configName _x];
	} forEach _vehs;

	buttonSetAction [1600, "
		_listbox = findDisplay 1 displayCtrl 1500;
		_index = lbCurSel _listbox;
		_veh = _listbox lbData _index;
		_name = _listbox lbText _index;
		_cost = _listbox lbtextRight _index;
		_funds = [_cost] remoteExec ['fce_fnc_getFunds', 2];
		_newBalance = _funds - (getNumber (_veh >> 'armor'));
		_vehSpawn = _veh createVehicle position logi_spawn;
		hint format ['%1 spawned!', _name];"
	];

	buttonSetAction [1601, "
		_funds = 'logistics\getFunds.sqf' remoteExec ['execVM', 2];
		hint format ['Supplies remaining: %1'];
	"]
}]] remoteExec ["addAction", 0, true];

