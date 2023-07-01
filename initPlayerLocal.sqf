// Setup player character
//
_name = name player;
_uid = getPlayerUID player;
_netId = clientOwner;
player setVariable ["Roles", ["Rifle"]];
[_name, _uid, _netId] remoteExec ["fce_fnc_checkPlayerData", 2];

player addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_name = name _unit;
	_uid = getPlayerUID _unit;

	_killerType = typeOf _killer;
	_killer = name _killer;
	[_name, _uid, _killer, _killerType, _date] remoteExec ["fce_fnc_playerDied", 2];
}];

while {alive player} do {
	sleep 10;
	_pos = getPosATL player;
	_gear = getUnitLoadout player;
	_dir = getDir player;

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
		_data = player getVariable _X;
		_var = _x;
		_toSave = [_var, _data];
		_medData pushback _toSave;
	} forEach _medVars;

	[_name, _UID, _id, _pos, _gear, _dir, _medData] remoteExec ["fce_fnc_updatePlayerDatabase", 2];
};