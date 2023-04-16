_db = ["new", format ["Logistics - %1 %2", missionName, worldName]] call oo_inidbi;

_funds = ["read", ["Supply Points", "Balance"]] call _db;

_list = findDisplay 1 displayCtrl 1500;
_sel = lbCurSel _list;

_class = _list lbData _sel; 
_cost = ["read", [_class, "Cost"]] call _db;

if (_cost > _funds) then {
	"You cannot afford this!" remoteExec ["hint", 0];
} else {
	_carry = ["read", [_class, "CanCarry"]] call _db;
	_weight = ["read", [_class, "Weight"]] call _db;

	_veh = _class createVehicle position logi_spawn; 
	_dmg = random [0.2, 0.5, 0.7];
	_veh setDamage [_dmg, false];
	_fuel = random [0.2, 0.5, 0.7];

	[_veh, _carry, [0, 3, 1], 10] call ace_dragging_fnc_setCarryable;
	[_veh, _weight] call ace_cargo_fnc_setSize;
	_veh setFuel _fuel;
	closeDialog 2;
};

