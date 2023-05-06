lawnmower limitSpeed 15;
[lawnMower, ["Lower Blades", {
	removeAllActions lawnmower;
	_switch = "on";
	[lawnMower, ["Raise Blades", {_switch == "off"}]] remoteExec ["addAction", 0];
	while {_switch == "on"} do {
		_pos = getPos lawnmower;
		_cutter = createVehicle ["ClutterCutter_small_EP1", _pos, [], 0, "CAN_COLLIDE"];
		_cutter enableSimulationGlobal false;
		sleep 0.5;
	};
}]] remoteExec ["addAction", 0];
