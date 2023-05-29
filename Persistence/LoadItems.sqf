_db = ["new", format ["ALLITEMS %1 %2", missionName, worldName]] call oo_inidbi;

_sections = "getSections" call _db;
{
	// Current result is saved in variable _x
	_type = ["read", [_x, "Type"]] call _db;
	_pos = ["read", [_x, "Position"]] call _db;
	_dir = ["read", [_x, "Direction"]] call _db;
	_dmg = ["read", [_x, "Damage"]] call _db;
	_fuel = ["read", [_x, "Fuel"]] call _db;

	_items = ["read", [_x, "CargoItems"]] call _db;
	_mags = ["read", [_x, "CargoMags"]] call _db;
	_weps = ["read", [_x, "CargoWeps"]] call _db;
	_backs = ["read", [_x, "CargoBps"]] call _db;
	_pitch = ["read", [_x, "Pitch"]] call _db;

	// Create new vehicle based on data input 
	_veh = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
	clearItemCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	_veh setDir _dir;
	_veh setDamage [_dmg, false];
	_veh setFuel _fuel;
	[_veh, _pitch select 0, _pitch select 1] call BIS_fnc_setPitchBank;

	[_veh, true, [0, 6, 1], 10] remoteExec ["ace_dragging_fnc_setCarryable", 0, true];
	[_veh, 1] remoteExec ["ace_cargo_fnc_setSize", 0, true];
	
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

	_backs params ["_classes","_count"];
	for "_i" from 0 to count _classes - 1 do {
		_veh addBackpackCargoGlobal [_classes select _i,_count select _i]
	};

	[_veh, true, [0, 6, 1], 10] remoteExec ["ace_dragging_fnc_setCarryable", 0, true];
	[_veh, 1] remoteExec ["ace_cargo_fnc_setSize", 0, true];

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
	] call ace_interact_menu_fnc_createAction;

	_deleteObject = [
		"deleteObject",
		"Delete Object",
		"",
		{[_target] remoteExec ["fce_fnc_deleteItem", 2]},
		{true},
		{},
		[],
		[0, 0, 0],
		100
	] call ace_interact_menu_fnc_createAction;

	[_veh, 0, ["ACE_MainActions"], _saveObjectAction] remoteExec ["ace_interact_menu_fnc_addActionToObject", 0, true];
	[_veh, 0, ["ACE_MainActions"], _deleteObject] remoteExec ["ace_interact_menu_fnc_addActionToObject", 0, true];

	["deleteSection", _x] call _db;
	[_veh, _type] remoteExec ["fce_fnc_saveItem", 2];
} forEach _sections;