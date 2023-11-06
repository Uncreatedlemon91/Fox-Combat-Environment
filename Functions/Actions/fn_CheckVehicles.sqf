params ["_unit", "_role", "_veh", "_clientId", "_type", "_uid"];

// Get player data information 
_db = ["new", "Player Profiles"] call oo_inidbi;
_curRole = ["read", [_uid, "CurrentRole"]] call _db;

_whitelistedd = [];
_whitelistedg = [];
_check = false;

_veh = typeOf _veh;
// Define vehicle 
if (_veh in fox_lightVehicles) then {
	_whitelistedd = ["LV Crewman", "LV Commander"];
	_whitelistedg = ["LV Crewman", "LV Commander"];
	_check = true;
};
if (_veh in fox_mediumVehicles) then {
	_whitelistedd = ["APC/IFV Crewman", "APC/IFV Commander"];
	_whitelistedg = ["APC/IFV Crewman", "APC/IFV Commander"];
	_check = true;
};
if (_veh in fox_heavyVehicles) then {
	_whitelistedd = ["MBT Crewman", "MBT Commander"];
	_whitelistedg = ["MBT Crewman", "MBT Commander"];
	_check = true;
};
if (_veh in fox_artyVehicles) then {
	_whitelistedd = ["Mortarman", "Mortar Assistant", "Mortar Security"];
	_whitelistedg = ["Mortarman", "Mortar Assistant", "Mortar Security"];
	_check = true;
};
if (_veh in fox_heloVehiclesT) then {
	_whitelistedd = ["Rotary Pilot (Transport / Logistics)"];
	_whitelistedg = ["Rotary Pilot (Transport / Logistics)", "Rotary Crew Chief / Door Gunner"];
	_check = true;
};
if (_veh in fox_heloVehiclesM) then {
	_whitelistedd = ["Rotary Pilot (Multi)"];
	_whitelistedg = ["Rotary Pilot (Multi)", "Rotary Crew Chief / Door Gunner"];
	_check = true;
};
if (_veh in fox_heloVehiclesA) then {
	_whitelistedd = ["Rotary Pilot (Attack)"];
	_whitelistedg = ["Rotary Pilot (Attack)"];
	_check = true;
};
if (_veh == "PRACS_Mk5_SOCR") then {
	_whitelistedd = ["Naval Crewman"];
	_whitelistedg = ["Naval Crewman", "Naval Gunner"];
	_check = true;
};

// Check player current role vs whitelisted for driver when they change to Driver / Gunner slots
if (_type == "Switch") then {
	
	_roleArray = assignedVehicleRole _unit;
	if (!(_curRole in _whitelistedd) AND ("driver" in _roleArray) AND (_check)) then {
		moveOut _unit;
		"Your role doesn't have access to this seat!" remoteExec ["systemChat", _clientId];
	};
	if (!(_curRole in _whitelistedg) AND ("gunner" in _roleArray) AND (_check)) then {
		moveOut _unit;
		"Your role doesn't have access to this seat!" remoteExec ["systemChat", _clientId];
	};
	if (!(_curRole in _whitelistedd) AND ("commander" in _roleArray) AND (_check)) then {
		moveOut _unit;
		"Your role doesn't have access to this seat!" remoteExec ["systemChat", _clientId];
	};
};

// Check player current role vs whiitelisted for driver / gunner when they get in to that slot
if (_type == "GetIn") then {
	if (!(_curRole in _whitelistedd) AND (_role == "driver") AND (_check)) then {
		moveOut _unit;
		"Your role doesn't have access to this seat!" remoteExec ["systemChat", _clientId];
	};
	if (!(_curRole in _whitelistedg) AND (_role == "gunner") AND (_check)) then {
		moveOut _unit;
		"Your role doesn't have access to this seat!" remoteExec ["systemChat", _clientId];
	};
	if (!(_curRole in _whitelistedd) AND (_role == "commander") AND (_check)) then {
		moveOut _unit;
		"Your role doesn't have access to this seat!" remoteExec ["systemChat", _clientId];
	};
};