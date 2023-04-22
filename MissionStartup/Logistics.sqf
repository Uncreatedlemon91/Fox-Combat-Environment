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
	_supplies = ["kat_surgerySupplyCrate", "kat_pharmaMedicalCrate", "kat_medicalSupplyCrate", "kat_basicSupplyCrate", "kat_stretcherBag", 
		"ACM_B_NAG_AmmoBox", "ACE_Wheel", "ACE_medicalSupplyCrate_advanced", "FlexibleTank_01_forest_F", "Land_RepairDepot_01_green_F"];
	_furniture = ["Land_CampingChair_V2_F", "Land_CampingTable_F", "Land_Campfire_F"];
	
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

	{
		_class = _x;
		_name = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
		_image = getText (configFile >> "CfgVehicles" >> _x >> "editorPreview");
		_cost = round (random [5, 10, 15]);
		_weight = 1;
		_canCarry = true;
		
		["write", [_class, "Name", _name]] call _db;
		["write", [_class, "Class", _class]] call _db;
		["write", [_class, "Image", _image]] call _db;
		["write", [_class, "Cost", _cost]] call _db;
		["write", [_class, "Weight", _weight]] call _db;
		["write", [_class, "canCarry", _canCarry]] call _db;
	} forEach _supplies;

	{
		_class = _x;
		_name = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
		_image = getText (configFile >> "CfgVehicles" >> _x >> "editorPreview");
		_cost = round (random [5, 10, 15]);
		_weight = 1;
		_canCarry = true;
		
		["write", [_class, "Name", _name]] call _db;
		["write", [_class, "Class", _class]] call _db;
		["write", [_class, "Image", _image]] call _db;
		["write", [_class, "Cost", _cost]] call _db;
		["write", [_class, "Weight", _weight]] call _db;
		["write", [_class, "canCarry", _canCarry]] call _db;
	} forEach _furniture;
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