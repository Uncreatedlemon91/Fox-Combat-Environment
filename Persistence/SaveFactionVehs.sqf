_db = ["new", format ["Vehicles - %1 %2", missionName, worldName]] call oo_inidbi;
debugLog "Vehicles Saving";
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
	"ACM_B_NAG_T72",
	"ACM_B_NAG_MI171_Unarmed",
	"ACM_B_NAG_Civil",
	"ACM_B_NAG_KA52",
	"ACM_B_NAG_LauncherBox",
	"ACM_B_NAG_AmmoBox",
	"Box_IND_WpsSpecial_F",
	"ACE_Box_Ammo",
	"kat_surgerySupplyCrate",
	"kat_pharmaMedicalCrate",
	"kat_medicalSupplyCrate",
	"kat_basicSupplyCrate",
	"ACE_medicalSupplyCrate_advanced",
	"ACE_Wheel",
	"ACE_Track",
	"ACE_SandbagObject"
];

while {true} do {
	"delete" call _db;
	_db = ["new", format ["Vehicles - %1 %2", missionName, worldName]] call oo_inidbi;
	_logdb = ["new", format ["Logistics - %1 %2", missionName, worldName]] call oo_inidbi;

	{
		_type = typeOf _x;
		_missionLayer = (getmissionlayerEntities "MissionProps") select 0;
		if (_x in _missionLayer) then {} else {
			if (_type in _vehicles) then {	
				_pos = getPos _x;
				_type = typeOf _x;
				_dir = getDir _x;
				_dmg = damage _x;
				_fuel = fuel _x;

				_items = getItemCargo _x;
				_mags = getMagazineCargo _x;
				_weps = getWeaponCargo _x;
				_backs = getBackpackCargo _x;

				_canCarry = _x getVariable "canCarry";
				_weight = _x getVariable "CargoWeight";
				
				// Save to database 
				_section = format ["%1 - %2", _type, netId _x];
				["write", [_section, "Type", _type]] call _db;
				["write", [_section, "Position", _pos]] call _db;
				["write", [_section, "Direction", _dir]] call _db;
				["write", [_section, "Damage", _dmg]] call _db;
				["write", [_section, "Fuel", _fuel]] call _db;
				
				["write", [_section, "CargoItems", _items]] call _db;
				["write", [_section, "CargoMags", _mags]] call _db;
				["write", [_section, "CargoWeps", _weps]] call _db;
				["write", [_section, "CargoBps", _backs]] call _db;

				["write", [_section, "canCarry", _canCarry]] call _db;
				["write", [_section, "Weight", _weight]] call _db;
			};
		};
	} forEach allMissionObjects "All";
	sleep 60;
};