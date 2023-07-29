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
	default {};
};

if (_isVehicle == false) then {
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

	[_veh, 0, ["ACE_MainActions"], _saveObjectAction] call ace_interact_menu_fnc_addActionToObject;
	[_veh, 0, ["ACE_MainActions"], _deleteObject] call ace_interact_menu_fnc_addActionToObject;
	[_veh, true, [0, 4, 1], 10] call ace_dragging_fnc_setCarryable;
	[_veh, 1] call ace_cargo_fnc_setSize;
};

if (_isVehicle) then {
	_veh setDamage 0.8;
	_veh setFuel 0.1;

	if (_veh in _logi) then {
		
	}
};