params ["_class"];
_db = ["new", format ["Logistics - %1 %2", missionName, worldName]] call oo_inidbi;

_funds = ["read", ["Supply Points", "Balance"]] call _db;

_list = findDisplay 1 displayCtrl 1500;
_sel = lbCurSel _list;

_cost = ["read", [_class, "Cost"]] call _db;
format ["%1", _class] remoteExec ["systemChat", 0];

if (_cost > _funds) then {
	"You cannot afford this!" remoteExec ["hint", 0];
} else {
	_carry = ["read", [_class, "CanCarry"]] call _db;
	_weight = ["read", [_class, "Weight"]] call _db;

	_veh = _class createVehicle position logi_spawn; 
	_dmg = random [0.2, 0.5, 0.7];
	_veh setDamage [_dmg, false];
	_fuel = random [0.2, 0.5, 0.7];

	[_veh, _carry, [0, 3, 1], 10] remoteExec ["ace_dragging_fnc_setCarryable", 0, true];
	[_veh, _weight] remoteExec ["ace_cargo_fnc_setSize", 0, true];
	_veh setFuel _fuel;

	clearItemCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;

	if (_class == "ACM_B_NAG_AmmoBox") then {
		_cargo = [["CUP_30Rnd_762x51_FNFAL_M","MiniGrenade","CUP_1Rnd_HE_GP25_M","SmokeShell","Titan_AT","Titan_AA","CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M","CUP_10Rnd_762x51_FNFAL_M","SmokeShellBlue","Chemlight_blue","SmokeShellGreen","SmokeShellOrange","CUP_21Rnd_9x19_M17_Black","CUP_21Rnd_9x19_M17_Coyote","CUP_30Rnd_9x19AP_Vityaz","150Rnd_762x54_Box","CUP_HandGrenade_L109A1_HE","CUP_5Rnd_762x67_G22","CUP_PipeBomb_M","HandGrenade","30Rnd_580x42_Mag_F","B_IR_Grenade","1Rnd_HE_Grenade_shell","CUP_1Rnd_StarFlare_White_M203","1Rnd_Smoke_Grenade_shell","100Rnd_580x42_Mag_F"],[50,20,30,20,25,15,30,25,20,20,20,20,25,40,30,30,20,20,10,20,50,20,30,30,30,20]];
		_cargo params ["_classes","_count"];
		for "_i" from 0 to count _classes - 1 do {
    		_veh addItemCargoGlobal [_classes select _i,_count select _i]
		};
	};

	if (_class == "ACE_Wheel") then {
		_veh setDamage [0, false];
	};

	if (_class == "ACE_medicalSupplyCrate") then {
		_cargo = [["kat_guedel","ACE_EarPlugs","ACE_fieldDressing","ACE_packingBandage","ACE_elasticBandage","ACE_tourniquet","ACE_splint","ACE_quikclot","ACE_bodyBag"],[30,50,40,40,40,20,50,40,10]];
		_cargo params ["_classes","_count"];
		for "_i" from 0 to count _classes - 1 do {
    		_veh addItemCargoGlobal [_classes select _i,_count select _i]
		};
	};


	_newBalance = _funds - _cost;
	["write", ["Supply Points", "Balance", _newBalance]] call _db;
	_hint = findDisplay 1 displayCtrl 1602;
	_hint ctrlSetText str _newBalance;
};
