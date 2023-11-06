// Adds ace actions to the FOB Container 
params ["_fob", "_deployed"];

if (_deployed) then {
	// Action to Disable FOB Area
	_deleteFOB = [
		"deleteFOB",
		"Disable FOB",
		"",
		{[_target] remoteExec ["fce_fnc_deleteFOB", 2]},
		{true},
		{},
		[],
		[0, 0, 0],
		100
	] call ace_interact_menu_fnc_createAction;

	// Add Actioin to FOB Area
	[_fob, 0, ["ACE_MainActions"], _deleteFOB] call ace_interact_menu_fnc_addActionToObject;
} else {
	// Action to deploy FOB 
	_deployFOB = [
		"deployFOB",
		"Deploy FOB",
		"",
		{[_target] remoteExec ["fce_fnc_deployFOB", 2]},
		{true},
		{},
		[],
		[0, 0, 0],
		100
	] call ace_interact_menu_fnc_createAction;

	// Add actions to the Container 
	[_fob, 0, ["ACE_MainActions"], _deployFOB] call ace_interact_menu_fnc_addActionToObject;
};
