// Build a civilian into the system.
params ["_city"];

// Name databases in use 
_cityDb = ["new", format ["City Profiles %1 %2", missionName, worldName]] call oo_inidbi;
_civDb = ["new", format ["Civilian Database %1 %2", missionName, worldName]] call oo_inidbi;

// Get base variables 
_cityPos = getPos _city;
_cityHostility = ["read", [text _city, "City Hostility"]] call _cityDb;

// Generate random civilian 
_toSpawn = selectRandom [
	"C_man_1",
	"C_man_p_beggar_F",
	"C_Man_casual_1_F",
	"C_Man_casual_2_F",
	"C_Man_casual_3_F",
	"C_Man_casual_4_v2_F",
	"C_Man_casual_6_v2_F",
	"C_Man_casual_5_v2_F",
	"C_Man_casual_7_F",
	"C_Man_casual_8_F",
	"C_Man_formal_2_F",
	"C_Man_formal_4_F",
	"C_Man_smart_casual_1_F",
	"C_Man_smart_casual_2_F",
	"C_man_sport_1_F",
	"C_man_sport_3_F",
	"C_Man_casual_4_F",
	"C_Man_casual_5_F",
	"C_Man_casual_6_F",
	"C_man_polo_1_F",
	"C_man_polo_2_F",
	"C_man_polo_3_F",
	"C_man_polo_4_F",
	"C_man_polo_5_F",
	"C_man_polo_6_F",
	"C_man_shorts_1_F",
	"C_man_1_1_F",
	"C_man_1_2_F",
	"C_man_1_3_F",
	"C_Man_Fisherman_01_F",
	"C_man_p_shorts_1_F",
	"C_man_p_fugitive_F"
];
_civG = createGroup civilian;
_civG deleteGroupWhenEmpty true;
_suborAdd = selectRandom [true, false];
_hostileVariance = round (random 20);
_spawnPos = [_cityPos, 0, 100, 2, 0, 20, 0, ["base"]] call BIS_fnc_findSafePos;
_civ = _civG createUnit [_toSpawn, _spawnPos, [], 0, "CAN_COLLIDE"];

// Build civilian data 
_civName = name _civ;
_civFace = face _civ;
_civLoadout = getUnitLoadout _civ;
_civHostility = 0;
if (_subOrAdd) then {
	_civHostility = _cityHostility - _hostileVariance;
} else {
	_civHostility = _cityHostility + _hostileVariance;
};
_homes = nearestObjects [_cityPos, ["house"], 200];
_civHome = selectRandom _homes;
_civHomePos = getPos _civHome;
_civLanguages = ["Local"];
_knowsInternational = selectRandomWeighted [true, 0.3, false, 0.7];
if (_knowsInternational) then {
	_civLanguages pushback "International";
};

// For testing only 
_mkr = createMarkerLocal [format ["%1 %2", text _city, _civName], _spawnPos];
_mkr setMarkerTypelocal "hd_dot";
_mkr setMarkerSizeLocal [0.3, 0.3];
_mkr setMarkerColorLocal "ColorYellow";

// Create Civilian entry 
["write", [format ["%1 - %2", text _city, _civName], "Name", _civName]] call _civDb;
["write", [format ["%1 - %2", text _city, _civName], "Face", _civFace]] call _civDb;
["write", [format ["%1 - %2", text _city, _civName], "Home Town", text _city]] call _civDb;
["write", [format ["%1 - %2", text _city, _civName], "Loadout", _civLoadout]] call _civDb;
["write", [format ["%1 - %2", text _city, _civName], "Hostility", _civHostility]] call _civDb;
["write", [format ["%1 - %2", text _city, _civName], "Position", _spawnPos]] call _civDb;
["write", [format ["%1 - %2", text _city, _civName], "Languages", _civLanguages]] call _civDb;
["write", [format ["%1 - %2", text _city, _civName], "Home", _civHomePos]] call _civDb;
["write", [format ["%1 - %2", text _city, _civName], "Status", "Idle"]] call _civDb;
["write", [format ["%1 - %2", text _city, _civName], "Hostile", false]] call _civDb;

// Create Trigger from civilian position location
_trg = createTrigger ["EmptyDetector", _spawnPos, true];

// Set Trigger variables 
_trg setVariable ["fox_civ_data", format ["%1 - %2", text _city, _civName], true];

// Configure Trigger
_trg setTriggerArea [200, 200, 0, false, 100];
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trg setTriggerStatements [
	"this",
	"[thisTrigger] remoteExec [""fce_fnc_spawnCiv"", 2];",
	""
];

// Delete civilian for performance reasons 
deleteVehicle _civ;