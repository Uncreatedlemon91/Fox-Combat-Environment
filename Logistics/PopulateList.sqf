/*
Establish supplies of logistics at Laptop
*/
_db = ["new", format ["Logistics - %1 %2", missionName, worldName]] call oo_inidbi;
_exists = "exists" call _db;
if (_exists) then {
	"delete" call _db;
};

_logiSpawnables = (getmissionlayerEntities "LogiItems") select 0;
{
	// Current result is saved in variable _x
	_class = typeOf _x;
	_nameV = _x getVariable "listName";
	if (isNil "_nameV") then {
		_nameV = gettext (configfile >> "CfgVehicles" >> _class >> "displayName")
	};
	
	_cargoItems = getItemCargo _x;	
	_cargoWeps = getWeaponCargo _x;
	_cargoBps = getBackpackCargo _x;
	_cargoMags = getMagazineCargo _x;

	["write", [_nameV, "Magazines", _cargoMags]] call _db;
	["write", [_nameV, "Title", _nameV]] call _db;
	["write", [_nameV, "Type", _class]] call _db;
	["write", [_nameV, "Items", _cargoItems]] call _db;
	["write", [_nameV, "Weapons", _cargoWeps]] call _db;
	["write", [_nameV, "Backpacks", _cargoBps]] call _db;
} forEach _logiSpawnables;


[logiLapt, ["Open Logistics Menu", {
	[clientOwner] remoteExec ["fce_fnc_getLogiData", 2];
}]]remoteExec ["addAction", 0, true];

refundTrg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
refundTrg setTriggerStatements [ "this", "{_veh = _x; {_veh deleteVehicleCrew _x} forEach crew _veh; deleteVehicle _veh} foreach (vehicles select {_x inArea thisTrigger});", ""];