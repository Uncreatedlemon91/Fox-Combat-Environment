params ["_trg"];
_active = _trg getVariable "Active";

if (_active == true) then {

} else {
	// Get variables from the trigger 
	"AI Spawning" remoteExec ["systemChat", 0, true];
	_trg setVariable ["Active", true, true];
	_regimentSide = _trg getVariable "Side";
	_regimentName = _trg getVariable "Regiment";

	_db = ["new", format ["%1 Regiments - %2 %3", _regimentSide, missionName, worldName]] call oo_inidbi;

	_regimentSize = ["read", [_regimentName, "Size"]] call _db;
	_regimentPos = ["read", [_regimentName, "Position"]] call _db;
	_regimentSide = ["read", [_regimentName, "Side"]] call _db;
	systemChat format ["%1", _regimentName];

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

		[_grp, _trg, _regimentName, _groupID, _regimentSide] execVM "Regiments\DeSpawnAI.sqf";
		{
			[_x, "lambs_danger_OnContact", {
				params ["_unit", "_groupOfUnit", "_target"];
				systemChat "ASSESSING!";
				_chanceOfAirSupport = round (random 100);
				_chanceOfParatrooper = round (random 100);

				if (_chanceOfAirSupport < 2) then {
					[_unit, _target] execVM "Regiments\AIAirSupport.sqf";
				};

				if (_chanceofParatrooper < 2) then {
					[_unit] execVM "Regiments\AIParatroopers.sqf";
				};
			}] call BIS_fnc_addScriptedEventHandler;
		} forEach units _grp;
	};
};