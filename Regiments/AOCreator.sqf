// Check if map world is saved already or not 
_worldDb = ["new", format ["Objectives %1-%2", missionName, worldName]] call oo_inidbi;
_exists = "exists" call _worldDb;
if (_exists) then {
	// Load Objectives onto map 
	[[1000, 1000]] remoteExec ["fce_fnc_loadObjectives", 2];

	// Load Regiments onto map 
	[] remoteExec ["fce_fnc_loadRegiments", 2];
} else {
	// Create objectives on map 
	systemChat "Generating Objective Areas...";
	[10, [1000, 1000]] remoteExec ["fce_fnc_Objectives", 2];

	// Create OPFOR 
	systemChat "Generating Enemy Forces...";
	[25, "o"] remoteExec ["fce_fnc_createRegiment", 2];

	// Create BLUFOR
	systemChat "Generating Friendly Forces...";
	[10, "b"] remoteExec ["fce_fnc_createRegiment", 2];
};

_Regdbb = ["new", format ["b Regiments - %1 %2", missionName, worldName]] call oo_inidbi;
_sectionsb = "getSections" call _Regdbb;
{
	[_x, "b"] remoteExec ["fce_fnc_aiLogic", 2];
} forEach _sectionsb;

_Regdbo = ["new", format ["o Regiments - %1 %2", missionName, worldName]] call oo_inidbi;
_sectionso = "getSections" call _Regdbo;
{
	[_x, "o"] remoteExec ["fce_fnc_aiLogic", 2];
} forEach _sectionso;