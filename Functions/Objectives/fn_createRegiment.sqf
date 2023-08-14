params ["_loc", "_locMkr", "_regimentSide"];
_db = ["new", format ["%1 Regiments - %2 %3", _regimentSide, missionName, worldName]] call oo_inidbi;

// Create Regiment Identity
_regimentNumber = round (random 300);
_regimentNumber = [_regimentNumber, "english"] call BIS_fnc_ordinalNumber;
_regimentType = selectRandom ["Infantry", "Mechanized", "Motorized", "Special Operations", "Armored"];
_regimentName = format ["%1 %2 Regiment", _regimentNumber, _regimentType];
_regimentMarker = "";
_regimentSpeed = 5;
_regimentSkill = selectRandom ["Private", "Corporal", "Sergeant", "Captain"];
_values = [];
switch (_regimentType) do {
	case "Infantry": {_regimentMarker = format ["%1_Inf", _regimentSide]; _regimentSpeed = 6; _values = [0.8, 0.2, 0.2, 0.1, 0.1]};
	case "Mechanized": {_regimentMarker = format ["%1_mech_inf", _regimentSide]; _regimentSpeed = 10; _values = [0.6, 0.5, 0.3, 0.1, 0.2]};
	case "Motorized": {_regimentMarker = format ["%1_Motor_inf", _regimentSide]; _regimentSpeed = 15; _values = [0.6, 0.1, 0.5, 0.2, 0.1]};
	case "Special Operations": {_regimentMarker = format ["%1_Recon", _regimentSide]; _regimentSpeed = 8; _values = [0.5, 0.1, 0.1, 0.5, 0.1]};
	case "Armored": {_regimentMarker = format ["%1_Armor", _regimentSide]; _regimentSpeed = 6; _values = [0.5, 0.2, 0.2, 0.2, 0.4]};
};
_regimentSize = round (random [4, 8, 12]);
_HqPos = [[_locMkr], ["base", "water"]] call BIS_fnc_randomPos;
_noPos = _hqPos inArea "NoLocation";
if (_noPos) then {
	_HqPos = [["AO"], ["base", "water"]] call BIS_fnc_randomPos;
};

// Save regiment to database 
["write", [_regimentName, "Position", _hqPos]] call _db;
["write", [_regimentName, "Type", _regimentType]] call _db;
["write", [_regimentName, "Marker", _regimentMarker]] call _db;
["write", [_regimentName, "Speed", _regimentSpeed]] call _db;
["write", [_regimentName, "Size", _regimentSize]] call _db;
["write", [_regimentName, "Skill", _regimentSkill]] call _db;
["write", [_regimentName, "Side", _regimentSide]] call _db;

// Add marker to world map 
_mkr = createMarkerLocal [_regimentName, _hqPos];
_mkr setMarkerTextLocal _regimentName;
_mkr setMarkerAlphaLocal 0;
_mkr setMarkerType _regimentMarker;

// Start function to watch for player locality
_trg = createTrigger ["EmptyDetector", _hqPos, true];
_trg setVariable ["Active", false, true];
_trg setVariable ["Regiment", _regimentName];
_trg setVariable ["Side", _regimentSide];
_trg setTriggerArea [850, 850, 0, false, 200];
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trg setTriggerStatements ["this", "[thisTrigger] remoteExec ['fce_fnc_SpawnAI', 2]", ""];

// Define classnames for AI spawning 
_faction = "";
_inf = [];
_mech = [];
_mot = [];
_armor = [];
_recon = [];

switch (_regimentSide) do {
	case "b": {
		_faction = west;
		_inf = [
			"B_MasereRMDF_AT_01",
			"B_MasereRMDF_Auto_01",
			"B_MasereRMDF_CLS_01",
			"B_MasereRMDF_Engineer_01",
			"B_MasereRMDF_GL_01",
			"B_MasereRMDF_HMG_01",
			"B_MasereRMDF_M_01",
			"B_MasereRMDF_MisslAA_01",
			"B_MasereRMDF_MisslAT_01",
			"B_MasereRMDF_Rifleman_01",
			"B_MasereRMDF_Light_AT_01",
			"B_MasereRMDF_SL_01",
			"B_MasereRMDF_TL_01",
			"B_MasereRMDF_UAVOp_01"
		];

		_mech = [
			"ACM_BTR80A_RMDF_Naval"
		];

		_mot = [
			"ACM_Dingo_GL_RMDF_Naval",
			"ACM_Dingo_MG_RMDF_Naval"
		];
		
		_armor = [
			"ACM_AFV_Wheeled_01_cannon_RMDF_NAVAL_F",
			"ACM_AFV_Wheeled_01_cannon_up_RMDF_NAVAL_F"
		];
		
		_recon = [
			"B_MasereRMDF_NSF_Autogren_01",
			"B_MasereRMDF_NSF_Marksman_01",
			"B_MasereRMDF_NSF_CLS_01",
			"B_MasereRMDF_NSF_Scout_01",
			"B_MasereRMDF_NSF_AT_01",
			"B_MasereRMDF_NSF_TL_01"
		];
	};
	case "o": {
		_faction = east;
		_inf = [
			"O_A_soldier_A_F",
			"O_A_soldier_AR_F",
			"O_A_medic_F",
			"O_A_engineer_F",
			"O_A_soldier_GL_F",
			"O_A_soldier_M_F",
			"O_A_soldier_AA_F",
			"O_A_soldier_AT_F",
			"O_A_soldier_F",
			"O_A_soldier_LAT_F",
			"O_A_Soldier_AR_lxWS",
			"O_A_Soldier_TL_lxWS",
			"O_A_Soldier_lxWS",
			"O_A_medic_lxWS",
			"O_A_RadioOperator_F",
			"O_A_soldier_SL_F",
			"O_A_soldier_TL_F",
			"O_A_HeavyGunner_lxWS",
			"O_A_medic_lxWS",
			"O_A_Soldier_GL_lxWS"
		];

		_mech = [
			"O_A_APC_Tracked_02_cannon_F",
			"O_A_APC_Wheeled_02_rcws_v2_F"
		];

		_mot = [
			"O_A_LSV_02_unarmed_F",
			"O_A_LSV_02_armed_F",
			"O_A_LSV_02_AT_F"
		];

		_armor = [
			"O_A_MBT_02_cannon_F"
		];

		_recon = [
			"O_T_Recon_F",
			"O_T_Recon_CQ_F",
			"O_T_Recon_TL_F",
			"O_T_Sniper_F",
			"O_T_Recon_JTAC_F",
			"O_T_Recon_GL_F",
			"O_T_Recon_M_F",
			"O_T_Pathfinder_F",
			"O_T_Pathfinder_F",
			"O_T_Spotter_F"
		];
	};
};

// Create Groups for the regiment 
for "_i" from 1 to _regimentSize do {
	_groupType = selectRandomWeighted ["Infantry", _values select 0, "Mechanized", _values select 1, "Motorized", _values select 2, "Special Operations", _values select 3, "Armored", _values select 4];
	_pltType = "";
	_pltSize = 4;
	switch (_groupType) do {
		case "Infantry": {_pltType = _inf; _pltSize = round (random [10, 14, 18]);};
		case "Mechanized": {_pltType = _mech; _pltSize = 1;};
		case "Motorized": {_pltType = _mot; _pltSize = 1;};
		case "Special Operations": {_pltType = _recon; _pltSize = round (random [6, 8, 10]);};
		case "Armored": {_pltType = _armor; _pltSize = 1;};
	};
	
	_pltComp = [];
	for "_i" from 1 to _pltSize do {
		_unit = selectRandom _pltType;
		_pltComp pushback _unit;
	};
	["write", [_regimentName, format ["Group %1", _i], _pltComp]] call _db;
};
