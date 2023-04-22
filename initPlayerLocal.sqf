// 
_getData = profileNameSpace getVariable "Position";
if (isNil "_getData") then {
	
} else {
	_pos = profileNameSpace getVariable "Position";
	_dir = profileNameSpace getVariable "Direction";
	_kit = profileNameSpace getVariable "Loadout";

	player setPosASL _pos;
	player setDir _dir;
	player setUnitLoadout _kit;
};

sleep 10;

while {true} do {
	if (alive player) then {
		_pos = getPosASL player;
		_dir = getDir player;
		_kit = getUnitLoadout player;

		profileNameSpace setVariable ["Position", _pos];
		profileNameSpace setVariable ["Direction", _dir];
		profileNameSpace setVariable ["Loadout", _kit];
	} else {
		profileNameSpace setVariable ["Position", nil];
		profileNameSpace setVariable ["Direction", nil];
		profileNameSpace setVariable ["Loadout", nil];
	};
};