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
if ((_class in fox_generalVehicles) OR (_class in fox_lightVehicles) OR (_class in fox_mediumVehicles) OR (_class in fox_heavyVehicles) OR (_class in fox_medicalVehicles) OR (_class in fox_artyVehicles) OR (_class in fox_supplyVehicles) OR (_class in fox_AA) OR (_class in fox_heloVehiclesA) OR (_class in fox_heloVehiclesM) or (_class in fox_heloVehiclesT)) then {
	[_veh] remoteExec ["fce_fnc_setupVehicleEH", 2];
	_veh setDamage 0.8;
	_veh setFuel 0.1;
};

// If the Vehicle is a FOB Item 
if (_class == "B_Slingload_01_Cargo_F") then {
	// Add actions to the cargo container 
	[_veh, false] remoteExec ["fce_fnc_addFobActions", 0, true];
};

// If the vehicle is an ammo box 
if (_class == "Land_Ammobox_rounds_F") then {
	// Add actions to re-arm at the box
	[_veh] remoteExec ["fce_fnc_ammoBoxActions", 0, true];
};

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
	
	default { };
};