/*
Establish supplies of logistics
*/
_db = ["new", format ["Logistics - %1 %2", missionName, worldName]] call oo_inidbi;
_exists = "exists" call _db;

if (_exists) then {
	// old data load 
} else {
	// New data load 
	["write", ["Supply Points", "Balance", round(random 200)]] call _db;
	_grpCfg = "getText (_x >> 'Faction') == 'ACM_B_NAG' && getText (_x >> 'vehicleClass') == 'Car'" configClasses (configFile >> "CfgVehicles");
	_dataToSend = [];
	{
		// Current result is saved in variable _x
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

		_data = [_class, _name, _image, _cost, _weight, _canCarry];
		_dataToSend pushback _data;
	} forEach _grpCfg;

	systemChat format ["%1", _grpCfg];
	[_grpCfg] call fce_fnc_openMenu;
}