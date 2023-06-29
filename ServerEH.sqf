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

	_medData = [];
	// Medical Data to save 
	_medVars = [
		"kat_airway_obstruction",
		"kat_airway_occluded",
		"kat_breathing_pneumothorax",
		"kat_breathing_hemopneumothorax",
		"kat_breathing_tensionpneumothorax",
		"kat_pharma_kidneyfail",
		"kat_breathing_airwaystatus",
		"ace_advanced_fatigue_ae2reserve",
		"kat_circulation_asystole",
		"kat_pharma_iv",
		"kat_pharma_txa",
		"kat_breathing_pulseoximeter",
		"kat_chemical_gasmask_durability",
		"kat_circulation_aed_x_volume",
		"kat_circulation_aedvehiclename",
		"kat_pharma_ivpfh",
		"kat_pharma_active",
		"kat_airway_overstretch",
		"ace_advanced_fatigue_muscledamage",
		"kat_airway_occluded",
		"kat_breathing_pulseoximeter_volume",
		"kat_circulation_bloodtypeplayer",
		"ace_advanced_fatigue_anfatigue",
		"kat_airway_obstruction",
		"kat_pharma_kidneypressure",
		"kat_surgery_etomidate",
		"kat_circulation_x",
		"kat_airway_recovery",
		"kat_chemical_enteredpoison",
		"kat_circulation_use",
		"kat_circulation_aedvehicle",
		"kat_pharma_ph",
		"kat_pharma_kidneyarrest",
		"ace_medical_islimping",
		"ace_medical_handledamageehid",
		"kat_breathing_stethoscopesoundvolume",
		"kat_airway_airway",
		"kat_circulation_returnedaed",
		"kat_chemical_chemdetectorstate",
		"kat_surgery_fractures",
		"kat_surgery_lidocaine",
		"kat_circulation_vehicletrue",
		"kat_pharma_alphaaction",
		"ace_advanced_fatigue_ae1reserve",
		"kat_circulation_cprcount",
		"kat_surgery_debridement",
		"kat_breathing_pulseoximeter_volumepatient"
	];

	{
		// Current result is saved in variable _x
		_data = _unit getVariable _X;
		_var = _x;
		_toSave = [_var, _data];
		_medData pushback _toSave;
	} forEach _medVars;

	[_name, _UID, _id, _pos, _gear, _dir, _medData] remoteExec ["fce_fnc_updatePlayerDatabase", 2];
}];