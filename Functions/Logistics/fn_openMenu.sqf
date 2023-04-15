/* 
Receives data from server to client for menu 
*/
params ["_items", "_funds"];

createDialog "LogiMenu";
_list = findDisplay 1 displayCtrl 1500;
_hint = findDisplay 1 displayCtrl 1602;
_purchase = findDisplay 1 displayCtrl 1601;


_populate = _items;
// [format ["_items = %1", _populate]] remoteExec ["systemChat", 0];
// [format ["_funds = %1", _funds]] remoteExec ["systemChat", 0];

buttonSetAction [1602, "Hint format ['Current Supply: %1', _funds]"];
_hint ctrlSetText format ["Supplies: %1", _funds];

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


/*{
	[format ["ITEM = %1", _x]] remoteExec ["systemChat", 0];
	for "_i" from 0 to (count _x) do {
		_data = _populate select _i;
		[format ["_data = %1", _data]] remoteExec ["systemChat", 0];
		// Current result is saved in variable _x
		_classname = _data select 0;
		[format ["_classname = %1", _classname]] remoteExec ["systemChat", 0];
		
		_name = _data select 1;
		_image = _data select 2;
		_added = _list lbAdd _name;
		_cost = __data select 3;
		_list lbSetData [_added, _classname];
		_list lbsetTextRight [_added, _cost];
		_list lbSetPicture [_added, _image];
	};

} forEach _populate;

