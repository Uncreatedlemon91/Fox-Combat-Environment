// Get existing data from database 
_name = name player;
_id = clientOwner; 
_uid = getPlayerUID player;
[_name, _uid, _id] remoteExec ["fce_fnc_getPlayerData", 2];
[] remoteExec ["fce_fnc_defineObjects", clientOwner];

// Add event handlers to player 
player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	
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
	removeBackpack _corpse;

	_name = name _unit;
	_id = clientOwner; 
	_uid = getPlayerUID _unit;
	[_name, _uid, _id] remoteExec ["fce_fnc_getPlayerData", 2];

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
}];

player addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[_unit, _killer, _instigator] remoteExec ["fce_fnc_PlayerKilled", 2];
}];

player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	[_unit, _role, _vehicle, clientOwner, "GetIn"] remoteExec ["fce_fnc_CheckVehicles", 2];
}];

player addEventHandler ["SeatSwitchedMan", {
	params ["_unit1", "_unit2", "_vehicle"];
	[_unit1, _unit2, _vehicle, clientOwner, "Switch"] remoteExec ["fce_fnc_CheckVehicles", 2];
}];

while {true} do {
	player unlinkItem "ItemGPS";
	player removeItem "ItemGPS";
	sleep 20;
};