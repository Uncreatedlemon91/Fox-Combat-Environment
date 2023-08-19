// Function to create a convoy that moves to an area, then deploys an item. 
params ["_deployClass", "_deployPoint", "_deployType"];
_convoySpawnPos = selectRandom ["INS_1", "INS_2", "INS_3", "INS_4", "INS_5"];
_opfordb = ["new", format ["OPFOR Compositions %1 %2", missionName, worldName]] call oo_inidbi;
_vehicle = selectRandom (["read", ["opfSupplyTrucks", "Classes"]] call _opfordb);
_spawnVeh = [getMarkerPos _convoySpawnPos, random 360, _vehicle, east] call BIS_fnc_spawnVehicle;

systemChat format ["%1 : %2 : %3", _deployClass, _deployPoint, _deployType];

_veh = _spawnVeh select 0;
_crew = _spawnVeh select 1;
_grp = _spawnVeh select 2;
_driver = driver _veh;

_grp deleteGroupWhenEmpty true;

systemChat "Vehicle Spawned";

_grp move _deployPoint; 
_dist = 100;

while {_dist > 30} do {
	_dist = _veh distance2d _deployPoint;
	sleep 5;
};

// Builds the object
systemChat "Vehicle has arrived";
sleep 5;
_building = "";
_mannedClasses = ["OPFOR AA Sites", "Opfor Artillery"];

if (_deployType in _mannedClasses) then {
	_building = [_deployPoint, random 360, _deployClass, east] call BIS_fnc_spawnVehicle;
	_buildinggrp = _building select 2;
	[_buildinggrp] call lambs_wp_fnc_taskArtilleryRegister;
} else {
	_building = _deployClass createVehicle _deployPoint;
	switch (_deployType) do {
		case "OPFOR Snipers": {[_deployPoint, _building] call fce_fnc_spawnSnipers};
		default { };
	};
};

_data = [_deployPoint, _deployClass];

_db = ["new", format ["Opfor Installations - %1 %2", missionName, worldName]] call oo_inidbi;
_keys = ["GetKeys", _deployType] call _db;
_keyCount = count _keys;
_keyID = _keyCount + 1;
["write", [_deployType, format ["%1 %2", _deployType, _keyID] , _data]] call _db;

// Send the vehicle back to spawn point and delete
sleep 3;
_veh move getMarkerPos _convoySpawnPos;
_dist = 100;

while {_dist > 10} do {
	_dist = _veh distance2d getMarkerPos _convoySpawnPos;
	sleep 5;
};

deleteVehicleCrew _veh;
deleteVehicle _veh;