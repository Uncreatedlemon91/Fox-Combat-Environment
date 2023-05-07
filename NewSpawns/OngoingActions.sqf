while {true} do {
	sleep 30;
	_tasking = selectRandom ["Supply"];
	
	switch (_tasking) do {
		case "Supply": {[] call fce_fnc_resupply};
		default { };
	};
};