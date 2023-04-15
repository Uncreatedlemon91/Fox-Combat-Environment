/*
Establish supplies of logistics at Laptop
*/
_db = ["new", format ["Logistics - %1 %2", missionName, worldName]] call oo_inidbi;
_exists = "exists" call _db;

if (_exists) then {
	
} else {
	// New data load 
	["write", ["Supply Points", "Balance", round(random 300)]] call _db;

	// Add faction vehicles 
	_grpCfg = "getText (_x >> 'Faction') == 'ACM_B_NAG' && getText (_x >> 'vehicleClass') == 'Car'" configClasses (configFile >> "CfgVehicles");
	{
		_class = configName _x;
		_name = getText (configFile >> "CfgVehicles" >> _class >> "displayName");
		_image = getText (configFile >> "CfgVehicles" >> _class >> "editorPreview");
		_cost = round(random 50);
		_weight = 1;
		_canCarry = false;
		
		["write", [_class, "Name", _name]] call _db;
		["write", [_class, "Class", _class]] call _db;
		["write", [_class, "Image", _image]] call _db;
		["write", [_class, "Cost", _cost]] call _db;
		["write", [_class, "Weight", _weight]] call _db;
		["write", [_class, "canCarry", _canCarry]] call _db;
	} forEach _grpCfg;

	// Add Misc Items
	_items = ["Land_HBarrier_1_F", "Land_PlasticBarrier_01_F", "Land_PlasticBarrier_03_F", "Land_HBarrier_3_F", "Land_HBarrierTower_F"];
	_supplies = ["kat_surgerySupplyCrate", "kat_pharmaMedicalCrate", "kat_medicalSupplyCrate", "kat_basicSupplyCrate", "kat_stretcherBag", 
		"ACM_B_NAG_WeaponsBox", "ACM_B_NAG_SupportBox", "ACM_B_NAG_AmmoBox", "ACM_B_NAG_LaunchersBox", "ACM_B_NAG_WeaponsBox", "Item_ToolKit", "ACE_Wheel", 
		"ACE_medicalSupplyCrate_advanced"];
	_furniture = ["Land_CampingChair_V2_F", "Land_CampingTable_F", "Land_Campfire_F"];
	{
		_class = _x;
		_name = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
		_image = getText (configFile >> "CfgVehicles" >> _x >> "editorPreview");
		_cost = round(random 10);
		_weight = 1;
		_canCarry = true;
		
		["write", [_class, "Name", _name]] call _db;
		["write", [_class, "Class", _x]] call _db;
		["write", [_class, "Image", _image]] call _db;
		["write", [_class, "Cost", _cost]] call _db;
		["write", [_class, "Weight", _weight]] call _db;
		["write", [_class, "canCarry", _canCarry]] call _db;
	} forEach _items;

	{
		_class = _x;
		_name = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
		_image = getText (configFile >> "CfgVehicles" >> _x >> "editorPreview");
		_cost = round(random 10);
		_weight = 1;
		_canCarry = true;
		
		["write", [_class, "Name", _name]] call _db;
		["write", [_class, "Class", _x]] call _db;
		["write", [_class, "Image", _image]] call _db;
		["write", [_class, "Cost", _cost]] call _db;
		["write", [_class, "Weight", _weight]] call _db;
		["write", [_class, "canCarry", _canCarry]] call _db;
	} forEach _supplies;

	{
		_class = _x;
		_name = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
		_image = getText (configFile >> "CfgVehicles" >> _x >> "editorPreview");
		_cost = round(random 10);
		_weight = 1;
		_canCarry = true;
		
		["write", [_class, "Name", _name]] call _db;
		["write", [_class, "Class", _x]] call _db;
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
refundTrg setTriggerStatements [ "this", "
	{_veh = _x;
	{_veh deleteVehicleCrew _x} forEach crew _veh; 
	deleteVehicle _veh} foreach (vehicles select {_x inArea thisTrigger});
	_db = ['new', format ['Logistics - %1 %2', missionName, worldName]] call oo_inidbi;
	_curFunds = ['read', ['Supply Points', 'Balance']] call _db;
	_newFunds = _curFunds + round(random 20);
	['write', ['Supply Points', 'Balance', _newFunds]] call _db;

	[format ['New Funds: %1', _newFunds]] remoteExec ['systemChat', 0];
	", ""];