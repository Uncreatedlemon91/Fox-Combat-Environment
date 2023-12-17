// Add action to the computer for players to use
/*
[logiLapt, ["Whitelist Menu", {
	[clientOwner] remoteExec ["fce_fnc_LoadWlMenu", 2];
}]]remoteExec ["addAction", 0, true];
*/

_openWL = [
	"OpenWL",
	"Whitelist Menu",
	"",
	{
		[clientOwner] remoteExec ["fce_fnc_LoadWlMenu", 2];
	},
	{true},
	{},
	[],
	[0, 0, 0],
	100
] call ace_interact_menu_fnc_createAction;

[logiLapt, 0, ["ACE_MainActions"], _openWL] call ace_interact_menu_fnc_addActionToObject;