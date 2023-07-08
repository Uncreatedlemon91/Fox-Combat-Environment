// Setup actions to the ATC Laptops 
[atc_1, ["Use ATC Laptop", {
	params ["_target", "_caller", "_actionId", "_arguments"];
	_loadout = _caller getVariable "roleLoadout";
	if (_loadout == fox_atc) then {
		_caller setVariable ["Fox_ATC_Status", [_target, true]];
		execVM "Worldbuilder\ATC.sqf";
	} else {
		systemChat "You are not whitelisted for this role, contact S5 for assistance";
	};
}]] remoteExec ["addaction", 0, true];

[atc_2, ["Use ATC Laptop", {
	params ["_target", "_caller", "_actionId", "_arguments"];
	_loadout = _caller getVariable "roleLoadout";
	if (_loadout == fox_atc) then {
		_caller setVariable ["Fox_ATC_Status", [_target, true]];
		execVM "Worldbuilder\ATC.sqf";
	} else {
		systemChat "You are not whitelisted for this role, contact S5 for assistance";
	};
}]] remoteExec ["addaction", 0, true];