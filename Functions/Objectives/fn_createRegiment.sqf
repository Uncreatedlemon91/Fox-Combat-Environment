params ["_count", "_side"];
// Define the Database 
_db = ["new", format ["%1 Regiments - %2 %3", _side, missionName, worldName]] call oo_inidbi;
_exists = "Exists" call _db;

if (_exists) then {
	_sections = "getSections" call _db;
	{
		_hqPos = ["read", [_x, "Position"]] call _db;
		_regimentType = ["read", [_x, "Type"]] call _db;
		_regimentMarker = ["read", [_x, "Marker"]] call _db;
		_regimentSpeed = ["read", [_x, "Speed"]] call _db;
		_regimentSize = ["read", [_x, "Size"]] call _db;
		_regimentSkill= ["read", [_x, "Skill"]] call _db;

		// Add Debug tools 
		_mkr = createMarkerLocal [_x, _hqPos];
		_mkr setMarkerTextLocal _x;
		_mkr setMarkerAlpha 0;
		_mkr setMarkerType _regimentMarker;

		[format ["%1 Loaded", _x]] remoteExec ["systemChat", 0, true];

	} forEach _sections;
} else {
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
		_mkr setMarkerAlphaLocal 1;
		_mkr setMarkerType _regimentMarker;
	};
}

