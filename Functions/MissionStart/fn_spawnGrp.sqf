/* 
Spawn AI Group when player enters area 
*/ 
params ["_grp", "_regiment"];

// Get data from database 
_db = ["new", format ["Regiments - %1 %2", missionName, worldName]] call oo_inidbi;
