/* 
Receives data from server to client for menu 
*/
params ["_items"];

createDialog "LogiMenu";
_list = findDisplay 1 displayCtrl 1500;

{
	// Current result is saved in variable _x
	_classname = configName _x;
	_name = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");
	_image = getText (configFile >> "CfgVehicles" >> _classname >> "editorPreview");
	_added = _list lbAdd _name;
	_list lbSetData [_added, _x];
	_list lbsetTextRight [_added, _x];
	_list lbSetPicture [_added, _image];
} forEach _items;
