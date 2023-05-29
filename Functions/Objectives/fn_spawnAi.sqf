params ["_trg"];
systemChat "AI SPAWNING!";
_active = _trg getVariable "Active";
_side = _trg getVariable "Side";
_plt = _trg getVariable "PlatoonComp";
_pos = position _trg;

_inf = [];
_mech = [];
_mot = [];
_armor = [];
_recon = [];

switch (_side) do {
	case "b": {
		_inf = [
			"ACM_NAG_Soldier_AR",
			"ACM_NAG_Soldier_CLS",
			"ACM_NAG_Soldier_GL",
			"ACM_NAG_Soldier_MR",
			"ACM_NAG_Soldier_ExplEx",
			"ACM_NAG_Soldier_AA",
			"ACM_NAG_Soldier_AT",
			"ACM_NAG_Soldier_ATA",
			"ACM_NAG_Soldier_Radio",
			"ACM_NAG_Soldier_Repair",
			"ACM_NAG_Soldier",
			"ACM_NAG_Soldier_RifleAT",
			"ACM_NAG_Soldier_RifleLight",
			"ACM_NAG_Soldier_TL"
		];

		_mech = [
			"ACM_B_NAG_BMP2",
			"ACM_B_NAG_BTR80A",
			"ACM_B_NAG_BMP2_ZU"
		];

		_mot = [
			"ACM_B_NAG_Ifrit_HMG",
			"ACM_B_NAG_UAZ_AGS30",
			"ACM_B_NAG_UAZ_MG",
			"ACM_B_NAG_UAZ_SPG"
		];
		
		_armor = [
			"ACM_B_NAG_T72"
		];
		
		_recon = [
			"ACM_NAG_Soldier_SPEC_AR",
			"ACM_NAG_Soldier_SPEC_CLS",
			"ACM_NAG_Soldier_SPEC_GL",
			"ACM_NAG_Soldier_SPEC_MR",
			"ACM_NAG_Soldier_SPEC_ExplEx",
			"ACM_NAG_Soldier_SPEC",
			"ACM_NAG_Soldier_SPEC_AT",
			"ACM_NAG_Soldier_SPEC_RifleAT",
			"ACM_NAG_Soldier_SPEC_TL",
			"ACM_NAG_Soldier_SPEC_RifleLight"
		];
	};
	case "o": {
		_inf = [
			"ACM_HDF_Soldier_AA",
			"ACM_HDF_Soldier_AR",
			"ACM_HDF_Soldier_CLS",
			"ACM_HDF_Soldier_GL",
			"ACM_HDF_Soldier_MR",
			"ACM_HDF_Soldier_AT",
			"ACM_HDF_Soldier",
			"ACM_HDF_Soldier_LiteAT",
			"ACM_HDF_Soldier_Light",
			"ACM_HDF_Soldier_Thermals",
			"ACM_HDF_Soldier_TL"
		];

		_mech = [
			"ACM_O_HDF_BMP2",
			"ACM_O_HDF_BMP2_HQ"
		];

		_mot = [
			"ACM_O_HDF_HILUX_DSHKM",
			"ACM_O_HDF_HILUX_IGLA",
			"ACM_O_HDF_HILUX_ARMORED_SPG9",
			"ACM_O_HDF_HILUX_ARMORED_ZU23",
			"ACM_O_HDF_UAZ_MG",
			"ACM_O_HDF_UAZ_SPG9"
		];

		_armor = [
			"ACM_O_HDF_T55",
			"ACM_O_HDF_T34",
			"ACM_O_HDF_T72"
		];

		_recon = [
			"ACM_HDF_Soldier_LI_MG",
			"ACM_HDF_Soldier_LI_CLS",
			"ACM_HDF_Soldier_LI_GL",
			"ACM_HDF_Soldier_LI_MR",
			"ACM_HDF_Soldier_LI_Expl",
			"ACM_HDF_Soldier_LI_MR2",
			"ACM_HDF_Soldier_LI_AA",
			"ACM_HDF_Soldier_LI_AT",
			"ACM_HDF_Soldier_LI_ATA",
			"ACM_HDF_Soldier_LI",
			"ACM_HDF_Soldier_LI_Repair",
			"ACM_HDF_Soldier_LI_LiteAT",
			"ACM_HDF_Soldier_LI_RifleLite"
		];
	};
};

if (_side == "b") then {
	_side = west;
};
if (_side == "o") then {
	_side = east;
};

if (_active) then {
	// Do nothing, AI is spawned 
} else {
	_trg setVariable ["Active", true];
	_grp = "";
	{
		switch (_x) do {
			case "Infantry": {
				_grpSize = round (random [8, 10, 12]);
				_grp = createGroup _side;
				for "_i" from 1 to _grpSize do {
					_unit = selectRandom _inf;
					_grp createUnit [_unit, _pos, [], random 360, "FORM"];
				};
				[_grp, _pos, 300] call BIS_fnc_taskPatrol;
				[_grp] execVM "Regiments\DespawnAI.sqf";
			};
			case "Mechanized": {
				_grpSize = round (random [1, 2, 3]);
				_grp = createGroup _side;
				for "_i" from 1 to _grpSize do {
					_unit = selectRandom _mech;
					_grp = [_pos, random 360, _unit, _grp] call BIS_fnc_spawnVehicle;
				};
				[_grp, _pos, 300] call BIS_fnc_taskPatrol;
				[_grp] execVM "Regiments\DespawnAI.sqf";
			};
			case "Motorized": {
				_grpsize = round (random [2, 3, 4]);
				_grp = createGroup _side;
				for "_i" from 1 to _grpSize do {
					_unit = selectRandom _mot;
					_grp = [_pos, random 360, _unit, _grp] call BIS_fnc_spawnVehicle;
				};
				[_grp, _pos, 300] call BIS_fnc_taskPatrol;
				[_grp] execVM "Regiments\DespawnAI.sqf";
			};
			case "Special Operations": {
				_grpSize = round (random [8, 10, 12]);
				_grp = createGroup _side;
				for "_i" from 1 to _grpSize do {
					_unit = selectRandom _recon;
					_grp createUnit [_unit, _pos, [], random 360, "FORM"];
				};
				[_grp, _pos, 300] call BIS_fnc_taskPatrol;
				[_grp] execVM "Regiments\DespawnAI.sqf";
			};
			case "Armored": {
				_grpsize = round (random [2, 3, 4]);
				_grp = createGroup _side;
				for "_i" from 1 to _grpSize do {
					_unit = selectRandom _armor;
					_grp = [_pos, random 360, _unit, _grp] call BIS_fnc_spawnVehicle;
				};
				[_grp, _pos, 300] call BIS_fnc_taskPatrol;
				[_grp] execVM "Regiments\DespawnAI.sqf";
			};
		};
	} forEach _plt;
};