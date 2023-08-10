// Manages the convoy functions 
while {true} do {
	if (playersNumber west > 0) then {
		systemChat "Running Convoy!";
		_deployClass = "";
		_deployPoint = [["AO"], ["base", "water"]] call BIS_fnc_randomPos;
		_deployPoint = [_deployPoint, 0, 200, 7, 0, 10, 0, ["base"]] call BIS_fnc_findSafePos;
		_deployType = selectRandom ["OPFOR AA Sites", "Opfor Artillery", "OPFOR Helipad", "OPFOR Snipers"];

		switch (_deployType) do {
			case "OPFOR AA Sites": {_deployClass = selectRandom ["O_A_Static_AA_F", "O_T_APC_Tracked_02_AA_ghex_F"]};
			case "Opfor Artillery": {_deployClass = selectRandom ["O_A_Mortar_01_F", "O_T_MBT_02_arty_ghex_F", "O_T_Truck_02_MRL_F"]};
		};

		[_deployClass, _deployPoint, _deployType] remoteExec ["fce_fnc_createConvoy", 2];

		sleep random [600, 1200, 1800];
	};
};