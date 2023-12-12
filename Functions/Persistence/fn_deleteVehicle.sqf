params ["_target"];
_pos = getPos _target;
_nearestRepair = nearestObject [_pos, "Land_RepairDepot_01_tan_F"];
_distance = _pos distance2D (getpos _nearestRepair);

if (_distance < 10) then {
	_netId = netId _target;
	_pvic = ["new", format ["Player Vehicles %1 %2", missionName, worldName]] call oo_inidbi;
	["deleteSection", _netID] call _pvic;
	deleteVehicle _target;
} else {
	[format ["You are too far away from a Repair Depot to salvage this! (Nearest Depot: %1m)", _distance]] remoteExec ["systemChat", clientOwner];
};