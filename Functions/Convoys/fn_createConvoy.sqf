// Creates a convoy for the faction and sets place, type and deployment rules 
params ["_side"];

// Set spawn area 
_spawnPosSel = "";
_spawnSide = "";
switch (_side) do {
	case "B": {_spawnPosSel = selectRandom ["B_INS", "B_INS_1", "B_INS_2", "B_INS_3", "B_INS_4"]; _spawnSide = WEST};
	case "O": {_spawnPosSel = selectRandom ["INS_1", "INS_2", "INS_3", "INS_4", "INS_5"]; _spawnSide = EAST};
};
_spawnPos = getMarkerPos _spawnPosSel;

// Set destination location 
_base = getMarkerPos "BASE";
_locs = nearestLocations [_base, ["Name", "NameCity", "NameLocal", "NameVillage", "Strategic", "Flag", "Hill", "VegetationBroadleaf", "VegetationFir", "VegetationPalm", "VegetationVineyard"], worldSize * 4];
_locSel = selectRandom _locs;
_destPos = [position _locSel, 0, 300, 10, 0, 10, 0, ["BASE"]] call BIS_fnc_findSafePos;

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
_driver = _truck select 2;
_truckV = _truck select 0;
_driver move _destPos;

_mkr = createMarker [format ["Convoy %1", _destPos], _destPos];
_mkr setMarkerType "hd_flag";
_mkr setMarkerColor "COLORRED";

_distance = _truckV distance2D _destPos;
systemchat "[CONVOY] En Route!";

while {_distance > 20} do {
	_distance = _truckV distance2D _destPos;
	sleep 5;
};

systemchat "[CONVOY] Arrived!";
// Setup asset and provide direction 
_pos = getpos _truckV;
_assetSpawned = [_pos, random 360, _asset, _spawnSide] call BIS_fnc_spawnVehicle;
switch (_assetType) do {
	case "Artillery": {[_assetSpawned select 2] call lambs_wp_fnc_taskArtilleryRegister};
	case "AntiAir": {[_assetSpawned select 2, _pos] call BIS_fnc_taskDefend};
};

// Save asset to the database
_db = ["new", _dbName] call oo_inidbi;
_section = [_assetSpawned select 0] call BIS_fnc_netId;
["write", [_section, "Position", _pos]] call _db;
["write", [_section, "Type", _assetSpawned select 0]] call _db;

// Send the truck back 
_driver move _spawnPos;
_distance = _truckV distance2D _spawnPos;
while {_distance > 20} do {
	_distance = _truckV distance2D _spawnPos;
	sleep 5;
};