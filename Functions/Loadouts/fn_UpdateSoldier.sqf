params ["_control", "_lbCurSel", "_lbSelection"];

_det = lbText [1500, _lbCurSel];

_moveCamera = {
	params ["_role"];
	Fox_Loadout_camera camPrepareTarget _role;
	Fox_Loadout_camera camCommitPrepared 1; // needed for relative position
	Fox_Loadout_camera camPrepareRelPos [0, 3, 1.5];
	Fox_Loadout_camera cameraEffect ["internal", "back"];
	Fox_Loadout_camera camCommitPrepared 2;

	// set the role to the player for later reference 
	player setVariable ["roleLoadout", _role];
};

switch (_det) do {
	// Add 1st Platoon roles
	case "Rifleman": {
		[fox_rifleman] call _moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Ammo Carrier": {
		[fox_ammoCarrier] call _moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Grenadier": {
		[fox_gren] call _moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Machine Gunner": {
		[fox_mg] call _moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Combat Life Saver": {
		[fox_cls] call _moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Team Leader": {
		[fox_ftl] call _moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "RTO / JTAC / FO": {
		[fox_rto] call _moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "AT Specialist": {
		[fox_at] call _moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "AA Specialist": {
		[fox_aa] call _moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	// Add 2nd platoon roles 
	case "Crew": {
		[fox_crew] call _moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Crew Leader": {
		[fox_crewLead] call _moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Crew Tech": {
		[fox_crewTech] call _moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};

	// Add 317th Air Squadron Roles 
	case "Jet Pilot": {
		[fox_jetPilot] call _moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Flight Tech": {
		[fox_airCrew] call _moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Helicopter Pilot": {
		[fox_helicopterPilot] call _moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
	case "Helicopter Crew": {
		[fox_helicopterCrew] call _moveCamera;
		buttonSetAction [2400, "[] call fce_fnc_getLoadout"];
	};
};

_anim = selectRandom ["STAND1", "STAND2", "WATCH", "GUARD", "KNEEL", "BRIEFING"];
[soldierModel, _anim, "ASIS"] call BIS_fnc_ambientAnim;