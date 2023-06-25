addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	_pos = getPosATL _unit;
	_gear = getUnitLoadout _unit;
	_dir = getDir _unit;

	[_name, _UID, _id, _pos, _gear, _dir] remoteExec ["fce_fnc_updatePlayerDatabase", 2];
	//true;
}];

addMissionEventHandler ["PlayerDisconnected", {
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	_data = getUserInfo _id;
	_unit = _data select 10;

	_pos = getPosATL _unit;
	_gear = getUnitLoadout _unit;
	_dir = getDir _unit;
	[_name, _UID, _id, _pos, _gear, _dir] remoteExec ["fce_fnc_updatePlayerDatabase", 2];
}];