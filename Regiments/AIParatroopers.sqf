params ["_caller"];
// Create Plane 
_tgtPos = getPos _caller;
_planeClass = selectRandom ["O_T_Plane_Transport_01_infantry_ghex_F", "O_T_VTOL_02_infantry_dynamicLoadout_F"];
_spawnPos = [["OffMap"], ["AO"]] call BIS_fnc_randomPos;
_jetV = createVehicle [_planeClass, _spawnPos, [], 0, "Fly"];
_jetG = createVehicleCrew _jetV;

_jetG deleteGroupWhenEmpty true;

// Set waypoints for plane
_jetG move _tgtPos;
_jetV flyInHeight random [100, 200, 300];

_dist = _jetV distance2D _tgtPos;
waitUntil {_dist < 10};

systemChat "Spawning Paratroopers!";
// Add passengers
_smoke = "SmokeShellRed" createVehicle _tgtPos;
_inf = [
	"O_T_Spotter_F",
	"O_T_Sniper_F",
	"O_T_Recon_TL_F",
	"O_T_Recon_M_F",
	"O_T_Recon_Medic_F",
	"O_T_Recon_F",
	"O_T_Recon_LAT_F",
	"O_T_Recon_JTAC_F",
	"O_T_Recon_Exp_F",
	"O_T_Pathfinder_F"
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