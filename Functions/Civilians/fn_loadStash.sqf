// Spawns an enemy Stash of weapons 
_db = ["new", format ["Insurgent Stashes %1 %2", missionName, worldName]] call oo_inidbi;
_sections = "getSections" call _db;
{
	_stashes = ["read", [_x, "Stashes"]] call _db;
	{
		// Get database info 
		_data = _x;
		_pos = _data select 0;
		_type = _data select 1;

		// Spawn the stash into the world 
		_stash = _type createVehicle _pos;
		clearMagazineCargoGlobal _stash;
		clearWeaponCargoGlobal _stash;
		clearBackpackCargoGlobal _stash;
		clearItemCargoGlobal _stash;

		// Add ACE actions to the stash 
	} forEach _stashes;
} forEach _sections;
