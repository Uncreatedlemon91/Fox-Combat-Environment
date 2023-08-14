// Adds ACE Keys to the vehicle
params ["_veh"];
/*

_keyCount = 3;
// Put keys in the vehicle 
for "_i" from 1 to _keyCount do {
	[_veh, _veh, true] remoteExec ["ACE_VehicleLock_fnc_addKeyForVehicle", 2];
};

// Make sure the vehicle is unlocked 
_veh lock false;