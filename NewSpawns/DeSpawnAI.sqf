params ["_mkr", "_area", "_grp"];
while {true} do {
	_pos = getPos leader _grp;

	_playerList = allPlayers apply {[_pos distance _x, _x]};
	_playerList sort true;
	_closestPlayer = (_playerList select 0) param [1, objNull];
	_dist = _closestPlayer distance _pos;

	if (_dist > 800) then {
		{
			// Current result is saved in variable _x
			_vic = vehicle _x;
			deleteVehicle _vic;
			deleteVehicle _x;
		} forEach units _grp;

		_db = ["new", _area] call oo_inidbi;
		["write", [_mkr, "Active", false]] call _db;
		["write", [_mkr, "Position", _pos]] call _db;
		_mkr setMarkerPos _pos;
	};
	sleep 5;
};