/*
Cleanup props and items around the players. Any item outside of this scope will be culled. 
*/ 
params ["_grp", "_mkr"];
_db = ["new", format ["Enemies %1 %2", missionName, worldName]] call oo_inidbi;

_leader = leader _grp;
while {true} do {
	sleep 5;
	_origin = getPos _leader;
	_nearPlayer = [allplayers, _origin] call BIS_fnc_nearestPosition;
	_dist = _leader distance _nearPlayer;
	if (_dist > 1200) then {
		{
			// Current result is saved in variable _x
			deleteVehicle vehicle _x;
			deleteVehicle _x;
			deleteGroup _grp;
			systemChat "Group Deleted";
			["write", [_mkr, "Active", false]] call _db;
		} forEach units _grp;
	};
};
