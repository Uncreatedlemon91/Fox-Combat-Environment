systemChat "TASKING!";
while {true} do {
	
	_tasking = selectRandom ["Supply"];
	systemChat format ["%1", _tasking];

	
	switch (_tasking) do {
		case "Supply": {[] call fce_fnc_resupply};
		default { };
	};
	sleep 30;
};