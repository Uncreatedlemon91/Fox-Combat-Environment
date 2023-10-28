// Adds an ace action to the building to enable repairs 
params ["_bld", "_taskid", "_old"];

_repairBld = [
	"repairBld",
	"Reconstruct the building",
	"",
	{
		_isEngineer = player getVariable "ace_isEngineer";
		_nearBricksObj = nearestObject [player, "Land_Bricks_V1_F"];
		_nearBlocksObj = nearestObject [player, "Land_CinderBlocks_F"];
		_nearWorkStationObj = nearestObject [player, "Land_WorkStand_F"];
		_nearWoodObj = nearestObject [player, "Land_WoodenPlanks_01_pine_F"];

		_nearBricks = player distance2d _nearBricksObj;
		_nearBlocks = player distance2D _nearBlocksObj;
		_nearWorkStation =player distance2D _nearWorkStationObj;
		_nearWood = player distance2D _nearWoodObj;

		_taskid = _target getVariable "fox_bld_taskid";
		systemChat format ["%1", _target];
		if ((_isEngineer > 0) AND (_nearBricks < 10) AND (_nearWood < 10) AND (_nearBlocks < 10) AND (_nearWorkStation < 10)) then {
			deleteVehicle _nearWoodObj;
			deleteVehicle _nearWorkStationObj;
			deleteVehicle _nearBlocksObj;
			deleteVehicle _nearBricksObj;

			[_taskid, "SUCCEEDED", true] call BIS_fnc_taskSetState;

			// remove building from building wreckage area 
			[_target] remoteExec ["fce_fnc_deleteBuildingWreckage", 2];
		} else {
			systemChat "Either you're not an engineer, or you don't have all the materials needed for construction";
			systemChat "You need Cinder Blocks, Bricks, a workstation and wood in order to rebuild buildings";
		};
	},
	{true},
	{},
	[],
	[0, 0, 0],
	100
] call ace_interact_menu_fnc_createAction;

// Add Action to Building Area
[_bld, 0, ["ACE_MainActions"], _repairBld] call ace_interact_menu_fnc_addActionToObject;
