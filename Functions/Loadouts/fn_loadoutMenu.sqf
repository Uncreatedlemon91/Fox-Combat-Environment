params [];

// Create the camera
_cam = "camera" camCreate [0, 0, 0];
_cam camPrepareTarget soldierModel;
_cam camCommitPrepared 0; // needed for relative position
_cam camPrepareRelPos [0, 3, 1.5];
_cam cameraEffect ["internal", "back"];
_cam camCommitPrepared 0;

player setVariable ["Cam", _cam];

// Open the Interface 
createDialog "NewLoadoutMenu";

// Populate Drop down box 
_dropDowndata = [
	"1st Platoon - The Infantry",
	"2nd Platoon - The Armor",
	"B Battery",
	"317th Air Squadron",
	"7th Medical Detachment",
	"Intelligence Detachment",
	"Engineering & Requisitions Detachment"
];

_ctrl = findDisplay 3 displayCtrl 2100;
{
	_added = _ctrl lbAdd _x;
} forEach _dropDowndata;

// Add eventhandler for interface 
_display = findDisplay 3;

_dropCtrl = _display displayCtrl 2100;
_dropEvent = _dropCtrl ctrlAddEventHandler ["LBSelChanged", {call fce_fnc_UpdateListBox}];

_listBox = _display displayCtrl 1500;
_listEvent = _listBox ctrlAddEventHandler ["LBSelChanged", {call fce_fnc_UpdateSoldier}];

// Disable to ESCAPE key while menu is open
#include "\a3\ui_f\hpp\definedikcodes.inc"
_display displayAddEventHandler ["KeyDown",
{
	params ["", "_key"];
	_key == DIK_ESCAPE;
}];