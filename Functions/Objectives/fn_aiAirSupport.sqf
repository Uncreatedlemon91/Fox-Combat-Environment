params ["_caller"];

_tgtPos = getPos _caller;
_jetClass = selectRandom [];
_spawnPos = [["OffMap"], ["AO"]] call BIS_fnc_randomPos;
_jet = [_spawnPos, random 360, _jetClass, east] call BIS_fnc_spawnVehicle;

_jetV = _jet select 0;
_jetC = _jet select 1;
_jetG = _jet select 2;

_jetG deleteGroupWhenEmpty true;

_jetV moveTo _tgtPos;
waitUntil {moveToCompleted _jetv};

sleep random [100, 200, 300];

_jetV moveto _spawnPos;

waitUntil {moveToCompleted _jetV};
deleteVehicleCrew _jetV;
deleteVehicle _jetV;
