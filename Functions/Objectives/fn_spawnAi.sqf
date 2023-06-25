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
		_grpLdr = leader _grp;
		[_grpLdr, "lambs_danger_OnContact", {
			params ["_unit", "_groupOfUnit", "_target"];
			systemChat "ASSESSING!";
			_chanceOfAirSupport = random 100;
			_chanceOfParatrooper = random 100;

			if (_chanceOfAirSupport < 5) then {
				[_unit, _target] execVM "Regiments\AIAirSupport.sqf";
			};

			if (_chanceofParatrooper < 5) then {
				[_unit] execVM "Regiments\AIParatroopers.sqf";
			};
		}] call BIS_fnc_addScriptedEventHandler;

		[_grpLdr, "lambs_danger_OnArtilleryCalled", {
			params ["_unitThatCalledArtillery", "_groupOfUnit", "_ArtilleryGun", "_TargetPosition"];
			
			// Get the players with a 117 radio on them 
			_radioOperators = [];
			{
				_hasRadio = [_x, "ACRE_PRC148"] call acre_api_fnc_hasKindOfRadio;
				_detachment = _x getVariable "Detachment";
				if ((_hasRadio) && (_detachment = "S2")) then {
					_radioOperators pushback _x;
				};
			} forEach allPlayers;
			
			_receiver = selectRandom _radioOperators;
			_receiverID = owner _receiver;
			[format ["Be Advised: Enemy Observers are requesting %1 to fire at %2"], _artilleryGun, _targetPosition] remoteExec ["SystemChat", _receiverID, true];
		}] call BIS_fnc_addScriptedEventHandler;

		[_grpLdr, "lambs_danger_OnInformationShared", {
			params ["_unit", "_groupOfUnit", "_target", "_groups"];
			
			// Get the players with a 117 radio on them 
			_radioOperators = [];
			{
				_hasRadio = [_x, "ACRE_PRC148"] call acre_api_fnc_hasKindOfRadio;
				_detachment = _x getVariable "Detachment";
				if ((_hasRadio) && (_detachment = "S2")) then {
					_radioOperators pushback _x;
				};
			} forEach allPlayers;
			
			_receiver = selectRandom _radioOperators;
			_receiverID = owner _receiver;
			[format ["Be Advised: Enemy Forces are observing %1. They are receiving information about %2."], _target, _groups] remoteExec ["SystemChat", _receiverID, true];
		}] call BIS_fnc_addScriptedEventHandler;

		{
			[_x, _groupID, _regimentName, _regimentSide] remoteExec ["fce_fnc_AIAttributes", 2];	
		} forEach units _grp;
	};
};