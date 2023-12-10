// Opens the Logistics Menu 
createDialog "LogiMenuNew";

// List all the elements present in the menu 
_categoryList = findDisplay 1 displayCtrl 1500;
_itemsList = findDisplay 1 displayCtrl 1501;
_picture = findDisplay 1 displayCtrl 1200;
_spawnButton = findDisplay 1 displayCtrl 1600;
_exitButton = findDisplay 1 displayCtrl 1601;

// Add Data to the interfaces 
_categories = [
	"General Vehicles",
	"Light Armored Vehicles",
	"Medical Supplies",
	"Artillery Vehicles",
	"Transport Helicopters",
	"Multi Role Helicopters",
	"Attack Helicopters",
	"Supplies",
	"Base Items",
	"Building Materials",
	"Turrets",
	"Construction"
];
{
	_categoryList lbadd _x;
} forEach _categories;

// Add button interactions
_spawnButton buttonSetAction "_class = player getVariable ""fox_btn_log_item""; [_class] call fce_fnc_spawnVehicle";
_exitButton buttonSetAction "closeDialog 2";

// Add event handlers to the interface 
_categoryList ctrlAddEventHandler ["LBSelChanged", {
	params ["_control", "_lbCurSel", "_lbSelection"];
	_itemsList = findDisplay 1 displayCtrl 1501;
	_items = [];
	lbClear _itemsList;
	switch (_lbCurSel) do {
		case 0: { 
			_items = fox_generalVehicles;
		};
		case 1: {
			_items = fox_mediumVehicles;
		};
		case 2: {
			_items = fox_medicalVehicles;
		};
		case 3: {
			_items = fox_artyVehicles;
		};
		case 4: {
			_items = fox_heloVehiclesT;
		};
		case 5: {
			_items = fox_heloVehiclesM;
		};
		case 6: {
			_items = fox_heloVehiclesA;
		};
		case 7: {
			_items = fox_supplies;
		};
		case 8: {
			_items = fox_baseBuilding;
		};
		case 9: {
			_items = fox_Turrets;
		};
		case 10: {
			_items = fox_construction;
		};
	};

	{
		_itemsList = findDisplay 1 displayCtrl 1501;
		_name = gettext (configfile >> "CfgVehicles" >> _x >> "displayName");
		_itemAdded = _itemsList lbAdd _name;
		_itemsList lbSetData [_itemAdded, _x];
	} forEach _items;
}];

_itemsList ctrlAddEventHandler ["LBSelChanged", {
	params ["_control", "_lbCurSel", "_lbSelection"];
	_className = _control lbData _lbCurSel;
	_picture = findDisplay 1 displayCtrl 1200;
	_imageToShow = gettext (configfile >> "CfgVehicles" >> _className >> "editorPreview");
	_picture ctrlSetText _imageToShow;
	player setVariable ["fox_btn_log_item", _classname, true];
}];