/*
Establish supplies of logistics at Laptop
*/
_db = ["new", format ["Logistics - %1 %2", missionName, worldName]] call oo_inidbi;
_exists = "exists" call _db;

if (_exists) then {
	
} else {
	// New data load 
	["write", ["Supply Points", "Balance", round(random [100, 200, 300])]] call _db;

	_SpawnItems = [
		// Turret Items
		["ACM_B_NAG_T_DSHKM", "DSHKM Turret", 4, 1, true],
		["ACM_B_NAG_T_DSHKM", "DSHKM Turret (Low)", 4, 1, true],
		["ACM_B_NAG_T_Mortar", "Mortar", 15, 1, true],
		["ACM_B_NAG_T_Searchlight", "Searchlight", 4, 1, true],
		["ACM_B_NAG_T_SPG9", "SPG9 Turret", 10, 1, true],
		["ACM_B_NAG_T_ZU23", "ZU23 AA Turret", 15, 1, true],
		// ACE Items 
		["ACE_SandbagObject", "Sandbag (Empty)", 1, 1, true],
		["ACE_Track", "Replacement Track", 1, 1, true],
		["ACE_Wheel", "Replacement Wheel", 1, 1, true],
		// Ammunition 
		["ACM_B_NAG_LauncherBox", "LAT Kit Munitions", 10, 1, true],
		["ACM_B_NAG_LauncherBox", "HAT Kit Munitions", 40, 1, true],
		["ACM_B_NAG_AmmoBox", "7.62 FAL Ammo Box", 10, 1, true],
		["ACM_B_NAG_AmmoBox", "MG Ammo Box", 10, 1, true],
		["ACM_B_NAG_AmmoBox", "Carbine Ammo", 10, 1, true],
		["Box_IND_WpsSpecial_F", "Sniper Supplies", 30, 1, true],
		["ACE_Box_Ammo", "Grenadier Ammunition", 10, 1, true],
		["ACE_Box_Ammo", "Grenades", 10, 1, true],
		["ACE_Box_Ammo", "Shotgun Ammo", 10, 1, true],
		["ACE_Box_Ammo", "Pistol Ammo", 10, 1, true],
		["ACE_medicalSupplyCrate_advanced", "Packing Bandages", 5, 1, true],
		["ACE_medicalSupplyCrate_advanced", "Elastic Bandages", 5, 1, true],
		["ACE_medicalSupplyCrate_advanced", "Fluids", 5, 1, true],
		["ACE_medicalSupplyCrate_advanced", "Medications", 5, 1, true],
		["ACE_medicalSupplyCrate_advanced", "Surgery Tools", 5, 1, true],
		// Vehicles 
		["ACM_B_NAG_Tatra", "Tatra Truck", 15, 20, false],
		["ACM_B_NAG_Tatra_Ammo", "Ammo Truck", 30, 20, false],
		["ACM_B_NAG_Tatra_Refuel", "Refuel Truck", 30, 20, false],
		["ACM_B_NAG_Tatra_Repair", "Repair Truck", 30, 20, false],
		["ACM_B_NAG_UAZ_Unarmed", "UAZ - Unarmed", 10, 20, false],
		["ACM_B_NAG_UAZ_MG", "UAZ - Machine Gun", 25, false],
		["ACM_B_NAG_UAZ_AGS30", "UAZ - Grenade Launcher", 40, 20, false],
		["ACM_B_NAG_UAZ_SPG", "UAZ - SPG9 Launcher", 40, 20, false],
		["ACM_B_NAG_Ifrit", "Ifrit - Unarmed", 40, 20, false],
		["ACM_B_NAG_Ifrit_HMG", "Ifrit - Machine Gun", 60, 20, false],
		["ACM_B_NAG_Ifrit_GMG", "Ifrit - Grenade Launcher", 80, 20, false],
		["ACM_B_NAG_BMP2", "BMP", 180, 20, false]
	];

	{
		// Current result is saved in variable _x
		_class = _x select 0;
		_name = _x select 1;
		_cost = _x select 2;
		_weight = _x select 3;
		_canCarry = _x select 4;

		["write", [_class, "Type", _class]] call _db;
		["write", [_class, "Title", _name]] call _db;
		["write", [_class, "Cost", _cost]] call _db;
		["write", [_class, "Weight", _weight]] call _db;
		["write", [_class, "CanCarry", _canCarry]] call _db;

	} forEach _spawnItems;
};


/*
 TURRETS 
	ACM_B_NAG_T_DSHKM
	ACM_B_NAG_T_DSHKM_Mini
	ACM_B_NAG_T_Mortar
	ACM_B_NAG_T_Searchlight
	ACM_B_NAG_T_SPG9
	ACM_B_NAG_T_ZU23
ITEMS 
	ACE_SandbagObject
	ACE_Track
	ACE_Wheel
	ACE_TripodObject
SUPPLIES 
	ACM_B_NAG_LaunchersBox
	ACM_B_NAG_AmmoBox
	Box_IND_WpsSpecial_F
	ACE_Box_Ammo
	ACE_medicalSupplyCrate_advanced
APC 
	ACM_B_NAG_BMP2
	ACM_B_NAG_BMP2_AMB
	ACM_B_NAG_BMP2_ZU
	ACM_B_NAG_BMP_HQ
	ACM_B_NAG_BTR80A
TANK
	ACM_B_NAG_T72
ARTY 
	ACM_B_NAG_RM70
	ACM_B_NAG_T_D30 (TURRET)
CARS 
	ACM_B_NAG_Ifrit
	ACM_B_NAG_Ifrit_GMG
	ACM_B_NAG_Ifrit_HMG
	ACM_B_NAG_Tatra
	ACM_B_NAG_Tatra_Ammo
	ACM_B_NAG_Tatra_Refuel
	ACM_B_NAG_Tatra_Repair
	ACM_B_NAG_UAZ_Unarmed
	ACM_B_NAG_UAZ_AGS30
	ACM_B_NAG_UAZ_MG
	ACM_B_NAG_UAZ_SPG
HELI 
	ACM_B_NAG_MI171
	ACM_B_NAG_MI171_Unarmed
	ACM_B_NAG_KA52
PLANES 
	ACM_B_NAG_C130
	ACM_B_NAG_C130_Cargo
	ACM_B_NAG_Harrier
	ACM_B_NAG_Civil
ANTIAIR 
	ACM_B_NAG_2S6M

*/

[logiLapt, ["Open Logistics Menu", {
	[clientOwner] remoteExec ["fce_fnc_getLogiData", 2];
}]]remoteExec ["addAction", 0, true];

refundTrg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
refundTrg setTriggerStatements [ "this", 
	"{_veh = _x; {_veh deleteVehicleCrew _x} forEach crew _veh; deleteVehicle _veh} foreach (vehicles select {_x inArea thisTrigger});
	_db = ['new', format ['Logistics - %1 %2', missionName, worldName]] call oo_inidbi;
	_curFunds = ['read', ['Supply Points', 'Balance']] call _db;
	_newFunds = _curFunds + round(random 30);
	['write', ['Supply Points', 'Balance', _newFunds]] call _db;

	'Refund Received!' remoteExec ['systemChat', 0];
	", 
	""];