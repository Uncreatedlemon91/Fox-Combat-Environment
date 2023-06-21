params ["_grp", "_trg", "_regimentName", "_groupID", "_regimentSide"];
_db = ["new", format ["%1 Regiments - %2 %3", _regimentSide, missionName, worldName]] call oo_inidbi;

while {true} do {
	_pos = getPos leader _grp;
	_playerList = allPlayers apply {[_pos distance _x, _x]};
	_playerList sort true;
	_closestPlayer = (_playerList select 0) param [1, objNull];
	_dist = _closestPlayer distance _pos;
	_countGrp = count units _grp;
	systemChat format ["Group spawn count", _countGrp];

	if (_countGrp < 3) exitWith {
		_db = ["new", format ["%1 Regiments - %2 %3", _regimentSide, missionName, worldName]] call oo_inidbi;
		["deleteKey", [_regimentName, _groupID]] call _db;
		systemChat format ["Removed Unit %1 - %2 from Database: Count %3", _regimentName, _groupID, _countGrp];
	};	

	if (_dist > 800) exitWith {
		{	
			deleteVehicle vehicle _x;
			deleteVehicle _x;
		} forEach units _grp;
		_trg setVariable ["Active", false];
	};
	sleep 5;
};