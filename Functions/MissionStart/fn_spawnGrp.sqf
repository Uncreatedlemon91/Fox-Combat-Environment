/* 
Spawn AI Group when player enters area 
*/ 
params ["_grpID"];

// Get data from database 
_db = ["new", format ["Groups - %1 %2", missionName, worldName]] call oo_inidbi;
_grpRank = ["read", [_grpID, "Rank"]] call _db;
_grpPos = ["read", [_grpID, "Position"]] call _db;
_grpActive = ["read", [_grpID, "Active"]] call _db;
_grpRegiment = ["read", [_grpID, "Regiment"]] call _db;
_grpType = ["read", [_grpID, "Type"]] call _db;
_grpCfg = ["read", [_grpID, "Config"]] call _db;
_grpFaction = ["read", [_grpID, "Faction"]] call _db;

systemChat "SPAWNING!";
if (_grpActive) then {
	// Do nothing, ,the AI Group is spawned.
} else {
	// Group is not active, spawn them in.
	_grp = [_grpPos, east, (configFile >> "CfgGroups" >> "EAST" >> _grpFaction >> _grpType >> _grpCfg)] call BIS_fnc_spawnGroup;
	systemChat "SPAWNED GROUP";
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
				["deleteSection", _grpID] call _db;
			};
		}];
	} forEach units _grp;

	_grp deleteGroupWhenEmpty true;
	[_grp, _grpID] execVM "missionStartup\Cleanup.sqf";
};