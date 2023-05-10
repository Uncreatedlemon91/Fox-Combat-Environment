// Sends a truck to resupply a grid location. 
_insertLoc = selectRandom ["e_ins_1", "e_ins_2", "e_ins_3", "e_ins_4"];
_insertPos = getMarkerPos _insertLoc;
_truck = "ACM_O_HDF_V3S_Covered";
_destination = [] call BIS_fnc_randomPos;

systemChat format ["%1", _insertLoc];

// Spawn truck and assign items 
_spawnVehicle = [_insertPos, 180, _truck, east] call BIS_fnc_spawnVehicle;
_veh = _spawnVehicle select 0;
_crew = _spawnVehicle select 1;
_grp = _spawnVehicle select 2;

_driver = driver _veh;

systemChat format ["%1 Spawned!", _crew];

_veh limitSpeed 10;
_driver moveTo _destination;

systemChat format ["%1 Moving!", _grp];

_mkr = createMarker [format ["Convoy%1_%2", _insertPos, _destination], _insertPos];
_mkr2 = createMarker [format ["Convoy%2_%1", _insertPos, _destination], _destination];

_mkr setMarkerType "mil_start";
_mkr2 setMarkerType "mil_join";

_mkr setMarkerColor "colorRed";
_mkr2 setMarkerColor "colorRed";

_mkr setMarkerAlpha 1;
_mkr2 setMarkerAlpha 1;


waitUntil { moveToCompleted _driver };

_supplyCount = round (random 20);
for "_i" from 1 to _supplyCount do {
	"CUP_BOX_ChDKZ_Ammo_F" createVehicle _destination;
	_mkr = createMarker [format ["%1 Cache %2", _destination, _i], _destination];
	_mkr setMarkerType "hd_objective_noShadow";
	_mkr setMarkerSize [0.3, 0.3];
	_mkr setMarkerColor "ColorGreen";
	_mkr setMarkerAlpha 1;
};
_objs = nearestObjects [_destination, ["CUP_BOX_ChDKZ_Ammo_F"], 100];
_count = count _objs;

_db = ["new", "Resupply Caches"] call oo_inidbi;
["write", [_destination, _count]] call db;

deleteVehicleCrew _crew;
deleteVehicle _veh;

"Enemy Supplies Delivered!" remoteExec ["systemChat", 0];
