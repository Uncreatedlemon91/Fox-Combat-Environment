params ["_unit", "_groupID", "_side"];
_db = ["new", format ["%3 Platoons %1 %2", missionName, worldName, _side]] call oo_inidbi;

// Add variables to AI 
_unit setVariable ["Group", _groupID, true];

// add event handlers
_unit addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"]; 
	_grp = group _unit;
	_type = typeOf _unit;
	_countGrp = { alive _unit} count units _grp;

	// Record death of AI. Remove from Database
	_db = ["new", format ["%3 Platoons %1 %2", missionName, worldName, _side]] call oo_inidbi;
	_size = ["read", [_groupID, "Size"]] call _Db;
	_newSize = _size - 1;
	["write", [_groupID, "Size", _newSize]] call _Db;

	// Delete group if the count is too small
	if (_newSize == 0) then {
		["deleteSection", _groupID] call _db;
		deleteVehicle _trg;
		systemChat format ["Removed Unit %1 from Database", _groupID];
	};

	// Clean body after 
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeBackpack _unit;
}];