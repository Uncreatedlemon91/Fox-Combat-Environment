params ["_veh"];
// Add event Handler to vehicle and save to database 
_veh addEventHandler ["ContainerClosed", {
	params ["_container", "_unit"];
	[_container] remoteExec ["fce_fnc_SaveVehicle", 2];
}];

_veh addEventHandler ["Engine", {
	params ["_vehicle", "_engineState"];
	[_vehicle] remoteExec ["fce_fnc_saveVehicle", 2];
}];

_veh addEventHandler ["Fuel", {
	params ["_vehicle", "_hasFuel"];
	[_vehicle] remoteExec ["fce_fnc_saveVehicle", 2];
}];

_veh addEventHandler ["GetIn", {
	params ["_vehicle", "_role", "_unit", "_turret"];
	[_vehicle] remoteExec ["fce_fnc_saveVehicle", 2];
}];

_veh addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret"];
	[_vehicle] remoteExec ["fce_fnc_saveVehicle", 2];
}];

_veh addEventHandler ["HandleDamage", {
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit"];
	[_unit] remoteExec ["fce_fnc_saveVehicle", 2];
	_dmg = damage _unit;
	_totalDmg = _dmg + _damage;
	if (_totalDmg >= 0.8) then {
		_unit setDamage 0.9;
		_unit allowDamage false;
	} else {
		_unit allowDamage true;
	};
}];

_veh addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[_unit] remoteExec ["fce_fnc_saveVehicle", 2];
}];

_veh addEventHandler ["LandedTouchDown", {
	params ["_plane", "_airportID", "_airportObject"];
	[_plane] remoteExec ["fce_fnc_saveVehicle", 2];
}];

_veh addEventHandler ["SeatSwitched", {
	params ["_vehicle", "_unit1", "_unit2"];
	[_vehicle] remoteExec ["fce_fnc_saveVehicle", 2];
}];