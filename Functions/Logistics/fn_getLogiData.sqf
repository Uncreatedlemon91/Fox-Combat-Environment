/* 
Get Data from database 
*/
params ["_clientID"];
_db = ["new", format ["Logistics - %1 %2", missionName, worldName]] call oo_inidbi;
_sections = "getSections" call _db;
_dataToSend = [];
_funds = ["read", ["Supply Points", "Balance"]] call _db;
{
	// Current result is saved in variable _x
	_name = ["read", [_x, "Name"]] call _db;
	_class = ["read", [_x, "Class"]] call _db;
	_image = ["read", [_x, "Image"]] call _db;
	_cost = ["read", [_x, "Cost"]] call _db;
	_weight = ["read", [_x, "Weight"]] call _db;
	_canCarry = ["read", [_x, "canCarry"]] call _db;

	_data = [_class, _name, _image, _cost, _weight, _canCarry];		
	_dataToSend pushBack _data;
} forEach _sections;

[_dataToSend, _funds] remoteExec ["fce_fnc_openMenu", 0];