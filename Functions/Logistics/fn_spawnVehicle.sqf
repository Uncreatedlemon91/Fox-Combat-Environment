params ["_class", "_name"];
_db = ["new", format ["Logistics - %1 %2", missionName, worldName]] call oo_inidbi;

_list = findDisplay 1 displayCtrl 1500;
_sel = lbCurSel _list;

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

_mags = ["read", [_name, "Magazines"]] call _db;
_items = ["read", [_name, "Items"]] call _db;
_weps = ["read", [_name, "Weapons"]] call _db;
_bps = ["read", [_name, "Backpacks"]] call _db;
_cargo = ["read", [_name, "CargoSize"]] call _db;

[_veh, _cargo] call ace_cargo_fnc_setSpace;
_items params ["_classes","_count"];
for "_i" from 0 to count _classes - 1 do {
	_veh addItemCargoGlobal [_classes select _i,_count select _i]
};

_mags params ["_classes","_count"];
for "_i" from 0 to count _classes - 1 do {
	_veh addMagazineCargoGlobal [_classes select _i,_count select _i]
};

_weps params ["_classes","_count"];
for "_i" from 0 to count _classes - 1 do {
	_veh addWeaponCargoGlobal [_classes select _i,_count select _i]
};

_bps params ["_classes","_count"];
for "_i" from 0 to count _classes - 1 do {
	_veh addBackpackCargoGlobal [_classes select _i,_count select _i]
};

// Add ace actions and interaction items
[_veh] remoteExec ["fce_fnc_addAceActions", 0, true];


// Setup vehicle event handlers if it is a vehicle
switch (true) do
{
	case (_veh isKindOf "Car") : {[_veh] remoteExec ["fce_fnc_setupVehicleEH", 2];};
	case (_veh isKindOf "Tank") : {[_veh] remoteExec ["fce_fnc_setupVehicleEH", 2];};
	case (_veh isKindOf "Motorcycle") : {[_veh] remoteExec ["fce_fnc_setupVehicleEH", 2];};
	case (_veh isKindOf "Ship") : {[_veh] remoteExec ["fce_fnc_setupVehicleEH", 2];};
	case (_veh isKindOf "Helicopter") : {[_veh] remoteExec ["fce_fnc_setupVehicleEH", 2];};
	case (_veh isKindOf "Plane") : {[_veh] remoteExec ["fce_fnc_setupVehicleEH", 2];};
	default {};
};