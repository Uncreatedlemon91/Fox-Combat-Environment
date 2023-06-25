params ["_caller"];
// Create Plane 
_tgtPos = getPos _caller;
_planeClass = selectRandom ["ACM_O_SEV_C47"];
_spawnPos = [["OffMap"], ["AO"]] call BIS_fnc_randomPos;
_jetV = createVehicle [_planeClass, _spawnPos, [], 0, "Fly"];
_jetG = createVehicleCrew _jetV;

_jetG deleteGroupWhenEmpty true;

// Set waypoints for plane
_jetG move _tgtPos;
_jetV flyInHeight random [40, 60, 100];

waitUntil {_dist = _jetV distance _tgtPos; _dist < 200};

systemChat "Spawning Paratroopers!";
// Add passengers
_smoke = "SmokeShellRed" createVehicle _tgtPos;
_inf = [
	"ACM_HDF_Soldier_Thermals",
	"ACM_HDF_Soldier_LiteAT",
	"ACM_HDF_Soldier",
	"ACM_HDF_Soldier_AT",
	"ACM_HDF_Soldier_GL",
	"ACM_HDF_Soldier_CLS",
	"ACM_HDF_Soldier_AA",
	"ACM_HDF_Soldier_LI",
	"ACM_HDF_Soldier_LI_Repair",
	"ACM_HDF_Soldier_LI_ATA",
	"ACM_HDF_Soldier_LI_Expl",
	"ACM_HDF_Soldier_LI_MR2",
	"ACM_HDF_Soldier_LI_MR",
	"ACM_HDF_Soldier_LI_CLS",
	"ACM_HDF_Soldier_LI_MG",
	"ACM_HDF_Soldier_MR",
	"ACM_HDF_Soldier_AR",
	"ACM_HDF_Soldier_TL"
];
_grp = createGroup east;
for "_i" from 1 to 15 do {
	_unit = _grp createUnit [selectRandom _inf, getPosATL _jetV, [], 0, "form"];
	_unit allowDamage false;
	removeBackpack _unit;
	_unit addBackpack "ACE_NonSteerableParachute";
	//_chem = "ACE_Chemlight_HiRed" createVehicle [0,0,0];
	//_chem attachTo [_unit, [0,0,0.05]];
	sleep 0.3;
	_unit allowDamage true;
};
[_grp, 400] spawn lambs_wp_fnc_taskRush;

_jetG move _spawnPos;

waitUntil {_dist = _jetV distance _spawnPos; _dist < 75};
deleteVehicleCrew _jetV;
deleteVehicle _jetV;