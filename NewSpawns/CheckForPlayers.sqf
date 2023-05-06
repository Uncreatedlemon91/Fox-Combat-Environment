params ["_mkr", "_area"];

while {true} do
{
	_region = getMarkerPos _area;
	_playerList = allPlayers apply {[_region distance _x, _x]};
	_playerList sort true;
	_closestPlayer = (_playerList select 0) param [1, objNull];
	_dist = _closestPlayer distance _region;

	if (_dist < 2400) then {
		_db = ["new", _area] call oo_inidbi;
		_pos = ["read", [_mkr, "Position"]] call _db;
		_active = ["read", [_mkr, "Active"]] call _db;
		_side = ["read", [_mkr, "Owner"]] call _db;

		_playerList = allPlayers apply {[_pos distance _x, _x]};
		_playerList sort true;
		_closestPlayer = (_playerList select 0) param [1, objNull];
		_dist = _closestPlayer distance _pos;

		if ((_dist < 800) AND !(_active) AND (_side == "OPFOR")) then
		{
			["write", [_mkr, "Active", true]] call _db;
			_units = ["read", [_mkr, "Units"]] call _db;
			_rank = ["read", [_mkr, "Rank"]] call _db;
			_orders = ["read", [_mkr, "Orders"]] call _db;
			_grp = createGroup east;
			_grp deleteGroupWhenEmpty true;
			{
				// Current result is saved in variable _x
				_unit = _grp createUnit [_x, _pos, [], 5, "FORM"];
				_unit setVariable ["AssignedMarker", _mkr];
				_unit setVariable ["AssignedAO", _area];
				_unit setVariable ["GroupID", _grp];
				systemChat format ["%1 %2", _mkr, _area];
				_unit addEventHandler [
					"Killed",
					{
						params ["_unit", "_killer", "_instigator", "_useEffects"];
						_group = _unit getVariable "GroupID";
						_mkr = _unit getVariable "AssignedMarker";
						_ao = _unit getVariable "AssignedAO";

						_db = ["new", _ao] call oo_inidbi;
						_troops = [];
						// ["deleteKey", [_mkr, "Units"]] call _db;
						{
							// Current result is saved in variable _x
							if (alive _x) then {
								_type = typeOf _x;
								_troops pushBack _type;
							};
						} forEach units _group;
						["write", [_mkr, "Units", _troops]] call _db;
						["write", [_mkr, "Size", count _troops]] call _db;

						if (count _troops <= 3) then {
							["deleteSection", _mkr] call _db;
						};
					}
				];
				sleep 0.75;
			} forEach _units;
			if (_orders == "Patrol") then {
				[_grp, _pos, 500, ["base"]] call BIS_fnc_taskPatrol;
			};

			if (_orders == "Camp") then {
				[_grp, _pos, 250] call lambs_wp_fnc_taskCamp;
			};

			[_mkr, _area, _grp] execVM "NewSpawns\DeSpawnAI.sqf";

		};
	};
	sleep 5;
};