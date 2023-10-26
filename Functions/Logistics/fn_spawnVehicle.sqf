params ["_class"];

// Spawn the vehicle and attach correct elements to it 
_veh = _class createVehicle position Logi_Spawn;

clearItemCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
clearWeaponCargoGlobal _veh;

_turrets = magazinesAllTurrets _veh;

{
	_mag = _x select 0;
	_turret = _x select 1;
	_veh removeMagazinesTurret [_mag, _turret];
} forEach _turrets;

// Add ace actions and interaction items
[_veh] remoteExec ["fce_fnc_addAceActions", 0, true];

// Setup vehicle event handlers if it is a vehicle
_vehicleClasses = [
	fox_generalVehicles,
	fox_lightVehicles,
	fox_mediumVehicles,
	fox_heavyVehicles,
	fox_medicalVehicles,
	fox_artyVehicles,
	fox_supplyVehicles,
	fox_AA,
	fox_heloVehiclesA,
	fox_heloVehiclesM,
	fox_heloVehiclesT
];
{
	if (_class in _x) then {
		[_veh] remoteExec ["fce_fnc_setupVehicleEH", 2];
		_veh setDamage 0.8;
		_veh setFuel 0.1;
	};
} forEach _vehicleClasses;

switch (_class) do {
	// Repair Vehicles
	case "PRACS_M250_Repair": {_veh setVariable ["ace_repair_canRepair", 1, true]};
	
	// Refuel Vehicles 
	case "PRACS_M250_fuel": {[_veh, 3000] remoteExec ["ace_refuel_fnc_makeSource", 0, true]};
	case "PRACS_HEMMTT_Fueler": {[_veh, 3000] remoteExec ["ace_refuel_fnc_makeSource", 0, true]};
	case "PRACS_m548_fuel": {[_veh, 1000] remoteExec ["ace_refuel_fnc_makeSource", 0, true]};
	
	// Rearming Trucks 
	case "PRACS_m548_ammo": {[_veh, 300] remoteExec ["ace_rearm_fnc_makeSource", 0, true]};
	case "PRACS_m548_arty_tender": {[_veh, 300] remoteExec ["ace_rearm_fnc_makeSource", 0, true]};
	case "PRACS_M250_Ammo": {[_veh, 300] remoteExec ["ace_rearm_fnc_makeSource", 0, true]};
	
	// Ammo box 
	case "Land_Ammobox_rounds_F": {[_veh] remoteExec ["fce_fnc_ammoBoxActions", 0, true]};

	// FOB 
	case "B_Slingload_01_Cargo_F": {[_veh, false] remoteExec ["fce_fnc_addFobActions", 0, true]};
	
	default {};
};