// Module based design mission framework
// Define classes used in the framework 
[] remoteExec ["Fce_fnc_defineClasses", 2];

// Create Regiment and Locations 
[] execVM "Regiments\AOCreator.sqf";

// Start Logistics Module
[] remoteExec ["fce_fnc_populateList", 2];

// Start persistence module 
[] remoteExec ["fce_fnc_loadVehicles", 2];
[] remoteExec ["fce_fnc_loadItems", 2];

// Add loadouts and gear on menu
[Ace_Arsenal, ["Get Kit", {call fce_fnc_loadoutMenu}]] remoteExec ["addAction", 0, true];

// Start environmental module
[] execVM "WorldBuilder\startWorldBuilder.sqf";

// Start Civilian Module 
[] remoteExec ["fce_fnc_initCiv", 2];

// Add event handlers 
addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	_pos = getPosATL _unit;
	_gear = getUnitLoadout _unit;
	_dir = getDir _unit;
	_name = name _unit;
	_curRole = _unit getVariable "roleLoadout";
	[_name, _UID, _id, _pos, _gear, _dir, _curRole] remoteExec ["fce_fnc_savePlayer", 2];
}];
