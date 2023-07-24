params ["_player", "_didJIP"];

// Get existing data from database 
_id = clientOwner; 
_uid = getPlayerUID player;
[_player, _id, _uid] remoteExec ["fce_fnc_getPlayerData", 2];

// Add event handlers to player 
player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	_unit setPosatl [-1105.89,2142.39,8.00307];
	
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	player setUnitLoadout (getUnitLoadout dead_kit);

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	systemChat "Welcome to the after life...";
}];

sleep 10;
// Save data to server on a loop 
while {true} do {
	_pos = getPosATL player;
	_gear = getUnitLoadout player;
	_dir = getDir player;
	_role = player getVariable ["roleLoadout", "None"];
	_role = str _role;

	// Get player connection info 
	_uid = getPlayerUID player;

	// Send data to the server 
	[_pos, _gear, _dir, _role, _uid] remoteExec ["fce_fnc_savePlayer", 2];

	// Loop script 
	sleep 5;
};