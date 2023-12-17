/*
Establish supplies of logistics at Laptop
*/
[] remoteExec ["fce_fnc_defineObjects", 0, true];

// Add action to the computer for players to use
/*
[logiLapt, ["Open Logistics", {
	[] remoteExec ["fce_fnc_openLogiMenu", clientOwner];
}]]remoteExec ["addAction", 0, true];
*/

// Create ACE actions 
_openLogi = [
	"OpenLogi",
	"Open Logistics",
	"",
	{
		[] remoteExec ["fce_fnc_openLogiMenu", clientOwner];
	},
	{true},
	{},
	[],
	[0, 0, 0],
	100
] call ace_interact_menu_fnc_createAction;

[logiLapt, 0, ["ACE_MainActions"], _openLogi] call ace_interact_menu_fnc_addActionToObject;