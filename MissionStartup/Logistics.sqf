/*
Establish supplies of logistics at Laptop
*/
_db = ["new", format ["Logistics - %1 %2", missionName, worldName]] call oo_inidbi;
_exists = "exists" call _db;

if (_exists) then {
	[logiLapt, ["Open Logistics Menu", {
		params ["_target", "_caller", "_actionId", "_arguments"];
		_clientID = clientOwner;
		_clientID remoteExec ["fce_fnc_getLogiData", 2];
	}]]remoteExec ["addAction", 0, true];
} else {
	_dataToSend = [];
	// New data load 
	["write", ["Supply Points", "Balance", round(random 200)]] call _db;
	_grpCfg = "getText (_x >> 'Faction') == 'ACM_B_NAG' && getText (_x >> 'vehicleClass') == 'Car'" configClasses (configFile >> "CfgVehicles");
	
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
		fce_dataToSend pushback _data;
		logiLapt setVariable ["MenuData", fce_dataToSend, true];
	} forEach _grpCfg;
	
	[logiLapt, ["Open Logistics Menu", {
		params ["_target", "_caller", "_actionId", "_arguments"];
		_mData = _target getVariable "MenuData";
		[_mData] call fce_fnc_openMenu}]]remoteExec ["addAction", 0, true];
};

/*
// Create Task Missions to get new supplies 
_taskPos = [] call BIS_fnc_randomPos;
_box = "CargoNet_01_box_F";

[logiLapt, [true, "logiRun", ["Command has requested that you collect supplies left behind by nearby friendly forces. Be careful out there, we don't know what you'll be getting yourself into out there!", "Retrieve Supplies"], [] call BIS_fnc_randomPos, "AUTOASSIGNED", -1, true, "box"]] call BIS_fnc_taskCreate;

_spawnBox = _box createVehicle _taskPos;
[_spawnBox, ["Retrieve Supplies", {
	params ["_target", "_caller", "_actionId", "_arguments"];
	deleteVehicle _target;
	[_caller] remoteExec ["fce_fnc_getDataInfo", 2];
	["logiRun", "SUCCEEDED", true] call BIS_fnc_taskSetState
	_supplyRefund = round(random 20);
	[_supplyRefund, ] remoteExec ["fce_fnc_setDataInfo", 2];
}]] remoteExec ["addAction", 0, true];