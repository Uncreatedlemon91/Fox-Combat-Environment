_db = ["new", format ["Fortifications - %1 %2", missionName, worldName]] call oo_inidbi;
_logidb = ["new", format ["Logistics - %1 %2", missionName, worldName]] call oo_inidbi;
debugLog "Vehicles Saving";
_vehicles = [
	"Land_RoadBarrier_01_F",
	"Land_HBarrier_1_F",
	"Land_Mil_WallBig_4m_F", 
	"Land_PortableDesk_01_olive_F",
	"Land_PlasticCase_01_medium_olive_F",
	"TargetP_Inf_F",
	"Land_Campfire_F",
	"Land_CampingChair_V2_F",
	"ACM_B_NAG_T_DSHKM",
	"ACM_B_NAG_T_DSHKM",
	"ACM_B_NAG_T_Mortar",
	"ACM_B_NAG_T_Searchlight",
	"ACM_B_NAG_T_SPG9",
	"ACM_B_NAG_T_ZU23"
];

while {true} do {
	"delete" call _db;
	_db = ["new", format ["Fortifications - %1 %2", missionName, worldName]] call oo_inidbi;
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