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

_data = ["read", [_name, "Data"]] call _db;

_items = _data select 2;
_weps = _data select 3;
_bps = _data select 4;
_mags = _data select 5;

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

// Add ACRE Radio feature to vehicle 
[_veh, ["ACRE_VRC103", "FOX Radio Network", "Dash", false, ["inside"], ["CARGO"], "ACRE_PRC117F", [], []], true] call acre_api_fnc_addRackToVehicle;


// Setup vehicle event handlers if it is a vehicle
switch (true) do
{
	case (_veh isKindOf "Car") : {[_veh] remoteExec ["fce_fnc_setupVehicleEH", 2]; _veh setDamage 0.8; _veh setFuel 0.1};
	case (_veh isKindOf "Tank") : {[_veh] remoteExec ["fce_fnc_setupVehicleEH", 2]; _veh setDamage 0.8; _veh setFuel 0.1};
	case (_veh isKindOf "Motorcycle") : {[_veh] remoteExec ["fce_fnc_setupVehicleEH", 2]; _veh setDamage 0.8; _veh setFuel 0.1};
	case (_veh isKindOf "Ship") : {[_veh] remoteExec ["fce_fnc_setupVehicleEH", 2]; _veh setDamage 0.8; _veh setFuel 0.1};
	case (_veh isKindOf "Helicopter") : {[_veh] remoteExec ["fce_fnc_setupVehicleEH", 2]; _veh setDamage 0.8; _veh setFuel 0.1};
	case (_veh isKindOf "Plane") : {[_veh] remoteExec ["fce_fnc_setupVehicleEH", 2]; _veh setDamage 0.8; _veh setFuel 0.1};
	default {};
};