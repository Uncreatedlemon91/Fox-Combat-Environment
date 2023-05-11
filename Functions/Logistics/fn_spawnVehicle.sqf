params ["_class", "_name"];

_list = findDisplay 1 displayCtrl 1500;
_sel = lbCurSel _list;

_veh = _class createVehicle position Logi_Spawn;

[_veh, true, [0, 6, 1], 10] remoteExec ["ace_dragging_fnc_setCarryable", 0, true];
[_veh, 1] remoteExec ["ace_cargo_fnc_setSize", 0, true];

[_veh, _class] execVM "Persistence\SaveItems.sqf";
