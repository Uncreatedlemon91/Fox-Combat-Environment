// Function to create a convoy that moves to an area, then deploys an item. 
params ["_deployClass", "_deployPoint", "_deployType"];
_convoySpawnPos = selectRandom ["INS_1", "INS_2", "INS_3", "INS_4", "INS_5"];
_spawnVeh = [_convoySpawnPos, random 360, _vehicle, east] call BIS_fnc_spawnVehicle;

_veh = _spawnVeh select 0;
_crew = _spawnVeh select 1;
_grp = _spawnVeh select 2;

_grp move _deployPoint;
_dist = _veh distance _deployPoint;

waitUntil {_dist < 10};

sleep 10;
_building = _deployClass createVehicle _deployPoint;
_data = [_deployPoint, _deployClass];

_db = ["new", format ["Opfor Installations - %1 %2", missionName, worldName]] call oo_inidbi;
["write", [format ["OPFOR %1", _deployType]], _data] call _db;

