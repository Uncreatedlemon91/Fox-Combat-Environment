// 
_kit = profileNameSpace getVariable "Kit";
_dir = profileNameSpace getVariable "Direction";
_pos = profileNameSpace getVariable "PlayerPosition";

if (isNil "_kit") then {} else {
	player setUnitLoadout _kit;
	player setDir _dir;
	player setPosASL _pos;
};

sleep 10;

while {true} do {
	if (alive player) then {
		_kit = getUnitLoadout player;
		_pos = getPosASL player;
		_dir = getDir player;

		profileNameSpace setVariable ["Kit", _kit];
		profileNameSpace setVariable ["PlayerPosition", _pos];
		profileNameSpace setVariable ["Direction", _dir];
	} else {
		profileNameSpace setVariable ["Kit", nil];
		profileNameSpace setVariable ["PlayerPosition", nil];
		profileNameSpace setVariable ["Direction", nil];
	};

	sleep 2;
};