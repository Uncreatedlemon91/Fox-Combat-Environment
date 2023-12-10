params ["_trg"];

_active = _trg getVariable "unitActive";
_side = _trg getVariable "unitSide";

_pltDb = "";
_faction = "";
_sideStr = "";

switch (_side) do {
    case "O": {_pltDb = ["new", format ["OPFOR Platoons %1 %2", missionName, worldName]] call oo_inidbi; _faction = east; _sideStr = "OPFOR"};
    case "B": {_pltDb = ["new", format ["BLUFOR Platoons %1 %2", missionName, worldName]] call oo_inidbi; _faction = west; _sideStr = "BLUFOR"};
};

if !(_active) then {
	// Get variables from the trigger 
	_trg setVariable ["unitActive", true, true];
	_type = _trg getVariable "unitType";
	_id = _trg getVariable "unitID";
	_endpos = _trg getVariable "PltEndPos";

	_count = ["read", [_id, "Size"]] call _pltDb;
	_comp = ["read", [_id, "Composition"]] call _pltDb;
	_pos = ["read", [_id, "Pos"]] call _pltDb;

	_groupID = format ["Group %1", _id];
	_spawnPos = [_pos, 1, 100, 20, 0, 10, 0, ["base"]] call BIS_fnc_findSafePos;
	
	_grp = [_spawnPos, _faction, _comp, [], [], [], [], [],180, false] call BIS_fnc_spawnGroup;
	{
		_x allowDamage false;
		[_x, _id, _sideStr] remoteExec ["fce_fnc_aiAttributes", 2];
	} forEach units _grp;

	_grp deleteGroupWhenEmpty true;
	[_grp, _endpos, 100] call lambs_wp_fnc_taskPatrol;

	[_grp, _trg] execVM "Regiments\DeSpawnAI.sqf";
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
			format ["[RADIO INTERCEPT] This is %2 to %3. We are requesting immediate fire mission on %1", getpos _TargetPosition, _groupOfUnit, _ArtilleryGun] remoteExec ["SystemChat", _receiverID];
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
		_x allowDamage true;
	} forEach units _grp;
};