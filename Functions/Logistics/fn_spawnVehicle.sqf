params ["_class"];

// Spawn the vehicle and attach correct elements to it 
_veh = _class createVehicle position Logi_Spawn;

_veh allowDamage false;
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
	fox_heloVehiclesT,
	fox_boats
];
{
	if (_class in _x) then {
		[_veh] remoteExec ["fce_fnc_setupVehicleEH", 2];
		_veh setDamage 0.8;
		_veh setFuel 0.1;
	};
} forEach _vehicleClasses;

switch (_class) do {
	// Ammo box 
	case "Land_Ammobox_rounds_F": {[_veh] remoteExec ["fce_fnc_ammoBoxActions", 0, true]};

	// FOB 
	case "B_Slingload_01_Cargo_F": {[_veh, false] remoteExec ["fce_fnc_addFobActions", 0, true]};

	// Move boats to the water 
	case "PRACS_Mk5_SOCR": {_veh setPos (getPosAsl sea_spawn)};
	case "PRACS_Zodiac": {_veh setPos (getPosASL sea_spawn)};
	
	default {};
};

_veh allowDamage true;