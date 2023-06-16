// Function to create a convoy that moves to an area, then deploys an item. 
params ["_deployClass", "_deployPoint", "_deployType"];
_convoySpawnPos = selectRandom ["INS_1", "INS_2", "INS_3", "INS_4", "INS_5"];
_spawnVeh = [getMarkerPos _convoySpawnPos, random 360, "ACM_O_HDF_V3S_Covered", east] call BIS_fnc_spawnVehicle;

systemChat format ["%1 : %2 : %3", _deployClass, _deployPoint, _deployType];

_veh = _spawnVeh select 0;
_crew = _spawnVeh select 1;
_grp = _spawnVeh select 2;
_driver = driver _veh;

_grp deleteGroupWhenEmpty true;

systemChat "Vehicle Spawned";

_grp move _deployPoint;
_dist = 100;

while {_dist > 10} do {
	_dist = _veh distance _deployPoint;
	sleep 5;
};

// Builds the object
systemChat "Vehicle has arrived";
sleep 5;
_building = "";
_mannedClasses = 

if (_deployType in _mannedClasses) then {
	_building = [_deployPoint, random 360, _deployClass, east] call BIS_fnc_spawnVehicle;
} else {
	_building = _deployClass createVehicle _deployPoint;
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
	_dist = _veh distance getMarkerPos _convoySpawnPos;
	sleep 5;
};

deleteVehicleCrew _veh;
deleteVehicle _veh;