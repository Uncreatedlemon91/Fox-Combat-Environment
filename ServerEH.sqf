["ace_trenches_finished", fce_fnc_saveTrench] call CBA_fnc_addEventHandler;

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	_pos = getPosATL _unit;
	_gear = getUnitLoadout _unit;
	_dir = getDir _unit;
	_bullets = _unit getVariable ["Bullets", 0];
	_unit setVariable ["Bullets", 0];

	[_name, _UID, _id, _pos, _gear, _dir, _bullets] remoteExec ["fce_fnc_updatePlayerDatabase", 2];
	//true;
}];