params ["_caller"];

_tgtPos = getPos _caller;
_jetClass = selectRandom ["FIR_F16C_ENEMY_TYPE_A", "O_Plane_CAS_02_dynamicLoadout_F"];
_spawnPos = [["OffMap"], ["AO"]] call BIS_fnc_randomPos;
_jet = [_spawnPos, random 360, _jetClass, east] call BIS_fnc_spawnVehicle;

_jetV = _jet select 0;
_jetC = _jet select 1;
_jetG = _jet select 2;

_jetG deleteGroupWhenEmpty true;

_jetG move _tgtPos;
_dist = 500;
while {_dist > 200} do {
	_dist = _jetV distance _tgtPos;
	sleep 4;
};

_jetG setCombatMode "RED";

sleep random [100, 200, 300];
_exfil = [["OffMap"], ["AO"]] call BIS_fnc_randomPos;
_jetV move _exfil;
_dist = 500;

while {_dist > 200} do {
	_dist = _jetV distance _tgtPos;
	sleep 4;
};

deleteVehicleCrew _jetV;
deleteVehicle _jetV;