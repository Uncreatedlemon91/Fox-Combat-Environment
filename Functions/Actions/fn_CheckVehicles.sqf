params ["_unit", "_role", "_veh"];

// Get player data information 
_db = ["new", format ["Player Profiles %1 %2", missionName, worldName]] call oo_inidbi;
_uid = getPlayerUID _unit;
_curRole = ["read", [_uid, "CurrentRole"]] call _db;

// Define vehicle 
if (_veh isKindOf "Tank") then {
	_whitelistedRoles = ["fox_crewLeader", "fox_crew"];
};

if (_veh isKindOf "Air") then {
	_whitelistedRoles = ["fox_hPilot", "fox_hCrew"];
};