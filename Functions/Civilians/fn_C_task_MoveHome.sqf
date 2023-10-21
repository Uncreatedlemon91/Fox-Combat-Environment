// Civ will move to a random house in the town 
params ["_civ"];

// Define Variables 
_civG = group _civ;

// Update Status 
_civ setVariable ["fox_civ_status", "MoveHome", true];

// Get waypoint locations 
_startPoint = getPos _civ;
_homes = nearestObjects [_startPoint, ["house"], 200];
_civHome = selectRandom _homes;
_civHomePos = getPos _civHome;

// Move the civilian to that point 
_civ moveTo _civHomePos;
_civG setBehaviour "CARELESS";

waitUntil {moveToCompleted _civ};
[_civ, "REPAIR_VEH_KNEEL", "ASIS"] call BIS_fnc_ambientAnim;
sleep 10;

// Update status
_civ setVariable ["fox_civ_status", "Idle", true];

// Get new task
sleep round (random 60);
[_civ] remoteExec ["fce_fnc_TaskManager", 2];