// Generates tasks for the AI Civilians 
params ["_civ"];

// Setup variables 
_task = selectRandom [
	"MoveHome",
	"IED"
];
switch (_task) do {
	case "MoveHome": {[_civ] remoteExec ["fce_fnc_C_Task_MoveHome", 2]; systemChat "MoveHome"};
	case "IED": {[_civ] remoteExec ["fce_fnc_C_task_SetIED", 2]; systemChat "IED"};

	default { };
};