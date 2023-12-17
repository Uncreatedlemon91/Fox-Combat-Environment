_db = ["new", format ["ALLITEMS %1 %2", missionName, worldName]] call oo_inidbi;
_sections = "getSections" call _db;
{
	// Current result is saved in variable _x
	_data = ["read", [_x, "Data"]] call _db;

	_type = _data select 0;
	_pos = _data select 1;
	_dir = _data select 2;
	_dmg = _data select 3;
	_fuel = _data select 4;

	_items = _data select 5;
	_mags = _data select 6;
	_weps = _data select 7;
	_backs = _data select 8;
	_pitch = _data select 9;

	["deleteSection", _x] call _db;

	// Create new vehicle based on data input 
	_veh = createVehicle [_type, [0,0,0], [], 0, "CAN_COLLIDE"];
	_veh setPosATL _pos;
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
	
	[_veh] remoteExec ["fce_fnc_addAceActions", 0, true];
	[_veh, _type] remoteExec ["fce_fnc_saveItem", 2];

	// Add interactions to special items 
	switch (_type) do {
		case "Land_Ammobox_rounds_F": {[_veh] remoteExec ["fce_fnc_ammoBoxActions", 0, true]};
		case "Box_NATO_Equip_F": {[_veh] remoteExec ["fce_fnc_loadoutBoxActions", 0, true]};
		default { };
	};
} forEach _sections;

"All Persistent Data Loaded" remoteExec ["SystemChat", 0, true];