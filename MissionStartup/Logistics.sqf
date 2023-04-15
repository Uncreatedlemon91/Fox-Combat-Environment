/*
Establish supplies of logistics at Laptop
*/
_db = ["new", format ["Logistics - %1 %2", missionName, worldName]] call oo_inidbi;
_exists = "exists" call _db;

if (_exists) then {
	
} else {
	// New data load 
	["write", ["Supply Points", "Balance", round(random 200)]] call _db;

	// Add faction vehicles 
	_grpCfg = "getText (_x >> 'Faction') == 'ACM_B_NAG' && getText (_x >> 'vehicleClass') == 'Car'" configClasses (configFile >> "CfgVehicles");
	{
		_class = configName _x;
		_name = getText (configFile >> "CfgVehicles" >> _class >> "displayName");
		_image = getText (configFile >> "CfgVehicles" >> _class >> "editorPreview");
		_cost = round(random 50);
		_weight = 1;
		_canCarry = true;
		
		["write", [_name, "Name", _name]] call _db;
		["write", [_name, "Class", _class]] call _db;
		["write", [_name, "Image", _image]] call _db;
		["write", [_name, "Cost", _cost]] call _db;
		["write", [_name, "Weight", _weight]] call _db;
		["write", [_name, "canCarry", _canCarry]] call _db;
	} forEach _grpCfg;

	// Add Construction Items
	_items = ["Land_HBarrier_1_F", "Land_PlasticBarrier_01_F", "Land_PlasticBarrier_03_F", "Land_HBarrier_3_F", "Land_HBarrierTower_F"];
	_supplies = ["kat_surgerySupplyCrate", "kat_pharmaMedicalCrate", "kat_medicalSupplyCrate", "kat_basicSupplyCrate", "kat_stretcherBag", 
		"ACM_B_NAG_WeaponsBox", "ACM_B_NAG_SupportBox", "ACM_B_NAG_AmmoBox", "ACM_B_NAG_LaunchersBox", "ACM_B_NAG_WeaponsBox"];
	_furniture = ["Land_CampingChair_V2_F", "Land_CampingTable_F", "Land_Campfire_F"];
	{
		_name = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
		_image = getText (configFile >> "CfgVehicles" >> _x >> "editorPreview");
		_cost = round(random 10);
		_weight = 1;
		_canCarry = true;
		
		["write", [_name, "Name", _name]] call _db;
		["write", [_name, "Class", _x]] call _db;
		["write", [_name, "Image", _image]] call _db;
		["write", [_name, "Cost", _cost]] call _db;
		["write", [_name, "Weight", _weight]] call _db;
		["write", [_name, "canCarry", _canCarry]] call _db;
	} forEach _items;

	{
		_name = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
		_image = getText (configFile >> "CfgVehicles" >> _x >> "editorPreview");
		_cost = round(random 10);
		_weight = 1;
		_canCarry = true;
		
		["write", [_name, "Name", _name]] call _db;
		["write", [_name, "Class", _x]] call _db;
		["write", [_name, "Image", _image]] call _db;
		["write", [_name, "Cost", _cost]] call _db;
		["write", [_name, "Weight", _weight]] call _db;
		["write", [_name, "canCarry", _canCarry]] call _db;
	} forEach _supplies;

	{
		_name = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
		_image = getText (configFile >> "CfgVehicles" >> _x >> "editorPreview");
		_cost = round(random 10);
		_weight = 1;
		_canCarry = true;
		
		["write", [_name, "Name", _name]] call _db;
		["write", [_name, "Class", _x]] call _db;
		["write", [_name, "Image", _image]] call _db;
		["write", [_name, "Cost", _cost]] call _db;
		["write", [_name, "Weight", _weight]] call _db;
		["write", [_name, "canCarry", _canCarry]] call _db;
	} forEach _furniture;

	
};


[logiLapt, ["Open Logistics Menu", {
	[clientOwner] remoteExec ["fce_fnc_getLogiData", 2];
}]]remoteExec ["addAction", 0, true];
