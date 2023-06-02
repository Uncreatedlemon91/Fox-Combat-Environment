params ["_veh"];
_repairStation = "Land_RepairDepot_01_green_F";
_nearestRepair = nearestObject [_veh, _repairStation];
_dist = getPos _veh distance getPos _nearestRepair;
if (_dist < 20) then {
	systemChat "Repairing!";
	_class = typeOf _veh;
	_pos = getPosATL _veh;

	_veh = _class createVehicle _pos;
	_veh setDamage 0.9;
	_veh setFuel 0;
	clearItemCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
} else {
	"You are too far away from a repair station!" remoteExec ["systemChat", 0];
};