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
	_uid = getPlayerUID player;
	[_unit, _role, _vehicle, clientOwner, "GetIn", _uid] remoteExec ["fce_fnc_CheckVehicles", 2];
}];

player addEventHandler ["SeatSwitchedMan", {
	params ["_unit1", "_unit2", "_vehicle"];
	_uid = getPlayerUID player;
	[_unit1, _unit2, _vehicle, clientOwner, "Switch", _uid] remoteExec ["fce_fnc_CheckVehicles", 2];
}];

// Add weapon switching notice 
waitUntil {!(isNull (findDisplay 46))};
#include "\a3\ui_f\hpp\definedikcodes.inc"
findDisplay 46 displayAddEventHandler ["KeyUp", {
	params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
	if (_key == 33) then {
		_wep = currentWeapon player;
		systemChat format ["Fire-mode: %1", _mode];
	};
}];

// Add Grenade switching notice
findDisplay 46 displayAddEventHandler ["KeyUp", {
	params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
	if ((_key == 34) AND (_ctrl)) then {
		_selThrowable = currentThrowable  player;
		_class = _selThrowable select 0;
		_name = gettext (configfile >> "CfgMagazines" >> _class >> "displayName");
		systemChat format ["Selected Throwable: %1", _name];
	};
}];

// Stop players getting a GPS
while {true} do {
	player unlinkItem "ItemGPS";
	player removeItem "ItemGPS";
	sleep 20;
};