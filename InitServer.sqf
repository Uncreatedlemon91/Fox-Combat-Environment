// Module based design mission framework

// Create Regiment and Locations 
[] execVM "Regiments\AOCreator.sqf";

// Start Logistics Module
[] call fce_fnc_populateList;

// Start persistence module 
[] call fce_fnc_loadVehicles;
[] call fce_fnc_loadItems;

// Add loadouts and gear on menu
[Ace_Arsenal, ["Get Kit", {call fce_fnc_loadoutMenu}]] remoteExec ["addAction", 0, true];

// Start environmental module
[] execVM "WorldBuilder\startWorldBuilder.sqf";

// Add event handlers 
addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	_pos = getPosATL _unit;
	_gear = getUnitLoadout _unit;
	_dir = getDir _unit;

	[_name, _UID, _id, _pos, _gear, _dir] remoteExec ["fce_fnc_savePlayer", 2];
}];
/*
addMissionEventHandler ["OnUserSelectedPlayer", {
		params ["_networkId", "_playerObject"];
		_name = name _playerobject;
		_uid = getplayerUID _playerObject;
		_netId = _networkId;
}];