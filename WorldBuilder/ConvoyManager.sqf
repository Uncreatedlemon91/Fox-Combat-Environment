// Manages the convoy functions 
while {true} do {
	_deployClass = "";
	_deployPoint = [] call BIS_fnc_randomPos;
	_deployType = selectRandom ["OPFOR AA Sites", "Opfor Artillery", "OPFOR Helipad", "OPFOR Snipers"];

	switch (_deployType) do {
		case "OPFOR AA Sites": {_deployClass = selectRandom []};
		case "Opfor Artillery": {_deployClass = selectRandom []};
		case "OPFOR Helipad": {_deployClass = selectRandom []};
		case "OPFOR Snipers": {_deployClass = selectRandom []};
	};

	[_deployClass, _deployPoint, _deployType] remoteExec ["fce_fnc_createConvoy", 2];

	sleep random [300, 600, 900];
};