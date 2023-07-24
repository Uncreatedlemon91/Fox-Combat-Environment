params ["_control", "_lbCurSel", "_lbSelection"];

_det = lbText [1500, _lbCurSel];


switch (_det) do {
	// Add 1st Platoon roles
	case "Rifleman": {
		[fox_rifleman] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Ammo Carrier": {
		[fox_ammoCarrier] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Grenadier": {
		[fox_grenadier] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Machine Gunner": {
		[fox_mg] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Combat Life Saver": {
		[fox_cls] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Team Leader": {
		[fox_ftl] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Radio Operator": {
		[fox_rto] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "JTAC": {
		[fox_jtac] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Missile Specialist": {
		[fox_missileSpec] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Squad Leader": {
		[fox_sl] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Platoon Leader": {
		[fox_pl] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	// Add 2nd platoon roles 
	case "Crew Member": {
		[fox_crew] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Crew Leader": {
		[fox_crewLeader] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};

	// Add 317th Air Squadron Roles 
	case "Jet Pilot": {
		[fox_jPilot] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Helicopter Pilot": {
		[fox_hPilot] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Helicopter Crew": {
		[fox_hCrew] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};

	// Add Artillery 
	case "Battery Gunner": {
		[fox_battGunner] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Forward Observer": {
		[fox_battFO] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Battery Commander": {
		[fox_battCommander] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};

	// Add Medical 
	case "(MedDet) Combat Life Saver": {
		[fox_cls2] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Medical Technician": {
		[fox_medtech] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Surgeon": {
		[fox_surgeon] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};

	// Add S2 
	case "Scout Leader": {
		[fox_scoutLead] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Scout": {
		[fox_scout] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Scout Machinegunner": {
		[fox_scoutMg] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Scout Mule": {
		[fox_scoutMule] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Scout Sniper": {
		[fox_scoutSniper] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};

	// Add Engineer Roles 
	case "Quartermaster": {
		[fox_Quartermaster] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Air Traffic Controller": {
		[fox_ATC] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Combat Engineer": {
		[fox_cEngineer] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Explosive Ordinance Disposal": {
		[fox_EOD] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Ground Crew": {
		[fox_groundCrew] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Drone Operator": {
		[fox_droneOp] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	
};