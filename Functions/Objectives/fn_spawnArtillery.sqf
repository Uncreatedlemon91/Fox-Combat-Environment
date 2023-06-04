params ["_count"];
_db = ["new", format ["Opfor Installations - %1 %2", missionName, worldName]] call oo_inidbi;
_exists = "Exists" call _db;

if (_exists) then {
	_sections = "getSections" call _db;
	_count = count _sections;
	for "_i" from 1 to _count do {
		_data = ["read", ["Opfor Artillery", format ["Arty Group %1", _i]]] call _db;
		_spawnPos = _data select 0;
		_classToSpawn = _data select 1;

		_arty = [_spawnPos, random 360, _classToSpawn, east] call BIS_fnc_spawnVehicle;
		_artygrp = _arty select 2;
		[_artyGrp] call lambs_wp_fnc_taskArtilleryRegister;
	};
} else {
	for "_i" from 1 to _count do {
		_spawnPos = [["AO"], ["Base", "Water"]] call BIS_fnc_randomPos;
		_spawnPos = [_spawnPos, 0, 50, 10, 0, 10, 0, ["base"]] call BIS_fnc_findSafePos;
		_classToSpawn = selectRandom ["ACM_O_HDF_BM21", "ACM_O_HDF_T_D30", "ACM_O_HDF_T_Mortar"];
		_data = [_spawnPos, _classToSpawn];

		["write", ["Opfor Artillery", format ["Arty Group %1", _i], _data]] call _db;

		_arty = [_spawnPos, random 360, _classToSpawn, east] call BIS_fnc_spawnVehicle;
		_artygrp = _arty select 2;
		[_artyGrp] call lambs_wp_fnc_taskArtilleryRegister;
	};
};