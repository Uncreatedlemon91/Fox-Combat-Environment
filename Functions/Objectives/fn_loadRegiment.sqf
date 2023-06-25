params ["_regimentSide"];
_db = ["new", format ["%1 Regiments - %2 %3", _regimentSide, missionName, worldName]] call oo_inidbi;
_sections = "getSections" call _db;
{
		_hqPos = ["read", [_x, "Position"]] call _db;
		_regimentSide = ["read", [_x, "Side"]] call _db;
		_regimentMarker = ["read", [_x, "Marker"]] call _db;

		// Start function to watch for player locality
		_trg = createTrigger ["EmptyDetector", _hqPos, true];
		_trg setVariable ["Active", false, true];
		_trg setVariable ["Regiment", _x];
		_trg setVariable ["Side", _regimentSide];
		_trg setTriggerArea [850, 850, 0, false, 200];
		_trg setTriggerActivation ["WEST", "PRESENT", true];
		_trg setTriggerStatements ["this", "[thisTrigger] remoteExec ['fce_fnc_SpawnAI', 2]", ""];

		// Add marker to world map 
		_mkr = createMarkerLocal [_x, _hqPos];
		_mkr setMarkerTextLocal _x;
		_mkr setMarkerAlphaLocal 0;
		_mkr setMarkerType _regimentMarker;
} forEach _sections;