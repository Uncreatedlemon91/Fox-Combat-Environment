// Module based design mission framework
// Define classes used in the framework 
[] remoteExec ["Fce_fnc_defineClasses", 2];

// Start Civilian Module 
// [] remoteExec ["fce_fnc_initCiv", 2];

// Create Regiment and Locations 
[] execVM "Regiments\AOCreator.sqf";

// Start Logistics Module
[] remoteExec ["fce_fnc_startLogistics", 2];

// Start persistence module 
[] remoteExec ["fce_fnc_loadVehicles", 2];
[] remoteExec ["fce_fnc_loadItems", 2];
[] remoteExec ["fce_fnc_loadFOBs", 2];

// Add loadouts and gear on menu
[] remoteExec ["fce_fnc_loadout_DefineKits", 2];

// Start environmental module
[] execVM "WorldBuilder\startWorldBuilder.sqf";

// Add whitelist Controller 
[] remoteExec ["fce_fnc_initWL", 2];

// Add event handlers 
addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	_pos = getPosATL _unit;
	_gear = getUnitLoadout _unit;
	_dir = getDir _unit;
	_name = name _unit;
	_curRole = _unit getVariable "roleLoadout";
	_med = [_unit] call ace_medical_fnc_serializeState;
	_face = face _unit;
	[_name, _UID, _id, _pos, _gear, _dir, _curRole, _med, _face] remoteExec ["fce_fnc_savePlayer", 2];
}];
