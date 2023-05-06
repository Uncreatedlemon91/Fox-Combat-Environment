/*
Ambient aircraft will fly in and engage / drop bombs on hostile locations. Artillery will also drop rounds on random grids that are hostile. 
*/ 
while {true} do {
	_origin = [] call BIS_fnc_randomPos;
	_end = [] call BIS_fnc_randomPos;
	_air = selectRandom ["ACM_B_NAG_KA52", "ACM_B_NAG_Civil", "ACM_B_NAG_MI171_Unarmed", "ACM_B_NAG_Harrier"];

	[_origin, _end, random [50, 100, 300], "FULL", _air, west] call BIS_fnc_ambientFlyby;
	sleep 60;
};