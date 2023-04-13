/* 
Spawn AI Group when player enters area 
*/ 
params ["_data"];

// Get data from database 
_db = ["new", format ["Regiments - %1 %2", missionName, worldName]] call oo_inidbi;

_grpID = _data select 0;
_regiment = _data select 1;
_grpPos = _data select 2;
_grpType = _data select 3;
_grpConfig = _data select 4;
_active = _data select 5;

_grpRank = ["read", [_regiment, "Rank"]] call _db;


if (_active) then {
	// Do nothing, ,the AI Group is spawned.
} else {
	// Group is not active, spawn them in.
	_grp = [_grpPos, east, _grpConfig] call BIS_fnc_spawnGroup;
	_tasking = selectRandomWeighted ["Hunt", 0.3, "Camp", 0.3, "Patrol", 0.7];
	switch (_tasking) do {
		case "Hunt": {[_grp, 500] spawn lambs_wp_fnc_taskHunt};
		case "Camp": {[_grp, _grpPos, 50] call lambs_wp_fnc_taskCamp};
		case "Patrol": {[_grp, _grpPos, 500] call lambs_wp_fnc_taskPatrol};
	};
	{
		_x setRank _grpRank;
		_x addEventHandler ["Killed",{
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			_grpCount = count (group _unit);
			if (_grpCount < 2) then {
				["deleteKey", [_regiment, _groupID]] call _db;
			};
		}];
	} forEach units _grp;
};