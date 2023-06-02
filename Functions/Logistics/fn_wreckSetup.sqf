params ["_veh", "_mkr"];

_recoverWreckAction = [
	"RestoreWreck",
	"Repair Wreck",
	"",
	{[_target] remoteExec ["fce_fnc_repairWreck", 2]},
	{true},
	{},
	[],
	[0, 0, 0],
	100
] call ace_interact_menu_fnc_createAction;

[_veh, 0, ["ACE_MainActions"], _recoverWreckAction] call ace_interact_menu_fnc_addActionToObject;
