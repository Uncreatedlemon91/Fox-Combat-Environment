// Setup actions to the ATC Laptops 
[atc_1,["Use ATC Laptop", {
	params ["_target", "_caller", "_actionId", "_arguments"];
	_loadout = _caller getVariable "roleLoadout";
	_caller setVariable ["Fox_ATC_Status", [_target, true]];
	execVM "Worldbuilder\ATC.sqf";
}]] remoteExec ["addAction", 0, true];

[atc_2,["Use ATC Laptop", {
	params ["_target", "_caller", "_actionId", "_arguments"];
	_loadout = _caller getVariable "roleLoadout";
	_caller setVariable ["Fox_ATC_Status", [_target, true]];
	execVM "Worldbuilder\ATC.sqf";
}]] remoteExec ["addAction", 0, true];