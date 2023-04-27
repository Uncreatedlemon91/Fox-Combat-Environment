_db = ["new", format ["Trenches - %1 %2", missionName, worldName]] call oo_inidbi;

_sections = "getSections" call _db;
{
	if (_x == "Supply Points") then {} else {
		// Current result is saved in variable _x
		_type = ["read", [_x, "Type"]] call _db;
		_pos = ["read", [_x, "Position"]] call _db;
		_dir = ["read", [_x, "Direction"]] call _db;
		_dmg = ["read", [_x, "Damage"]] call _db;

		// Create new vehicle based on data input 
		_veh = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
		_veh setDir _dir;
		_veh setDamage [_dmg, false];
	};
} forEach _sections;
sleep 10;

"delete" call _db;

execVM "Persistence\SaveFactionVehs.sqf";