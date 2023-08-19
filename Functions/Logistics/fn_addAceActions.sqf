params ["_veh"];

_isVehicle = false;
switch (true) do
{
	case (_veh isKindOf "Car") : {_isVehicle = true;};
	case (_veh isKindOf "Tank") : {_isVehicle = true;};
	case (_veh isKindOf "Motorcycle") : {_isVehicle = true;};
	case (_veh isKindOf "Ship") : {_isVehicle = true;};
	case (_veh isKindOf "Helicopter") : {_isVehicle = true;};
	case (_veh isKindOf "Plane") : {_isVehicle = true;};
	default {_isVehicle = false;};
};

if !(_isVehicle) then {
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
	[_veh, true, [0, 4, 1], 10] call ace_dragging_fnc_setCarryable;
	[_veh, 1] call ace_cargo_fnc_setSize;
	[_veh] remoteExec ["fce_fnc_addKeys", 2];
};
// If the vehicle is a phone line 
_class = typeOf _veh;
if (_class == "Land_IPPhone_01_sand_F") then {
	[_veh, ["ACRE_VRC103", "FOX Landlines", "Dash", false, ["external"], [], "ACRE_PRC148", [], []], true] call acre_api_fnc_addRackToVehicle;
	
	// Get the radio 
	_radioId = ["ACRE_PRC152", _veh] call acre_api_fnc_getRadioByType;
	[_radioId, 101] call acre_api_fnc_setRadioChannel;
	_success = [_radioId, "INTAUDIO"] call acre_api_fnc_setRadioAudioSource

};

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