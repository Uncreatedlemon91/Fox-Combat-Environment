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

		[_grp, _trg, _regimentName, _groupID] execVM "Regiments\DeSpawnAI.sqf";
		{
			//[_x, _groupID, _regimentName, _regimentSide] remoteExec ["fce_fnc_AIAttributes", 2];

			[_x, "lambs_danger_OnAssess", {
				params ["_unit", "_groupOfUnit", "_enemys"];
				systemChat "ASSESSING!";
				_chanceOfAirSupport = round (random 100);
				_chanceOfParatrooper = round (random 100);
				_chanceOfJetSupport = round (random 100);

				systemChat format ["Air: %1, Paras: %2, Jets: %3", _chanceofAirSupport, _chanceOfParatrooper, _chanceOfJetSupport];

				if (_chanceOfAirSupport < 5) then {
					[_unit] remoteExec ["fce_fnc_aiAirSupport", 2];
				};

				if (_chanceofParatrooper < 40) then {
					execVM "Regiments\AIParatroopers.sqf";
				};
			}] call BIS_fnc_addScriptedEventHandler;
		} forEach units _grp;
	};
};