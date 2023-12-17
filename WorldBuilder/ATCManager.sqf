// Setup actions to the ATC Laptops 
/*
[atc_1,["Use ATC Laptop", {
	params ["_target", "_caller", "_actionId", "_arguments"];
	_loadout = _caller getVariable "roleLoadout";
	_caller setVariable ["Fox_ATC_Status", [_target, true]];
	execVM "Worldbuilder\ATC.sqf";
}]] remoteExec ["addAction", 0, true];
*/

_openATC = [
	"OpenWL",
	"Open ATC Laptop",
	"",
	{
		_player setVariable ["Fox_ATC_Status", [_target, true]];
		execVM "Worldbuilder\ATC.sqf";
	},
	{true},
	{},
	[],
	[0, 0, 0],
	100
] call ace_interact_menu_fnc_createAction;

[atc_1, 0, ["ACE_MainActions"], _openATC] call ace_interact_menu_fnc_addActionToObject;