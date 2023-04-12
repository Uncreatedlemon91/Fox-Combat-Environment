/* 
Function grabs data from the database and sends it to the player requesting it to open menu. 
*/
params ["_database", "_clientID"];

_db = ["new", _database] call oo_inidbi;
_funds = ["read", ["Mission Logistics", "Funds"]] call _db;
_faction = ["read", ["Mission Factions", "BLUFOR"]] call _db;

_vdb = ["new", format ["Logistics Shop %1 - %2", missionName, worldName]] call oo_inidbi;
_exists = "exists" call _vdb;
_data = [];

if (_exists) then {
	_sections = "getSections" call _vdb;
	{
		// Current result is saved in variable _x
		_name = ["read", [_x, "DisplayName"]] call _vdb;
		_preview = ["read", [_x, "EditorPreview"]] call _vdb;
		_classname = ["read", [_x, "Classname"]] call _vdb;
		_cargoWeight = ["read", [_x, "Cargo Weight"]] call _vdb;
		_cargoSize = ["read", [_x, "Cargo Storage"]] call _vdb;
		_canCarry = ["read", [_x, "Can Carry"]] call _vdb;
		_cost = ["read", [_x, "Cost"]] call _vdb;
		_itemData = [_name, _preview, _classname, _cargoWeight, _canCarry, _cargoSize, _cost];

		_data pushBack _itemData;
	} forEach _sections;

} else {
	_vehs = "configName _x isKindof 'Car' && gettext (_x >> 'faction') == 'ACM_B_NAG'" configClasses (configFile >> "CfgVehicles");
	_items = ["ACE_WHEEL", "ACE_TRACK", "Land_HBarrier_1_F", "Land_CncBarrierMedium_F", "Land_BagFence_Corner_F", "Land_BagFence_Long_F", "Land_BagFence_Round_F"];
	_supplies = ["kat_basicSupplyCrate", "kat_medicalSupplyCrate", "kat_pharmaMedicalCrate", "kat_surgerySupplyCrate", "FlexibleTank_01_forest_F", "Land_CanisterFuel_F", "ACM_B_NAG_AmmoBox", 
	"ACM_B_NAG_SupportBox", "ACM_B_NAG_WeaponsBox", "ACM_B_NAG_LaunchersBox"];

	{
		// Current result is saved in variable _x
		_name = ["write", [_x, "DisplayName", getText (_x >> "displayName")]] call _vdb;
		_preview = ["write", [_x, "EditorPreview", getText (_x >> "editorPreview")]] call _vdb;
		_classname = ["write", [_x, "Classname", configName _x]] call _vdb;
		_cargoWeight = ["write", [_x, "Cargo Weight", 20]] call _vdb;
		_canCarry = ["write", [_x, "Cargo Storage", 4]] call _vdb;
		_cargoSize = ["write", [_x, "Can Carry", false]] call _vdb;
		_cost = ["write", [_x, "Cost", round (random 70)]] call _vdb;
		_itemData = [_name, _preview, _classname, _cargoWeight, _canCarry, _cargoSize, _cost];
		
		_data pushBack _itemData;
	} forEach _vehs;
	{
		// Current result is saved in variable _x
		_name = ["write", [_x, "DisplayName", getText (_x >> "displayName")]] call _vdb;
		_preview = ["write", [_x, "EditorPreview", getText (_x >> "editorPreview")]] call _vdb;
		_classname = ["write", [_x, "Classname", configName _x]] call _vdb;
		_cargoWeight = ["write", [_x, "Cargo Weight", 1]] call _vdb;
		_canCarry = ["write", [_x, "Cargo Storage", 0]] call _vdb;
		_cargoSize = ["write", [_x, "Can Carry", true]] call _vdb;
		_cost = ["write", [_x, "Cost", round (random 10)]] call _vdb;
		_itemData = [_name, _preview, _classname, _cargoWeight, _canCarry, _cargoSize, _cost];

		_data pushBack _itemData;
	} forEach _items;
	{
		// Current result is saved in variable _x
		_name = ["write", [_x, "DisplayName", getText (_x >> "displayName")]] call _vdb;
		_preview = ["write", [_x, "EditorPreview", getText (_x >> "editorPreview")]] call _vdb;
		_classname = ["write", [_x, "Classname", configName _x]] call _vdb;
		_cargoWeight = ["write", [_x, "Cargo Weight", 1]] call _vdb;
		_canCarry = ["write", [_x, "Cargo Storage", 0]] call _vdb;
		_cargoSize = ["write", [_x, "Can Carry", true]] call _vdb;
		_cost = ["write", [_x, "Cost", round (random 10)]] call _vdb;
		_itemData = [_name, _preview, _classname, _cargoWeight, _canCarry, _cargoSize, _cost];
		
		_data pushBack _itemData;
	} forEach _supplies;
};

[_data, _funds] remoteExec ["fce_fn_openMenu", _clientID];





