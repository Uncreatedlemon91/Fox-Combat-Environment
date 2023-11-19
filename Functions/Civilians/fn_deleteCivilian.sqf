// Deletes civilian from the DAtabase 
params ["_civ"];

// Define Database 
_db = ["new", format ["Civilian Database %1 %2", missionName, worldName]] call oo_inidbi;

// Remove Civ from Database 
_civID = _civ getVariable "fox_civ_id";
["deleteSection", _civID] call _db;

// Notify Players? Maybe remove this later on 
["A civilian has been killed!"] remoteExec ["systemChat", -2];
