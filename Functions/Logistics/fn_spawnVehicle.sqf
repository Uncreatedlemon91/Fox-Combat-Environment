params ["_class", "_name"];
_db = ["new", format ["Logistics - %1 %2", missionName, worldName]] call oo_inidbi;

_funds = ["read", ["Supply Points", "Balance"]] call _db;

_list = findDisplay 1 displayCtrl 1500;
_sel = lbCurSel _list;

_cost = ["read", [_name, "Cost"]] call _db;

if (_cost > _funds) then {
	"You cannot afford this!" remoteExec ["hint", 0];
} else {
	_carry = ["read", [_name, "CanCarry"]] call _db;
	_weight = ["read", [_name, "Weight"]] call _db;

	_vehicles = [
		"ACM_B_NAG_Tatra",
		"ACM_B_NAG_Tatra_Ammo",
		"ACM_B_NAG_Tatra_Refuel",
		"ACM_B_NAG_Tatra_Repair",
		"ACM_B_NAG_UAZ_Unarmed",
		"ACM_B_NAG_UAZ_MG",
		"ACM_B_NAG_UAZ_AGS30",
		"ACM_B_NAG_UAZ_SPG",
		"ACM_B_NAG_Ifrit",
		"ACM_B_NAG_Ifrit_HMG",
		"ACM_B_NAG_Ifrit_GMG",
		"ACM_B_NAG_BMP2_AMB",
		"ACM_B_NAG_BMP2",
		"ACM_B_NAG_RM70",
		"ACM_B_NAG_MI171_Unarmed",
		"ACM_B_NAG_Civil",
		"ACM_B_NAG_KA52"
	];
	_veh = _class createVehicle position logi_spawn; 
	if (_class in _vehicles) then {
		
		_dmg = random [0.2, 0.5, 0.7];
		_veh setDamage [_dmg, false];
		_fuel = random [0.2, 0.5, 0.7];
		_veh setFuel _fuel;
		clearItemCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;

	};

	[_veh, _carry, [0, 3, 1], 10] remoteExec ["ace_dragging_fnc_setCarryable", 0, true];
	[_veh, _weight] remoteExec ["ace_cargo_fnc_setSize", 0, true];
	_veh setVariable ["canCarry", _carry];
	_veh setVariable ["CargoWeight", _weight];
	

	if (_name == "FAL Ammo Box") then {
		clearItemCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
   		_veh addMagazineCargoGlobal ["CUP_30Rnd_762x51_FNFAL_M", 50];
	};

	if (_name == "MG Ammo Box") then {
		clearItemCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
   		_veh addMagazineCargoGlobal ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M", 25];
	};

	if (_name == "Pistol Ammo") then {
		clearItemCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
   		_veh addMagazineCargoGlobal ["CUP_21Rnd_9x19_M17_Black", 20];
	};

	if (_name == "Shotgun Supplies") then {
		clearItemCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
		_veh addWeaponCargoGlobal ["CUP_sgun_Saiga12K", 3];
   		_veh addMagazineCargoGlobal ["CUP_5Rnd_B_Saiga12_Buck_1", 20];
		_veh addMagazineCargoGlobal ["CUP_5Rnd_B_Saiga12_Slug", 20];
		_veh addMagazineCargoGlobal ["CUP_5Rnd_B_Saiga12_Buck_00", 20];
	};

	if (_name == "Sniper Supplies") then {
		clearItemCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
		_veh addWeaponCargoGlobal ["CUP_srifle_g22_wdl", 3];
   		_veh addMagazineCargoGlobal ["CUP_5Rnd_762x67_G22", 20];
		_veh addItemCargoGlobal ["cup_bipod_harris_1a2_l_blk", 3];
		_veh addItemCargoGlobal ["ace_optic_lrps_pip", 3];
		_veh addItemCargoGlobal ["ACE_SpottingScope", 3];
		_veh addItemCargoGlobal ["ACE_DAGR", 3];
		_veh addItemCargoGlobal ["ACE_Kestrel4500", 3];
		_veh addBackpackCargo ["ace_gunbag", 3];
	};

	if (_name == "HAT Kit Munitions") then {
		clearItemCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
   		_veh addMagazineCargoGlobal ["Titan_AT", 4];
		_veh addMagazineCargoGlobal ["Titan_AP", 4];
	};

	if (_name == "LAT Kit Munitions") then {
		clearItemCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
   		_veh addWeaponCargoGlobal ["CUP_APILAS_M", 8];
	};

	if (_name == "Grenades") then {
		clearItemCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
   		_veh addMagazineCargoGlobal ["SmokeShellYellow", 10];
		_veh addMagazineCargoGlobal ["SmokeShellRed", 10];
		_veh addMagazineCargoGlobal ["SmokeShellBlue", 10];
		_veh addMagazineCargoGlobal ["SmokeShellGreen", 10];
		_veh addMagazineCargoGlobal ["SmokeShell", 30];
		_veh addMagazineCargoGlobal ["HandGrenade", 30];
	};

	if (_name == "Grenadier Ammunition") then {
		clearItemCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
   		_veh addMagazineCargoGlobal ["CUP_IlumFlareWhite_GP25_M", 10];
		_veh addMagazineCargoGlobal ["CUP_FlareRed_GP25_M", 10];
		_veh addMagazineCargoGlobal ["CUP_1Rnd_SmokeGreen_GP25_M", 10];
		_veh addMagazineCargoGlobal ["CUP_1Rnd_SmokeRed_GP25_M", 10];
		_veh addMagazineCargoGlobal ["CUP_1Rnd_HE_GP25_M", 30];
		_veh addMagazineCargoGlobal ["CUP_1Rnd_SMOKE_GP25_M", 30];
	};

	if (_class == "ACM_B_NAG_Tatra") then {
		[_veh, 20] call ace_cargo_fnc_setSpace;
	};

	_newBalance = _funds - _cost;
	["write", ["Supply Points", "Balance", _newBalance]] call _db;
	_hint = findDisplay 1 displayCtrl 1602;
	_hint ctrlSetText str _newBalance;
};
