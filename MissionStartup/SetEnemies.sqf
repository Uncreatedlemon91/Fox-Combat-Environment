
_db = ["new", format ["Enemies %1 %2", missionName, worldName]] call oo_inidbi;
_exists = "exists" call _db;

if (_exists) then {
	_sections = "getSections" call _db;
	{
		_pos = ["read", [_x, "Position"]] call _db;
		_mkrtype = ["read", [_x, "Type"]] call _db;

		_mkr = createMarker ["new", format ["%1 - %2", random 7000, _mkrType], _pos];
		_mkr setMarkerType _mkrType;
		_mkr setMarkerSize [0.7, 0.7];
		_mkr setMarkerAlpha 0;

		_trg = createTrigger ["EmptyDetector", _pos, true];
		_trg setTriggerArea [1000, 1000, 0, false];
		_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
		_trg setVariable ["grpMkr", _mkr, true];
		_trg setTriggerStatements ["this", "_mkr = thisTrigger getvariable 'grpMkr'; [_mkr] call fce_fnc_spawnmkrgrp", "_mkr = thisTrigger getvariable 'grpMkr'; _mkr setMarkerAlpha 0"];
	} forEach _sections;
} else {
	_countAI = round (random [1500, 1800, 2000]);
	for "_i" from 0 to _countAI do {
		_pos = [["AO"], ["Base", "water"]] call BIS_fnc_randomPos;
		_mkrtype = selectRandomWeighted ["o_inf", 0.7, "o_armor", 0.2, "o_motor_inf", 0.3, "o_mech_inf", 0.3, "o_mortar", 0.2];

		_mkr = createMarker [format ["%1 - %2", random 7000, _mkrType], _pos];
		_mkr setMarkerType _mkrType;
		_mkr setMarkerSize [0.7, 0.7];
		_mkr setMarkerAlpha 0;

		_trg = createTrigger ["EmptyDetector", _pos, true];
		_trg setTriggerArea [1000, 1000, 0, false];
		_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
		_trg setVariable ["grpMkr", _mkr, true];
		_trg setTriggerStatements ["this", "_mkr = thisTrigger getvariable 'grpMkr'; [_mkr] call fce_fnc_spawnmkrgrp", "_mkr = thisTrigger getVariable 'grpMkr'; _mkr setMarkerAlpha 0"];

		["write", [_mkr, "Position", _pos]] call _db;
		["write", [_mkr, "Type", _mkrType]] call _db;
		["write", [_mkr, "Active", false]] call _db;
		["write", [_mkr, "Class", ""]] call _db;
	};
};