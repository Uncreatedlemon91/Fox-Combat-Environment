params ["_tgtPos"];

_jetClass = selectRandom [];
_spawnPos = [["OffMap"], ["AO"]] call BIS_fnc_randomPos;
_jet = [_spawnPos, random 360, _jetClass, east] call BIS_fnc_spawnVehicle;

