/* 
Receives data from server to client for menu 
*/
params ["_items", "_funds"];

createDialog "LogiMenu";
_list = findDisplay 1 displayCtrl 1500;
_hint = findDisplay 1 displayCtrl 1602;
_purchase = findDisplay 1 displayCtrl 1601;

// [format ["_items = %1", _populate]] remoteExec ["systemChat", 0];
// [format ["_funds = %1", _funds]] remoteExec ["systemChat", 0];

buttonSetAction [1601, "_list = findDisplay 1 displayCtrl 1500; _sel = lbCurSel _list; _class = _list lbData _sel; _class createVehicle position player; closeDialog 2"];
_hint ctrlSetText format ["Supplies: %1", _funds];

/*
_populate apply {
	[format ["_items = %1", _x]] remoteExec ["systemChat", 0];
	_classname = _x select 0;
	_name = _x select 1;
	_image = _x select 2;
	_added = _list lbAdd _name;
	_cost = _x select 3;
	_list lbSetData [_added, _classname];
	_list lbsetTextRight [_added, _cost];
	_list lbSetPicture [_added, _image];
};
*/
diag_log ["_items", _items];

{
	for "_i" from 1 to (count _x - 1) do {
		_x params ["_classname", "_name", "_image", "_cost"];
		_added = _list lbAdd _name;
		_list lbSetData [_added, _classname];
		_list lbsetTextRight [_added, _cost];
		_list lbSetPicture [_added, _image];
	};
} forEach _items;

