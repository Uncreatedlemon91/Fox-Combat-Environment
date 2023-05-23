// Server based modules
if (isServer) then {

};
// Player based modules
if ((!isServer) OR (isServer && hasInterface)) then {
	// Player persistence 
	systemChat "Running Player stuff";
	[] execVM "Player\PlayerPersistence.sqf";
};