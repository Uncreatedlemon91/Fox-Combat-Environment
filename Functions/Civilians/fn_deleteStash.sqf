// Deletes Stash within town when it is destroyed by explosives or other items. 
params ["_stashID", "_stash", "_city"];

// Define the database used 
_db = ["new", format ["Insurgent Stashes %1 %2", missionName, worldName]] call oo_inidbi;

// Delete the object in the 3D world 
deleteVehicle _stash;

// Delete the object from Database 
["deleteKey", [_city, _stashID]] call _db;

// Notify all players that a Cache has been destroyed
[format ["A Cache has been discovered and destroyed in %1!", _city]] remoteExec ["TitleText", -2];
