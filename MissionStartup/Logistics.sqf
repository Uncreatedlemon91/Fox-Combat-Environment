/*
Establish supplies of logistics at Laptop
*/
_db = ["new", format ["Logistics - %1 %2", missionName, worldName]] call oo_inidbi;
_exists = "exists" call _db;

if (_exists) then {
	
} else {
	// New data load 
	["write", ["Supply Points", "Balance", round(random [100, 200, 300])]] call _db;

	// Add Car vehicles 
	_cars = "getText (_x >> 'Faction') == 'ACM_B_NAG' && getText (_x >> 'vehicleClass') == 'Car'" configClasses (configFile >> "CfgVehicles");
	{
		_class = configName _x;
		_name = getText (configFile >> "CfgVehicles" >> _class >> "displayName");
		_image = getText (configFile >> "CfgVehicles" >> _class >> "editorPreview"); 
		_cost = round (random [30, 50, 70]);
		_weight = 20;
		_canCarry = false;
		
		["write", [_class, "Name", _name]] call _db;
		["write", [_class, "Class", _class]] call _db;
		["write", [_class, "Image", _image]] call _db;
		["write", [_class, "Cost", _cost]] call _db;
		["write", [_class, "Weight", _weight]] call _db;
		["write", [_class, "canCarry", _canCarry]] call _db;
	} forEach _cars;

	_armored = "getText (_x >> 'Faction') == 'ACM_B_NAG' && getText (_x >> 'vehicleClass') == 'Armored'" configClasses (configFile >> "CfgVehicles");
	{
		_class = configName _x;
		_name = getText (configFile >> "CfgVehicles" >> _class >> "displayName");
		_image = getText (configFile >> "CfgVehicles" >> _class >> "editorPreview");
		_cost = round (random [200, 250, 300]);
		_weight = 50;
		_canCarry = false;
		
		["write", [_class, "Name", _name]] call _db;
		["write", [_class, "Class", _class]] call _db;
		["write", [_class, "Image", _image]] call _db;
		["write", [_class, "Cost", _cost]] call _db;
		["write", [_class, "Weight", _weight]] call _db;
		["write", [_class, "canCarry", _canCarry]] call _db;
	} forEach _armored;

	// Add Misc Items
	_items = ["Land_HBarrier_1_F", "Land_PlasticBarrier_01_F", "Land_PlasticBarrier_03_F", "Land_HBarrier_3_F", "Land_HBarrierTower_F"];
	
	{
		_class = _x;
		_name = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
		_image = getText (configFile >> "CfgVehicles" >> _x >> "editorPreview");
		_cost = round (random [3, 5, 10]);
		_weight = 1;
		_canCarry = true;
		
		["write", [_class, "Name", _name]] call _db;
		["write", [_class, "Class", _class]] call _db;
		["write", [_class, "Image", _image]] call _db;
		["write", [_class, "Cost", _cost]] call _db;
		["write", [_class, "Weight", _weight]] call _db;
		["write", [_class, "canCarry", _canCarry]] call _db;
	} forEach _items;
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