/* 
Receives data from server to client for menu 
*/
params ["_items"];

createDialog "LogiMenu";
_list = findDisplay 1 displayCtrl 1500;

{
	// Current result is saved in variable _x
	_data = _x select 1;
	systemChat format ["_data = %1", _data];
	{
		// Current result is saved in variable _x
		_classname = _x select 0;
		systemChat format ["_classname = %1", _classname];
		
		_name = _x select 1;
		_image = _x select 2;
		_added = _list lbAdd _name;
		_cost = _x select 3;
		_list lbSetData [_added, _classname];
		_list lbsetTextRight [_added, _cost];
		_list lbSetPicture [_added, _image];
	} forEach _data ;
} forEach _items;
