params ["_veh"];


_restoreWreck = [
	"restoreWreck",
	"Repair Wreck",
	"",
	{},
	{true},
	{_target setDamage 0.9; _target setFuel 0.1;},
	[],
	[0, 0, 0],
	100
] call ace_interact_menu_fnc_createAction;
[_veh, 0, ["ACE_MainActions"], _restoreWreck] call ace_interact_menu_fnc_addActionToObject;

