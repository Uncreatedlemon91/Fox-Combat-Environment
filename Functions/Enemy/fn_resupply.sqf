// Sends a truck to resupply a grid location. 
_insertLoc = selectRandom ["e_ins_1", "e_ins_2", "e_ins_3", "e_ins_4"];
_insertPos = getMarkerPos _insertLoc;
_truck = "ACM_O_HDF_V3S_Covered";
_destination = [] call BIS_fnc_randomPos;

systemChat format ["%1", _insertLoc];

// Spawn truck and assign items 
_spawnVehicle = [_insertPos, 180, _truck, east] call BIS_fnc_spawnVehicle;
_veh = _spawnVehicle select 0;
_crew = _spawnVehicle select 1;
_grp = _spawnVehicle select 2;

_sizeOfReinforcement = round (random 10);
_trpGrp = createGroup east;

for "_i" from 1 to _sizeOfReinforcement do {
	_type = selectRandom [
		"ACM_HDF_Soldier_AA",
		"ACM_HDF_Soldier_AR",
		"ACM_HDF_Soldier_CLS",
		"ACM_HDF_Soldier_GL",
		"ACM_HDF_Soldier_MR",
		"ACM_HDF_Soldier_AT",
		"ACM_HDF_Soldier",
		"ACM_HDF_Soldier_LiteAT",
		"ACM_HDF_Soldier_Light",
		"ACM_HDF_Soldier_Thermals"
	];
	_unit = _trpGrp createUnit [_type, _insertPos, [], 40, "FORM"];
	_unit moveInCargo _veh;
};

systemChat format ["%1 Spawned!", _crew];

_veh limitSpeed 10;
_grp move _destination;

systemChat format ["%1 Moving!", _grp];

_mkr = createMarker [format ["Convoy%1_%2", _insertPos, _destination], _insertPos];
_mkr2 = createMarker [format ["Convoy%2_%1", _insertPos, _destination], _destination];

_mkr setMarkerType "mil_start";
_mkr2 setMarkerType "mil_join";

_mkr setMarkerColor "colorRed";
_mkr2 setMarkerColor "colorRed";

_mkr setMarkerAlpha 0;
_mkr2 setMarkerAlpha 1;

_dist = _veh distance _insertPos;
waitUntil { _dist < 10 };

_newGroup = [];
{
	// Current result is saved in variable _x
	_type = typeOf _x;
	_newGroup pushback _type;
	moveOut _x;
} forEach units _trpGrp;

_objs = [];
{
	// Current result is saved in variable _x
	_mkrType = markerShape _x;
	if (_mkrType == "RECTANGLE") then {
		_objs pushback _x;
	};
} forEach allMapMarkers;

_objective = [_objs, _insertPos] call BIS_fnc_nearestPosition;


_db = ["new", _objective] call oo_inidbi;
["write", [format ["Reinforcement %1", random 1000], _newGroup]] call _db;

_playerList = allPlayers apply {[_pos distance _x, _x]};
_playerList sort true;
_closestPlayer = (_playerList select 0) param [1, objNull];
_dist = _closestPlayer distance _insertPos;

if (_dist > 800) then {
	{
		// Current result is saved in variable _x
		deleteVehicle _x;
	} forEach units _trpGrp;
};

deleteVehicleCrew _crew;
deleteVehicle _veh;

deleteMarker _mkr;
deleteMarker _mkr2;

"Enemy Reinforcements Delivered!" remoteExec ["systemChat", 0];
