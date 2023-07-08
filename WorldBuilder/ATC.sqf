
// Let player know they are connected and to open the map 
systemChat format ["Welcome to Fox Air Traffic Controller OS %1. Open the map to get started", name player];

// Loop while the user is "live"
_status = player getVariable "Fox_ATC_Status";
_statusTgt = _status select 0;
_statusLive = _status select 1;

_markedAssets = [];

while {_statusLive} do {
	// Clear the map interface
	{
		deleteMarkerLocal _x;
		sleep 0.4;
	} forEach _markedAssets;

	// Measure distance from player to computer, if too far away, it will disconnect the player
	_dist = player distance _statusTgt;
	if (_dist < 6) then {
		{
			_pos = getPosATL _x;
			_type = typeOf _x;
			_side = side _x;
			_kind = _x isKindOf "AIR";
			_netID = netId _x;
			if ((_kind) and (_pos select 2 > 20)) then {
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
				sleep 0.4;
			};
			
		} forEach vehicles;
	};

	if (_dist > 5) exitWith {
		systemChat "You have been disconnected from the ATC Terminal";
		player setVariable ["FOX_ATC_Status", [_statusTgt, false]];
	};
	sleep 4;
};
	
	