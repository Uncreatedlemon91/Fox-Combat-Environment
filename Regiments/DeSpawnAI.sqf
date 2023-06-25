params ["_grp", "_trg", "_regimentName", "_groupID", "_regimentSide"];

sleep 5;
_loop = true;
while {_loop} do {
	_pos = getPos leader _grp;
	_playerList = allPlayers apply {[_pos distance _x, _x]};
	_playerList sort true;
	_closestPlayer = (_playerList select 0) param [1, objNull];
	_dist = _closestPlayer distance _pos;
	_countGrp = { alive _x } count units _grp;

	// Exit loop and delete group from data base
	if (_countGrp < 3) then {
		_db = ["new", format ["%1 Regiments - %2 %3", _regimentSide, missionName, worldName]] call oo_inidbi;
		["deleteKey", [_regimentName, _groupID]] call _db;
		_size = ["read", [_regimentName, "Size"]] call _Db;
		_newSize = _size - 1;
		["write", [_regimentName, "Size", _newSize]] call _Db;
		if (_newSize = 0) then {
			["deleteSection", _regimentName] call _db;
		}
		systemChat format ["Removed Unit %1 - %2 from Database: Count %3", _regimentName, _groupID, _countGrp];
		_loop = false;
	};	

	// Exit loop and remove AI from the map
	if (_dist > 800) then {
		{	
			deleteVehicle vehicle _x;
			deleteVehicle _x;
		} forEach units _grp;
		_trg setVariable ["Active", false];
		_loop = false;
	};
	sleep 5;
};