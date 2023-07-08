params ["_markedAssets", "_laptop"];

_dist = player distance _laptop;
if (_dist < 10) then {
	{
		_veh = objectFromNetId _x;
		_x setMarkerPosLocal _veh;
	} forEach _markedAssets;
	systemChat "ATC System Updated";
} else {
	systemChat "You have been disconnected from the ATC Service";
	{
		deleteMarkerLocal _x;
	} forEach _markedAssets;
};