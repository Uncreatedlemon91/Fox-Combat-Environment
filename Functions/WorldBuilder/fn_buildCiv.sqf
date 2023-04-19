/*
Build a civilian identity in the database. 
*/  
params ["_pos", "_loyalty", "_town"];

_civ = "getText (_x >> 'Faction') == 'CIV_F' && getText (_x >> 'vehicleClass') == 'Men'" configClasses (configFile >> "CfgVehicles");
_civ = configName _civ;

_grp = createGroup Civilian;
_civ = _grp createUnit [_civ, _pos, [], 300, "Form"];

// Get info from unit 
_name = name _civ;
_face = face _civ;
_loadout = getUnitLoadout _civ;
_pos = getPosASL _civ;

_positiveOrNegativeRel = selectRandom [1, 2];
if (_positiveOrNegativeRel == 1) then {
	_loyalty = _loyalty + round (random 50);
} else {
	_loyalty = _loyalty - round (random 50);
};

deleteVehicle _civ;

// Write data to database 
_db = ["new", format ["Towns - %1 %2 %3", _town, missionName, worldName]] call oo_inidbi;
["write", [_name, "Name", _name]] call _db;
["write", [_name, "Position", _pos]] call _db;
["write", [_name, "Loyalty", _loyalty]] call _db;
["write", [_name, "Gear", _loadout]] call _db;
