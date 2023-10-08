// Add action to the computer for players to use
[logiLapt, ["Whitelist Menu", {
	[clientOwner] remoteExec ["fce_fnc_LoadWlMenu", 2];
}]]remoteExec ["addAction", 0, true];