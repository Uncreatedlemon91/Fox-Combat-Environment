/*
Establish supplies of logistics at Laptop
*/
_db = ["new", format ["Logistics - %1 %2", missionName, worldName]] call oo_inidbi;

_logiSpawnables = (getmissionlayerEntities "LogiItems") select 0;
// Current result is saved in variable _x
{
	_class = typeOf _x;
	_nameV = _x getVariable "listName";
	if (isNil "_nameV") then {
		_nameV = gettext (configfile >> "CfgVehicles" >> _class >> "displayName")
	};
	
	_cargoItems = getItemCargo _x;	
	_cargoWeps = getWeaponCargo _x;
	_cargoBps = getBackpackCargo _x;
	_cargoMags = getMagazineCargo _x;

	_data = [_class, _nameV, _cargoItems, _cargoWeps, _cargoBps, _cargoMags];

	["write", [_nameV, "Data", _data]] call _db;
} forEach _logiSpawnables;

// Add action to the computer for players to use
[logiLapt, ["Open Logistics Menu", {
	[clientOwner] remoteExec ["fce_fnc_getLogiData", 2];
}]]remoteExec ["addAction", 0, true];