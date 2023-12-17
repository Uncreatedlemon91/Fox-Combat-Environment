// Allows users to select a different kit. 
params ["_box"];

// Create ACE actions 
_changeKit = [
	"ChangeKit",
	"Change Kit",
	"",
	{
		_netId = clientOwner;
		[_player, _netID] remoteExec ["fce_fnc_loadout_PrepMenu", 2];
		deleteVehicle _target;
	},
	{true},
	{},
	[],
	[0, 0, 0],
	100
] call ace_interact_menu_fnc_createAction;

[_box, 0, ["ACE_MainActions"], _changeKit] call ace_interact_menu_fnc_addActionToObject;

[_box, 4] call ace_cargo_fnc_setSize;