/*
Establish supplies of logistics at Laptop
*/
_db = ["new", format ["Logistics - %1 %2", missionName, worldName]] call oo_inidbi;
_exists = "exists" call _db;

_SpawnItems = [
	// Fortifications 
	["Land_RoadBarrier_01_F", "Road Gate", 1, 1, true],
	["Land_HBarrier_1_F", "Hesco Barrier", 1, 1, true],
	["Land_HBarrierWall6_F", "Hesco Barrier Wall - Long", 4, 1, true],
	["Land_HBarrierWall4_F", "Hesco Barrier Wall - Short", 2, 1, true],
	["Land_HBarrierWall_corner_F", "Hesco Barrier Wall - Corner", 2, 1, true],
	["Land_HBarrier_3_F", "Hesco Barriers (3)", 3, 1, true],
	["Land_HBarrierWall_corridor_F", "Hesco Barriers - Corridor", 5, 1, true],
	["Land_Mil_WallBig_4m_F", "Base Wall", 1, 1, true],
	["Land_PortableDesk_01_olive_F", "Desk", 1, 1, true],
	["Land_PlasticCase_01_medium_olive_F", "Empty Box", 1, 1, true],
	["TargetP_Inf_F", "Target", 1, 1, true],
	["Land_Campfire_F", "Campfire", 1, 1, true],
	["Land_CampingChair_V2_F", "Chair", 1, 1, true],
	["Land_Sign_MinesTall_English_F", "Mines warning sign", 1, 1, true],
	// Lighting 
	["RoadCone_L_F", "Road Cone", 1, 1, true],
	["Land_PortableLight_single_F", "Single Light", 1, 1, true],
	["Land_TentLamp_01_standing_F", "Single Light", 1, 1, true],
	["Land_TentLamp_01_standing_red_F", "Single Light", 1, 1, true],
	["Land_PortableLight_02_double_olive_F", "Single Light", 1, 1, true],
	["Land_Camping_Light_F", "Single Light", 1, 1, true],
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
	["ACM_B_NAG_AmmoBox", "FAL Ammo Box", 10, 1, true],
	["ACM_B_NAG_AmmoBox", "MG Ammo Box", 10, 1, true],
	["Box_IND_WpsSpecial_F", "Sniper Supplies", 30, 1, true],
	["ACE_Box_Ammo", "Grenadier Ammunition", 10, 1, true],
	["ACE_Box_Ammo", "Grenades", 10, 1, true],
	["ACE_Box_Ammo", "Shotgun Supplies", 10, 1, true],
	["ACE_Box_Ammo", "Pistol Ammo", 10, 1, true],
	// Supplies 
	["FlexibleTank_01_forest_F", "Flexible Fuel Carrier", 10, 1, true],
	["Land_CanisterFuel_F", "Fuel Can", 2, 1, true],
	["Land_RepairDepot_01_green_F", "Repair Facility", 10, 4, true],
	["Box_NATO_AmmoVeh_F", "Vehicle Ammo Crate", 20, 4, true],
	// Medical
	["kat_surgerySupplyCrate", "KAM Surgery Tools", 5, 1, true],
	["kat_pharmaMedicalCrate", "KAM Pharmacy Crate", 5, 1, true],
	["kat_medicalSupplyCrate", "KAM Blood", 5, 1, true],
	["kat_basicSupplyCrate", "KAM General Items", 5, 1, true],
	["ACE_medicalSupplyCrate_advanced", "ACE Advanced Medical", 5, 1, true],
	// Vehicles 
	["ACM_B_NAG_Tatra", "Tatra Truck", 15, 20, false],
	["ACM_B_NAG_Tatra_Ammo", "Ammo Truck", 30, 20, false],
	["ACM_B_NAG_Tatra_Refuel", "Refuel Truck", 30, 20, false],
	["ACM_B_NAG_Tatra_Repair", "Repair Truck", 30, 20, false],
	["ACM_B_NAG_UAZ_Unarmed", "UAZ - Unarmed", 10, 20, false],
	["ACM_B_NAG_UAZ_MG", "UAZ - Machine Gun", 25, 20, false],
	["ACM_B_NAG_UAZ_AGS30", "UAZ - Grenade Launcher", 40, 20, false],
	["ACM_B_NAG_UAZ_SPG", "UAZ - SPG9 Launcher", 40, 20, false],
	["ACM_B_NAG_Ifrit", "Ifrit - Unarmed", 40, 20, false],
	["ACM_B_NAG_Ifrit_HMG", "Ifrit - Machine Gun", 60, 20, false],
	["ACM_B_NAG_Ifrit_GMG", "Ifrit - Grenade Launcher", 80, 20, false],
	["ACM_B_NAG_BMP2_AMB", "BMP - Ambulance", 120, 20, false],
	["ACM_B_NAG_BMP2", "BMP", 180, 20, false],
	["ACM_B_NAG_BTR80A", "BTR 80A", 220, 20, false],
	["ACM_B_NAG_RM70", "Rocket Artillery", 220, 20, false],
	["ACM_B_NAG_T72", "T72 Tank", 320, 20, false],
	["ACM_B_NAG_MI171_Unarmed", "MI-17 Unarmed", 320, 20, false],
	["ACM_B_NAG_Civil", "Scout Plane", 560, 20, false],
	["ACM_B_NAG_KA52", "KA-52 Support Helicopter", 980, 20, false]
];
if (_exists) then {
	
} else {
	// New data load 
	["write", ["Supply Points", "Balance", round (random [100, 200, 300])]] call _db;

	{
		// Current result is saved in variable _x
		_class = _x select 0;
		_name = _x select 1;
		_cost = _x select 2;
		_weight = _x select 3;
		_canCarry = _x select 4;

		["write", [_name, "Type", _class]] call _db;
		["write", [_name, "Title", _name]] call _db;
		["write", [_name, "Cost", _cost]] call _db;
		["write", [_name, "Weight", _weight]] call _db;
		["write", [_name, "CanCarry", _canCarry]] call _db;

	} forEach _spawnItems;
};

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