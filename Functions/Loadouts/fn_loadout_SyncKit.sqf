// Syncs the kit with the server and database 
params ["_loadout", "_unit", "_uid"];

// Initialize the database 
_db = ["new", format ["Fox Kits %1 %2", missionName, worldName]] call oo_inidbi;
_kit = ["read", [_loadout, "Loadout"]] call _db;
_unit setUnitLoadout _kit;
_unit setVariable ["fox_loadout_kit", _kit, true];

// Save current kit to the database 
_pdb = ["new", "Player Profiles"] call oo_inidbi;
["write", [_uid, "CurrentRole", _loadout]] call _pdb;
