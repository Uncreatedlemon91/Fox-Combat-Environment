/* 
Get Data from database 
*/
params ["_clientID"];
_db = ["new", format ["Logistics - %1 %2", missionName, worldName]] call oo_inidbi;

_sections = "getSections" call _db;
_dataToSend = [];
{
	_dataR = ["read", [_x, "Data"]] call _db;

	_class = _dataR select 0;
	_name = _dataR select 1;

	systemChat format ["%1 %2", _class, _name];
	_data = [_class, _name];		
	_dataToSend pushBack _data;
} forEach _sections;

[_dataToSend] remoteExec ["fce_fnc_openMenu", _clientID];