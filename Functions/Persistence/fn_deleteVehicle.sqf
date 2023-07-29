params ["_target"];

_netId = netId _target;

_pvic = ["new", format ["Player Vehicles %1 %2", missionName, worldName]] call oo_inidbi;
["deleteSection", _netID] call _pvic;