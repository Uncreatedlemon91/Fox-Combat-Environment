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
		[fox_gren] call fce_fnc_moveCamera;
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
	case "RTO": {
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
	case "Crew": {
		[fox_crew] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Crew Leader": {
		[fox_crewLead] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};

	// Add 317th Air Squadron Roles 
	case "Jet Pilot": {
		[fox_jetPilot] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Helicopter Pilot": {
		[fox_helicopterPilot] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Helicopter Crew": {
		[fox_helicopterCrew] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};

	// Add Artillery 
	case "Gunner": {
		[fox_gunner] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Forward Observer": {
		[fox_fo] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};

	// Add Medical 
	case "(MedDet)Combat Life Saver": {
		[fox_cls2] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Medical Tech": {
		[fox_mt] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};

	// Add S2 
	case "Scout": {
		[fox_scout] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Scout Team Lead": {
		[fox_scoutTL] call fce_fnc_moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
};

_anim = selectRandom ["STAND1", "STAND2", "WATCH", "GUARD", "KNEEL", "BRIEFING"];
[soldierModel, _anim, "ASIS"] call BIS_fnc_ambientAnim;