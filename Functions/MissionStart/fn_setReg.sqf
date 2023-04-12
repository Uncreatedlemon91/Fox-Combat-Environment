/*
Build enemy regiment system. 
*/ 

_regimentName = format ["%1 %2 Regiment", round (random 300), selectRandom ["Infantry", "Mechanized", "Reconaissance"]];
_regimentSize = round (random [20, 40, 50]);
_regimentType = selectRandom ["O_INF", "O_MECH_INF", "O_RECON", "O_MOT_INF"];
_regimentRank = selectRandom ["PRIVATE", "CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL"];
_regimentRadius = round (random [1000, 1500, 3000]);
_regimentSupply = round (random 300);
_regimentPosition = [["AO"], ["BASE", "water"]] call BIS_fnc_randomPos;
_regimentFaction = _faction;

// Build enemy commander 
/* 
- Spawn an enemy officer
- Get their loadout.
- Get their identity - face, voice, looks. 
- Assign a random rank for difficulty setting. 
- Save that information to the database. 
- Set their rank to the regiment. 
*/

// Save data to the database 
_db = ["new", format ["Regiments - %1 %2", missionName, worldName]] call oo_inidbi;
["write", [_regimentName, "Name", _regimentName]] call _db;
["write", [_regimentName, "Size", _regimentSize]] call _db;
["write", [_regimentName, "Type", _regimentType]] call _db;
["write", [_regimentName, "Rank", _regimentRank]] call _db;
["write", [_regimentName, "Radius", _regimentRadius]] call _db;
["write", [_regimentName, "Supplies", _regimentSupply]] call _db;
["write", [_regimentName, "Position", _regimentPosition]] call _db;
["write", [_regimentName, "Faction", _regimentFaction]] call _db;

_regimentName;