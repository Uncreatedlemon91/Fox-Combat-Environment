// Defines the factions used in the mission file 
_opforTypes = ["opfAA", "opfAPC", "opfArmor", "opfArty", "opfCars", "opfDrone", "opfHelos", "opfInf", "opfJets", "opfRecon", "opfSupplyTrucks", "opfTurrets"];
_Odb = ["new", format ["OPFOR Compositions %1 %2", missionName, worldName]] call oo_inidbi;

{
	_units = (getmissionlayerEntities _x) select 0;
	_type = _x;
	_definedUnit = [];
	{
		_class = typeOf _x;
		_definedUnit pushback _class		
	} forEach _units;
	["write",[_x, "Classes", _definedUnit]] call _Odb;
} forEach _types;


_civTypes = ["civPed"];
_Cdb = ["new", format ["Civilian Compositions %1 %2", missionName, worldName]] call oo_inidbi;
{
	_units = (getMissionLayerEntities _x) select 0;
	_type = _x;
	_definedUnit = [];
	{
		_class = typeOf _x;
		_definedUnit pushback _class;		
	} forEach _units;	
	["write", [_x, "Classes", _definedUnit]] call _Cdb;
} forEach _civTypes;