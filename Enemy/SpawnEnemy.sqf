// Spawn ai group from params passed by Trigger. 
params ["_data"];

// Extract data from passed argument 
_regiment = _data select 0;
_rank = _data select 1;
_pos = _data select 2;
_class = _data select 3;
_mkrType = _data select 4;
_faction = _data select 5;

format ["%1 Spawned at %2 Difficulty for %3!", _class, _rank, _regiment] remoteExec ["systemChat", 0];

switch (_mkrType) do {
	case "O_INF": {
		_grp = [_pos, east, (configFile >> "CfgGroups" >> "East" >> _faction >> "Infantry" >> _class)] call BIS_fnc_spawnGroup;

		{
			// Current result is saved in variable _x
			zeusCam addCuratorEditableObjects [_x, true];
		} forEach units _grp;

		_task = selectRandom ["Camp", "Patrol", "Hunt"];
		switch (_task) do {
			case "Camp": {[_grp, _pos, 50] call lambs_wp_fnc_taskCamp;};
			case "Patrol": {[_grp, _pos, 500] call lambs_wp_fnc_taskPatrol;};
			case "Hunt": {[_grp, 500] spawn lambs_wp_fnc_taskHunt;};
		};
	};
	
	case "O_MOTOR_INF": {
		_grp = [_pos, east, (configFile >> "CfgGroups" >> "East" >> _faction >> "Motorized" >> _class)] call BIS_fnc_spawnGroup;

		_task = selectRandom ["Camp", "Patrol", "Hunt"];
		switch (_task) do {
			case "Camp": {[_grp, _pos, 50] call lambs_wp_fnc_taskCamp;};
			case "Patrol": {[_grp, _pos, 500] call lambs_wp_fnc_taskPatrol;};
			case "Hunt": {[_grp, 500] spawn lambs_wp_fnc_taskHunt;};
		};
	};

	case "O_MECH_INF": {
		_grp = [_pos, east, (configFile >> "CfgGroups" >> "East" >> _faction >> "Mechanized" >> _class)] call BIS_fnc_spawnGroup;

		_task = selectRandom ["Camp", "Patrol", "Hunt"];
		switch (_task) do {
			case "Camp": {[_grp, _pos, 50] call lambs_wp_fnc_taskCamp;};
			case "Patrol": {[_grp, _pos, 500] call lambs_wp_fnc_taskPatrol;};
			case "Hunt": {[_grp, 500] spawn lambs_wp_fnc_taskHunt;};
		};	
	};

	case "O_RECON": {
		_grp = [_pos, east, (configFile >> "CfgGroups" >> "East" >> _faction >> "SpecOps" >> _class)] call BIS_fnc_spawnGroup;

		_task = selectRandom ["Camp", "Patrol", "Hunt"];
		switch (_task) do {
			case "Camp": {[_grp, _pos, 50] call lambs_wp_fnc_taskCamp;};
			case "Patrol": {[_grp, _pos, 500] call lambs_wp_fnc_taskPatrol;};
			case "Hunt": {[_grp, 500] spawn lambs_wp_fnc_taskHunt;};
		};	
	};

	case "O_ARMOR": {
		_grp = [_pos, east, (configFile >> "CfgGroups" >> "East" >> _faction >> "Armored" >> _class)] call BIS_fnc_spawnGroup;

		_task = selectRandom ["Camp", "Patrol", "Hunt"];
		switch (_task) do {
			case "Camp": {[_grp, _pos, 50] call lambs_wp_fnc_taskCamp;};
			case "Patrol": {[_grp, _pos, 500] call lambs_wp_fnc_taskPatrol;};
			case "Hunt": {[_grp, 500] spawn lambs_wp_fnc_taskHunt;};
		};		
	};
};
