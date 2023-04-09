[LogiLapt, ["Open Logistics Menu", {
	createDialog "LogiMenu";
	_db = ["new", format ["%1 on %2", missionName, worldName]] call oo_inidbi;
	_faction = ["read", ["Mission Factions", "Opfor"]] call _db;

	_vehs = "configName _x isKindof 'Car' && gettext (_x >> 'faction') == _faction" configClasses (configFile >> "CfgVehicles");


	_listbox = findDisplay 1 displayCtrl 1500;
	{
		// Current result is saved in variable _x
		_added = _listbox lbAdd (getText (configFile >> "CfgVehicles" >> _x >> "displayName"));
		_listbox lbSetData [_x, _added];
		_listbox lbsetTextRight [_added, (getNumber (configFile >> "CfgVehicles" >> _x >> "armor"))];
		_listbox lbSetPicture [_added, (getText (configFile >> "CfgVehicles" >> _x >> "editorPreview"))];
	} forEach _vehs;
}]] remoteExec ["addAction", 0, true];

