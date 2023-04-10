params ["_client"];
_db = ["new", format ["%1 on %2", missionName, worldName]] call oo_inidbi;
_funds = ["read", ["Mission Logistics", "Funds"]] call _db;
