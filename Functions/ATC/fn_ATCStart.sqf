// Variables and arguments 
params ["_laptop"];

_markedAssets = [];


// Find all planes
{
	_pos = getPosATL _x;
	_type = typeOf _x;
	_side = side _x;
	_kind = _x isKindOf "AIR";
	_netID = netId _x;
	if (_kind) then {
		_mkr = createMarkerLocal [format ["V_%1", _netID], _pos];
		switch (_side) do {
			case east: {_mkr setMarkerTypeLocal "o_unknown"};
			case west: {_mkr setMarkerTypeLocal "b_unknown"};
			case civilian: {_mkr setMarkerTypeLocal "c_unknown"};
		};
		_typeName = [configFile >> "CfgVehicles" >> _type] call bis_fnc_displayName;
		_alt = format ["%1 meters", round (_pos select 2)];
		_mkr setMarkerSizeLocal [0.8, 0.8];
		_mkr setMarkerTextLocal format ["%1 : %2", _typeName, _alt];
		_markedAssets pushback _mkr;
	};
} forEach vehicles;

[_markedAssets, _laptop] call fce_fnc_updateMarkers;
