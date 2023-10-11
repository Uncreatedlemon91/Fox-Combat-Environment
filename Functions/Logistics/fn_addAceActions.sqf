params ["_veh"];

_class = typeOf _veh;
_isVehicle = false;
if ((_class in fox_generalVehicles) OR (_class in fox_lightVehicles) OR (_class in fox_mediumVehicles) OR (_class in fox_heavyVehicles) OR (_class in fox_medicalVehicles) OR (_class in fox_artyVehicles) OR (_class in fox_supplyVehicles) OR (_class in fox_heloVehiclesT) OR (_class in fox_heloVehiclesM) OR (_class in fox_heloVehiclesA) OR (_class in fox_AA)) then {
	_isVehicle = true;
};

if !(_isVehicle) then {
	// Add save option
	_saveObjectAction = [
		"saveObject",
		"Lock Object",
		"",
		{_class = typeOf _target; [_target, _class] remoteExec ["fce_fnc_saveItem", 2]},
		{true},
		{},
		[],
		[0, 0, 0],
		100
	] call ace_interact_menu_fnc_createAction;

	[_veh, 0, ["ACE_MainActions"], _saveObjectAction] call ace_interact_menu_fnc_addActionToObject;

	// Add Delete Option
	_deleteObject = [
		"deleteObject",
		"Delete Object",
		"",
		{
			[_target] remoteExec ["fce_fnc_deleteItem", 2];
		},
		{true},
		{},
		[],
		[0, 0, 0],
		100
	] call ace_interact_menu_fnc_createAction;
	[_veh, 0, ["ACE_MainActions"], _deleteObject] call ace_interact_menu_fnc_addActionToObject;
	
	// Set If player can carry it 
	[_veh, true, [0, 2, 1], 10] call ace_dragging_fnc_setCarryable;
	
	// Set Cargo Size 
	[_veh, 1] call ace_cargo_fnc_setSize;
} else {
	_deleteObject = [
		"deleteVehicle",
		"Delete Vehicle",
		"",
		{
			[_target] remoteExec ["fce_fnc_deleteVehicle", 2];
		},
		{true},
		{},
		[],
		[0, 0, 0],
		100
	] call ace_interact_menu_fnc_createAction;
	[_veh, 0, ["ACE_MainActions"], _deleteObject] call ace_interact_menu_fnc_addActionToObject;

	// Add Radio Network 
	[_veh, ["ACRE_VRC103", "FOX Communications", "Dash", false, ["external"], [], "ACRE_PRC148", [], []], true] call acre_api_fnc_addRackToVehicle;
};
