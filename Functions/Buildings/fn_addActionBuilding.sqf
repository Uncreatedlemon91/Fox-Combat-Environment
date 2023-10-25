// Adds an ace action to the building to enable repairs 
params ["_bld"];

_repairBld = [
	"repairBld",
	"Reconstruct the building",
	"",
	{_target setDamage 0},
	{true},
	{},
	[],
	[0, 0, 0],
	100
] call ace_interact_menu_fnc_createAction;

// Add Action to FOB Area
[_bld, 0, ["ACE_MainActions"], _repairBld] call ace_interact_menu_fnc_addActionToObject;
