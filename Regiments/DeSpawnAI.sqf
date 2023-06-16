params ["_grp", "_trg"];
while {true} do {
	_pos = getPos leader _grp;
	_playerList = allPlayers apply {[_pos distance _x, _x]};
	_playerList sort true;
	_closestPlayer = (_playerList select 0) param [1, objNull];
	_dist = _closestPlayer distance _pos;
	
	if (_dist > 800) then {
		{	
			deleteVehicle vehicle _x;
			deleteVehicle _x;
		} forEach units _grp;
		_trg setVariable ["Active", false];
	};
	sleep 5;
};