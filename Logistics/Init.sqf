[LogiLapt, ["Open Logistics Menu", {
	createDialog "LogiMenu";
	_vehs = "configName _x isKindof 'Car' && gettext (_x >> 'faction') == 'ACM_O_HDF'" configClasses (configFile >> "CfgVehicles");


	_listbox = findDisplay 1 displayCtrl 1500;
	{
		// Current result is saved in variable _x
		_added = _listbox lbAdd getText (_x >> "displayName");
		_listbox lbsetTextRight [_added, str (getNumber (_x >> "armor"))];
		_listbox lbSetPicture [_added, (getText (_x >> "editorPreview"))];
	} forEach _vehs;
}]] remoteExec ["addAction", 0, true];

