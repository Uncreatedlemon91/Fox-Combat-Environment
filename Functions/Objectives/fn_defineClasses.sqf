// Defines the factions used in the mission file 
_types = ["opfAA", "opfAPC", "opfArmor", "opfArty", "opfCars", "opfDrone", "opfHelos", "opfInf", "opfJets", "opfRecon", "opfSupplyTrucks", "opfTurrets"];
_db = ["new", format ["OPFOR Compositions %1 %2", missionName, worldName]] call oo_inidbi;

{
	_units = (getmissionlayerEntities _x) select 0;
	_type = _x;
	_definedUnit = [];
	{
		_class = typeOf _x;
		_definedUnit pushback _class		
	} forEach _units;
	["write",[_x, "Classes", _definedUnit]] call _db;
} forEach _types;
