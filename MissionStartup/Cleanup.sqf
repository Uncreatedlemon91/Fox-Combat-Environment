/*
Cleanup props and items around the players. Any item outside of this scope will be culled. 
*/ 
params ["_grp", "_grpID"];

_leader = leader _grp;
_db = ["new", format ["Groups - %1 %2", missionName, worldName]] call oo_inidbi;
while {alive _leader} do {
	sleep 10;
	_nearPlayer = [allplayers, position _leader] call BIS_fnc_nearestPosition;
	_dist = _leader distance _nearPlayer;
	if (_dist > 800) then {
		{
			// Current result is saved in variable _x
			deleteVehicle vehicle _x;
			deleteVehicle _x;
			deleteGroup _grp;
			systemChat "Group Deleted";
		} forEach units _grp;

		["write", [_grpID, "Active", false]] call _db;
	};
};
