// Creates a town on the database 
params ["_loc"];

_pos = position _loc;
_name = str _loc;
_houses = nearObjects ["House", 300];
_population = count _houses / 3;
_relationship = round (random 100);
_caches = round (random 4);

_trg = createTrigger ["emptyDetector", _pos];
// Set trigger variables 
_trg setVariable ["Fox_Towns_Name", _name];
_trg setVariable ["Fox_Towns_Pop", _population];
_trg setVariable ["Fox_Towns_Rel", _relationship];

_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trg setTriggerArea [800, 800, 0, false, 80];
_trg setTriggerStatements [
	"this",
	"[thisTrigger] call fce_fnc_spawnTown",
	""
];
