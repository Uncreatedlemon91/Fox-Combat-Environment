params ["_control", "_lbCurSel", "_lbSelection"];
systemChat "LOADOUT!!";
_image = findDisplay 2 displayCtrl 1200;
_class = _control lbData _lbCurSel;
_pic = getText (configFile >> "CfgVehicles" >> _class >> "editorPreview");
_image ctrlSetText _pic;

_button = findDisplay 2 displayCtrl 1600;
_textbox = findDisplay 2 displayCtrl 1000;

switch (_class) do {
	case "ACM_NAG_Soldier": {_button ctrlSetText "Load Rifleman Kit"; _button buttonSetAction "call fce_fnc_RiflemanKit"};
	case "ACM_NAG_Soldier_RifleAT": {_button ctrlSetText "Load LAT Kit"; _button buttonSetAction "call fce_fnc_LATKit"};
	case "ACM_NAG_Soldier_CLS": {_button ctrlSetText "Load Combat Life Saver Kit"; _button buttonSetAction "call fce_fnc_CLSKit"};
	case "ACM_NAG_Soldier_GL": {_button ctrlSetText "Load Grenadier Kit"; _button buttonSetAction "call fce_fnc_GrenadierKit"};
	case "ACM_NAG_Soldier_Radio": {_button ctrlSetText "Load Radioman Kit"; _button buttonSetAction "call fce_fnc_PltSgtKit"};
	case "ACM_NAG_Soldier_Repair": {_button ctrlSetText "Load Engineer Kit"; _button buttonSetAction "call fce_fnc_EngineerKit"};
	case "ACM_NAG_Soldier_TL": {_button ctrlSetText "Load Engineer Kit"; _button buttonSetAction "call fce_fnc_TLKit"};
	case "ACM_NAG_Soldier_Officer": {_button ctrlSetText "Load Officer Kit"; _button buttonSetAction "call fce_fnc_OfficerKit"};
	case "ACM_NAG_Soldier_AR": {_button ctrlSetText "Load Automatic Rifleman Kit"; _button buttonSetAction "call fce_fnc_MachinegunnerKit"};
	default { };
};