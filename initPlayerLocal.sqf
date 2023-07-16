// Setup player character
//
_name = name player;
_uid = getPlayerUID player;
_netId = clientOwner;
[_name, _uid, _netId] remoteExec ["fce_fnc_checkPlayerData", 2];

player addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_name = name _unit;
	_uid = getPlayerUID _unit;

	_killerType = typeOf _killer;
	_killer = name _killer;
	[_name, _uid, _killer, _killerType, _date] remoteExec ["fce_fnc_playerDied", 2];
}];

// Get player information to relay with the database 
_name = name player;
_uid = getPlayerUID player;
_netID = clientOwner;

// Connect players to the database 
_inDatabase = [_name, _uid, _netID] remoteExec ["fce_fnc_checkDb", 2];
if (_inDatabase) then {
	// If data present, grab it and load it to player model 
	_playerData = [_name, _uid, _netID] remoteExec ["fce_fnc_getPlayerData", 2];
	params ["_pos", "_dir", "_gear", "_face", "_insignia", "_health", "_role", "_quals", "_Det"];
	player setPosATL _pos;
	player setDir _dir;
	player setUnitLoadout _gear;
	player setFace _face;
	[player, _insignia] call BIS_fnc_setUnitInsignia;
	player setVariable ["fox_role", _role];
	player setVariable ["fox_Quals", _quals];
	player setVariable ["fox_Detachment", _det];
	{
		_var = _x select 0;
		_val = _x select 1;
		player setVariable [_var, _val];
	} forEach _health;

	systemChat "Player Data loaded!";
} else {
	// If no data present, create data point for player
	systemChat "No player profile found! Creating new profile...";
	sleep 2;
	[_name, _uid, _netID] remoteExec ["fce_fnc_createProfile", 2];
};

// Loop database updates and player persistence saving. 
while {alive player} do {
	_pos = getPosATL player;
	_gear = getUnitLoadout player;
	_dir = getDir player;
	_role = player getVariable "fox_role";
	_insig = [player] call BIS_fnc_getUnitInsignia;
	_face = face player;
	_quals = player getVariable "fox_quals";
	_det = player getVariable "fox_detachment"

	_health = [];
	_medVars = [
		"kat_airway_obstruction",
		"kat_airway_occluded",
		"kat_breathing_pneumothorax",
		"kat_breathing_hemopneumothorax",
		"kat_breathing_tensionpneumothorax",
		"kat_pharma_kidneyfail",
		"kat_breathing_airwaystatus",
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
		"kat_airway_occluded",
		"kat_breathing_pulseoximeter_volume",
		"kat_circulation_bloodtypeplayer",
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
		_data = _unit getVariable _X;
		_var = _x;
		_toSave = [_var, _data];
		_health pushback _toSave;
	} forEach _medVars;

	["_name", "_UID", "_netID", "_pos", "_gear", "_dir", "_medData", "_role", "_insig", "_face"] remoteExec ["fce_fnc_updateProfile", 2];

	// Repeat loop 
	sleep 10;
};

// Handle death of player 
[_name, _UID, _netID, [947.509,2880.22,0], _gear, _dir, _medData, _role, _insig, _face] remoteExec ["fce_fnc_updateProfile", 2];

