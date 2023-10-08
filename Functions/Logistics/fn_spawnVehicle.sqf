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
if ((_class in fox_generalVehicles) OR (_class in fox_lightVehicles) OR (_class in fox_mediumVehicles) OR (_class in fox_heavyVehicles) OR (_class in fox_medicalVehicles) OR (_class in fox_artyVehicles) OR (_class in fox_supplyVehicles)) then {
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
}
