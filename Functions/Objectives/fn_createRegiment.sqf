params ["_count", "_side"];
for "_i" from 1 to _count do {
	// Create Regiment Identity
	_regimentNumber = round (random 300);
	_regimentNumber = [_regimentNumber, "english"] call BIS_fnc_ordinalNumber;
	_regimentType = selectRandom ["Infantry", "Mechanized", "Motorized", "Special Operations", "Armored"];
	_regimentName = format ["%1 %2 Regiment", _regimentNumber, _regimentType];
	_regimentMarker = "";
	_regimentSpeed = 5;
	switch (_regimentType) do {
		case "Infantry": {_regimentMarker = format ["%1_Inf", _side]; _regimentSpeed = 6};
		case "Mechanized": {_regimentMarker = format ["%1_mech_inf", _side]; _regimentSpeed = 10};
		case "Motorized": {_regimentMarker = format ["%1_Motor_inf", _side]; _regimentSpeed = 15};
		case "Special Operations": {_regimentMarker = format ["%1_Recon", _side]; _regimentSpeed = 8};
		case "Armored": {_regimentMarker = format ["%1_Armor", _side]; _regimentSpeed = 6};
	};
	_HqPos = [["AO"], ["base", "water"]] call BIS_fnc_randomPos;
	_regimentSize = round (random [5, 10, 15]);
	_regimentSkill = selectRandom ["Private", "Corporal", "Sergeant", "Lieutenant", "Captain", "Major", "Colonel"];

	// Save regiment to database 
	_db = ["new", format ["%1 Regiments - %2 %3", _side, missionName, worldName]] call oo_inidbi;
	["write", [_regimentName, "Position", _hqPos]] call _db;
	["write", [_regimentName, "Type", _regimentType]] call _db;
	["write", [_regimentName, "Marker", _regimentMarker]] call _db;
	["write", [_regimentName, "Speed", _regimentSpeed]] call _db;
	["write", [_regimentName, "Size", _regimentSize]] call _db;
	["write", [_regimentName, "Skill", _regimentSkill]] call _db;
	["write", [_regimentName, "Side", _side]] call _db;

	// Add marker to world map 
	_mkr = createMarkerLocal [_regimentName, _hqPos];
	_mkr setMarkerTextLocal _regimentName;
	_mkr setMarkerAlphaLocal 0;
	_mkr setMarkerType _regimentMarker;

	// Add headquarters to destroy with guards 
	_hqBuilding = "Land_A_tent";
	_hqBuildingPos = [_hqPos, 0, 20, 3, 0, 10, 0, ["base"]] call BIS_fnc_findSafePos;
	_hq = _hqBuilding createVehicle _hqBuildingPos;

	_hqFlag = "Flag_ACM_HDF1";
	_flagPos = [_hqBuildingPos, 0, 5, 1, 0, 10, 0, ["base"]] call BIS_fnc_findSafePos;
	_flag = _hqFlag createVehicle _flagPos;

	_hq allowDamage false;
	_flag allowDamage false;

	_hq setVariable ["Regiment", _regimentName];
	_hq setVariable ["Flag", _flag];

	[_hq, ["Destroy Enemy HQ", {
		_regimentName = _target getVariable "Regiment";
		_flag = _target getVariable "Flag";

		_db = ["new", format ["%1 Regiments - %2 %3", _side, missionName, worldName]] call oo_inidbi;
		deleteVehicle _flag;
		deleteVehicle _target;
		["deleteSection", _regimentName] call _db;
	}]] remoteExec ["AddAction", 0, true];
};