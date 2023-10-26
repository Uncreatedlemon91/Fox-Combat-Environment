// Spawns an enemy Stash of weapons 
params ["_city"];
_db = ["new", format ["Insurgent Stashes %1 %2", missionName, worldName]] call oo_inidbi;
_curData = ["read", [text _city, "Stashes", []]] call _db;

// Create Stash object 
_className = selectRandom [
	"Box_FIA_Ammo_F",
	"Box_FIA_Wps_F",
	"VirtualReammoBox_camonet_F",
	"rhs_weapons_crate_ak_ammo_545x39",
	"Land_CratesWooden_F",
	"Land_WoodenCrate_01_stack_x3_F",
	"Land_WoodenCrate_01_F",
	"AmmoCrate_NoInteractive_",
	"Fort_Crate_wood"
];
_cityPos = getPos _city;
_safePos = [_cityPos, 10, 300, 5, 0, 5, 0, ["base"]] call BIS_fnc_findSafePos;

_stash = _className createVehicle _safePos;
clearMagazineCargoGlobal _stash;
clearWeaponCargoGlobal _stash;
clearBackpackCargoGlobal _stash;
clearItemCargoGlobal _stash;

// Add ACE Actions 

// Save to the Database 
_data = [_safePos, _classname];
_curData pushback _Data;
["write", [text _city, "Stashes", _curData]] call _Db;

// Mark for debug 
_mkr = createMarkerLocal [format ["%1 %2", _className, _safePos], _safePos];
_mkr setMarkerTypeLocal "hd_dot";
_mkr setMarkerColorLocal "ColorRed";
_mkr setMarkerSizeLocal [0.3, 0.3];