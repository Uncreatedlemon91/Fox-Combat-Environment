// Deletes the FOB when user uses ACE ACtion on it 
params ["_fob"];

// Get variables from FOB 
_fobName = _fob getVariable "fox_fob_name";
_fobID =  _fob getVariable "fox_fob_id";
_fobMkr = _fob getVariable "fox_fob_mkr";

// Delete the paracute marker 
deleteVehicle _fob;
deleteMarker _fobMkr;

// Delete entry in the FOB database 
_db = ["new", format ["FOBs %1 %2", missionName, worldName]] call oo_inidbi;
_id = format ["%1 %2", _fobName, _fobID];
["deleteSection", _id] call _db;