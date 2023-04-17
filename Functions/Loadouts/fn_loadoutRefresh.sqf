params ["_control", "_lbCurSel", "_lbSelection"];
_image = findDisplay 2 displayCtrl 1200;
_class = _control lbData _lbCurSel;
_pic = getText (configFile >> "CfgVehicles" >> _class >> "editorPreview");
_image ctrlSetText _pic;

_button = findDisplay 2 displayCtrl 1600;
_textbox = findDisplay 2 displayCtrl 1000;

if (_class == "ACM_NAG_Soldier") then {
	_button ctrlSetText "Load Rifleman Kit";
	_button buttonSetAction {"call fce_fnc_RiflemanKit"};
};