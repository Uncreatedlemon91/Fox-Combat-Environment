/* 
Spawn AI Group when player enters area 
*/ 
params ["_grp", "_regiment"];

// Get data from database 
_db = ["new", _regiment] call oo_inidbi;
