params ["_grp", "_trg"];

sleep 5;
_loop = true;
while {_loop} do {
	_pos = getPos leader _grp;
	_playerList = allPlayers apply {[_pos distance _x, _x]};
	_playerList sort true;
	_closestPlayer = (_playerList select 0) param [1, objNull];
	_dist = _closestPlayer distance _pos;
	_mkr = _trg getVariable "unitMkr";

	// Exit loop and remove AI from the map
	if (_dist > 1000) then {
		_mkr setMarkerPos _pos;
		{	
			deleteVehicle vehicle _x;
			deleteVehicle _x;
		} forEach units _grp;
		_trg setVariable ["unitActive", false];
		_loop = false;

		[_trg] remoteExec ["fce_fnc_movePlatoon", 2];
	};
	sleep 15;
};