// Creates convoys and determines when new convoys are scheduled 
// Determine if enough players are on to enable convoys 
_playerCount = count allplayers;
_commit = random 100;
if ((_playerCount > 0) AND (_commit < 80)) then {
	// Determine the side that the convoy originates from 
	_side = selectRandom ["B", "O"];

	// Execute the convoy function 
	[_side] remoteExec ["fce_fnc_createConvoy", 2];

	// Server debug 
	systemChat "[CONVOY MANAGER] - New Convoy sent!";
};
