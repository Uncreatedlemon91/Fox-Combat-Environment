params ["_trg"];
_active = _trg getVariable "Active";


if (_active == true) then {

} else {
	// Get variables from the trigger 
	_trg setVariable ["Active", true, true];
	_regimentSide = _trg getVariable "Side";
	_regimentName = _trg getVariable "Regiment";
	

	_db = ["new", format ["%1 Regiments - %2 %3", _regimentSide, missionName, worldName]] call oo_inidbi;

	_regimentSize = ["read", [_regimentName, "Size"]] call _db;
	_regimentPos = ["read", [_regimentName, "Position"]] call _db;
	_regimentSide = ["read", [_regimentName, "Side"]] call _db;
	_regimentRank = ["read", [_regimentName, "Skill"]] call _db;

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

			_chanceOfAirSupport = random 100;

			if (_chanceOfAirSupport < 25) then {
				[_unit, _target] execVM "Regiments\AIAirSupport.sqf";
				systemChat "Calling in Air";
			};
		}] call BIS_fnc_addScriptedEventHandler;

		[_grpLdr, "lambs_danger_OnArtilleryCalled", {
			params ["_unitThatCalledArtillery", "_groupOfUnit", "_ArtilleryGun", "_TargetPosition"];
			_chance = random 100;
			_chanceOfIntercept = 25;
			if (_chance < _chanceOfIntercept) then {
				// Get the players with a 148 radio on them 
				_radioOperators = [];
				{
					_hasRadio = [_x, "ACRE_PRC148"] call acre_api_fnc_hasKindOfRadio;
					if (_hasRadio) then {
						_radioOperators pushback _x;
					};
				} forEach allPlayers;
				
				_receiver = selectRandom _radioOperators;
				_receiverID = netId _receiver;
				_arty = [configFile >> "CfgVehicles" >> typeOf _ArtilleryGun] call BIS_fnc_displayName;
				format ["[RADIO INTERCEPT] This is %2 to %3. We are requesting immediate fire mission on %1", _TargetPosition, _groupOfUnit, _ArtilleryGun] remoteExec ["SystemChat", _receiverID];
			};
		}] call BIS_fnc_addScriptedEventHandler;

		[_grpLdr, "lambs_danger_OnInformationShared", {
			params ["_unit", "_groupOfUnit", "_target", "_groups"];
			_chance = random 100;
			_chanceOfIntercept = 25;
			systemChat "AI is Calling out targets";
			if (_chance < _chanceOfIntercept) then {
				// Get the players with a 117 radio on them 
				_radioOperators = [];
				{
					_hasRadio = [_x, "ACRE_PRC148"] call acre_api_fnc_hasKindOfRadio;
					systemChat "Check radios";
					if (_hasRadio) then {
						_radioOperators pushback _x;
					};
				} forEach allPlayers;
				
				_receiver = selectRandom _radioOperators;
				_receiverID = netid _receiver;
				format ["[RADIO INTERCEPT] We have eyes on enemy contact! It looks like %1! Send assistance!", _target] remoteExec ["SystemChat", _receiverID];
			};
		}] call BIS_fnc_addScriptedEventHandler;

		{
			[_x, _groupID, _regimentName, _regimentSide, _regimentRank] remoteExec ["fce_fnc_AIAttributes", 2];	
		} forEach units _grp;
	sleep 3;
	};
};