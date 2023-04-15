/* 
Receives data from server to client for menu 
*/
params ["_items", "_funds"];

createDialog "LogiMenu";
_list = findDisplay 1 displayCtrl 1500;
_hint = findDisplay 1 displayCtrl 1602;
[format ["_items = %1", _items]] remoteExec ["systemChat", 0];
[format ["_funds = %1", _funds]] remoteExec ["systemChat", 0];

_hint buttonSetAction "Hint format ['Current Supply: %1', _funds]";
_hint ctrlSetText format ["Supplies: %1", _funds];
{
	// Current result is saved in variable _x
	[format ["ITEM = %1", _x]] remoteExec ["systemChat", 0];
	_data = _x;
	[format ["_data = %1", _data]] remoteExec ["systemChat", 0];
	{
		// Current result is saved in variable _x
		_classname = _x select 0;
		[format ["_classname = %1", _classname]] remoteExec ["systemChat", 0];
		
		_name = _x select 1;
		_image = _x select 2;
		_added = _list lbAdd _name;
		_cost = _x select 3;
		_list lbSetData [_added, _classname];
		_list lbsetTextRight [_added, _cost];
		_list lbSetPicture [_added, _image];
	} forEach _data;

} forEach _items;

