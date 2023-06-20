params [];

_Fox_Loadout_camera = "camera" camCreate [0, 0, 0];
_Fox_Loadout_camera camPrepareTarget soldierModel;
_Fox_Loadout_camera camCommitPrepared 0; // needed for relative position
_Fox_Loadout_camera camPrepareRelPos [0, 3, 1.5];
_Fox_Loadout_camera cameraEffect ["internal", "back"];
_Fox_Loadout_camera camCommitPrepared 0;

// Set animation for splash screen 
_anim = selectRandom ["STAND1", "STAND2", "WATCH", "GUARD", "KNEEL", "BRIEFING"];
[soldierModel, _anim, "ASIS"] call BIS_fnc_ambientAnim;

// Add the variable to player to call back later 
player setVariable ["Camera", _Fox_Loadout_camera];

// Open the hasInterface 
createDialog "NewLoadoutMenu";

// Populate Drop down box 
_dropDowndata = [
	"1st Platoon - The Infantry",
	"2nd Platoon - The Armor",
	"Artillery Battery",
	"317th Air Squadron", 
	"Engineering & Requisitions Detachment",
	"Medical Detachment"
];

{
	_added = lbAdd [2100, _x];
	lbSetData [2100, _added, _x];
} forEach _dropDowndata;