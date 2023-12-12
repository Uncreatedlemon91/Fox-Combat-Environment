params ["_caller", "_target"];

_tgtPos = getPos _caller;
_side = side _caller;
_planes = [];
switch (_side) do {
	case WEST: {_planes = selectRandomWeighted [fox_blu_AGPlanes, 0.4, fox_blu_AAPlanes, 0.2, fox_blu_Helicopters, 0.4]};
	case EAST: {_planes = selectRandomWeighted [fox_opf_AGPlanes, 0.4, fox_opf_AAPlanes, 0.2, fox_opf_Helicopters, 0.4]};
};
_tgtPos = getpos _target;

_jetClass = selectRandom _planes;
_spawnPos = [["OffMap"], ["AO"]] call BIS_fnc_randomPos;
_jet = [_spawnPos, random 360, _jetClass, _side] call BIS_fnc_spawnVehicle;

_jetV = _jet select 0;
_jetC = _jet select 1;
_jetG = _jet select 2;

_jetG deleteGroupWhenEmpty true;
_jetG setCombatMode "RED";
_jetG setSpeedMode "FULL";
_jetG move _tgtPos;
_jetV flyInHeight random [30, 100, 200];

_dist = 500;
while {_dist > 100} do {
	_dist = _jetV distance2D _tgtPos;
	sleep 4;
};

sleep random [100, 200, 300];
_jetV move _spawnPos;
_dist = 500;

while {_dist > 100} do {
	_dist = _jetV distance2D _tgtPos;
	sleep 4;
};

deleteVehicleCrew _jetV;
deleteVehicle _jetV;