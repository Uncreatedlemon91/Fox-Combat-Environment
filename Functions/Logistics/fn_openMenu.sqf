/* 
Receives data from server to client for menu 
*/
params ["_items", "_funds"];

createDialog "LogiMenu";
_list = findDisplay 1 displayCtrl 1500;
_hint = findDisplay 1 displayCtrl 1602;
_purchase = findDisplay 1 displayCtrl 1601;

{
	_x params ["_classname", "_name", "_image", "_cost"];
	_added = _list lbAdd _name;
	_list lbSetData [_added, _classname];
	_list lbsetTextRight [_added, str _cost];
	_list lbSetPicture [_added, _image];
} forEach _items;

buttonSetAction [1601, "_list = findDisplay 1 displayCtrl 1500;
	_cur = lbCurSel _list;
	_data = _list lbData _cur;
	_data remoteExec ['fce_fnc_spawnVehicle', 2];"
	];

_hint ctrlSetText format ["Supplies: %1", _funds];