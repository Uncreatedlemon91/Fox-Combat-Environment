/* 
Get Data from database 
*/
params ["_clientID"];
_db = ["new", format ["Logistics - %1 %2", missionName, worldName]] call oo_inidbi;
_exists = "Exists" call _db;

_sections = "getSections" call _db;
_dataToSend = [];
{
	_class = ["read", [_x, "Type"]] call _db;
	_name = ["read", [_x, "Title"]] call _db;

	_data = [_class, _name];		
	_dataToSend pushBack _data;
} forEach _sections;

[_dataToSend] remoteExec ["fce_fnc_openMenu", _clientID];