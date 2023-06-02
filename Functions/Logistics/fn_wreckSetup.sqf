params ["_veh", "_mkr"];

_recoverWreck = {
	params ["_veh"];
	_repairStation = "Land_RepairDepot_01_green_F";
	_nearestRepair = nearestObject [_veh, _repairStation];
	_dist = getPos _veh distance getPos _nearestRepair;
	if (_dist < 20) then {
		_veh setDamage 0.9;
		_veh setFuel 0;
		clearItemCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;
	} else {
		"You are too far away from a repair station!" remoteExec ["systemChat", 0];
	};
};

_recoverWreckAction = [
	"RestoreWreck",
	"Repair Wreck",
	"",
	{[_target] remoteExec ["_recoverWreck", 2]},
	{true},
	{},
	[],
	[0, 0, 0],
	100
] call ace_interact_menu_fnc_createAction;

[_veh, 0, ["ACE_MainActions"], _recoverWreckAction] call ace_interact_menu_fnc_addActionToObject;
