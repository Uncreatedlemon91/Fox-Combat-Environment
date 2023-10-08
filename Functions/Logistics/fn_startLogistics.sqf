/*
Establish supplies of logistics at Laptop
*/
[] remoteExec ["fce_fnc_defineObjects", 0, true];

// Add action to the computer for players to use
[logiLapt, ["Open Logistics", {
	[] remoteExec ["fce_fnc_openLogiMenu", clientOwner];
}]]remoteExec ["addAction", 0, true];
