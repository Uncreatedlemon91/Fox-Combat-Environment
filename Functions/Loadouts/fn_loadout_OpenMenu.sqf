// Opens the menu to show the loadouts available and whitelisted to the player. 
params ["_loadouts"];

// Open the menu and display whitelisted roles 
createDialog "LoadoutsNew";

// Put the loadouts on the left side List box 
_leftBox = findDisplay 3 displayCtrl 1500;
{
	_newItem = _leftBox lbAdd _x;
} forEach _loadouts;

// Provide actions on the buttons of the menu 
_getLoadout = findDisplay 3 displayCtrl 1600;
_getLoadout buttonSetAction "closeDialog 2; [] call fce_fnc_loadout_getKit";

_exitMenu = findDisplay 3 displayCtrl 1601;
_exitMenu buttonSetAction "closeDialog 2";
