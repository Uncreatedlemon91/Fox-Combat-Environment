// Spawns a Civilian
params ["_trg"];
// systemChat "Civ Spawning";
// systemChat format ["%1", _civ];
_civID = _trg getVariable "fox_civ_data";

// Database loading 
_db = ["new", format ["Civilian Database %1 %2", missionName, worldName]] call oo_inidbi;
_name = ["read", [_civID, "Name"]] call _db;
_face = ["read", [_civID, "Face"]] call _db;
_homeTown = ["read", [_civID, "Home Town"]] call _db;
_loadout = ["read", [_civID, "Loadout"]] call _db;
_hostility = ["read", [_civID, "Hostility"]] call _db;
_pos = ["read", [_civID, "Position"]] call _db;
_languages = ["read", [_civID, "Languages"]] call _db;
_home = ["read", [_civID, "Home"]] call _db;
_status = ["read", [_civID, "Status"]] call _db;
_hostile = ["read", [_civID, "Hostile"]] call _db;

// Initialize civilian 
_civG = createGroup civilian;
_civ = _civG createUnit ["C_Man_1", _pos, [], 0, "CAN_COLLIDE"];
_civ setVariable ["fox_civ_hostility", _hostility, true];
_civ setVariable ["fox_civ_status", _status, true];
_civ setVariable ["fox_civ_home", _home, true];
_civ setVariable ["fox_civ_hostile", _hostile, true];
_civ setVariable ["fox_civ_languages", _languages, true];
_civ setVariable ["fox_civ_hometown", _hometown, true];
_civ setVariable ["fox_civ_id", _civID, true];

[_civ, _face, nil, nil, nil, _name, nil] call BIS_fnc_setIdentity;
// [_civ, _face] remoteExecCall ["setFace", 0, true];
[_civ, _loadout] remoteExecCall ["setUnitLoadout", 0, true];

// Add event handlers to Civilian AI 
_civ addEventHandler ["Hit", {
	params ["_unit", "_source", "_damage", "_instigator"];
}];

_civ addEventHandler ["killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
}]

sleep 3;
// Provide direction 
[_civ] remoteExec ["fce_fnc_taskManager", 2];
