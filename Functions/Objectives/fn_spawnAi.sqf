params ["_trg"];
_active = _trg getVariable "Active";

if (_active) then {

} else {
	// Get variables from the trigger 
	_trg setVariable ["Active", true];
	_regimentSide = _trg getVariable "Side";
	_regimentName = _trg getVariable "Regiment";
	

	_db = ["new", format ["%1 Regiments - %2 %3", _regimentSide, missionName, worldName]] call oo_inidbi;

	_regimentSize = ["read", [_regimentName, "Size"]] call _db;
	_regimentPos = ["read", [_regimentName, "Position"]] call _db;
	_regimentSide = ["read", [_regimentName, "Side"]] call _db;
	systemChat format ["%1", _regimentSize];

	_faction = "";
	if (_regimentSide == "b") then {
		_faction = west;
	};
	if (_regimentSide == "o") then {
		_faction = east;
	};

	for "_i" from 1 to _regimentSize do {
		_groupID = format ["Group %1", _i];
		_spawnPos = [_regimentPos, 1, 300, 5, 0, 10, 0, ["base"]] call BIS_fnc_findSafePos;
		_pltComp = ["read", [_regimentName, _groupID]] call _db;
		
		_grp = [_spawnPos, _faction, _pltComp] call BIS_fnc_spawnGroup;
		_grp deleteGroupWhenEmpty true;
		[_grp, _spawnPos, 100] call lambs_wp_fnc_taskPatrol;

		[_grp, _trg] execVM "Regiments\DeSpawnAI.sqf";
		{
			[_x, _groupID, _regimentName, _regimentSide] remoteExec ["fce_fnc_AIAttributes", 2];
		} forEach units _grp;

		[_unit, "lambs_danger_OnContact", {
			params [_unit, _groupOfUnit, _target];
			_chanceOfAirSupport = round (random 100);
			_chanceOfParatrooper = round (random 100);
			_chanceOfJetSupport = round (random 100);

			if (_chanceOfAirSupport < 10) then {
				_pos = getPos _unit;
				[_pos] remoteExec ["fce_fnc_aiAirSupport", 2];
			};
		}] call BIS_fnc_addScriptedEventHandler;
	};
};