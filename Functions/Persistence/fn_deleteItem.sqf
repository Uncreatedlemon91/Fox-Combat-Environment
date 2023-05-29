params ["_target"];

_class = typeOf _target;
_netId = netId _target;
_section = format ["%1 - %2", _class, _netID];

_db = ["new", format ["ALLITEMS %1 %2", missionName, worldName]] call oo_inidbi;
["deleteSection", _section] call _db;

deleteVehicle _target;