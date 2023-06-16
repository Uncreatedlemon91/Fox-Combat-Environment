params ["_caller"];

_tgtPos = getPos _caller;
_planeClass = selectRandom ["ACM_O_SEV_C47"];
_spawnPos = [["OffMap"], ["AO"]] call BIS_fnc_randomPos;
_jetV = createVehicle [_planeClass, _spawnPos, [], 0, "Fly"];
_jetG = createVehicleCrew _jetV;

_jetG deleteGroupWhenEmpty true;

_jetG move _tgtPos; 
_dist = 500;
while {_dist > 400} do {
	_dist = _jetV distance _tgtPos;
	sleep 4;
};

_smoke = "SmokeShellRed" createVehicle _tgtPos;
_dist = 500;
while {_dist > 100} do {
	_dist = _jetV distance _tgtPos;
	sleep 4;
};

_jetG setCombatMode "RED";
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
	_unit = _grp createUnit [selectRandom _inf, [0,0,0], [], 0, "form"];
	_unit moveInCargo _jetV;
	removeBackpack _unit;
	_unit addBackpack "ACE_NonSteerableParachute";
	moveOut _unit;
	_chem = "ACE_Chemlight_HiRed" createVehicle [0,0,0];
	_chem attachTo [_unit, [0,0,0.05]];
};
[_grp, 800] spawn lambs_wp_fnc_taskRush;
sleep random [100, 200, 300];

_jetV move _spawnPos;
_dist = 500;

while {_dist > 100} do {
	_dist = _jetV distance _spawnPos;
	sleep 4;
};

deleteVehicleCrew _jetV;
deleteVehicle _jetV;