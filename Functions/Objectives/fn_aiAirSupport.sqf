params ["_tgtPos"];

_jetClass = selectRandom [];
_spawnPos = [["OffMap"], ["AO"]] call BIS_fnc_randomPos;
_jet = [_spawnPos, random 360, _jetClass, east] call BIS_fnc_spawnVehicle;

_jetV = _jet select 0;
_jetC = _jet select 1;
_jetG = _jet select 2;

_jetG moveTo _tgtPos;
_jetG setCombatMode "RED";

