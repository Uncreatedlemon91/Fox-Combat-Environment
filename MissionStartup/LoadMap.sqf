/*
Creates the enemy locations and situational items on the chosen map. 
*/ 
// Variables to apply. 
_faction = "";


// find enemy strategic locations + log them into database
_TerrainLocs = [["RockArea", "Hill"], 1] call fnc_fce_getStratLoc;
_TownLocs = [["Name", "NameCity", "NameVillage"], 1] call fnc_fce_getStratLoc;

// Setup enemy regiment hq's.
_regiments = [_faction] call fnc_fce_setReg;