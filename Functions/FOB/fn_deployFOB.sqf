// Deploys the FOB, deletes container item and replaces it with a square grid area that allows 
// players to put supplies inside and keep the base 'maintained'.
params ["_container"];

// Get the container location and details 
_pos = getPos _container;
_dir = getDir _container;

// Delete the Container 
deleteVehicle _container;

// Spawn helipad in it's place 
_fobArea = "PARACHUTE_TARGET" createVehicle _pos;

// Assign a random ID number 
_id = round (random 3000);

// Attach a name to the FOB 
_name1 = selectRandom ["OLIVE", "PARANORMAL", "UPSET", "UNIDENTIFIED", "LOOSE", "HOT", "WELLS", "MAD", "ANGRY", "JAZZED", "HOCUS", "SUSPICIOUS", "HUNGRY", "TIRED", "TRAUMATIC", "TOASTED"];
_name2 = selectRandom ["GARDEN", "ANVIL", "HAMMER", "BILLOW", "LEMON", "FOX", "FARGO", "LIGHTNING", "THUNDER", "ACTIVITY", "BEEEE", "POCUS", "FARM", "MORPHINE", "LOLLIPOP", "BEER-CAN"];
_name = format ["%1 %2", _name1, _name2];

// Add a marker to the area 
_mkr = createMarkerLocal [format ["%1 %2", _name, _id], _pos];
_mkr setMarkerTypeLocal "n_hq";
_mkr setMarkerText format ["FOB %1", _name];

// Add a respawn point to the map
[west, _pos, _name] call BIS_fnc_addRespawnPosition;

// Assign name and variables to the helipad
_supply = 5;
_nameID = format ["%1 %2", _name, _id];
_fobArea setVariable ["fox_fob_name", _name, true];
_fobArea setVariable ["fox_fob_id", _id, true];
_fobArea setVariable ["fox_fob_supply", _supply, true];
_fobArea setVariable ["fox_fob_mkr", _mkr, true];

// Save the FOB to the database 
_db = ["new", format ["FOBs %1 %2", missionName, worldName]] call oo_inidbi;
["write", [_nameID, "Name", _name]] call _db;
["write", [_nameID, "ID", _id]] call _db;
["write", [_nameID, "Position", _pos]] call _db;
["write", [_nameID, "Supply", _supply]] call _db;

// Add disable fob action to area 
[_fobArea, true] remoteExec ["fce_fnc_addFobAreaActions"]
