// Manages the convoy functions 
while {true} do {
	systemChat "Running Convoy!";
	_deployClass = "";
	_deployPoint = [["AO"], ["base", "water"]] call BIS_fnc_randomPos;
	_deployPoint = [_deployPoint, 0, 200, 7, 0, 10, 0, ["base"]] call BIS_fnc_findSafePos;
	_deployType = selectRandom ["OPFOR AA Sites", "Opfor Artillery", "OPFOR Helipad", "OPFOR Snipers"];

	switch (_deployType) do {
		case "OPFOR AA Sites": {_deployClass = selectRandom ["ACM_O_HDF_T_ZU23", "ACM_O_HDF_T_DSHKM_Mini", "ACM_O_HDF_T_DSHKM", "ACM_O_HDF_HILUX_IGLA"]};
		case "Opfor Artillery": {_deployClass = selectRandom ["ACM_O_HDF_BM21", "ACM_O_HDF_T_D30", "ACM_O_HDF_T_D30_AT", "ACM_O_HDF_T_Mortar", "ACM_O_HDF_T_SPG9"]};
		case "OPFOR Helipad": {_deployClass = selectRandom ["Land_HelipadCivil_F", "Land_HelipadCircle_F"]};
		case "OPFOR Snipers": {_deployClass = selectRandom ["Land_tent_east", "Land_TentA_F"]};
	};

	[_deployClass, _deployPoint, _deployType] remoteExec ["fce_fnc_createConvoy", 2];

	sleep random [300, 600, 900];
};