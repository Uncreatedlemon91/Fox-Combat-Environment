/* 
Spawn AI Group when player enters area 
*/ 
params ["_grp", "_regiment"];

// Get data from database 
_db = ["new", format ["Regiment - %1", _regiment]] call oo_inidbi;
