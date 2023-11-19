// Sets up a city for the first time, establishes loyalty, population, stashes etc 
params ["_city"];

// Setup core variables for city 
_cityPos = position _city;
_cityName = text _city;

// Setup population of the city 
_houses = nearestObjects [_cityPos, ["house"], 200];
_housesCount = count _houses;
_cityPopulation = 0;
if (_housesCount == 0) then {
	_cityPopulation = 2;
} else {
	_cityPopulation = round (_housesCount / 3);
};

// Setup city loyalty 
_cityHostility = round (random 100);

// Setup insurgent Stashes 
_cityStashes = round (random 8);
for "_i" from 1 to _cityStashes do {
	[_city] remoteExec ["fce_fnc_createStash", 2];
	sleep 0.3;
};
// Setup amount of vehicles 
_cityVehicles = round (_cityPopulation / 3);

// Save Variables to the database 
_db = ["new", format ["City Profiles %1 %2", missionName, worldName]] call oo_inidbi;
["write", [text _city, "City Name", _cityName]] call _db;
["write", [text _city, "City Position", _cityPos]] call _db;
["write", [text _city, "City Homes", _housesCount]] call _db;
["write", [text _city, "City Population", _cityPopulation]] call _db;
["write", [text _city, "City Hostility", _cityHostility]] call _db;
["write", [text _city, "City Vehicles", _cityVehicles]] call _db;
["write", [text _city, "Stashes", _cityStashes]] call _db;

// Sleep to give time for processing 
sleep 2;

// Build civilian population for town 
for "_i" from 1 to _cityPopulation do {
	[_city] remoteExec ["fce_fnc_createCivilian", 2];
	sleep 1;
};