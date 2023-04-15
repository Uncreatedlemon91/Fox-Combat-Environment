/* 
Receives data from server to client for menu 
*/
params ["_items", "_funds"];

createDialog "LogiMenu";
_list = findDisplay 1 displayCtrl 1500;
_hint = findDisplay 1 displayCtrl 1602;
_purchase = findDisplay 1 displayCtrl 1601;

{
	for "_i" from 0 to (count _x - 1) do {
		_x params ["_classname", "_name", "_image", "_cost"];
		_added = _list lbAdd _name;
		_list lbSetData [_added, [_classname, _cost, _funds]];
		_list lbsetTextRight [_added, str _cost];
		_list lbSetPicture [_added, _image];
	};
} forEach _items;


buttonSetAction [1601, 
	"_list = findDisplay 1 displayCtrl 1500; 
	_sel = lbCurSel _list; 
	_class = _list lbData _sel; 
	_class = _class select 0;
	_cost = _class select 1;
	if (_cost > _funds) exitwith {systemChat 'You cannot afford this!'};
	_veh = _class createVehicle position logi_spawn; 
	_dmg = random [0.2, 0.5, 0.7];
	_veh setDamage _dmg;
	_fuel = random [0.2, 0.5, 0.7];
	_veh setFuel _fuel;
	clearItemCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	closeDialog 2"];
_hint ctrlSetText format ["Supplies: %1", _funds];


