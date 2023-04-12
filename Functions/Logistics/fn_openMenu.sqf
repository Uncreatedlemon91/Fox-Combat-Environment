params ["_data"];
createDialog "LogiMenu";

_listbox = findDisplay 1 displayCtrl 1500;
{
	_added = _listbox lbAdd _x select 0;
	_listbox lbsetTextRight [_added, str (_x select 6)];
	_listbox lbSetPicture [_added, _x select 1];
	_listbox lbSetData [_added, _x select 2];
} forEach _data;