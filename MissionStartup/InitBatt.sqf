// Build up Battalion Size element 
_battAOSize = [5000, 5000];
_battMarkerType = "O_HQ";
_battMkrAlpha = 0.6;
_battMkrSize = 1;

_battNumber = round (random 300);
_battNumber = [_battNumber, "English"] call BIS_fnc_ordinalNumber;

_battType = selectRandom ["Infantry", "Ranger", "Light", "Armored", "Cavalry", "Support"];
_battName = format ["%1 %2 Battalion", _battNumber, _battType];

_battPos = [[], ["Base", "water"]] call BIS_fnc_randomPos;
_BattMkr = createMarker [_battName, _battPos];
_battMkr setMarkerSize _battMkrSize;
_battMkr setMarkerType _battMarkerType;
_battMkr setMarkerAlpha _battMkrAlpha;
_battMkr setMarkerText _battName;

_battMkr2 createMarker [format ["%1_2", _battName], _battPos];
_battMkr2 setMarkerShape "ELLIPSE";
_battMkr2 setMarkerBrush "DIAGGRID";
_battMkr2 setMarkerAlpha _battMkrAlpha;
_battMkr2 setMarkerSize _battAOSize;
_battMkr2 setMarkerColor "COLORRED";

_battSize = selectRandom [4, 5, 6];

_battDb = ["new", _battName] call oo_inidbi;
["write", ["Battalion HQ", "Name", _battName]] call _db;
["write", ["Battalion HQ", "Position", _battPos]] call _db;
["write", ["Battalion HQ", "Size", _battSize]] call _db;

// Build Company level assets. 
_CompanyNumber = 0;
for "_i" from 1 to _battsize do {
	_companyNumber = _companyNumber + 1;
	_companyNumber = [_companyNumber, "English"] call BIS_fnc_ordinalNumber;
	_companyName = format ["%1 Company, %2", _companyNumber, _battName];

	_companySize = selectRandom [3, 4, 5];
	_companyPos = [[_BattMkr2], ["Base", "water"]] call BIS_fnc_randomPos;
	_companyMkrSize = 0.8;
	_companyMkrType = "O_hq";
	_companyAO = [2000, 2000];
	_companyMkrAlpha = 0.7;

	_companyMkr = createMarker [_companyName, _companyPos];
	_companyMkr setMarkerSize _companyMkrSize;
	_companyMkr setMarkerType _companyMkrType;
	_companyMkr setMarkerText _companyName;
	
	_companyMkr2 createMarker [format ["%1_2", _companyName], _companyPos];
	_companyMkr2 setMarkerShape "ELLIPSE";
	_companyMkr2 setMarkerBrush "DIAGGRID";
	_companyMkr2 setMarkerAlpha _companyMkrAlpha;
	_companyMkr2 setMarkerSize _companyAO;
	_companyMkr2 setMarkerColor "COLORGREEN";

	["write", [format ["%1, %2", _companyName, _battName]], "Company Name", _companyName];
	["write", [format ["%1, %2", _companyName, _battName]], "Company Position", _companyPos];
	["write", [format ["%1, %2", _companyName, _battName]], "Company Size", _companySize];
	
	_pltNumber = 0;
	for "_i" from 1 to _companySize do {
		_pltNumber = _pltNumber + 1;
		_pltNumber =  [_pltNumber, "English"] call BIS_fnc_ordinalNumber;
		_pltSize = selectRandom [3,4,5];

		_pltName = format ["%1 , %2", _pltNumber, _companyName];
		_pltPos = [[_companyMkr2], ["Base", "water"]] call BIS_fnc_randomPos;

		_pltMarker = createMarker [_pltName, _pltPos];
		_pltMarker setMarkerType "O_SUPPORT";
		_pltMarker setMarkerText _pltName;
		_pltMarker setMarkerSize 0.6;

		_pltMarker2 = createMarker [format ["%1_2", _pltName], _pltPos];
		_pltMarker2 setMarkerShape "ELLIPSE";
		_pltMarker2 setMarkerSize = [1000, 1000];
		_pltMarker2 setMarkerBrush "DIAGGRID";
		_pltMarker2 setMarkerColor "COLORBLUE";
		_pltMakrer2 setMarkerAlpha 0.4;

		["write", [format ["%1, %2", _pltName, _CompanyName]], "Platoon Name", _pltName];
		["write", [format ["%1, %2", _pltName, _CompanyName]], "Platoon Position", _pltPos];
		["write", [format ["%1, %2", _pltName, _CompanyName]], "Platoon Size", _pltSize];

		_squads = ["Alpha", "Bravo", "Charlie", "Delta", "Echo"];
		_squadIndex = 0;
		for "_i" from 0 to _pltSize do {
			_squadName = _squads select _squadIndex;
			_squadPos = [[_pltMarker2], ["Base", "water"]] call BIS_fnc_randomPos;
			
			_squadMarker = createMarker [format ["%1 %2", _squadName, _pltName], _squadPos];
			_squadMarker setMarkerType selectRandomWeighted ["O_INF", 0.5, "O_RECON", 0.3, "O_MECH_INF", 0.2, "O_MOTOR_INF", 0.3, "O_ARMOR", 0.1];
			_squadMarker setMarkerSize 0.4;
		
		};
	};
}