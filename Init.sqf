// Server based modules
if (isServer) then {
	// AI Module 
	[] execVM "AI\PopulateForces.sqf";
};
// Player based modules
if ((!isServer) OR (isServer && hasInterface)) then {
	// Player persistence Module
	[] execVM "Persistence\PlayerPersistence.sqf";
};