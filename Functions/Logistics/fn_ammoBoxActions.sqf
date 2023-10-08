// Adds actions to the ammo box 
params ["_box"];

// Create ACE actions 
_resupply = [
	"resupply",
	"Re-supply",
	"",
	{
		_loadout = _player getVariable "fox_loadout_kit";
		_player setUnitLoadout _loadout;
		deleteVehicle _target;
		hint "Loadout Refreshed!";
	},
	{true},
	{},
	[],
	[0, 0, 0],
	100
] call ace_interact_menu_fnc_createAction;

[_box, 0, ["ACE_MainActions"], _resupply] call ace_interact_menu_fnc_addActionToObject;