// Sets an IED in an area near to the town the Civ lives in 
// Gets item from stash first. 
params ["_civ"];

// reference databases 
_stashdb = ["new", format ["Insurgent Stashes %1 %2", missionName, worldName]] call oo_inidbi;

// Find nearby weapon stash 
_civHome = _civ getVariable "fox_civ_hometown";
_nearStashes = ["read", [_civHome, "Stashes"]] call _stashDb;
_selStash = selectRandom _nearStashes;
_stashType = _selStash select 1;
_stashPos = _selStash select 0;

// Move civilian to the stash 
_civG = group _civ;
_civ doMove _stashPos;
_civG setCombatMode "CARELESS";

// Wait until Civ gets to stash 
_dist = _civ distance _stashPos;
waitUntil {_dist < 1};

sleep 2;

// Add IED to civ inventory 
_iedClass = selectRandom [
	"APERSBoundingMine",
	"APERSMine",
	"APERSTripMine",
	"ATMine",
	"rhs_mine_a200_bz",
	"rhs_mine_a200_dz35",
	"Claymore_F",
	"rhsusf_mine_m14",
	"rhsusf_mine_M19",
	"BombCluster_03_UXO1_F",
	"BombCluster_02_UXO1_F",
	"BombCluster_01_UXO1_F",
	"BombCluster_03_UXO4_F",
	"rhs_uxo_ptab25m_3",
	"KAT_Gas_TripWireMine"
];
_civ addItem _iedClass;

// Find position to place IED 
_road = _civ nearRoads 200;
_selRoad = selectRandom _road;
_selRoadPos = getPos _selRoad;

// Move civ to the chosen road area 
// _civ moveto _selRoadPos;
_civ doMove _selRoadPos;

// Wait until civ gets to road 
_dist = _civ distance _selRoadPos;
waitUntil {_dist < 2};

// Place IED and arm it 
// [_civ, "REPAIR_VEH_KNEEL", "ASIS"] call BIS_fnc_ambientAnim;
sleep 4;
_civ removeItem _iedClass;
_mine = createMine [_iedClass, position _civ, [], 2];

// Move civilian to safety 
_civ doMove position _civHome;

// Await new tasking 
sleep round (random 60);
[_civ] remoteExec ["fce_fnc_TaskManager", 2];