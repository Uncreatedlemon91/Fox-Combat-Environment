params ["_unit", "_groupID", "_regimentName", "_regimentSide", "_regimentRank"];
_db = ["new", format ["%1 Regiments - %2 %3", _regimentSide, missionName, worldName]] call oo_inidbi;

// Add variables to AI 
_unit setVariable ["Regiment", _regimentName, true];
_unit setVariable ["Group", _groupID, true];

// Change difficulty of AI
_unit setRank _regimentRank;

// add event handlers
_unit addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[
		_unit, ["Check Sleeves", 
		{params ["_target", "_caller", "_actionId", "_arguments"]; _regiment = _target getVariable "Regiment"; systemChat format ["You notice the emblem of the %1 on the soldier's sleeve", _regiment]}, 
		nil, 
		1.5, 
		true, 
		true, 
		"", 
		"true", 
		5, 
		false, 
		"", 
		""
	]] remoteExec ["Addaction", 0, true];
}];

_unit addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeBackpack _unit;
}];
