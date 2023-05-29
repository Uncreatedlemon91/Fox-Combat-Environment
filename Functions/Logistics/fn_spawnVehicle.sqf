params ["_class", "_name"];
_db = ["new", format ["Logistics - %1 %2", missionName, worldName]] call oo_inidbi;

_list = findDisplay 1 displayCtrl 1500;
_sel = lbCurSel _list;

_veh = _class createVehicle position Logi_Spawn;

clearItemCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
clearWeaponCargoGlobal _veh;

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

_saveObjectAction = [
	"saveObject",
	"Lock Object",
	"",
	{_class = typeOf _target; [_target, _class] remoteExec ["fce_fnc_saveItem", 2]},
	{true},
	{},
	[],
	[0, 0, 0],
	100
] remoteExec ["ace_interact_menu_fnc_createAction", 0, true];

_deleteObject = [
	"deleteObject",
	"Delete Object",
	"",
	{deleteVehicle _target},
	{true},
	{},
	[],
	[0, 0, 0],
	100
] remoteExec ["ace_interact_menu_fnc_createAction", 0, true];

[_veh, 0, ["ACE_MainActions"], _saveObjectAction] remoteExec ["ace_interact_menu_fnc_addActionToObject", 0, true];
[_veh, 0, ["ACE_MainActions"], _deleteObject] remoteExec ["ace_interact_menu_fnc_addActionToObject", 0, true];

[_veh, true, [0, 6, 1], 10] remoteExec ["ace_dragging_fnc_setCarryable", 0, true];
[_veh, 1] remoteExec ["ace_cargo_fnc_setSize", 0, true];