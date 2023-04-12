/*
Creates the enemy locations and situational items on the chosen map. 
*/ 
// Variables to apply. 
_faction = "";


// find enemy strategic locations + log them into database
_TerrainLocs = [["RockArea", "Hill"], 1] call fce_fnc_getStratLoc;
_TownLocs = [["Name", "NameCity", "NameVillage"], 1] call fce_fnc_getStratLoc;

// Setup enemy regiment hq's.
_regCount = round (random [20, 50, 70]);
_regiments = [];
for "_i" from 0 to _regCount do {
	_regiment = [_faction] call fce_fnc_setReg;
	_regiments pushBack _regiment;
};
// Virtualize regiments
{
	// Current result is saved in variable _x
	[_x] call fce_fnc_virtReg;
} forEach _regiments;