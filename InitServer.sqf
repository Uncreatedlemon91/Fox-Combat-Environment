// Create Master Database for Mission File 
_db = ["new", format ["%1 on %2", missionName, worldName]] call oo_inidbi;
_exists = "exists" call _db;

// Create Server Event Handlers 
[] execVM "ServerEH.sqf";


if (_exists) then {
	// Database already exists, load information if needed.
	_opfor = ["read", ["Mission Factions", "OPFOR"]] call _db;
	_blufor = ["read", ["Mission Factions", "BLUFOR"]] call _db;
	_logiFunds = ["read", ["Mission Logistics", "Funds"]] call _db;

} else {
	// Database does not exist, create initial information.
	_blufor = selectRandom ["ACM_B_NAG"];
	_opfor = selectRandom ["ACM_O_SEV"];
	_funds = round (random [40, 80, 120]);

	["write", ["Mission Factions", "OPFOR", _opfor]] call _db;
	["write", ["Mission Factions", "BLUFOR", _blufor]] call _db;
	["write", ["Mission Logistics", "Funds", _funds]] call _db;
	
};

// Run modules.
[] execVM "Enemy\Regiments.sqf";				// Create Regiments on the map.
[] execVM "Logistics\Init.sqf";					// Start Logistics Module
[] execVM "Player\PlayerPersistence.sqf";		// Start Player Persistence
