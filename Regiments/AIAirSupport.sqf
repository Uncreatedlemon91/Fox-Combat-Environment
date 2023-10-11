params ["_caller"];

_tgtPos = getPos _caller;
_mkr = createMarkerLocal ["targetingMarker", _tgtPos];
_mkr setMarkerAlphaLocal 0;
_mkr setMarkerShapeLocal "Ellipse";
_mkr setMarkerSize [100, 100];
_tgtPos = [[_mkr], ["base", "water"]] call BIS_fnc_randomPos;

_jetClass = selectRandom ["RHS_TU95MS_vvs_tambov", "RHS_Ka52_vvsc", "RHS_Mi24V_vvsc", "rhs_mig29sm_vvs", "RHS_Su25SM_vvs", "rhs_mig29s_vvs"];
_spawnPos = [["OffMap"], ["AO"]] call BIS_fnc_randomPos;
_jet = [_spawnPos, random 360, _jetClass, east] call BIS_fnc_spawnVehicle;

_jetV = _jet select 0;
_jetC = _jet select 1;
_jetG = _jet select 2;

_jetG deleteGroupWhenEmpty true;
_jetG setCombatMode "RED";
_jetG setSpeedMode "FULL";
_jetG move _tgtPos;
_jetV flyInHeight random [100, 400, 900];

_dist = 500;
while {_dist > 50} do {
	_dist = _jetV distance2D _tgtPos;
	sleep 4;
};

sleep random [100, 200, 300];
_exfil = [["OffMap"], ["AO"]] call BIS_fnc_randomPos;
_jetV move _exfil;
_dist = 500;

while {_dist > 50} do {
	_dist = _jetV distance2D _tgtPos;
	sleep 4;
};

deleteVehicleCrew _jetV;
deleteVehicle _jetV;