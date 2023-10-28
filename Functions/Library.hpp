class CfgFunctions
{
	class FCE
	{
		class Logistics
		{
			class startLogistics {};
			class spawnVehicle {};
			class addAceActions {};
			class ammoBoxActions {};
			class openLogiMenu {};
			class defineObjects {};
		};
		class Loadouts
		{
			class loadout_DefineKits {};
			class loadout_GetKit {};
			class loadout_OpenMenu {};
			class loadout_PrepMenu {};
			class loadout_SyncKit {};
		};
		class Objectives
		{
			class Objectives {};
			class createRegiment {};
			class loadRegiment {};
			class spawnAI {};
			class AIAttributes {};
			class spawnArtillery {};
			class spawnAASite {};
			class createConvoy {};
			class defineClasses {};
		};
		class Persistence
		{
			class saveItem {};
			class deleteItem {};
			class LoadPlayer {};
			class getPlayerData {};
			class savePlayer {};
			class saveVehicle {};
			class playerKilled {};
			class setupVehicleEH {};
			class deleteVehicle {};
			class loadItems {};
			class loadVehicles {};
			class startSpec {};
		};
		class Civilians
		{
			class initCiv {};
			class setupCity {};
			class createCivilian {};
			class spawnCiv {};
			class loadCiv {};
			class taskManager {};
			class createStash {};
			class loadStash {};
			class C_task_MoveHome {};
			class C_task_SetIED {};

		};
		class Whitelist
		{
			class GetWLData {};
			class OpenWlMenu {};
			class LoadWlMenu {};
			class initWl {};
			class UpdateWL {};
		};
		class FOB 
		{
			class addFobActions {};
			class deployFOB {};
			class deleteFob {};
			class loadFOBs {};
			class checkSupplies {};
		};
		class Actions 
		{
			class CheckVehicles {};
		};
		class Buildings
		{
			class TaskRepairBuilding {};
			class loadBuildings {};
			class buildingDmg {};
			class addActionBuilding {};
			class deleteBuildingWreckage {};
		};
	};
};