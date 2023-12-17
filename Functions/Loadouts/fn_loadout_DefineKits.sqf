// Grab all the kits from the editor and compile them into the Database to be used later on. 
_kits = (getmissionlayerEntities "RoleKits") select 0;
_db = ["new", format ["Fox Kits %1 %2", missionName, worldName]] call oo_inidbi;
{
	_displayName = _x getVariable "Fox_Display";
	_kit = getUnitLoadout _x;
	
	["write", [_displayName, "Loadout", _kit]] call _db;
} forEach _kits;

// Execute setup of arsenal and 'get kits' function
/*
[Ace_Arsenal, ["Get Kit", {
	params ["_target", "_caller", "_actionId", "_arguments"];
	_netId = clientOwner;
	[_caller, _netID] remoteExec ["fce_fnc_loadout_PrepMenu", 2]}
]] remoteExec ["addAction", 0, true];
*/

// Create ACE actions 
_arsenalKit = [
	"ChangeKit",
	"Change Kit",
	"",
	{
		_netId = clientOwner;
		[_player, _netID] remoteExec ["fce_fnc_loadout_PrepMenu", 2];
	},
	{true},
	{},
	[],
	[0, 0, 0],
	100
] call ace_interact_menu_fnc_createAction;

[Ace_Arsenal, 0, ["ACE_MainActions"], _arsenalKit] call ace_interact_menu_fnc_addActionToObject;