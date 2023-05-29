params ["_grp"];
while {true} do {
	_pos = getPos leader _grp;

	_playerList = allPlayers apply {[_pos distance _x, _x]};
	_playerList sort true;
	_closestPlayer = (_playerList select 0) param [1, objNull];
	_dist = _closestPlayer distance _pos;

	if (_dist > 1000) then {
		{
			_vic = vehicle _x;
			deleteVehicle _vic;
			deleteVehicle _x;
		} forEach units _grp;
	};
	sleep 5;
};