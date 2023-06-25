params [];

Fox_Loadout_camera = "camera" camCreate [0, 0, 0];
Fox_Loadout_camera camPrepareTarget soldierModel;
Fox_Loadout_camera camCommitPrepared 0; // needed for relative position
Fox_Loadout_camera camPrepareRelPos [0, 3, 1.5];
Fox_Loadout_camera cameraEffect ["internal", "back"];
Fox_Loadout_camera camCommitPrepared 0;


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