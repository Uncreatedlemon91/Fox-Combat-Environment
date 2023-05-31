lawnMower addEventHandler ["Engine", {
	params ["_vehicle", "_engineState"];
	_count = [];
	while {true} do {
		if (_engineState) then {
			_cutter = createVehicle ["ClutterCutter_small_EP1", getPos _vehicle, [], 0, "CAN_COLLIDE"];
			_cutter enableSimulation false;
			_count pushback _cutter;
			if (count _count > 30) then {
				deleteVehicle (_count select 0);
			};
		};
		sleep 1;
	};
}];
