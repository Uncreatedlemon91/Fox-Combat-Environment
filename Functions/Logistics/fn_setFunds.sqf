params ["_client"];
_db = ["new", format ["%1 on %2", missionName, worldName]] call oo_inidbi;
_funds = ["write", ["Mission Logistics", "Funds", _client]] call _db;
