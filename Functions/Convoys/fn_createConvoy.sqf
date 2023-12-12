// Creates a convoy for the faction and sets place, type and deployment rules 
params ["_side"];

// Set spawn area 
_spawnPosSel = "";
_spawnSide = "";
switch (_side) do {
	case "B": {_spawnPosSel = selectRandom ["B_INS", "B_INS_1", "B_INS_2", "B_INS_3", "B_INS_4"]; _spawnSide = WEST};
	case "O": {_spawnPosSel = selectRandom ["O_INS", "O_INS_1", "O_INS_2", "O_INS_3", "O_INS_4"]; _spawnSide = EAST};
};
_spawnPos = getMarkerPos _spawnPosSel;

// Set destination location 
_base = getMarkerPos "BASE";
_locs = nearestLocations [_base, ["Name", "NameCity", "NameLocal", "NameVillage", "Strategic", "Flag", "Hill", "VegetationBroadleaf", "VegetationFir", "VegetationPalm", "VegetationVineyard"], worldSize * 4];
_locSel = selectRandom _locs;
_destPos = [_locSel, 0, 300, 10, 0, 10, 0, ["BASE"]] call BIS_fnc_findSafePos;

// Set type of asset to bring into the field 
_assetType = selectRandom ["Artillery", "AntiAir"];
_dbName = format ["%1 %2 Installations", _side, _assetType];
_asset = "";
switch (_assetType) do {
	case "B Artillery Installations": {_asset = selectRandom fox_blu_Arty};
	case "B AntiAir Installations": {_asset = selectRandom fox_blu_AA};
	case "O Artillery Installations": {_asset = selectRandom fox_opf_Arty};
	case "O AntiAir Installations": {_asset = selectRandom fox_opf_AA};
	default { };
};

// Set transport representation 
_transport = "";
switch (_side) do {
	case "B": {_transport = selectRandom fox_blu_supply};
	case "O": {_transport = selectRandom fox_opf_supply};
};

// Spawn transport and wait until the convoy arrives
_truck = [_spawnPos, random 360, _transport, _spawnSide] call BIS_fnc_spawnVehicle;
_driver = _truck select 1;
_driver moveTo _destPos;
_distance = _driver distance2D _destPos;
systemchat "[CONVOY] En Route!";
waitUntil {_distance < 5};
systemchat "[CONVOY] Arrived!";
// Setup asset and provide direction 
_assetSpawned = [_destPos, random 360, _asset, _spawnSide] call BIS_fnc_spawnVehicle;
switch (_assetType) do {
	case "Artillery": {[_assetSpawned select 2] call lambs_wp_fnc_taskArtilleryRegister};
	case "AntiAir": {[_assetSpawned select 2, _destPos] call BIS_fnc_taskDefend};
};

// Save asset to the database
_db = ["new", _dbName] call oo_inidbi;
["write", [netId (_assetSpawned select 1), "Position", _destPos]] call _db;
["write", [netId (_assetSpawned select 1), "Type", _asseType]] call _db;