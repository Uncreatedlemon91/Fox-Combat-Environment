/* 
Spawn AI Group when player enters area 
*/ 
params ["_data"];

// Get data from database 
_db = ["new", format ["Regiments - %1 %2", missionName, worldName]] call oo_inidbi;

_data = ["read", [_regiment, _grp]] call _db;
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
	{
		// Current result is saved in variable _x
		_x setRank _grpRank;
	} forEach units _grp;
};