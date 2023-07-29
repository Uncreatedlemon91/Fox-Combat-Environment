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
_jetV flyInHeight random [100, 200, 300];

_dist = _jetV distance2D _tgtPos;
waitUntil {_dist < 50};

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
for "_i" from 1 to 12 do {
	_unit = selectRandom _inf;
	_unit = _grp createUnit [_unit, position _jetV, [], 0, "form"];
	_unit allowDamage false;
	removeBackpack _unit;
	_unit addBackpack "ACE_NonSteerableParachute";
	sleep 0.1;
	_unit allowDamage true;
};
[_grp, 400] spawn lambs_wp_fnc_taskRush;

_jetG move _spawnPos;

_dist = _jetV distance2D _spawnPos;
waitUntil {_dist < 300};

deleteVehicleCrew _jetV;
deleteVehicle _jetV;