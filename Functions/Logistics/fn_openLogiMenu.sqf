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
	"Light Vehicles",
	"Light Armored Vehicles",
	"Heavy Armored Vehicles",
	"Medical Vehicles",
	"Artillery Vehicles",
	"Support Vehicles",
	"Transport Helicopters",
	"Multi Role Helicopters",
	"Attack Helicopters",
	"Supplies",
	"Base Items",
	"Anti Air",
	"Building Materials",
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
			_items = fox_lightVehicles;
		};
		case 2: {
			_items = fox_mediumVehicles;
		};
		case 3: {
			_items = fox_heavyVehicles;
		};
		case 4: {
			_items = fox_medicalVehicles;
		};
		case 5: {
			_items = fox_artyVehicles;
		};
		case 6: {
			_items = fox_supplyVehicles;
		};
		case 7: {
			_items = fox_heloVehiclesT;
		};
		case 8: {
			_items = fox_heloVehiclesM;
		};
		case 9: {
			_items = fox_heloVehiclesA;
		};
		case 10: {
			_items = fox_supplies;
		};
		case 11: {
			_items = fox_FOBS;
		};
		case 12: {
			_items = fox_aa;
		};
		case 13: {
			_items = fox_baseBuilding;
		};
		case 14: {
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

