// Get existing data from database 
_name = name player;
_id = clientOwner; 
_uid = getPlayerUID player;
[_name, _uid, _id] remoteExec ["fce_fnc_getPlayerData", 2];

// Add event handlers to player 
player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	_unit setPosatl [-1105.89,2142.39,8.00307];
	
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	removeAllWeapons _corpse;
	removeAllItems _corpse;
	removeAllAssignedItems _corpse;
	removeBackpack _unit;

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	systemChat "Welcome to the after life...";
}];

player addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[_unit, _killer, _instigator] remoteExec ["fce_fnc_PlayerKilled", 2];
}];
