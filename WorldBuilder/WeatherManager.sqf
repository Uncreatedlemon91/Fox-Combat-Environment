_db = ["new", format ["WorldBuilder %1 %2", missionName, worldName]] call oo_inidbi;
_exists = "Exists" call _db;
// Set world settings 
setTimeMultiplier 6;

if (_exists) then {
	_date = ["read", ["World Info", "Date"]] call _db;
	setDate _date;

	_fog = ["read", ["World Info", "Fog"]] call _db;
	0 setFog _fog;

	_rain = ["read", ["World Info", "Rain"]] call _db;
	0 setRain _rain;

	_humidity = ["read", ["World Info", "Humidity"]] call _db;
	setHumidity _humidity;

	_overcast = ["read", ["World Info", "Overcast"]] call _db;
	0 setOvercast _overcast; 

	_rainbow = ["read", ["World Info", "Rainbow"]] call _db;
	0 setRainbow _rainbow;

	_waves = ["read", ["World Info", "Waves"]] call _db;
	0 setWaves _waves;

	_gusts = ["read", ["World Info", "Gusts"]] call _db;
	0 setGusts _gusts;

	_windStr = ["read", ["World Info", "Wind Strength"]] call _db;
	0 setWindStr _windStr;

	_windDir = ["read", ["World Info", "Wind Direction"]] call _db;
	0 setWindDir _windDir;

	_lightning = ["read", ["World Info", "Lightning"]] call _db;
	0 setLightnings _lightning;
};


sleep 30;
while {true} do {
	
	["write", ["World Info", "Date", date]] call _db;
	["write", ["World Info", "Fog", fogParams]] call _db;
	["write", ["World Info", "Rain", rain]] call _db;
	["write", ["World Info", "Humidity", humidity]] call _db;
	["write", ["World Info", "Overcast", overcast]] call _db;
	["write", ["World Info", "Rainbow", rainbow]] call _db;
	["write", ["World Info", "Waves", waves]] call _db;
	["write", ["World Info", "Gusts", gusts]] call _db;
	["write", ["World Info", "Wind", wind]] call _db;
	["write", ["World Info", "Wind Strength", windStr]] call _db;
	["write", ["World Info", "Wind Direction", windDir]] call _db;
	["write", ["World Info", "Lightning", lightnings]] call _db;

	sleep 20;
};