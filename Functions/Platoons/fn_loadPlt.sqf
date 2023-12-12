// Params 
params ["_faction", "_side"];

// Set script variables 
_mkrAlpha = 0;

// Load the platoons saved on databases to the game 
_pltDb = ["new", format ["%3 Platoons %1 %2", missionName, worldName, _faction]] call oo_inidbi;
_sections = "getSections" call _pltDb;

{
	_pos = ["read", [_x, "Pos"]] call _pltDb;
	_mkrType = ["read", [_x, "Marker"]] call _pltDb;
	_type = ["read", [_x, "Type"]] call _pltDb;
	_speed = ["read", [_x, "Speed"]] call _pltDb;
	_size = ["read", [_x, "Size"]] call _pltDb;

	// Create the marker for non-instanced AI 
	_mkr = createMarkerLocal [format ["%1 - %2", _type, _pos], _pos];
	_mkr setMarkerTypeLocal _mkrType;
	_mkr setMarkerSizeLocal [0.6, 0.6];
	_mkr setMarkerAlphaLocal _mkrAlpha;
	_mkr setMarkerTextLocal format ["%1 | %2", _type, _size];

	// Create Trigger 
	_trg = createTrigger ["EmptyDetector", _pos, true];
	_trg setTriggerArea [900, 900, 0, false, 100];
	_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	_trg setTriggerStatements [
		"this", 
		"[thisTrigger] remoteExec [""fce_fnc_spawnAi"", 2]",
		""
	];
	_trg setVariable ["unitID", _x, true];
	_trg setVariable ["unitMkr", _mkr, true];
	_trg setVariable ["unitType", _type, true];
	_trg setVariable ["unitActive", false, true];
	_trg setVariable ["unitSide", _side, true];
	_trg setVariable ["unitSpeed", _speed, true];

	// End function - Inform admin / local server
	// systemChat format ["[PLT - %2] Platoon %1 Loaded!", _type, _side];

	// send Platoon to objective area 
	[_trg] remoteExec ["fce_fnc_movePlatoon", 2];
} forEach _sections;
