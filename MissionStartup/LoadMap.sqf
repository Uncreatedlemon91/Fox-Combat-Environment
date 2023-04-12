/*
Creates the enemy locations and situational items on the chosen map. 
*/ 

// find enemy strategic locations 
_locs = [["Name", "NameCity", "NameVillage", "RockArea", "Hill"], 1] call fnc_fce_getStratLoc;

// Set time speed in world 
setTimeMultiplier 9;

// Disable channels for Voice and Chat.
_channels = [0, 1, 2, 3, 4];
{
	// Current result is saved in variable _x
	_x enableChannel [false, false];
} forEach _channels;

