params ["_caller"];

_tgtPos = getPos _caller;
_mkr = createMarkerLocal ["targetingMarker", _tgtPos];
_mkr setMarkerAlphaLocal 0;
_mkr setMarkerShapeLocal "Ellipse";
_mkr setMarkerSize [100, 100];
_tgtPos = [[_mkr], ["base", "water"]] call BIS_fnc_randomPos;

_jetClass = selectRandom ["O_Plane_CAS_02_dynamicLoadout_F", "CUP_O_SU34_CSAT", "O_Plane_Fighter_02_F", "O_Plane_Fighter_02_Stealth_F"];
_spawnPos = [["OffMap"], ["AO"]] call BIS_fnc_randomPos;
_jet = [_spawnPos, random 360, _jetClass, east] call BIS_fnc_spawnVehicle;

_jetV = _jet select 0;
_jetC = _jet select 1;
_jetG = _jet select 2;

_jetG deleteGroupWhenEmpty true;
_jetG setCombatMode "RED";
_jetG move _tgtPos;
_jetV flyInHeight random [100, 400, 900];
_dist = 500;
while {_dist > 200} do {
	_dist = _jetV distance _tgtPos;
	sleep 4;
};



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