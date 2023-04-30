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
	if (_x == "Supply Points") then {
		
	} else {
		_class = ["read", [_x, "Type"]] call _db;
		_name = ["read", [_x, "Title"]] call _db;
		_cost = ["read", [_x, "Cost"]] call _db;

		_data = [_class, _name, _cost];		
		_dataToSend pushBack _data;
	};
} forEach _sections;

[_dataToSend, _funds] remoteExec ["fce_fnc_openMenu", _clientID];