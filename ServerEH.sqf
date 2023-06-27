addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	_pos = getPosATL _unit;
	_gear = getUnitLoadout _unit;
	_dir = getDir _unit;
	
	// Medical Data to save 
	_aObs = _unit getVariable ["kat_airway_obstruction", false];
	_aOcc = _unit getVariable ["kat_airway_occluded", false];
	_pnu = _unit getVariable ["kat_breathing_pneumothorax", false];
	_hemo = _unit getVariable ["kat_breathing_hemopneumothorax", false];
	_tens = _unit getVariable ["kat_breathing_tensionpneumothorax", false];

	_medData = [_aObs, _aOcc, _pnu, _hemo, _tens];
	

	[_name, _UID, _id, _pos, _gear, _dir, _medData] remoteExec ["fce_fnc_updatePlayerDatabase", 2];
	//true;
}];

addMissionEventHandler ["PlayerDisconnected", {
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	_data = getUserInfo _id;
	_unit = _data select 10;

	_pos = getPosATL _unit;
	_gear = getUnitLoadout _unit;
	_dir = getDir _unit;
	
	// Medical Data to save 
	_aObs = _unit getVariable ["kat_airway_obstruction", false];
	_aOcc = _unit getVariable ["kat_airway_occluded", false];
	_pnu = _unit getVariable ["kat_breathing_pneumothorax", false];
	_hemo = _unit getVariable ["kat_breathing_hemopneumothorax", false];
	_tens = _unit getVariable ["kat_breathing_tensionpneumothorax", false];

	_medData = [_aObs, _aOcc, _pnu, _hemo, _tens];
	

	[_name, _UID, _id, _pos, _gear, _dir, _medData] remoteExec ["fce_fnc_updatePlayerDatabase", 2];
}];