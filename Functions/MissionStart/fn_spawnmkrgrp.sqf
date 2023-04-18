params ["_mkr"];
_db = ["new", format ["Enemies %1 %2", missionName, worldName]] call oo_inidbi;
_exists = "exists" call _db;

_pos = getMarkerPos _mkr;
_type = getMarkerType _mkr;
_active = ["read", [_mkr, "Active"]] call _db;
if (_active) exitwith {};
["write", [_mkr, "Active", true]] call _db;

_mkr setMarkerAlpha 0;

if (_type == "o_inf") then {
	for "_i" from 1 to 3 do {
		_pos = [_pos, 2, 10, 2, 0, 20, 0] call BIS_fnc_findSafePos;
		_class = selectRandom ["o_acmohdf_infantry_squad", "o_acmohdf_infantry_weapons_squad", "o_acmohdf_infantry_at_team","o_acmohdf_infantry_aa_team"];
		_grp = [_pos, east, (configfile >> "CfgGroups" >> "East" >> "ACM_O_HDF" >> "Infantry" >> _class)] call BIS_fnc_spawnGroup;
		_tasking = selectRandomWeighted ["Patrol", 0.8, "Camp", 0.3];

		if (_tasking == "Camp") then {
			[_grp, _pos, 50] call lambs_wp_fnc_taskCamp;
		};
		if (_tasking == "Patrol") then {
			[_grp, _pos, 500] call lambs_wp_fnc_taskPatrol;
		};

		["write", [_mkr, "Class", _class]] call _db;
		[_grp] execVM "MissionStartup\Cleanup.sqf";
		_grp deleteGroupWhenEmpty true;
		{
			// Current result is saved in variable _x
			_x addEventHandler ["Killed", {
				params ["_unit", "_killer", "_instigator", "_useEffects"];
				_grp = group _unit;
				_alive = count (units _grp);
				if (_alive < 2) then {
					_trg = nearestObject [position _unit, "emptyDetector"];
					deleteVehicle _trg;
					deleteMarker _mkr;
				};
			}];
		} forEach units _grp;
	};
};

if (_type == "o_armor") then {
	_pos = [_pos, 2, 10, 2, 0, 20, 0] call BIS_fnc_findSafePos;
	_class = selectRandom ["o_acmohdf_armored_tank_section_T55", "o_acmohdf_armored_tank_section_T34"];
	_grp = [_pos, east, (configfile >> "CfgGroups" >> "East" >> "ACM_O_HDF" >> "Armored" >> _class)] call BIS_fnc_spawnGroup;
	_tasking = selectRandomWeighted ["Patrol", 0.8, "Camp", 0.3];

	if (_tasking == "Camp") then {
		[_grp, _pos, 50] call lambs_wp_fnc_taskCamp;
	};
	if (_tasking == "Patrol") then {
		[_grp, _pos, 500] call lambs_wp_fnc_taskPatrol;
	};

	["write", [_mkr, "Class", _class]] call _db;
	[_grp] execVM "MissionStartup\Cleanup.sqf";
	_grp deleteGroupWhenEmpty true;
	{
		// Current result is saved in variable _x
		_x addEventHandler ["Killed", {
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			_grp = group _unit;
			_alive = count (units _grp);
			if (_alive < 2) then {
				_trg = nearestObject [position _unit, "emptyDetector"];
				deleteVehicle _trg;
				deleteMarker _mkr;
			};
		}];
	} forEach units _grp;
};

if (_type == "o_motor_inf") then {
	for "_i" from 1 to 2 do {
		_pos = [_pos, 2, 10, 2, 0, 20, 0] call BIS_fnc_findSafePos;
		_class = selectRandom ["o_acmohdf_motorized_motorized_reinforcements"];
		_grp = [_pos, east, (configfile >> "CfgGroups" >> "East" >> "ACM_O_HDF" >> "Motorized" >> _class)] call BIS_fnc_spawnGroup;
		_tasking = selectRandomWeighted ["Patrol", 0.8, "Camp", 0.3];
		
		if (_tasking == "Camp") then {
			[_grp, _pos, 50] call lambs_wp_fnc_taskCamp;
		};
		if (_tasking == "Patrol") then {
			[_grp, _pos, 500] call lambs_wp_fnc_taskPatrol;
		};
		
		["write", [_mkr, "Class", _class]] call _db;
		[_grp] execVM "MissionStartup\Cleanup.sqf";
		_grp deleteGroupWhenEmpty true;
		{
			// Current result is saved in variable _x
			_x addEventHandler ["Killed", {
				params ["_unit", "_killer", "_instigator", "_useEffects"];
				_grp = group _unit;
				_alive = count (units _grp);
				if (_alive < 2) then {
					_trg = nearestObject [position _unit, "emptyDetector"];
					deleteVehicle _trg;
					deleteMarker _mkr;
				};
			}];
		} forEach units _grp;
	};
};

if (_type == "o_mortar") then {
	_class = selectRandom ["ACM_O_HDF_T_Mortar"];
	_grp = [_pos, random 360, _class, east] call BIS_fnc_spawnVehicle;
	_grp = _grp select 2;
	
	[_grp] call lambs_wp_fnc_taskArtilleryRegister;

	["write", [_mkr, "Class", _class]] call _db;
	[_grp] execVM "MissionStartup\Cleanup.sqf";
	_grp deleteGroupWhenEmpty true;
	{
		// Current result is saved in variable _x
		_x addEventHandler ["Killed", {
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			_grp = group _unit;
			_alive = count (units _grp);
			if (_alive < 2) then {
				_trg = nearestObject [position _unit, "emptyDetector"];
				deleteVehicle _trg;
				deleteMarker _mkr;
			};
		}];
	} forEach units _grp;
};

if (_type == "o_mech_inf") then {
	_class = selectRandom ["o_acmohdf_mechanized_mechanized_squad_bmp", "o_acmohdf_mechanized_mechanized_squad_bmp1"];
	_grp = [_pos, east, (configfile >> "CfgGroups" >> "East" >> "ACM_O_HDF" >> "Mechanized" >> _class)] call BIS_fnc_spawnGroup;
	_tasking = selectRandomWeighted ["Patrol", 0.8, "Camp", 0.3];
	
	if (_tasking == "Camp") then {
		[_grp, _pos, 50] call lambs_wp_fnc_taskCamp;
	};
	if (_tasking == "Patrol") then {
		[_grp, _pos, 500] call lambs_wp_fnc_taskPatrol;
	};
	
	["write", [_mkr, "Class", _class]] call _db;
	[_grp] execVM "MissionStartup\Cleanup.sqf";
	_grp deleteGroupWhenEmpty true;
	{
		// Current result is saved in variable _x
		_x addEventHandler ["Killed", {
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			_grp = group _unit;
			_alive = count (units _grp);
			if (_alive < 2) then {
				_trg = nearestObject [position _unit, "emptyDetector"];
				deleteVehicle _trg;
				deleteMarker _mkr;
			};
		}];
	} forEach units _grp;
};