/*
Creates the enemy locations and situational items on the chosen map. 
*/ 
// Variables to apply. 
_faction = "ACM_O_HDF";


// find enemy strategic locations + log them into database
_TerrainLocs = [["RockArea", "Hill"], 1] call fce_fnc_getStratLoc;
_TownLocs = [["Name", "NameCity", "NameVillage"], 1] call fce_fnc_getStratLoc;

_regdb = ["new", format ["Regiments - %1 %2", missionName, worldName]] call oo_inidbi;
_regdbExists = "exists" call _regdb;
if !(_regdbExists) then {
	systemChat "NEW DATA";
	_regCount = round (random [20, 25, 30]);
	_regiments = [];
	for "_i" from 1 to _regCount do {
		_regiment = [_faction] call fce_fnc_setReg;
		_regiments pushback _regiment;
	};

	// Virtualize regiments
	{
		[_x] call fce_fnc_virtReg;
	} forEach _regiments;
} else {
	_regSections = "getSections" call _regdb;
	{
		[_x] call fce_fnc_virtReg;
	} forEach _regSections;
};


while {true} do {
	_start = [] call BIS_fnc_randomPos;
	_stop = [] call BIS_fnc_randomPos;
	_plane = selectRandom ["ACM_v_VTOL_01_Mas_Infantry", "ACM_V_Plane_su25", "ACM_V_Plane_Gripen"];
	[_start, _stop, round(random [10, 40, 100]), "FULL", _plane] call BIS_fnc_ambientFlyby;
	sleep 180;
};