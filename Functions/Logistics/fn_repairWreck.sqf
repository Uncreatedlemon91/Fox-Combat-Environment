params ["_wreck"];
_repairStation = "Land_RepairDepot_01_green_F";
_nearestRepair = nearestObject [_wreck, _repairStation];
_dist = getPos _wreck distance getPos _nearestRepair;
if (_dist < 50) then {
	_db = ["new", format ["PVics %1 %2", missionName, worldName]] call oo_inidbi;
	systemChat "Repairing!";
	_class = typeOf _wreck;
	_pos = getPosATL _wreck;
	_section = format ["%1 - %2", _class, netID _wreck];
	["deleteSection", _section] call _db;

	deleteVehicle _wreck;

	_veh = _class createVehicle _pos;
	_veh setDamage 0.9;
	_veh setFuel 0;
	clearItemCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	_veh setVehicleAmmo 0;

	[_veh] remoteExec ["fce_fnc_SaveVehicles", 2];	

} else {
	"You are too far away from a repair station!" remoteExec ["systemChat", 0];
};