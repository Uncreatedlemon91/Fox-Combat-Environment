params ["_unit", "_groupID", "_regimentName", "_regimentSide"];
_db = ["new", format ["%1 Regiments - %2 %3", _regimentSide, missionName, worldName]] call oo_inidbi;

_unit setVariable ["Regiment", _regimentName];
_unit setVariable ["Group", _groupID];
_unit addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[_unit, ["Check Sleeves", 
	{params ["_target", "_caller", "_actionId", "_arguments"];_regiment = _target getVariable "Regiment"; systemChat format ["You notice the emblem of the %1 on the soldier's sleeve", _regiment]}, 
	nil, 
	1.5, 
	true, 
	true, 
	"", 
	"true", 
	5, 
	false, 
	"", 
	""]] remoteExec ["Addaction", 0, true];
}];

