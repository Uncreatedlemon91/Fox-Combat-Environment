params ["_mkr"];
_db = ["new", _mkr] call oo_inidbi;
_owner = ["read", ["Grid Status", "Owner"]] call _db;

if (_owner == "OPFOR") then {
	_infCount = ["read", ["OPFOR-Count", "Infantry"]] call _db;
	_tankCount = ["read", ["OPFOR-Count", "Armored"]] call _db;
	_mortarCount = ["read", ["OPFOR-Count", "Mortars"]] call _db;
	_mechCount = ["read", ["OPFOR-Count", "Mechanized"]] call _db;
	_motCount = ["read", ["OPFOR-Count", "Motorized"]] call _db;

	_index = 0;
	for "_i" from 1 to _infCount do
	{
		
		// Current result is saved in variable _x
		_type = ["read", ["OPFOR-Types", "Infantry"]] call _db;
		_type = _type select _index;
		_index = _index + 1;
		_pos = [getMarkerPos _mkr, 10, 500, 4, 0, 20, 0, ["Base"]] call BIS_fnc_findSafePos;
		_grp = [_pos, east, (configfile >> "CfgGroups" >> "East" >> "ACM_O_HDF" >> "Infantry" >> _type)] call BIS_fnc_spawnGroup;
		[_grp, _pos, 500] call BIS_fnc_taskPatrol;
		_grp deleteGroupWhenEmpty true;
		{
			// Current result is saved in variable _x
			_x setVariable ["Mkr", _mkr];
			systemChat format ["%1", _mkr];
			sleep 0.5
		} forEach units _grp;
		sleep 1;
	};

	_index = 0;
	for "_i" from 1 to _tankCount do
	{
		
		// Current result is saved in variable _x
		_type = ["read", ["OPFOR-Types", "Armored"]] call _db;
		_type = _type select _index;
		_index = _index + 1;
		_pos = [getMarkerPos _mkr, 10, 500, 4, 0, 20, 0, ["Base"]] call BIS_fnc_findSafePos;
		_grp = [_pos, east, (configfile >> "CfgGroups" >> "East" >> "ACM_O_HDF" >> "Armored" >> _type)] call BIS_fnc_spawnGroup;
		[_grp, _pos, 500] call BIS_fnc_taskPatrol;
		_grp deleteGroupWhenEmpty true;

		{
			// Current result is saved in variable _x
			_x setVariable ["Mkr", _mkr];
			systemChat format ["%1", _mkr];
			sleep 0.5
		} forEach units _grp;
		sleep 1;
	};

	_index = 0;
	for "_i" from 1 to _mechCount do
	{
		
		// Current result is saved in variable _x
		_type = ["read", ["OPFOR-Types", "Mechanized"]] call _db;
		_type = _type select _index;
		_index = _index + 1;
		_pos = [getMarkerPos _mkr, 10, 500, 4, 0, 20, 0, ["Base"]] call BIS_fnc_findSafePos;
		_grp = [_pos, east, (configfile >> "CfgGroups" >> "East" >> "ACM_O_HDF" >> "Mechanized" >> _type)] call BIS_fnc_spawnGroup;
		[_grp, _pos, 500] call BIS_fnc_taskPatrol;
		_grp deleteGroupWhenEmpty true;

		{
			// Current result is saved in variable _x
			_x setVariable ["Mkr", _mkr];
			systemChat format ["%1", _mkr];
			sleep 0.5
		} forEach units _grp;
		sleep 2;
	};

	_index = 0;
	for "_i" from 1 to _motCount do
	{
		
		// Current result is saved in variable _x
		_type = ["read", ["OPFOR-Types", "Motorized"]] call _db;
		_type = _type select _index;
		_index = _index + 1;
		_pos = [getMarkerPos _mkr, 10, 500, 4, 0, 20, 0, ["Base"]] call BIS_fnc_findSafePos;
		_grp = [_pos, east, (configfile >> "CfgGroups" >> "East" >> "ACM_O_HDF" >> "Motorized" >> _type)] call BIS_fnc_spawnGroup;
		[_grp, _pos, 500] call BIS_fnc_taskPatrol;
		_grp deleteGroupWhenEmpty true;

		{
			// Current result is saved in variable _x
			_x setVariable ["Mkr", _mkr];
			systemChat format ["%1", _mkr];
			sleep 0.5
		} forEach units _grp;
		sleep 1;
	};
};
