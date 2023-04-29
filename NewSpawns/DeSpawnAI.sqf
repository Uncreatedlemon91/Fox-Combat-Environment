params ["_mkr"];
[_mkr] execVM "NewSpawns\CheckOwnership.sqf";
{
	// Current result is saved in variable _x
	_assignedMkr = _x getVariable "Mkr";
	if (_assignedMkr == _mkr) then {
		_veh = vehicle _x;
		deleteVehicle _veh;
		deleteVehicle _x;
	};
} forEach allUnits;