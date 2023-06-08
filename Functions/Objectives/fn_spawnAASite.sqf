params ["_count"];

_db = ["new", format ["Opfor Installations - %1 %2", missionName, worldName]] call oo_inidbi;
_sections = "getSections" call _db;

if ("OPFOR AA Sites" in _sections) then {
	_keys =  ["getKeys", "OPFOR AA Sites"] call _db;
	_count = count _keys;
	for "_i" from 1 to _count do {
		_data = ["read", ["Opfor AA Sites", format ["AA Site %1", _i]]] call _db;
		_spawnPos = _data select 0;
		_classToSpawn = _data select 1;

		_arty = [_spawnPos, random 360, _classToSpawn, east] call BIS_fnc_spawnVehicle;
		_artygrp = _arty select 2;
		[_artyGrp] call lambs_wp_fnc_taskArtilleryRegister;

		_veh = _arty select 0;
		_key = format ["AA Site %1", _i];
		_veh setVariable ["ID", _key];
		_veh addEventHandler ["Killed", {
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			_id = _unit getVariable "ID";
			_db = ["new", format ["Opfor Installations - %1 %2", missionName, worldName]] call oo_inidbi;
			["deleteKey", ["OPFOR AA Sites", _id]] call _db;
		}];

		sleep 0.2;
	};
} else {
	for "_i" from 1 to _count do {
		_spawnPos = [["AO"], ["Base", "Water"]] call BIS_fnc_randomPos;
		_spawnPos = [_spawnPos, 0, 100, 5, 0, 10, 0, ["base"]] call BIS_fnc_findSafePos;
		_classToSpawn = selectRandom ["ACM_O_SEV_IglaPod", "ACM_O_HDF_HILUX_IGLA", "ACM_O_HDF_HILUX_ARMORED_ZU23"];
		_data = [_spawnPos, _classToSpawn];

		["write", ["Opfor AA Sites", format ["AA Site %1", _i], _data]] call _db;

		_arty = [_spawnPos, random 360, _classToSpawn, east] call BIS_fnc_spawnVehicle;
		_artygrp = _arty select 2;
		_artygrp deleteGroupWhenEmpty true;
		
		_veh = _arty select 0;
		_key = format ["AA Site %1", _i];
		_veh setVariable ["PersistID", _key, true];
		_veh addEventHandler ["Killed", {
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			_id = _unit getVariable "PersistID";
			_db = ["new", format ["Opfor Installations - %1 %2", missionName, worldName]] call oo_inidbi;
			systemChat format ["%1", _id];
			["deleteKey", ["OPFOR AA Sites", _id]] call _db;
		}];

		sleep 0.2;
	};
};