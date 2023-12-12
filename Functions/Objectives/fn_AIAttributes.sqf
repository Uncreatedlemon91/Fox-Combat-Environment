params ["_unit", "_groupID", "_side"];
_db = ["new", format ["%3 Platoons %1 %2", missionName, worldName, _side]] call oo_inidbi;

// Add variables to AI 
_unit setVariable ["Fox_Group_ID", _groupID, true];
_unit setVariable ["Fox_Group_Side", _side, true];

// add event handlers
_unit addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"]; 
	_grp = group _unit;
	_type = typeOf _unit;
	_groupID = _unit getVariable "Fox_Group_ID";
	_side = _unit getVariable "Fox_Group_Side";
	systemChat format ["DEBUG: Delete from GroupID - %1", _groupID];
	_countGrp = { alive _unit} count units _grp;

	// Record death of AI. Remove from Database
	_db = ["new", format ["%3 Platoons %1 %2", missionName, worldName, _side]] call oo_inidbi;
	_size = ["read", [_groupID, "Size"]] call _Db;
	_newSize = _size - 1;
	["write", [_groupID, "Size", _newSize]] call _Db;
	systemChat format ["Adjusted %1 from %2 to %3", _groupID, _size, _newSize];

	// Delete group if the count is too small
	if (_newSize <= 2) then {
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